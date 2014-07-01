package dao;

import java.util.List;

import entity.Province;

public interface ProvinceDAO {

	public List<Province> queryProvince(String name);
}
