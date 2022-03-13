package my.model;

import java.util.Date;

public class Product {
	private int pid;
	private String pname;
	private int price;
	private Date pdate;
	private String pimage;
	private int pcount;
	
	public Product() {} //기본생성자 //using field할때 pid는 체크해제하고하기 팀명, 팀원 이랑 쇼핑몰 이름 담주 월욜까지 제출 

public Product(int pid, String pname, int price, Date pdate, String pimage) { //파라미터생성자
		super();
		this.pid = pid;
		this.pname = pname;
		this.price = price;
		this.pdate = pdate;
		this.pimage = pimage;
		
	}

	
	public int getPcount() {
	return pcount;
}

public void setPcount(int pcount) {
	this.pcount = pcount;
}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
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
	
	
	
}
