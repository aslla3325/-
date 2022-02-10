### java

## 생성

- AnswerVO.java : getter setter
- AnswerDAO.java : DAO 패턴
- AnswerDAO_Impl.java : 필요 함수

## 추가

- Ctrl.java

  		private AnswerDAO answerDao = null;
			public AnswerDAO getAnswerDao() { return answerDao; }
			public void setAnswerDao(AnswerDAO answerDao) { this.answerDao = answerDao; }
  		
  		...
  		
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
		  
		  ...
		  
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
  
### jsp

## 추가 

- qna_view.jsp

		<!-- Answer_show -->
		<table class="table table-borered table-striped">
    	    <q:forEach items="${ans_list}" var="t">
    	        <tr>
    	            <td>
    	               	<span class="font_table">${t.content}</span>
    	            </td>
    	            <td style="text-align:center;"><span class="font_sm">(${t.username} / ${t.time})</span></td>
    	            <td class="font_table">[<a href="del_ans.do?ans_no=${t.ans_no}&no=${list.no}">X</a>]</td>
    	            <td>
    	        </tr>
    	    </q:forEach>
    	</table>
		<!-- Answer_add -->
		<form method="POST" action="add_ans.do?no=${list.no}">
        
        	<div class="form-group has-success">
        	    <label class="font" for="bcd">작성자</label>
        	    <input type="text" class="form-control font" id="bcd" name="username"/>
        	</div>
        	
        	<div class="form-group has-success">
        	    <label class="font" for="abcd">내용</label>
        	    <textarea class="form-control font" id="abcd" name="content" rows="5"></textarea>
        	</div>
			        
        	<div class="form-group has-success">
        	    <input class="form-control" type="submit"/>
        	</div>
    	</form>

![image](https://user-images.githubusercontent.com/72788533/152972008-30698a05-3274-4003-8995-8f92afb70480.png)


### xml

## 추가

-spring.xml

		...
		<bean id="answerDao" class="banana.AnswerDAO_Impl">
			<property name="jdbcTemplate" ref="jtpl"/>
		</bean>
		...
		<bean class="banana.Ctrl">
			<property name="springDao" ref="springDao"/>
			<property name="answerDao" ref="answerDao"/>
			<property name="loginDao" ref="loginDao"/>
		</bean>



