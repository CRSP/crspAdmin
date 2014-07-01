package entity;

public class Record {
	
	private int id;
	private Resource resource;
	private User uploadUser;
	private User downloadUser;
	private int delta;
	private String time;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Resource getResource() {
		return resource;
	}
	public void setResource(Resource resource) {
		this.resource = resource;
	}
	public User getUploadUser() {
		return uploadUser;
	}
	public void setUploadUser(User uploadUser) {
		this.uploadUser = uploadUser;
	}
	public User getDownloadUser() {
		return downloadUser;
	}
	public void setDownloadUser(User downloadUser) {
		this.downloadUser = downloadUser;
	}
	public int getDelta() {
		return delta;
	}
	public void setDelta(int delta) {
		this.delta = delta;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
