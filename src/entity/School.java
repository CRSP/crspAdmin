package entity;

public class School {

	private int id;
	private Province province;
	private String name;
	private String description;
	private String avatar;
	private int resource_count;
	
	public int getResource_count() {
		return resource_count;
	}
	public void setResource_count(int resource_count) {
		this.resource_count = resource_count;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Province getProvince() {
		return province;
	}
	public void setProvince(Province province) {
		this.province = province;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	
}
