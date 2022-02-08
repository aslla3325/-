package banana;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class Ctrl {
	// ���� db
	private SpringDAO springDao = null;
	public SpringDAO getSpringDao() { return springDao; }
	public void setSpringDao(SpringDAO springDao) { this.springDao = springDao; }

	// �α��� db
	private LoginDAO loginDao = null;
	public LoginDAO getLoginDao() { return loginDao; }
	public void setLoginDao(LoginDAO loginDao) { this.loginDao = loginDao; }
	
	// �亯 db
	private AnswerDAO answerDao = null;
	public AnswerDAO getAnswerDao() { return answerDao; }
	public void setAnswerDao(AnswerDAO answerDao) { this.answerDao = answerDao; }

	// ��� db
	private ComDAO comDao = null;
	public ComDAO getComDao() { return comDao; }
	public void setComDao(ComDAO comDao) { this.comDao = comDao; }
	
	// ��� �亯 db
	private ComAnsDAO comansDao = null;
	public ComAnsDAO getComansDao() { return comansDao; }
	public void setComansDao(ComAnsDAO comansDao) { this.comansDao = comansDao; }

	//-----------------------------------------------------------------	
	@ResponseBody
	@RequestMapping("/ping.do")
	public String ping() throws Exception {
		return answerDao.toString();
	}

	// login ȭ��
	@RequestMapping("/login.do")
	public String login(HttpSession session, @RequestParam(value = "ecode", required = false) String ecode,
			HttpServletRequest request) throws Exception {
		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			session.removeAttribute("username");
			session.removeAttribute("password");
		}
		request.setAttribute("ecode", ecode);
		return "view_login";
	}

	//
	@RequestMapping("/login_add.do")
	public String login_add(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password, HttpSession session) throws Exception {
		if (username == null || username.equals("")) {
			return "redirect:login.do?ecode=id_invalid";
		}
		else if (password == null || password.equals("")) {
			return "redirect:login.do?ecode=pwd_invalid";
		} else {
			LoginVO vo = loginDao.findBy_IdPwd(username, password);
			if (vo == null) {
				return "redirect:login.do?ecode=login_fail";
			} else {
				session.setAttribute("username", vo.getUsername());
				session.setAttribute("password", vo.getPassword());
				return "redirect:home.do";
			}
		}
	}

	// ȸ�� ���� ȭ��
	@RequestMapping("/join.do")
	public String join(@RequestParam(value = "ecode", required = false) String ecode, HttpServletRequest request)
			throws Exception {
		request.setAttribute("ecode", ecode);
		return "id_create";
	}

	// ȸ�� ����
	@RequestMapping("/join_add.do")
	public String join_add(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password) throws Exception {
		if (username == null || username.equals("")) {
			return "redirect:join.do?ecode=id_invalid";
		}
		else if (password == null || password.equals("")) {
			return "redirect:join.do?ecode=pwd_invalid";
		}

		String res = loginDao.add_join(username, password);
		if (res.equals("fail")) {
			return "redirect:join.do?ecode=join_fail";
		} else {
			return "redirect:login.do?ecode=join_success";
		}
	}

	/*
	@RequestMapping("/list.do")
	public String list(HttpSession session, HttpServletRequest request) throws Exception {
		// /list.do �� �ٷ� �����ϴ� �� ����
		if (session.getAttribute("id") == null) {
			// ���� ������ ���ٸ� �α��� ȭ������ �̵�
			return "redirect:login.do?ecode=need_login";
		} else {
			// ���� ������ �ִٸ� list ȭ������ �̵�
			return "view_list";
		}
	}*/
