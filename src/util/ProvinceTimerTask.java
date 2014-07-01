package util;

import impl.ProvinceDAOImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import javax.servlet.ServletContext;

import dao.ProvinceDAO;

import entity.Province;

public class ProvinceTimerTask extends TimerTask {

	ProvinceDAO provinceDAOImpl=new ProvinceDAOImpl();
	
	private ServletContext application=null;
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		
		List<Province> provinces=new ArrayList<Province>();
		
		for (Province province : provinceDAOImpl.queryProvince("")) {
			provinces.add(province);
		}
		application.setAttribute("provinces", provinces);
	}

	public ServletContext getApplication() {
		return application;
	}

	public void setApplication(ServletContext application) {
		this.application = application;
	}

}
