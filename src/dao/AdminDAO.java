package dao;

import java.util.List;

import entity.Admin;

public interface AdminDAO {
	// 添加管理员信息
	public void save(Admin admin);

	// 更新管理员信息
	public boolean changePwd(String user_name,String user_pwd1,String user_pwd2);

	// 删除管理员信息
	public void delete(int id);

	// 根据Id查询管理员信息
	public Admin findById(int id);
	
	// 分页查询所有的管理员
	//public List<?> findByPage(Page page);
	
	// 根据管理员的用户名查询
	public List<Admin> findByName(String user_name);

	// 根据某个属性查询管理员的信息
//	public List<?> findByProperty(Page page,String propertyName, Object value);
//	
//	// 根据某个属性模糊查询管理员的信息
//	public List<?> findLikeProperty(Page page,String propertyName, Object value);
	
	// 查询总记录数
	public int queryCount(String hql);	
	
	public Admin loginCheck(Admin admin);
	
	public boolean queryUserName(String user_name);
	
	public boolean queryUserName(String user_name,String user_pwd,String user_pwd2);
	
}
