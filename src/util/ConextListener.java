package util;

import java.util.Timer;

import impl.DepartmentDAOImpl;
import impl.ProvinceDAOImpl;
import impl.SchoolDAOImpl;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import dao.DepartmentDAO;
import dao.ProvinceDAO;
import dao.SchoolDAO;

public class ConextListener implements ServletContextListener {

	ProvinceDAO provinceDAOImpl=new ProvinceDAOImpl();
	SchoolDAO schoolDAOImpl=new SchoolDAOImpl();
	DepartmentDAO departmentDAOImpl=new DepartmentDAOImpl();
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		// TODO Auto-generated method stub
		
		//设置分页默认每页显示的数量
		event.getServletContext().setAttribute("userSize", 5);
		event.getServletContext().setAttribute("resSize", 10);
		event.getServletContext().setAttribute("schoolSize", 10);
		event.getServletContext().setAttribute("schDeptSize", 10);
		event.getServletContext().setAttribute("resourceSize", 10);
		event.getServletContext().setAttribute("checkResSize", 10);
		event.getServletContext().setAttribute("comResSize", 10);
		event.getServletContext().setAttribute("mockResSize", 10);
		
		//服务器初始化填充下拉列表选项
		event.getServletContext().setAttribute("provinces", provinceDAOImpl.queryProvince(""));
		event.getServletContext().setAttribute("schools", schoolDAOImpl.querySchool("",1,1000));
		event.getServletContext().setAttribute("departments", departmentDAOImpl.queryDept(""));
		//省份定时更新
		ProvinceTimerTask provinceTimerTask=new ProvinceTimerTask();
		provinceTimerTask.setApplication(event.getServletContext());
		new Timer().schedule(provinceTimerTask, 0L, 5*1000L);
		//学校定时更新
		SchoolTimerTask schoolTimerTask=new SchoolTimerTask();
		schoolTimerTask.setApplication(event.getServletContext());
		new Timer().schedule(schoolTimerTask, 0L, 5*1000L);
		//院系定时更新
		DeptTimerTask deptTimerTask=new DeptTimerTask();
		deptTimerTask.setApplication(event.getServletContext());
		new Timer().schedule(deptTimerTask, 0L, 5*1000L);
	}

}
