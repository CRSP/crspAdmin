package servlet;

import impl.ResourceDAOImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ResourceDAO;
import entity.Mock;
import entity.Record;
import entity.Resource;

public class ResSer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	ResourceDAO resourceDAOImpl=new ResourceDAOImpl();
	
	public ResSer() {
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
		if(status.equals("queryRes")){
			String resourceName=request.getParameter("resourceName");
			request.getSession().setAttribute("queryResourceName", resourceName);
			
			int resourceSize=Integer.parseInt(request.getParameter("resourceSize"));
			request.getServletContext().setAttribute("resourceSize", resourceSize);
			
			request.getSession().setAttribute("currentPage", 1);
			request.getSession().setAttribute("countPage", resourceDAOImpl.cluPage(resourceName,resourceSize));
			
			List<Resource> resources=resourceDAOImpl.queryRes(resourceName, 1, resourceSize);
			request.setAttribute("resources", resources);
			request.getRequestDispatcher("/admin/queryRes.jsp").forward(request, response);
		}else if(status.equals("splitPage")){
			String resourceName=request.getSession().getAttribute("queryResourceName").toString();
			int resourceSize=Integer.parseInt(request.getServletContext().getAttribute("resourceSize").toString());
			int currentPage=Integer.parseInt(request.getParameter("currentPage"));
			request.getSession().setAttribute("currentPage", currentPage);
			List<Resource> resources=resourceDAOImpl.queryRes(resourceName,currentPage,resourceSize);
			request.setAttribute("resources", resources);
			request.getRequestDispatcher("/admin/queryRes.jsp").forward(request, response);
		}else if(status.equals("checkRes")){
			String checkResName=request.getParameter("checkResName");
			request.getSession().setAttribute("checkResName", checkResName);
			
			int checkResSize=Integer.parseInt(request.getParameter("checkResSize"));
			request.getServletContext().setAttribute("checkResSize", checkResSize);
			
			request.getSession().setAttribute("currentPage", 1);
			request.getSession().setAttribute("countPage", resourceDAOImpl.cluPage1(checkResName,checkResSize));
			
			List<Resource> resources=resourceDAOImpl.checkRes(checkResName, 1, checkResSize);
			request.setAttribute("resources", resources);
			request.getRequestDispatcher("/admin/checkRes.jsp").forward(request, response);
		}else if(status.equals("splitPage1")){
			String checkResName=request.getSession().getAttribute("checkResName").toString();
			int checkResSize=Integer.parseInt(request.getServletContext().getAttribute("checkResSize").toString());
			int currentPage=Integer.parseInt(request.getParameter("currentPage"));
			request.getSession().setAttribute("currentPage", currentPage);
			List<Resource> resources=resourceDAOImpl.checkRes(checkResName,currentPage,checkResSize);
			request.setAttribute("resources", resources);
			request.getRequestDispatcher("/admin/checkRes.jsp").forward(request, response);
		}else if(status.equals("updateRes")){
			int id=Integer.parseInt(request.getParameter("id"));
			int res_status=Integer.parseInt(request.getParameter("res_status"));
			resourceDAOImpl.updateResStatus(id, res_status);
			
			String checkResName=request.getSession().getAttribute("checkResName").toString();
			int checkResSize=Integer.parseInt(request.getServletContext().getAttribute("checkResSize").toString());
			int currentPage=Integer.parseInt(request.getSession().getAttribute("currentPage").toString());
			List<Resource> resources=resourceDAOImpl.checkRes(checkResName,currentPage,checkResSize);
			request.setAttribute("resources", resources);
			request.getRequestDispatcher("/admin/checkRes.jsp").forward(request, response);
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
