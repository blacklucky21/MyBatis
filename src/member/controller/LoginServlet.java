package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.exception.MemberException;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		
		
		
		System.out.println(userId);
		System.out.println(userPwd);
		Member m = new Member();
		
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		
		
		try {
			Member member = new MemberService().selectMember(m);
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser",member);
			session.setMaxInactiveInterval(600);
			request.getRequestDispatcher("/").forward(request, response);
			//"/"있으면 알아서 indexPage로 넘어감
		} catch (MemberException e) {
			//조회된 상황이 없을때 catch로 넘어옴
			RequestDispatcher error = request.getRequestDispatcher("/views/common/errorPage.jsp");
			request.setAttribute("message",e.getMessage());
			error.forward(request, response);
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
