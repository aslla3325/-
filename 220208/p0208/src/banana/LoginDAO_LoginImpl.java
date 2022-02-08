package banana;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class LoginDAO_LoginImpl implements LoginDAO {
	private JdbcTemplate jdbcTemplate = null;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public LoginVO findBy_IdPwd(String id, String pwd) throws Exception {
		// login ��ư�� �������� Ȯ��, ���� �޾ƿ��� ���� �޼���( ���̵� and �н������ select )
		RowMapper<LoginVO> rm = new RowMapper<LoginVO>() {
            @Override
            public LoginVO mapRow(ResultSet rs, int arg1) throws SQLException {
            	// LoginVO �� ����Ʈ �� ����
            	LoginVO vo = new LoginVO();
            	vo.setUsername( rs.getString("Username") );
            	vo.setPassword( rs.getString("Password") );
            	vo.setOperator( rs.getNString("Operator") );
                return vo;
            }
        };
        LoginVO vo = null;
        try {
        	vo = jdbcTemplate.queryForObject("SELECT * FROM login_T WHERE Username=? AND Password=?", rm, Util.han(id), pwd);
        }
        catch( EmptyResultDataAccessException e ) {
        	// ã�� ���� ���ٸ� null ��ȯ
        	return null;
        }
		return vo;
	}
	
	@Override
	public LoginVO findBy_Id(String id) throws Exception {
		// join ��ư�� �������� id �ߺ� Ȯ���ϱ� ���� �޼���
		RowMapper<LoginVO> rm = new RowMapper<LoginVO>() {
            @Override
            public LoginVO mapRow(ResultSet rs, int arg1) throws SQLException {
            	// LoginVO �� ����Ʈ �� ����
            	LoginVO vo = new LoginVO();
            	vo.setUsername( rs.getString("Username") );
            	vo.setPassword( rs.getString("Password") );
            	vo.setOperator( rs.getNString("Operator") );
                return vo;
            }
        };
        LoginVO vo = null;
        try {
        	vo = jdbcTemplate.queryForObject("SELECT * FROM login_T WHERE Username=?", rm, Util.han(id));
        }
        catch( EmptyResultDataAccessException e ) {
        	// ã�� ���� ���ٸ� null ��ȯ
        	return null;
        }
		return vo;
	}

	@Override
	public String add_join(String id, String pwd) throws Exception {
		LoginVO vo = findBy_Id(id);
		
		// findBy_Id ���� null �� �ƴϸ� id �� �ߺ��Ǿ��ٴ� ��
		if( vo != null ) {
			return "fail";
		}
		else {
			// findBy_Id ���� null �̸� id�� pwd �� insert
			jdbcTemplate.update("INSERT INTO login_T VALUES(?, ?, 'N')", Util.han(id), pwd );
			return "success";
		}
	}
}
