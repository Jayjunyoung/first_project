package my.model;

import java.util.List;

public class MessageListView {
	private int messageTotalCount; //전체 메시지  수
	private int currentPageNumber; //현재 페이지 번호
	private List<Message> messageList; //현재 페이지에 포함된 메시지들
	private int pageTotalCount; //전체 페이지 수
	private int messageCountPerPage; //페이지당 메시지 수
	private int firstRow; //페이지내 첫번째 레코드 번호
	private int endRow; //페이지내 마지막 레코드 번호
	public MessageListView(int messageTotalCount, int currentPageNumber,
			List<Message> messageList, int messageCountPerPage, int firstRow,
			int endRow) {
		super();
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageList = messageList;
		this.messageCountPerPage = messageCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calculatePageTotalCount(); //여기서 페이지수 계산
	}
	
	public void calculatePageTotalCount(){
		if (messageTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = messageTotalCount / messageCountPerPage;
			if (messageTotalCount % messageCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	public int getMessageTotalCount() {
		return messageTotalCount;
	}

	public void setMessageTotalCount(int messageTotalCount) {
		this.messageTotalCount = messageTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public List<Message> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getMessageCountPerPage() {
		return messageCountPerPage;
	}

	public void setMessageCountPerPage(int messageCountPerPage) {
		this.messageCountPerPage = messageCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	public boolean isEmpty(){
		return messageTotalCount == 0;  //메시지수가 0이면 true를 리턴 
	}
}










