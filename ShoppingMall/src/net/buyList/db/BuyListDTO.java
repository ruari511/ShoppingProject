package net.buyList.db;

import java.sql.Timestamp;

public class BuyListDTO {
	private int buynum;
	private String id;
	private String order_name;
	private String order_mtel;
	private String order_email;
	private String buydate;
	private int product_num;
	private int product_count;
	private int all_coupon_num; 
	private int delivery_coupon_num;
	private int point;
	private String delivery_title;
	private int delivery_cost;
	private String delivery_result;
	private String delivery_name;
	private String delivery_mtel;
	private String delivery_address;
	private String delivery_message;
	private String payments;
	
	public String getDelivery_title() {
		return delivery_title;
	}
	public void setDelivery_title(String delivery_title) {
		this.delivery_title = delivery_title;
	}
	public int getDelivery_coupon_num() {
		return delivery_coupon_num;
	}
	public void setDelivery_coupon_num(int delivery_coupon_num) {
		this.delivery_coupon_num = delivery_coupon_num;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_mtel() {
		return order_mtel;
	}
	public void setOrder_mtel(String order_mtel) {
		this.order_mtel = order_mtel;
	}
	public String getOrder_email() {
		return order_email;
	}
	public void setOrder_email(String order_email) {
		this.order_email = order_email;
	}
	public String getBuydate() {
		return buydate;
	}
	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}
	public int getAll_coupon_num() {
		return all_coupon_num;
	}
	public void setAll_coupon_num(int all_coupon_num) {
		this.all_coupon_num = all_coupon_num;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getDelivery_cost() {
		return delivery_cost;
	}
	public void setDelivery_cost(int delivery_cost) {
		this.delivery_cost = delivery_cost;
	}
	public String getDelivery_result() {
		return delivery_result;
	}
	public void setDelivery_result(String delivery_result) {
		this.delivery_result = delivery_result;
	}
	public String getDelivery_message() {
		return delivery_message;
	}
	public void setDelivery_message(String delivery_message) {
		this.delivery_message = delivery_message;
	}
	public String getPayments() {
		return payments;
	}
	public void setPayments(String payments) {
		this.payments = payments;
	}
	public int getBuynum() {
		return buynum;
	}
	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public String getDelivery_name() {
		return delivery_name;
	}
	public void setDelivery_name(String delivery_name) {
		this.delivery_name = delivery_name;
	}
	public String getDelivery_mtel() {
		return delivery_mtel;
	}
	public void setDelivery_mtel(String delivery_mtel) {
		this.delivery_mtel = delivery_mtel;
	}
	public String getDelivery_address() {
		return delivery_address;
	}
	public void setDelivery_address(String delivery_address) {
		this.delivery_address = delivery_address;
	}
}
