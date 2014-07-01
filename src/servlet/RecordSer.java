package servlet;

import impl.RecordDAOImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RecordDAO;
import entity.Record;
import entity.User;

public class RecordSer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	RecordDAO recordDAOImpl=new RecordDAOImpl();
	
	public RecordSer() {
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
		if(status.equals("queryRecord")){
			String res_name=request.getParameter("res_name");
			int resSize=Integer.parseInt(request.getParameter("resSize"));
			
			request.getSession().setAttribute("queryResName", res_name);
			request.getServletContext().setAttribute("resSize", resSize);
			
			request.getSession().setAttribute("currentPage", 1);
			request.getSession().setAttribute("countPage", recordDAOImpl.cluPage(res_name,resSize));
			
			List<Record> records=recordDAOImpl.queryRecord(res_name,1,resSize);
			request.setAttribute("records", records);
			request.getRequestDispatcher("/admin/queryRecord.jsp").forward(request, response);
		}else if(status.equals("splitPage")){
			String res_name=request.getSession().getAttribute("queryResName").toString();
			int resSize=Integer.parseInt(request.getServletContext().getAttribute("resSize").toString());
			int currentPage=Integer.parseInt(request.getParameter("currentPage"));
			request.getSession().setAttribute("currentPage", currentPage);
			List<Record> records=recordDAOImpl.queryRecord(res_name,currentPage,resSize);
			request.setAttribute("records", records);
			request.getRequestDispatcher("/admin/queryRecord.jsp").forward(request, response);
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
