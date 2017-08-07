package kr.co.sist.notice.domain;

public class NoticePageData {

	private int totalPage, firstPage, lastPage, currentPage;

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	@Override
	public String toString() {
		return "NoticePageData [totalPage=" + totalPage + ", firstPage=" + firstPage + ", lastPage=" + lastPage
				+ ", currentPage=" + currentPage + "]";
	}
	
	
}
