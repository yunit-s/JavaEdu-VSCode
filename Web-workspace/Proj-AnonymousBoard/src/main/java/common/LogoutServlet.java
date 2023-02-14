package common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.vo.Member;

/**
 * Servlet implementation class logoutServlet
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("logoutServlet.doGet() 실행");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		try {
			Member loginMember = (Member)session.getAttribute("loginMember");
			System.out.println("!!! logout! id : " + loginMember.getMemberId());
			loginMember.setMemberId(null);
			session.setAttribute("loginMember", loginMember);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("!!! logoutServlet.doPost() 오류발생");
		}
		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("login.html");
//		dispatcher.forward(request, response);
		response.sendRedirect("login.html");
		
	}

}