package com.ssh.pjt.dto;

public class ReplyDto {

	private int reply_seq;
	private String reply_id;
	private int reply_boardSeq;
	private String reply_text;
	private String reply_date;
	
	public int getReply_seq() {
		return reply_seq;
	}
	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}
	public String getReply_id() {
		return reply_id;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}
	public int getReply_boardSeq() {
		return reply_boardSeq;
	}
	public void setReply_boardSeq(int reply_boardSeq) {
		this.reply_boardSeq = reply_boardSeq;
	}
	public String getReply_text() {
		return reply_text;
	}
	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	
}
