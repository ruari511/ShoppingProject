package net.board.db;

import java.sql.Timestamp;

public class BoardDTO {
	private int num;  //글 번호
	private String id; //작성자 아이디
	private String category; //카테고리
	private int category_num; //카테고리번호
	private int product_num; //제품번호
	private String product_name; //제품명
	private String subject; //제목
	private String content; //내용
	private String file; //첨부파일
	private String re_result; //0:미답변, 1:답변
	private Timestamp reg_date; //글등록일
	private String reply_id;  //답변자 id
	private String reply; //답변 내용
	private Timestamp re_reg_date;  //답변 등록일
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getRe_result() {
		return re_result;
	}
	public void setRe_result(String re_result) {
		this.re_result = re_result;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getReply_id() {
		return reply_id;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Timestamp getRe_reg_date() {
		return re_reg_date;
	}
	public void setRe_reg_date(Timestamp re_reg_date) {
		this.re_reg_date = re_reg_date;
	}
	
	
	
}
