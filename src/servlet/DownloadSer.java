package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadSer extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6498014850935790208L;

	/**
	 * Constructor of the object.
	 */
	public DownloadSer() {
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

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