//----------------------------------------------------------		
	// ���� ȭ��
	// �α����� �Ǿ� ���� ���� ������� ��� ���� ���� -> �α��� ȭ��
	// ���� ����Ʈ
	@RequestMapping("/qna_list.do")
	public ModelAndView list( HttpSession session ) throws Exception {
		List<SpringVO> ls = springDao.findAll();
		ModelAndView mnv = new ModelAndView();
		
		if (session.getAttribute("username") == null) {
			mnv.setViewName("view_login");
			mnv.addObject("ecode", "need_login");
		}
		else {
			mnv.setViewName("view_list");
			mnv.addObject("list", ls);
		}
		return mnv;
	}
	
	// ���� ���
	@RequestMapping("/add.do")
	public String add(final @ModelAttribute SpringVO vo )
			throws Exception {
		
		System.out.println( vo.toString() );
		
		/*MultipartRequest mpr = new MultipartRequest(request, Util.uploadDir(), 1024 * 1024 * 16, "utf-8", null);
		String ofn = mpr.getOriginalFileName("apple");
		if (ofn != null) {
			File file = mpr.getFile("apple");
			String fsn = UUID.randomUUID().toString();
			file.renameTo(new File(Util.uploadDir() + fsn));
			vo.setOfn(ofn);
			vo.setFsn(fsn);
		}*/
		springDao.add(vo);
		return "redirect:qna_list.do";
	}
	
	// ���� ��� ȭ��
	@RequestMapping("/update.do")
	public ModelAndView update() throws Exception {
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("update_view");
		return mnv;
	}
	
	// ���� ����
	@RequestMapping("/del.do")
	public String del(final @ModelAttribute SpringVO vo, HttpSession session) throws Exception {
		springDao.delByPK(vo);
		return "redirect:qna_list.do";
	}
	
	// �亯 ���
	@RequestMapping("/add_ans.do")
	public String ans_add(final @ModelAttribute AnswerVO avo,final @ModelAttribute SpringVO vo)
			throws Exception {
		answerDao.add(avo, vo);
		return "redirect:qna.do?no="+vo.getNo();
	}
	
	// �亯 ����
	@RequestMapping("/del_ans.do")
	public String del_ans(final @ModelAttribute AnswerVO avo,final @ModelAttribute SpringVO vo) throws Exception {
		answerDao.delByPK(avo);
		return "redirect:qna.do?no=" + avo.getNo();
	}
	// ���� ��� �� �����غ���

	@RequestMapping("/qna.do")
	ModelAndView quest(final @ModelAttribute SpringVO vo, final @ModelAttribute AnswerVO avo, HttpSession session) throws Exception {
		springDao.view_update(vo, (String)session.getAttribute("username"));
		SpringVO ls = springDao.findByPk(vo);
		List<AnswerVO> ans_ls = answerDao.findByFk(avo,vo);
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("qna_view");
		mnv.addObject("list", ls);
		mnv.addObject("ans_list",ans_ls);
		return mnv;
	}

	@RequestMapping("/recomQ.do")
	public String recomQ(final @ModelAttribute SpringVO vo, HttpSession session) throws Exception {	
		springDao.recom(vo, (String)session.getAttribute("username"));
		return "redirect:qna.do?no=" + vo.getNo();
	}
	
	@RequestMapping("/recomA.do")
	public String recomA(final @ModelAttribute AnswerVO pvo, final @ModelAttribute SpringVO vo,HttpSession session) throws Exception {	
		answerDao.recom(pvo,(String)session.getAttribute("username"));
		return "redirect:qna.do?no=" + vo.getNo();
	}

	@RequestMapping("/down.do")
	public void down(@RequestParam("fsn") String fsn, @RequestParam("ofn") String ofn, HttpServletResponse response)
			throws Exception {
		if (fsn.equals("fsn") || fsn == null) {
			fsn = "down.svg";
		}
		InputStream in = new FileInputStream(Util.uploadDir() + fsn);

		response.setContentType("application/octet");
		response.setHeader("content-disposition", "attachment;filename=" + ofn);

		OutputStream out2 = response.getOutputStream();
		int len = 0;
		byte[] buf = new byte[1024];

		while ((len = in.read(buf)) != -1) {
			out2.write(buf, 0, len);
			out2.flush();
		}
		out2.close();
		in.close();
	}
//----------------------------------------------------------		
	// home
	@RequestMapping("/home.do")
	public ModelAndView main() throws Exception {
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("main");
		return mnv;
	}
//----------------------------------------------------------		
	// �̴��� Ȱ����
	@RequestMapping("/month_act.do")
	ModelAndView month_act() throws Exception {
		SpringVO ls = springDao.findBestQ();
		List<AnswerVO> ans_ls = answerDao.findAll();
		
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("thismonth_a");
		mnv.addObject("ans_ls", ans_ls);
		mnv.addObject("list", ls);
		return mnv;
	}
//----------------------------------------------------------	
	// ���
	// ��� ����Ʈ
	@RequestMapping("/com_list.do")
	public ModelAndView com_list(HttpSession session) throws Exception {
		List<ComVO> ls = comDao.findAll();
		ModelAndView mnv = new ModelAndView();
		
		if (session.getAttribute("username") == null) {
			mnv.setViewName("view_login");
			mnv.addObject("ecode", "need_login");
		}
		else {
			mnv.setViewName("com_list");
			mnv.addObject("list", ls);
		}
		return mnv;
	}
	
	// ��� ���
	@RequestMapping("/add_com.do")
	public String add_com(final @ModelAttribute ComVO vo )
		throws Exception {
		System.out.println( vo.toString() );
		comDao.add(vo);
		return "redirect:com_list.do";
	}
		
	// ��� ��� ȭ��
	@RequestMapping("/update_com.do")
	public ModelAndView update_com() throws Exception {
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("update_com");
		return mnv;
	}
		
	// ��� ����
	@RequestMapping("/delCom.do")
	public String del_com(final @ModelAttribute ComVO vo, HttpSession session) throws Exception {
		comDao.delByPK(vo);
		return "redirect:com_list.do";
	}
	
	// �亯 ���
	@RequestMapping("/addCom_ans.do")
	public String ansCom_add(final @ModelAttribute ComAnsVO avo,final @ModelAttribute ComVO vo)
			throws Exception {
		comansDao.add(avo, vo);
		return "redirect:com.do?no="+vo.getNo();
	}
		
	// �亯 ����
	@RequestMapping("/delCom_ans.do")
	public String delCom_ans(final @ModelAttribute ComAnsVO avo,final @ModelAttribute ComVO vo) throws Exception {
		comansDao.delByPK(avo);
		return "redirect:com.do?no=" + avo.getNo();
	}
	
	// �亯 ��õ
	@RequestMapping("/recomCom_A.do")
	public String recomA_com(final @ModelAttribute ComAnsVO pvo, final @ModelAttribute ComVO vo,HttpSession session) throws Exception {	
		comansDao.recom(pvo,(String)session.getAttribute("username"));
		return "redirect:com.do?no=" + vo.getNo();
	}
	
	@RequestMapping("/com.do")
	ModelAndView Community(final @ModelAttribute ComVO vo, final @ModelAttribute ComAnsVO avo, HttpSession session) throws Exception {
		comDao.view_update(vo, (String)session.getAttribute("username"));
		ComVO ls = comDao.findByPk(vo);
		List<ComAnsVO> ans_ls = comansDao.findByFk(avo,vo);
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("com_view");
		mnv.addObject("list", ls);
		mnv.addObject("ans_list",ans_ls);
		return mnv;
	}
	
}
