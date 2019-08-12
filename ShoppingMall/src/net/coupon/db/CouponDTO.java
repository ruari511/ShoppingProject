package net.coupon.db;

import java.sql.Timestamp;

public class CouponDTO {
	 private int coupon_num;
	 private int coupon_percent;
	 private String id;
	 private int category;
	 private Timestamp start_date;     // datetime
	 private Timestamp last_date;      // datetime
	 private int usecheck;
	 
	public int getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}
	public int getCoupon_percent() {
		return coupon_percent;
	}
	public void setCoupon_percent(int coupon_percent) {
		this.coupon_percent = coupon_percent;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public Timestamp getStart_date() {
		return start_date;
	}
	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}
	public Timestamp getLast_date() {
		return last_date;
	}
	public void setLast_date(Timestamp last_date) {
		this.last_date = last_date;
	}
	public int getUsecheck() {
		return usecheck;
	}
	public void setUsecheck(int usecheck) {
		this.usecheck = usecheck;
	}
	 
	 
}
