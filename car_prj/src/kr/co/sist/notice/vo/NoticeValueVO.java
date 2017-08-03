package kr.co.sist.notice.vo;

public class NoticeValueVO {

	private int startNum, endNum;
	private String columnName, keyword;
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public String getColumName() {
		return columnName;
	}
	public void setColumName(String columName) {
		this.columnName = columName;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "NoticeValueVO [startNum=" + startNum + ", endNum=" + endNum + ", columnName=" + columnName
				+ ", keyword=" + keyword + "]";
	}
	
	
}
