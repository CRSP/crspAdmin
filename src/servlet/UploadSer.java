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

import dao.SchoolDAO;

import entity.Province;
import entity.School;

import util.UploadUtil;

public class UploadSer extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4717727866275735253L;
	/**
	 * Constructor of the object.
	 */
	
	SchoolDAO schoolDAOImpl=new SchoolDAOImpl();
	
	public UploadSer() {
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
		String uuidName=null;
		String status=null;
		String path=null;
		School school=new School();
		if(ServletFileUpload.isMultipartContent(request)){
			//1工厂
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			//2工厂获得解析器
			ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
			//3设置解析器参数
			fileUpload.setFileSizeMax(1024*1024*5);
			//处理上传附件名乱码
			fileUpload.setHeaderEncoding("UTF-8");
			//解析器解析请求request
			try {
				List<FileItem>list = fileUpload.parseRequest(request);
				//遍历list每一个FileItem
				for (FileItem fileItem : list) {
					if(fileItem.isFormField()){
						//普通form表单项
						String name = fileItem.getFieldName();
						String value = fileItem.getString("utf-8");
						//parameterMap.put(name, value);//手动的将普通form输入的参数封装到一个自定义的map
						if(name.equals("status")){
							status=value;
						}else if(name.equals("name")){
							school.setName(value);
						}else if(name.equals("provinceId")){
							Province province=new Province();
							province.setId(Integer.parseInt(value));
							school.setProvince(province);
						}else if(name.equals("description")){
							school.setDescription(value);
						}else if(name.equals("id")){
							school.setId(Integer.parseInt(value));
						}
					}else{
						//文件上传项
						//判断用户是否上传文件
						String filename = fileItem.getName();
						if(filename != null && !filename.trim().equals("")){
							//没有上传文件
							//throw new RuntimeException("添加活动，必须上传图片");
							//获得真实文件名
							//filename = UploadUtil.subFileName(filename);
							//校检上传文件格式
							//String contentType = fileItem.getContentType();
							boolean isValid = UploadUtil.checkImgType(filename);
							if(!isValid){
								throw new RuntimeException("上传文件格式不正确");
							}
							//唯一的UUID随机文件名
							uuidName = UploadUtil.generateUUIDName(filename);
							//文件名入库
							school.setAvatar(uuidName);
							path=request.getServletContext().getRealPath("/");
							path = path+"avatar";
							if(!new File(path).isDirectory())//如果不存在，则创建目录   
	                            new File(path).mkdirs();
							
							//文件上传
							InputStream in = new BufferedInputStream(fileItem.getInputStream());
							OutputStream out = new BufferedOutputStream(new FileOutputStream(new File(path,uuidName)));
							int b;
							while((b=in.read())!=-1){
								out.write(b);
							}
							in.close();
							out.close();
							//刪除临时文件
							fileItem.delete();
							//将img保持到parameterMap
							//parameterMap.put("img", "/upload"+"/"+uuidName);

						}
						
					}
				}
				
//				Activity activity = new Activity();
//				BeanUtils.populate(activity, parameterMap);
//				//业务层
//				ActivityService service = new ActivityService();
//				service.addActivity(activity,request.getSession().getAttribute("loginUser"));
				
				
				
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		if(status.equals("saveSchool")){
			schoolDAOImpl.saveSchool(school);
			response.sendRedirect("/crspAdmin/admin/saveSchool.jsp");
		}else if(status.equals("updateAvatar")){
			schoolDAOImpl.updateAvatar(school);
			PrintWriter h = response.getWriter();
			h.write("\\crspAdmin\\avatar\\" + uuidName);
			h.flush();
			h.close();
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
