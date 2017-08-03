package kr.co.sist.notice.domain;

public class NoticePageData {

	private int tatalPage, firstPage, lastPage, currentPage;

	public int getTatalPage() {
		return tatalPage;
	}

	public void setTatalPage(int tatalPage) {
		this.tatalPage = tatalPage;
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
		return "NoticePageData [tatalPage=" + tatalPage + ", firstPage=" + firstPage + ", lastPage=" + lastPage
				+ ", currentPage=" + currentPage + "]";
	}
	
	
}
