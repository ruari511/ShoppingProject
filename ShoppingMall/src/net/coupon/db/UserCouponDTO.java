package net.coupon.db;


import java.sql.Timestamp;

public class UserCouponDTO {
	
	private int coupon_num;
	private String id;
	private Timestamp start_date;
	private Timestamp last_date;
	private int usecheck;
	
	private String coupon_name;
	private int coupon_percent;
	private int coupon_limitmax;
	private String coupon_type;
	
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public int getCoupon_percent() {
		return coupon_percent;
	}
	public void setCoupon_percent(int coupon_percent) {
		this.coupon_percent = coupon_percent;
	}
	public int getCoupon_limitmax() {
		return coupon_limitmax;
	}
	public void setCoupon_limitmax(int coupon_limitmax) {
		this.coupon_limitmax = coupon_limitmax;
	}
	public String getCoupon_type() {
		return coupon_type;
	}
	public void setCoupon_type(String coupon_type) {
		this.coupon_type = coupon_type;
	}
	public int getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
