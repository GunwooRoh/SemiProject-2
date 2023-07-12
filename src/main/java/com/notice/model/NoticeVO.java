package com.notice.model;

import java.sql.Timestamp;

public class NoticeVO {
	private int annNo;
	private String annTitle;
	private String annContent;
	private Timestamp regdate;
	private int adminNo;
	private int readCount;
	
	private String fileName;
	private String originFileName;
	private long fileSize;
	private int downCount;
	
	public NoticeVO() {
		super();
	}

	

	public NoticeVO(int annNo, String annTitle, String annContent, Timestamp regdate, int adminNo, int readCount,
			String fileName, String originFileName, long fileSize, int downCount) {
		super();
		this.annNo = annNo;
		this.annTitle = annTitle;
		this.annContent = annContent;
		this.regdate = regdate;
		this.adminNo = adminNo;
		this.readCount = readCount;
		this.fileName = fileName;
		this.originFileName = originFileName;
		this.fileSize = fileSize;
		this.downCount = downCount;
	}



	public int getAnnNo() {
		return annNo;
	}

	public void setAnnNo(int annNo) {
		this.annNo = annNo;
	}

	public String getAnnTitle() {
		return annTitle;
	}

	public void setAnnTitle(String annTitle) {
		this.annTitle = annTitle;
	}

	public String getAnnContent() {
		return annContent;
	}

	public void setAnnContent(String annContent) {
		this.annContent = annContent;
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

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	
	

	public int getDownCount() {
		return downCount;
	}



	public void setDownCount(int downCount) {
		this.downCount = downCount;
	}



	@Override
	public String toString() {
		return "NoticeVO [annNo=" + annNo + ", annTitle=" + annTitle + ", annContent=" + annContent + ", regdate="
				+ regdate + ", adminNo=" + adminNo + ", readCount=" + readCount + ", fileName=" + fileName
				+ ", originFileName=" + originFileName + ", fileSize=" + fileSize + ", downCount=" + downCount + "]";
	}



	
	

	
	
}
