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
        List<SpringVO> ls = jdbcTemplate.query("select * from ques_T ORDER BY no DESC", rowMapper);
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
        	ls = jdbcTemplate.queryForObject("select * from ques_T where recommend = (select max(recommend) as MAX from ques_T)", rowMapper);
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
        // jdbcTemplate.update("update ques_T set view = view+1 where no="+pvo.getNo());
        SpringVO ls = jdbcTemplate.queryForObject("select * from ques_T where no="+pvo.getNo(), rowMapper);
		return ls;
	}
    
    @Override
	public List<SpringVO> findByUserName(String username) throws Exception {
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
        List<SpringVO> ls = jdbcTemplate.query("select * from ques_T WHERE username=? ORDER BY no DESC", rowMapper, username);
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
        	ViewVO rec = jdbcTemplate.queryForObject("SELECT * FROM quesView_T WHERE no=? and username=?", rm, pvo.getNo(), username );
        }
        catch( EmptyResultDataAccessException e ) {
        	// ã�� ���� ���ٸ�
        	jdbcTemplate.update("UPDATE ques_T SET view = view+1 WHERE no="+ pvo.getNo());
        	jdbcTemplate.update("INSERT INTO quesView_T VALUES(?,?)", pvo.getNo(), username );
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
        	RecomQVO rec = jdbcTemplate.queryForObject("SELECT * FROM recomQ_T WHERE no=? and username=?", rm, pvo.getNo(), username );
        }
        catch( EmptyResultDataAccessException e ) {
        	// ã�� ���� ���ٸ�
        	jdbcTemplate.update("UPDATE ques_T SET recommend = recommend+1 WHERE no="+pvo.getNo());
        	jdbcTemplate.update("INSERT INTO recomQ_T VALUES(?,?)", pvo.getNo(), username );
        	// ���� �� ���������� �̰͵� �����ǰ� ����!!
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
        int uc = jdbcTemplate.update("INSERT INTO ques_T VALUES (default,?,?,?,0,0, now())", pss );
        return uc;
    }

    @Override
    public int delByPK(SpringVO pvo) throws Exception {
    	// ���� ����
        int uc = jdbcTemplate.update("DELETE FROM ques_T WHERE no = " + pvo.getNo());
        // ������ �޸� �亯�� ����
        uc = uc + jdbcTemplate.update("DELETE FROM quesAns_T WHERE no = " + pvo.getNo());
        // ������ �޸� ��õ ����
        uc = uc + jdbcTemplate.update("DELETE FROM recomQ_T WHERE no = " + pvo.getNo());
        // ������ ���� �亯 ��õ ����
        uc = uc + jdbcTemplate.update("DELETE FROM recomA_T WHERE no = " + pvo.getNo());
        // ������ ���� ��ȸ�� ��õ ����
        uc = uc + jdbcTemplate.update("DELETE FROM quesView_T WHERE no = " + pvo.getNo());
        return uc;
    }
}
