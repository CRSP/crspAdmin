package servlet;

import impl.ResTypeDAOImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ResTypeDAO;

import entity.Department;
import entity.ResType;

public class ResTypeSer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	ResTypeDAO resTypeDAOImpl=new ResTypeDAOImpl();
	
	public ResTypeSer() {
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
		if(status.equals("saveResType")){
			String name=request.getParameter("name");
			//后台判断资源类型名不重复
			if(resTypeDAOImpl.queryResType(name)){
				response.getWriter().write("false");
			}else if(name==""){
				response.getWriter().write("false");
			}else{
				resTypeDAOImpl.saveResType(name);
				response.getWriter().write("true");
			}
		}else if(status.equals("queryResType")){
			String name=request.getParameter("name");
			if(resTypeDAOImpl.queryResType(name)){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
		}else if(status.equals("queryResTypeName")){
			String name=request.getParameter("name");
			request.getSession().setAttribute("queryResTypeName", name);
			List<ResType> resTypes=resTypeDAOImpl.queryResTypeName(name);
			request.setAttribute("resTypes", resTypes);
			request.getRequestDispatcher("/admin/ResTypeManage.jsp").forward(request, response);
		}else if(status.equals("updateResType")){
			int id=Integer.parseInt(request.getParameter("id"));
			String name=request.getParameter("name");
			ResType resType=new ResType();
			resType.setId(id);
			resType.setName(name);
			resTypeDAOImpl.updateResType(resType);
		}else if(status.equals("deleteResType")){
			int id=Integer.parseInt(request.getParameter("id"));
			resTypeDAOImpl.deleteResType(id);
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
