package member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.exception.MemberException;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberPwdUpdate
 */
@WebServlet("/mPwdUpdate.me")
public class MemberPwdUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		
		String userId = member.getUserId();
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd");
		
		/*
		 * 
		 * update member
		 * set user_pwd =#{newPwd}
		 * where user_id =#{userId} and user_pwd=#{userPwd}
		 * 
		 */
		
		HashMap<String,String> map = new HashMap<>();
		map.put("userId",userId);
		map.put("userPwd",userPwd);
		map.put("newPwd",newPwd);
		
		try {
			new MemberService().pwdUpdate(map);
			member.setUserPwd(newPwd);
			request.getSession().setAttribute("loginUser",member);
			response.sendRedirect(request.getContextPath());
		} catch (MemberException e) {
			
			request.setAttribute("message",e.getMessage());
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
