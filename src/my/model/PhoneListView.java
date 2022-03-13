package my.model;

import java.util.List;

public class PhoneListView {
	private int phoneTotalCount;
	private int currentPageNumber;
	private List<Phone> phoneList;
	private int pageTotalCount;
	private int phoneCountPerPage;
	
	public PhoneListView(List<Phone> phoneList, int phoneTotalCount,
			int currentPageNumber, int phoneCountPerPage) {
		this.phoneList = phoneList;
		this.phoneTotalCount = phoneTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.phoneCountPerPage = phoneCountPerPage;
		calculatePageTotalCount();
	}

	private void calculatePageTotalCount() {
		if (phoneTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = phoneTotalCount / phoneCountPerPage;
			if (phoneTotalCount % phoneCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	public int getPhoneTotalCount() {
		return phoneTotalCount;
	}

	public void setPhoneTotalCount(int phoneTotalCount) {
		this.phoneTotalCount = phoneTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public List<Phone> getPhoneList() {
		return phoneList;
	}

	public void setPhoneList(List<Phone> phoneList) {
		this.phoneList = phoneList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getPhoneCountPerPage() {
		return phoneCountPerPage;
	}

	public void setPhoneCountPerPage(int phoneCountPerPage) {
		this.phoneCountPerPage = phoneCountPerPage;
	}

	
	

}
