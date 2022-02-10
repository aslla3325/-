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
		
	// �������� db
	private NoticeDAO noticeDao = null;
	public NoticeDAO getNoticeDao() { return noticeDao; }
	public void setNoticeDao(NoticeDAO noticeDao) { this.noticeDao = noticeDao; }
	
//-----------------------------------------------------------------
	
	@ResponseBody
	@RequestMapping("/ping.do")
	public String ping() throws Exception {
		return noticeDao.toString();
	}
	
//-----------------------------------------------------------------
	
	// �α��� ȭ��, ���� ���� ����
	@RequestMapping("/login.do")
	public ModelAndView login(HttpSession session, @RequestParam(value = "ecode", required = false) String ecode ) 
			throws Exception {
		if (session.getAttribute("username") != null || session.getAttribute("password") != null) {
			session.removeAttribute("username");
			session.removeAttribute("password");
			session.removeAttribute("operator");
		}
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("view_login");
		if(ecode != null) {
			mnv.addObject("ecode", ecode);
		}
		return mnv;
	}
	
	// �α��� ���̵�, �н����� ����
	@RequestMapping("/login_add.do")
	public String login_add(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password, HttpSession session) throws Exception {
		LoginVO vo = loginDao.findBy_IdPwd(username, password);
		if (vo == null) {
			return "redirect:login.do?ecode=login_fail";
		} else {
			session.setAttribute("username", vo.getUsername());
			session.setAttribute("password", vo.getPassword());
			session.setAttribute("operator", vo.getOperator());
			return "redirect:home.do";
		}
	}
	
//-----------------------------------------------------------------
	
	// ȸ�� ���� ȭ��
	@RequestMapping("/join.do")
	public String join(@RequestParam(value = "ecode", required = false) String ecode, HttpServletRequest request)
			throws Exception {
		request.setAttribute("ecode", ecode);
		return "id_create";
	}
	
	// ȸ�� ����, ���̵� �ߺ� Ȯ��
	@RequestMapping("/join_add.do")
	public String join_add(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password) throws Exception {
		String res = loginDao.add_join(username, password);
		if (res.equals("fail")) {
			return "redirect:join.do?ecode=join_fail";
		} else {
			return "redirect:login.do?ecode=join_success";
		}
	}
//-----------------------------------------------------------------	
	
	// ����������
	@RequestMapping("/mypage.do")
	public ModelAndView mypage(HttpSession session) throws Exception {
		String username = (String)session.getAttribute("username");
		List<SpringVO> ques = springDao.findByUserName(username);
		List<AnswerVO> q_ans = answerDao.findByUserName(username);
		List<ComVO> com = comDao.findByUserName(username);
		List<ComAnsVO> com_ans = comansDao.findByUserName(username);
		
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("user_page");
		mnv.addObject("ques", ques);
		mnv.addObject("q_ans", q_ans);
		mnv.addObject("com", com);
		mnv.addObject("com_ans", com_ans);
		return mnv;
	}
	
//-----------------------------------------------------------------
	
	// �������� ȭ��
	@RequestMapping("/notice.do")
	public ModelAndView notice() throws Exception {
		List<NoticeVO> ls = noticeDao.findAll();
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("view_notice");
		mnv.addObject("list", ls);
		return mnv;
	}
	
	// �������� �� ���� -> �ش� �ۿ� ���� ȭ��
	@RequestMapping("/notice_content.do")
	public ModelAndView notice_content(@ModelAttribute NoticeVO pvo) throws Exception {
		NoticeVO ls = noticeDao.findByPk(pvo);
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("notice_content");
		mnv.addObject("list", ls);
		return mnv;
	}
	
	// �������� �� �Է� ȭ��
	@RequestMapping("/update_notice.do")
	public ModelAndView update_notice(@RequestParam(value = "ecode", required = false) String ecode) 
			throws Exception {
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("update_notice");
		if(ecode != null) {
			mnv.addObject("ecode", ecode);
		}
		return mnv;
	}
	
	// �������� �� �Է� ȭ�鿡�� �Էµ� ���� �߰�
	@RequestMapping("/add_notice.do")
	public String add_notice(final @ModelAttribute NoticeVO vo )
			throws Exception {
		System.out.println( vo.toString() );
		noticeDao.add(vo);
		return "redirect:notice.do";
	}
	
	// �������� �� ����
	@RequestMapping("/del_notice.do")
	public String del_notice(@ModelAttribute NoticeVO vo) throws Exception {
		noticeDao.delByPK(vo);
		return "redirect:notice.do";
	}
	
