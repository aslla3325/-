package banana;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;

@Controller
public class Ctrl {
	private SpringDAO springDao = null;
	public SpringDAO getSpringDao() { return springDao; }
	public void setSpringDao(SpringDAO springDao) { this.springDao = springDao; }

	private AnswerDAO answerDao = null;
	public AnswerDAO getAnswerDao() { return answerDao; }
	public void setAnswerDao(AnswerDAO answerDao) { this.answerDao = answerDao; }

	private LoginDAO loginDao = null;
	public LoginDAO getLoginDao() { return loginDao; }
	public void setLoginDao(LoginDAO loginDao) { this.loginDao = loginDao; }

	@ResponseBody
	@RequestMapping("/ping.do")
	public String ping() throws Exception {
		return loginDao.toString();
	}

	@RequestMapping("/login.do")
	public String login(HttpSession session, @RequestParam(value = "ecode", required = false) String ecode,
			HttpServletRequest request) throws Exception {
		if (session.getAttribute("id") != null || session.getAttribute("pwd") != null) {
			session.removeAttribute("id");
			session.removeAttribute("pwd");
		}
		request.setAttribute("ecode", ecode);
		return "view_login";
	}

	@RequestMapping("/login_add.do")
	public String login_add(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "pwd", required = false) String pwd, HttpSession session) throws Exception {
		if (id == null || id.equals("")) {
			return "redirect:login.do?ecode=id_invalid";
		}
		else if (pwd == null || pwd.equals("")) {
			return "redirect:login.do?ecode=pwd_invalid";
		} else {
			LoginVO vo = loginDao.findBy_IdPwd(id, pwd);
			if (vo == null) {
				return "redirect:login.do?ecode=login_fail";
			} else {
				session.setAttribute("id", vo.getUsername());
				session.setAttribute("pwd", vo.getPassword());
				return "redirect:home.do";
			}
		}
	}

	@RequestMapping("/join.do")
	public String join(@RequestParam(value = "ecode", required = false) String ecode, HttpServletRequest request)
			throws Exception {
		request.setAttribute("ecode", ecode);
		return "id_create";
	}

	@RequestMapping("/join_add.do")
	public String join_add(@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "pwd", required = false) String pwd) throws Exception {
		if (id == null || id.equals("")) {
			return "redirect:join.do?ecode=id_invalid";
		}
		else if (pwd == null || pwd.equals("")) {
			return "redirect:join.do?ecode=pwd_invalid";
		}

		String res = loginDao.add_join(id, pwd);
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

	@RequestMapping("/home.do")
	public ModelAndView list( HttpSession session ) throws Exception {
		List<SpringVO> ls = springDao.findAll();
		ModelAndView mnv = new ModelAndView();
		
		if (session.getAttribute("id") == null) {
			mnv.setViewName("view_login");
			mnv.addObject("ecode", "need_login");
		}
		else {
			mnv.setViewName("view_list");
			mnv.addObject("list", ls);
		}
		return mnv;
	}

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
		return "redirect:home.do";
	}
	
	@RequestMapping("/add_ans.do")
	public String ans_add(final @ModelAttribute AnswerVO avo,final @ModelAttribute SpringVO vo)
			throws Exception {
		answerDao.add(avo, vo);
		return "redirect:qna.do?no="+vo.getNo();
	}
	
	@RequestMapping("/del_ans.do")
	public String del_ans(final @ModelAttribute AnswerVO avo,final @ModelAttribute SpringVO vo) throws Exception {
		answerDao.delByPK(avo);
		return "redirect:qna.do?no=" + avo.getNo();
	}

	@RequestMapping("/update.do")
	public ModelAndView update() throws Exception {
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("update_view");
		return mnv;
	}

	@RequestMapping("/del.do")
	public String del(final @ModelAttribute SpringVO vo, HttpSession session) throws Exception {
		springDao.delByPK(vo);
		return "redirect:home.do";
	}

	@RequestMapping("/qna.do")
	ModelAndView quest(final @ModelAttribute SpringVO vo, final @ModelAttribute AnswerVO avo) throws Exception {
		SpringVO ls = springDao.findByPk(vo);
		List<AnswerVO> ans_ls = answerDao.findByFk(avo,vo);
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("qna_view");
		mnv.addObject("list", ls);
		mnv.addObject("ans_list",ans_ls);
		return mnv;
	}

	@RequestMapping("/recom.do")
	public String recom(final @ModelAttribute SpringVO vo, HttpSession session) throws Exception {
		springDao.recom(vo);
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
}
