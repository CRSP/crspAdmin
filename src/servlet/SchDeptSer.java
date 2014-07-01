package servlet;

import impl.SchDeptDAOImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SchDeptDAO;
import entity.Department;
import entity.SchDept;
import entity.School;

public class SchDeptSer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	SchDeptDAO schDeptDAOImpl=new SchDeptDAOImpl();
	
	public SchDeptSer() {
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
		if(status.equals("querySchDept")){
			int schoolId=Integer.parseInt(request.getParameter("schoolId"));
			int deptId=Integer.parseInt(request.getParameter("deptId"));
			if(schDeptDAOImpl.querySchDept(schoolId, deptId)){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
		}else if(status.equals("saveSchDept")){
			int schoolId=Integer.parseInt(request.getParameter("schoolId"));
			int deptId=Integer.parseInt(request.getParameter("deptId"));
			if(schDeptDAOImpl.querySchDept(schoolId, deptId)){
				response.getWriter().write("false");
			}else{
				SchDept schDept=new SchDept();
				School school=new School();
				school.setId(schoolId);
				schDept.setSchool(school);
				Department dept=new Department();
				dept.setId(deptId);
				schDept.setDepartment(dept);
				schDeptDAOImpl.saveSchDept(schDept);
				response.getWriter().write("true");
			}
		}else if(status.equals("querySchDeptName")){
			String schoolName=request.getParameter("schoolName");
			int schDeptSize=Integer.parseInt(request.getParameter("schDeptSize"));
			
			request.getSession().setAttribute("querySchDeptName", schoolName);
			request.getServletContext().setAttribute("schDeptSize", schDeptSize);
			
			request.getSession().setAttribute("currentPage", 1);
			request.getSession().setAttribute("countPage", schDeptDAOImpl.cluPage(schoolName,schDeptSize));
			
			List<SchDept> schDepts=schDeptDAOImpl.querySchDeptName(schoolName,1,schDeptSize);
			request.setAttribute("schDepts", schDepts);
			request.getRequestDispatcher("/admin/querySchDept.jsp").forward(request, response);
		}else if(status.equals("updateSchDept")){
			int id=Integer.parseInt(request.getParameter("id"));
			int schoolId=Integer.parseInt(request.getParameter("schoolId"));
			int departmentId=Integer.parseInt(request.getParameter("departmentId"));
			schDeptDAOImpl.updateSchDept(id, schoolId, departmentId);
		}else if(status.equals("deleteSchDept")){
			int id=Integer.parseInt(request.getParameter("id"));
			schDeptDAOImpl.deleteSchDept(id);
		}else if(status.equals("splitPage")){
			String schoolName=request.getSession().getAttribute("querySchDeptName").toString();
			int schDeptSize=Integer.parseInt(request.getServletContext().getAttribute("schDeptSize").toString());
			int currentPage=Integer.parseInt(request.getParameter("currentPage"));
			request.getSession().setAttribute("currentPage", currentPage);
			List<SchDept> schDepts=schDeptDAOImpl.querySchDeptName(schoolName,currentPage,schDeptSize);
			request.setAttribute("schDepts", schDepts);
			request.getRequestDispatcher("/admin/querySchDept.jsp").forward(request, response);
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
