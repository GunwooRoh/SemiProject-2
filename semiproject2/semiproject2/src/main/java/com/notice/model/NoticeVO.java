package com.semiJY.notice.model;

import java.sql.Timestamp;

public class NoticeVO {
	private int no;
	private String title;
	private String content;
	private Timestamp regdate;
	private int adminNo;
	private String fileName;
	private String originFileName;
	private int fileSize;
	private int viewCount;
	
	public NoticeVO() {
		super();
	}

	public NoticeVO(int no, String title, String content, Timestamp regdate, int adminNo, String fileName,
			String originFileName, int fileSize, int viewCount) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.adminNo = adminNo;
		this.fileName = fileName;
		this.originFileName = originFileName;
		this.fileSize = fileSize;
		this.viewCount = viewCount;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	
	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	@Override
	public String toString() {
		return "NoticeVO [no=" + no + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", adminNo=" + adminNo + ", fileName=" + fileName + ", originFileName=" + originFileName
				+ ", fileSize=" + fileSize + ", viewCount=" + viewCount + "]";
	}

	
	
}
