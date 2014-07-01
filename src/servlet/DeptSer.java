package servlet;

import impl.DepartmentDAOImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DepartmentDAO;

import entity.Department;
import entity.User;

public class DeptSer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	DepartmentDAO departmentDAOImpl=new DepartmentDAOImpl();
	
	public DeptSer() {
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
		if(status.equals("saveDept")){
			String name=request.getParameter("name");
			String description=request.getParameter("description");
			String avatar=request.getParameter("avatar");
			//后台判断院系名称不重复
			if(departmentDAOImpl.queryDeptName(name)){
				response.getWriter().write("false");
			}else if(name==""){
				response.getWriter().write("false");
			}else{
				Department department=new Department();
				department.setName(name);
				department.setDescription(description);
				department.setAvatar(avatar);
				departmentDAOImpl.saveDept(department);
				response.getWriter().write("true");
			}
		}else if(status.equals("queryDeptName")){
			String name=request.getParameter("name");
			if(departmentDAOImpl.queryDeptName(name)){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
		}else if(status.equals("queryDept")){
			String name=request.getParameter("name");
			request.getSession().setAttribute("queryDeptName", name);
			List<Department> departments=departmentDAOImpl.queryDept(name);
			request.setAttribute("departments", departments);
			request.getRequestDispatcher("/admin/queryDept.jsp").forward(request, response);
		}else if(status.equals("updateDept")){
			int id=Integer.parseInt(request.getParameter("id"));
			String name=request.getParameter("name");
			String description=request.getParameter("description");
			String avatar=request.getParameter("avatar");
			Department department=new Department();
			department.setId(id);
			department.setName(name);
			department.setDescription(description);
			department.setAvatar(avatar);
			departmentDAOImpl.updateDept(department);
		}else if(status.equals("deleteDept")){
			int id=Integer.parseInt(request.getParameter("id"));
			departmentDAOImpl.deleteDept(id);
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
