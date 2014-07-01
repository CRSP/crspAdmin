package util;

import impl.SchoolDAOImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import javax.servlet.ServletContext;

import dao.SchoolDAO;
import entity.School;

public class SchoolTimerTask extends TimerTask {
	
	SchoolDAO schoolDAOImpl=new SchoolDAOImpl();
	
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

		List<School> schools=new ArrayList<School>();
		
		for (School school : schoolDAOImpl.querySchool("",1,1000)) {
			schools.add(school);
		}
		application.setAttribute("schools", schools);
	}

}
