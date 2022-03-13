package my.model;

import java.util.Date;

public class Galaxy {
	private int pid;
	private String maker;
	private String mname;
	private String company;
	private String capacity;
	private int price;
	private Date pdate;
	private String pimage;
	private int pcount;
	
	public Galaxy() {} //기본생성자 //using field할때 pid는 체크해제하고하기 팀명, 팀원 이랑 쇼핑몰 이름 담주 월욜까지 제출 

	

	
	public Galaxy(int pid, String maker, String mname, String company, String capacity, int price, Date pdate,
			String pimage) {
		super();
		this.pid = pid;
		this.maker = maker;
		this.mname = mname;
		this.company = company;
		this.capacity = capacity;
		this.price = price;
		this.pdate = pdate;
		this.pimage = pimage;
		
	}




	public int getPid() {
		return pid;
	}




	public void setPid(int pid) {
		this.pid = pid;
	}




	public String getMaker() {
		return maker;
	}




	public void setMaker(String maker) {
		this.maker = maker;
	}




	public String getMname() {
		return mname;
	}




	public void setMname(String mname) {
		this.mname = mname;
	}




	public String getCompany() {
		return company;
	}




	public void setCompany(String company) {
		this.company = company;
	}




	public String getCapacity() {
		return capacity;
	}




	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}




	public int getPrice() {
		return price;
	}




	public void setPrice(int price) {
		this.price = price;
	}




	public Date getPdate() {
		return pdate;
	}




	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}




	public String getPimage() {
		return pimage;
	}




	public void setPimage(String pimage) {
		this.pimage = pimage;
	}




	public int getPcount() {
		return pcount;
	}



	public void setPcount(int pcount) {
		this.pcount = pcount;
	}


	

	
	
}
