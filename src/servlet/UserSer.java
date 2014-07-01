package servlet;

import impl.UserDAOImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import entity.User;

public class UserSer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	UserDAO userDAOImpl=new UserDAOImpl();
	
	public UserSer() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String status=request.getParameter("status");
		if(status.equals("queryUser")){
			String user_id=request.getParameter("user_id");
			int userSize=Integer.parseInt(request.getParameter("userSize"));
			request.getSession().setAttribute("queryUserId", user_id);
			request.getServletContext().setAttribute("userSize", userSize);
			
			request.getSession().setAttribute("currentPage", 1);
			request.getSession().setAttribute("countPage", userDAOImpl.cluPage(user_id,userSize));
			
			List<User> users=userDAOImpl.queryUser(user_id,1,userSize);
			request.setAttribute("users", users);
			request.getRequestDispatcher("/admin/queryUser.jsp").forward(request, response);
		}else if(status.equals("updatePoints")){
			int id=Integer.parseInt(request.getParameter("id"));
			int points=Integer.parseInt(request.getParameter("points"));
			userDAOImpl.updatePoints(id, points);
		}else if(status.equals("splitPage")){
			String user_id=request.getSession().getAttribute("queryUserId").toString();
			int userSize=Integer.parseInt(request.getServletContext().getAttribute("userSize").toString());
			int currentPage=Integer.parseInt(request.getParameter("currentPage"));
			request.getSession().setAttribute("currentPage", currentPage);
			List<User> users=userDAOImpl.queryUser(user_id,currentPage,userSize);
			request.setAttribute("users", users);
			request.getRequestDispatcher("/admin/queryUser.jsp").forward(request, response);
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
