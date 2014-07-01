package servlet;

import impl.MockDAOImpl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MockDAO;

import entity.Comment;
import entity.Mock;

public class MockSer extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5848961721072506979L;
	
	/**
	 * Constructor of the object.
	 */
	
	MockDAO mockDAOImpl = new MockDAOImpl();
	
	public MockSer() {
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
		if(status.equals("queryMock")){
			String mockResName=request.getParameter("mockResName");
			int mockResSize=Integer.parseInt(request.getParameter("mockResSize"));
			
			request.getSession().setAttribute("queryMockResName", mockResName);
			request.getServletContext().setAttribute("mockResSize", mockResSize);
			
			request.getSession().setAttribute("currentPage", 1);
			request.getSession().setAttribute("countPage", mockDAOImpl.cluPage(mockResName,mockResSize));
			
			List<Mock> mocks=mockDAOImpl.queryMock(mockResName,1,mockResSize);
			request.setAttribute("mocks", mocks);
			request.getRequestDispatcher("/admin/queryMock.jsp").forward(request, response);
		}else if(status.equals("splitPage")){
			String mockResName=request.getSession().getAttribute("queryMockResName").toString();
			int mockResSize=Integer.parseInt(request.getServletContext().getAttribute("mockResSize").toString());
			int currentPage=Integer.parseInt(request.getParameter("currentPage"));
			request.getSession().setAttribute("currentPage", currentPage);
			List<Mock> mocks=mockDAOImpl.queryMock(mockResName,currentPage,mockResSize);
			request.setAttribute("mocks", mocks);
			request.getRequestDispatcher("/admin/queryMock.jsp").forward(request, response);
		}else if(status.equals("freezeRes")){
			int res_id=Integer.parseInt(request.getParameter("res_id"));
			int mock_status=Integer.parseInt(request.getParameter("mock_status"));
			int res_status=Integer.parseInt(request.getParameter("res_status"));
			mockDAOImpl.freezeRes(res_id, mock_status, res_status);
			//冻结后重新查询一次
			String mockResName=request.getSession().getAttribute("queryMockResName").toString();
			int mockResSize=Integer.parseInt(request.getServletContext().getAttribute("mockResSize").toString());
			int currentPage=Integer.parseInt(request.getSession().getAttribute("currentPage").toString());
			List<Mock> mocks=mockDAOImpl.queryMock(mockResName,currentPage,mockResSize);
			request.setAttribute("mocks", mocks);
			request.getRequestDispatcher("/admin/queryMock.jsp").forward(request, response);
		}else if(status.equals("repealMock")){
			int id=Integer.parseInt(request.getParameter("id"));
			int mock_status=Integer.parseInt(request.getParameter("mock_status"));
			mockDAOImpl.repealMock(id,mock_status);
			
			String mockResName=request.getSession().getAttribute("queryMockResName").toString();
			int mockResSize=Integer.parseInt(request.getServletContext().getAttribute("mockResSize").toString());
			int currentPage=Integer.parseInt(request.getSession().getAttribute("currentPage").toString());
			List<Mock> mocks=mockDAOImpl.queryMock(mockResName,currentPage,mockResSize);
			request.setAttribute("mocks", mocks);
			request.getRequestDispatcher("/admin/queryMock.jsp").forward(request, response);
		}else if(status.equals("downloadRes")){
			String fileName = request.getParameter("path");//数据库保存的文件名称
			System.out.println(fileName);
			String resourcePath = request.getSession().getServletContext().getRealPath("/");
			resourcePath=resourcePath.substring(0,resourcePath.lastIndexOf("\\"));
			resourcePath=resourcePath.substring(0,resourcePath.lastIndexOf("\\"));
			resourcePath=resourcePath + File.separator + "resource" + File.separator + fileName;
			System.out.println(resourcePath);
			// 设置为下载application/x-download 
			response.setContentType("application/x-download"); 
			// 即将下载的文件在服务器上的绝对路径 
			String filenamedownload = resourcePath; 
			// 下载文件时显示的文件保存名称 
			String filenamedisplay = fileName; 
			// 中文编码转换 
			filenamedisplay = URLEncoder.encode(filenamedisplay, "UTF-8"); 
			response.addHeader("Content-Disposition", "attachment;filename=" 
				    + filenamedisplay); 
			try{ 
				java.io.OutputStream os = response.getOutputStream(); 
				java.io.FileInputStream fis = new java.io.FileInputStream(filenamedownload); 
				byte[] b = new byte[1024]; 
				int i = 0; 
				while ((i = fis.read(b)) > 0) { 
					os.write(b, 0, i); 
				} 
				fis.close(); 
				os.flush(); 
				os.close(); 
			} catch (Exception e) { 
				 e.printStackTrace();
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
