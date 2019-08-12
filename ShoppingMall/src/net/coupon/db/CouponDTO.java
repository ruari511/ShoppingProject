package net.coupon.db;


public class CouponDTO {
	 
	private int coupon_num;
	private String coupon_name;
	private int coupon_percent;
	private int coupon_limitmax;
	private String category_main;
	private String coupon_type;
	
	
	public int getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}
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
	public String getCategory_main() {
		return category_main;
	}
	public void setCategory_main(String category_main) {
		this.category_main = category_main;
	}
	public String getCoupon_type() {
		return coupon_type;
	}
	public void setCoupon_type(String coupon_type) {
		this.coupon_type = coupon_type;
	}
	
	
	 
}