//-----------------------------------------------------------------
	
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
		springDao.add(vo);
		return "redirect:qna_list.do";
	}
	
	// ���� ��� ȭ��
	@RequestMapping("/update.do")
	public ModelAndView update(@RequestParam(value = "ecode", required = false) String ecode) throws Exception {
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("update_view");
		if(ecode != null) {
			mnv.addObject("ecode", ecode);
		}
		return mnv;
	}
	
	// ���� ����
	@RequestMapping("/del.do")
	public String del(final @ModelAttribute SpringVO vo, HttpSession session, 
			@RequestParam(value = "del", required = false) String del) throws Exception {
		springDao.delByPK(vo);
		if( del.equals("return_mypage") ) {
			return "redirect:mypage.do";
		}
		else {
			return "redirect:qna_list.do";
		}
	}
	
//-----------------------------------------------------------------
	
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

//-----------------------------------------------------------------
	
	// ���� �� ��� -> �� ���� -> �ش� �ۿ� ���� ����
	@RequestMapping("/qna.do")
	ModelAndView quest(final @ModelAttribute SpringVO vo, final @ModelAttribute AnswerVO avo, HttpSession session,
			@RequestParam(value = "ecode", required = false) String ecode) throws Exception {
		springDao.view_update(vo, (String)session.getAttribute("username"));
		SpringVO ls = springDao.findByPk(vo);
		List<AnswerVO> ans_ls = answerDao.findByFk(avo,vo);
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("qna_view");
		mnv.addObject("list", ls);
		mnv.addObject("ans_list",ans_ls);
		if(ecode != null) {
			mnv.addObject("ecode", ecode);
		}
		return mnv;
	}
	
	// ������ ��õ
	@RequestMapping("/recomQ.do")
	public String recomQ(final @ModelAttribute SpringVO vo, HttpSession session) throws Exception {	
		springDao.recom(vo, (String)session.getAttribute("username"));
		return "redirect:qna.do?no=" + vo.getNo();
	}
	
	// �亯 ��õ
	@RequestMapping("/recomA.do")
	public String recomA(final @ModelAttribute AnswerVO pvo, final @ModelAttribute SpringVO vo,HttpSession session) throws Exception {	
		answerDao.recom(pvo,(String)session.getAttribute("username"));
		return "redirect:qna.do?no=" + vo.getNo();
	}

//---------------------------------------------------------
	
	// home
	@RequestMapping("/home.do")
	public ModelAndView main() throws Exception {
		List<NoticeVO> notice = noticeDao.findAll();
		SpringVO month_q = springDao.findBestQ();
		List<AnswerVO> month_king = answerDao.findAll();
		List<SpringVO> ques = springDao.findAll();
		List<ComVO> com = comDao.findAll();
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("main");
		mnv.addObject("notice", notice);
		if( month_q != null ) {
			mnv.addObject("month_q", month_q);
		}
		mnv.addObject("month_king", month_king);
		mnv.addObject("ques", ques);
		mnv.addObject("com", com);
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
		if( ls != null ) {
			mnv.addObject("list", ls);
		}
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
	public ModelAndView update_com(@RequestParam(value = "ecode", required = false) String ecode) throws Exception {
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("update_com");
		if(ecode != null) {
			mnv.addObject("ecode", ecode);
		}
		return mnv;
	}

	// ��� ����
	@RequestMapping("/delCom.do")
	public String del_com(final @ModelAttribute ComVO vo, HttpSession session,
			@RequestParam(value = "del", required = false) String del ) throws Exception {
		comDao.delByPK(vo);
		if( del.equals("return_mypage") ) {
			return "redirect:mypage.do";
		}
		else {
			return "redirect:com_list.do";
		}
		//comDao.delByPK(vo);
		//return "redirect:com_list.do";
	}

//----------------------------------------------------------
	
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
	ModelAndView Community(final @ModelAttribute ComVO vo, final @ModelAttribute ComAnsVO avo, HttpSession session,
			@RequestParam(value = "ecode", required = false) String ecode) throws Exception {
		comDao.view_update(vo, (String)session.getAttribute("username"));
		ComVO ls = comDao.findByPk(vo);
		List<ComAnsVO> ans_ls = comansDao.findByFk(avo,vo);
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("com_view");
		mnv.addObject("list", ls);
		mnv.addObject("ans_list",ans_ls);
		if(ecode != null) {
			mnv.addObject("ecode", ecode);
		}
		return mnv;
	}
}
