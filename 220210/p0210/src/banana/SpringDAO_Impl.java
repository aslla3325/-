package banana;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;

public class SpringDAO_Impl implements SpringDAO{
    private JdbcTemplate jdbcTemplate = null;

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    boolean already_recom = false;
    
    @Override
    public List<SpringVO> findAll() throws Exception {
        RowMapper<SpringVO> rowMapper = new RowMapper<SpringVO>() {
            @Override
            public SpringVO mapRow(ResultSet rs, int idx) throws SQLException {
                SpringVO vo = new SpringVO();
                vo.setNo(rs.getInt("no"));
                vo.setUsername( rs.getString("username"));
                vo.setTitle( rs.getString("title"));
                vo.setContent( rs.getString("content"));
                vo.setView(rs.getInt("view"));
                vo.setRecommend(rs.getInt("recommend"));
                vo.setTime( rs.getString("time"));
                return vo;
            }
        };
        List<SpringVO> ls = jdbcTemplate.query("select * from tmp_02 ORDER BY no DESC", rowMapper);
        return ls;
    }
    
    @Override
    public SpringVO findBestQ() throws Exception{
    	RowMapper<SpringVO> rowMapper = new RowMapper<SpringVO>() {
            @Override
            public SpringVO mapRow(ResultSet rs, int idx) throws SQLException {
                SpringVO vo = new SpringVO();
                vo.setNo(rs.getInt("no"));
                vo.setUsername( rs.getString("username") );
                vo.setTitle( rs.getString("title") );
                vo.setContent( rs.getString("content") );
                vo.setView(rs.getInt("view"));
                vo.setRecommend(rs.getInt("recommend"));
                vo.setTime( rs.getString("time"));
                return vo;
            }
        };
        SpringVO ls = null;
        try {
        	ls = jdbcTemplate.queryForObject("select * from tmp_02 where recommend = (select max(recommend) as MAX from tmp_02)", rowMapper);
        }
        catch(IncorrectResultSizeDataAccessException e) {
        	// max ���� �ΰ� �̻��̶��
        	return null;
        }
		return ls;
    }
    
    @Override
	public SpringVO findByPk(final SpringVO pvo) throws Exception {
    	RowMapper<SpringVO> rowMapper = new RowMapper<SpringVO>() {
            @Override
            public SpringVO mapRow(ResultSet rs, int idx) throws SQLException {
                SpringVO vo = new SpringVO();
                vo.setNo(rs.getInt("no"));
                vo.setUsername( rs.getString("username") );
                vo.setTitle( rs.getString("title") );
                vo.setContent( rs.getString("content") );
                vo.setView(rs.getInt("view"));
                vo.setRecommend(rs.getInt("recommend"));
                vo.setTime( rs.getString("time"));
                return vo;
            }
        };
        // jdbcTemplate.update("update tmp_02 set view = view+1 where no="+pvo.getNo());
        SpringVO ls = jdbcTemplate.queryForObject("select * from tmp_02 where no="+pvo.getNo(), rowMapper);
		return ls;
	}
    
    @Override
	public void view_update(SpringVO pvo, String username) throws Exception {
    	RowMapper<ViewVO> rm = new RowMapper<ViewVO>() {
			@Override
			public ViewVO mapRow(ResultSet rs, int arg1) throws SQLException {
				ViewVO view = new ViewVO();
				view.setNo( rs.getInt("no") );
				view.setUsername( rs.getString("username") );
				return view;
			}
    	};

        try {
        	ViewVO rec = jdbcTemplate.queryForObject("SELECT * FROM view_T WHERE no=? and username=?", rm, pvo.getNo(), username );
        }
        catch( EmptyResultDataAccessException e ) {
        	// ã�� ���� ���ٸ�
        	jdbcTemplate.update("UPDATE tmp_02 SET view = view+1 WHERE no="+ pvo.getNo());
        	jdbcTemplate.update("INSERT INTO view_T VALUES(?,?)", pvo.getNo(), username );
        	// ���� �� ���������� �̰͵� �����ǰ� ����!! 
        }
	}
    
    @Override
	public void recom(SpringVO pvo, String username) throws Exception { 
    	RowMapper<RecomQVO> rm = new RowMapper<RecomQVO>() {
			@Override
			public RecomQVO mapRow(ResultSet rs, int arg1) throws SQLException {
				RecomQVO rec = new RecomQVO();
				rec.setNo( rs.getInt("no") );
				rec.setUsername( rs.getString("username") );
				return rec;
			}
    	};
    	
    	try {
        	if(already_recom==true) {
            	jdbcTemplate.update("UPDATE tmp_02 SET recommend = recommend-1 WHERE no="+pvo.getNo());
            	jdbcTemplate.update("DELETE FROM recomQ_T WHERE no = "+pvo.getNo()+" AND username = '"+username+"'" );
            	already_recom = false;
            }
        	else {
        		RecomQVO rec = jdbcTemplate.queryForObject("SELECT * FROM recomQ_T WHERE no=? and username=?", rm, pvo.getNo(), username );
        	}
        }
        catch( EmptyResultDataAccessException e ) {
        	// ã�� ���� ���ٸ�
        	jdbcTemplate.update("UPDATE tmp_02 SET recommend = recommend+1 WHERE no="+pvo.getNo());
        	jdbcTemplate.update("INSERT INTO recomQ_T VALUES(?,?)", pvo.getNo(), username );
        	// ���� �� ���������� �̰͵� �����ǰ� ����!!
        	already_recom = true;
        }
	}
    
    @Override
    public int add(final SpringVO pvo) throws Exception {
        PreparedStatementSetter pss = new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement stmt) throws SQLException {
                stmt.setString( 1, Util.han(pvo.getUsername()) );
                stmt.setString( 2, Util.han(pvo.getTitle()) );
                stmt.setString( 3, Util.han(pvo.getContent()) );
            }
        };
        int uc = jdbcTemplate.update("INSERT INTO tmp_02 VALUES (default,?,?,?,0,0, now())", pss );
        return uc;
    }

    @Override
    public int delByPK(SpringVO pvo) throws Exception {
    	// ���� ����
        int uc = jdbcTemplate.update("DELETE FROM tmp_02 WHERE no = " + pvo.getNo());
        // ������ �޸� �亯�� ����
        uc = uc + jdbcTemplate.update("DELETE FROM tmp_03 WHERE no = " + pvo.getNo());
        // ������ �޸� ��õ ����
        uc = uc + jdbcTemplate.update("DELETE FROM recomQ_T WHERE no = " + pvo.getNo());
        // ������ ���� �亯 ��õ ����
        uc = uc + jdbcTemplate.update("DELETE FROM recomA_T WHERE no = " + pvo.getNo());
        // ������ ���� ��ȸ�� ��õ ����
        uc = uc + jdbcTemplate.update("DELETE FROM view_T WHERE no = " + pvo.getNo());
        return uc;
    }
}
