package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDAO;
import impl.AdminDAOImpl;

import entity.Admin;

public class AdminSer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	private AdminDAO adminDAOImpl=new AdminDAOImpl();
	
	public AdminSer() {
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
		Admin admin=new Admin();
		List<Admin> admins=new ArrayList<Admin>();
		String status=request.getParameter("status");
		if(status.equals("loginAdmin")){
			String user_name=request.getParameter("user_name");
			String user_pwd=request.getParameter("user_pwd");
			admin.setUser_name(user_name);
			admin.setUser_pwd(user_pwd);
			admin=adminDAOImpl.loginCheck(admin);
			if(admin!=null){
				request.getSession().setAttribute("loginAdmin", admin);
				response.sendRedirect("/crspAdmin/admin/index.jsp");
			}else{
				request.setAttribute("error", "登录失败");
				request.getRequestDispatcher("/loginAdmin.jsp").forward(request, response);
			}
		}else if(status.equals("loginOut")){
			request.getSession().invalidate();
			response.sendRedirect("/crspAdmin/loginAdmin.jsp");
		}else if(status.equals("changePwd")){
			String user_pwd=request.getParameter("user_pwd");
			String user_pwd1=request.getParameter("user_pwd1");
			String user_pwd2=request.getParameter("user_pwd2");
			admin=(Admin)request.getSession().getAttribute("loginAdmin");
			String user_name=admin.getUser_name();
			if(admin.getUser_pwd().equals(user_pwd)){
				if(adminDAOImpl.changePwd(user_name, user_pwd1, user_pwd2)){
					admin.setUser_pwd(user_pwd1);
					request.getSession().setAttribute("loginAdmin", admin);
					response.getWriter().write("true");
				}else{
					response.getWriter().write("false");
				}
			}else{
				response.getWriter().write("false");
			}
		}else if(status.equals("saveAdmin")){
			String user_name=request.getParameter("user_name");
			String user_pwd=request.getParameter("user_pwd");
			String user_pwd2=request.getParameter("user_pwd2");
			//后台判断用户名不为空，用户名不重复，密码不为空，两个密码一致
			if(adminDAOImpl.queryUserName(user_name, user_pwd, user_pwd2)){
				admin.setUser_name(user_name);
				admin.setUser_pwd(user_pwd);
				adminDAOImpl.save(admin);
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
		}else if(status.equals("queryAdmin")){
			String user_name=request.getParameter("user_name");
			HttpSession session=request.getSession();
			session.setAttribute("queryAdminName", user_name);
			admins=adminDAOImpl.findByName(user_name);
			request.setAttribute("admins", admins);
			request.getRequestDispatcher("/admin/queryAdmin.jsp").forward(request, response);
		}else if(status.equals("deleteAdmin")){
			int id=Integer.parseInt(request.getParameter("id"));
			adminDAOImpl.delete(id);
		}else if(status.equals("queryUserName")){
			String user_name=request.getParameter("user_name");
			if(adminDAOImpl.queryUserName(user_name)){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
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
