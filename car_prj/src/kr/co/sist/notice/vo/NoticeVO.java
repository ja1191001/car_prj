package kr.co.sist.notice.vo;

public class NoticeVO {

	private int num;
	private String title, content, hiredate;
	
	public NoticeVO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeVO(int num, String title, String content, String hiredate) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.hiredate = hiredate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getHiredate() {
		return hiredate;
	}

	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}

	@Override
	public String toString() {
		return "NoticeNum [num=" + num + ", title=" + title + ", content=" + content + ", hiredate=" + hiredate + "]";
	}
	
	
}
