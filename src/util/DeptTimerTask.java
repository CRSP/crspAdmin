package util;

import impl.DepartmentDAOImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import javax.servlet.ServletContext;

import dao.DepartmentDAO;
import entity.Department;

public class DeptTimerTask extends TimerTask {
	
	DepartmentDAO departmentDAOImpl=new DepartmentDAOImpl();
	
	private ServletContext application=null;
	
	public ServletContext getApplication() {
		return application;
	}

	public void setApplication(ServletContext application) {
		this.application = application;
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub

		List<Department> departments=new ArrayList<Department>();
		
		for (Department department : departmentDAOImpl.queryDept("")) {
			departments.add(department);
		}
		application.setAttribute("departments", departments);
	}
}
