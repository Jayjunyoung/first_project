package my.model;

public class User {
	private String userId;
	private String password;
	private String name;
	private String email;
	private String address;
	private String birthday;
	
	public User() {}
	
	
	
	
	public User(String userId, String password, String name, String email, String address, String birthday) {
		super();
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.email = email;
		this.address = address;
		this.birthday = birthday;
	}




	public String getUserId() {
		return userId;
	}




	public void setUserId(String userId) {
		this.userId = userId;
	}




	public String getPassword() {
		return password;
	}




	public void setPassword(String password) {
		this.password = password;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
	}




	public String getBirthday() {
		return birthday;
	}




	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}


	
	

}
