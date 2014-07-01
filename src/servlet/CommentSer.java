package servlet;

import impl.CommentDAOImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDAO;
import entity.Comment;

public class CommentSer extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5742411990948470438L;

	CommentDAO commentDAOImpl=new CommentDAOImpl();
	
	/**
	 * Constructor of the object.
	 */
	public CommentSer() {
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
		if(status.equals("queryComment")){
			String comResName=request.getParameter("comResName");
			int comResSize=Integer.parseInt(request.getParameter("comResSize"));
			
			request.getSession().setAttribute("queryComResName", comResName);
			request.getServletContext().setAttribute("comResSize", comResSize);
			
			request.getSession().setAttribute("currentPage", 1);
			request.getSession().setAttribute("countPage", commentDAOImpl.cluPage(comResName,comResSize));
			
			List<Comment> comments=commentDAOImpl.queryComment(comResName,1,comResSize);
			request.setAttribute("comments", comments);
			request.getRequestDispatcher("/admin/queryComment.jsp").forward(request, response);
		}else if(status.equals("splitPage")){
			String comResName=request.getSession().getAttribute("queryComResName").toString();
			int comResSize=Integer.parseInt(request.getServletContext().getAttribute("comResSize").toString());
			int currentPage=Integer.parseInt(request.getParameter("currentPage"));
			request.getSession().setAttribute("currentPage", currentPage);
			List<Comment> comments=commentDAOImpl.queryComment(comResName,currentPage,comResSize);
			request.setAttribute("comments", comments);
			request.getRequestDispatcher("/admin/queryComment.jsp").forward(request, response);
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
