package servlet;

import impl.SchoolDAOImpl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import util.UploadUtil;

import dao.SchoolDAO;

import entity.Department;
import entity.Province;
import entity.Record;
import entity.School;

public class SchoolSer extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	SchoolDAO schoolDAOImpl=new SchoolDAOImpl();
	
	public SchoolSer() {
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
		if(status.equals("saveSchool")){
			String name=request.getParameter("name");
			int provinceId=Integer.parseInt(request.getParameter("provinceId"));
			String description=request.getParameter("description");
			//后台判断院系名称不重复
			if(schoolDAOImpl.querySchoolName(name)){
				response.getWriter().write("false");
			}else if(name==""){
				response.getWriter().write("false");
			}else{
				School school=new School();
				school.setName(name);
				Province province=new Province();
				province.setId(provinceId);
				school.setProvince(province);
				school.setDescription(description);
				
			}
		}else if(status.equals("querySchoolName")){
			String name=request.getParameter("name");
			if(schoolDAOImpl.querySchoolName(name)){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
		}else if(status.equals("querySchool")){
			String name=request.getParameter("name");
			int schoolSize=Integer.parseInt(request.getParameter("schoolSize"));
			
			request.getSession().setAttribute("querySchoolName", name);
			request.getServletContext().setAttribute("schoolSize", schoolSize);
			
			request.getSession().setAttribute("currentPage", 1);
			request.getSession().setAttribute("countPage", schoolDAOImpl.cluPage(name,schoolSize));
			
			List<School> schools=schoolDAOImpl.querySchool(name,1,schoolSize);
			request.setAttribute("schools", schools);
			request.getRequestDispatcher("/admin/querySchool.jsp").forward(request, response);
		}else if(status.equals("updateSchool")){
			int id=Integer.parseInt(request.getParameter("id"));
			String name=request.getParameter("name");
			int provinceId=Integer.parseInt(request.getParameter("provinceId"));
			String description=request.getParameter("description");
			//String avatar=request.getParameter("avatar");
			School school=new School();
			school.setId(id);
			school.setName(name);
			Province province=new Province();
			province.setId(provinceId);
			school.setProvince(province);
			school.setDescription(description);
			//school.setAvatar(avatar);
			schoolDAOImpl.updateSchool(school);
		}else if(status.equals("deleteSchool")){
			int id=Integer.parseInt(request.getParameter("id"));
			schoolDAOImpl.deleteSchool(id);
		}else if(status.equals("splitPage")){
			String name=request.getSession().getAttribute("querySchoolName").toString();
			int schoolSize=Integer.parseInt(request.getServletContext().getAttribute("schoolSize").toString());
			int currentPage=Integer.parseInt(request.getParameter("currentPage"));
			request.getSession().setAttribute("currentPage", currentPage);
			List<School> schools=schoolDAOImpl.querySchool(name,currentPage,schoolSize);
			request.setAttribute("schools", schools);
			request.getRequestDispatcher("/admin/querySchool.jsp").forward(request, response);
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
