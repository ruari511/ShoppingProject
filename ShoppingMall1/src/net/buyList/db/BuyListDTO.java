package net.buyList.db;

import java.sql.Timestamp;

public class BuyListDTO {
	
	//구매정보
	private int buynum;
	private String id;
	private String order_name;
	private String order_mtel;
	private String order_email;
	private Timestamp buydate; //String -> timestamp 변경
	private int product_num;
	/*private int product_count; -> buy_count 변경*/
	private int buy_count;
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
	
	
	//제품정보
	private String category_main;
	private String category_sub;
	private String product_name;
	private String product_sum_name; //추가
	private int product_count;
	private int product_price;
	private int product_sale_price;
	private String img_main;
	private String img_contents;
	private String brand;
	
	
	
	
	
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
	public Timestamp getBuydate() {
		return buydate;
	}
	public void setBuydate(Timestamp buydate) {
		this.buydate = buydate;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}
	public int getAll_coupon_num() {
		return all_coupon_num;
	}
	public void setAll_coupon_num(int all_coupon_num) {
		this.all_coupon_num = all_coupon_num;
	}
	public int getDelivery_coupon_num() {
		return delivery_coupon_num;
	}
	public void setDelivery_coupon_num(int delivery_coupon_num) {
		this.delivery_coupon_num = delivery_coupon_num;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getDelivery_title() {
		return delivery_title;
	}
	public void setDelivery_title(String delivery_title) {
		this.delivery_title = delivery_title;
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
	public String getCategory_main() {
		return category_main;
	}
	public void setCategory_main(String category_main) {
		this.category_main = category_main;
	}
	public String getCategory_sub() {
		return category_sub;
	}
	public void setCategory_sub(String category_sub) {
		this.category_sub = category_sub;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_sum_name() {
		return product_sum_name;
	}
	public void setProduct_sum_name(String product_sum_name) {
		this.product_sum_name = product_sum_name;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_sale_price() {
		return product_sale_price;
	}
	public void setProduct_sale_price(int product_sale_price) {
		this.product_sale_price = product_sale_price;
	}
	public String getImg_main() {
		return img_main;
	}
	public void setImg_main(String img_main) {
		this.img_main = img_main;
	}
	public String getImg_contents() {
		return img_contents;
	}
	public void setImg_contents(String img_contents) {
		this.img_contents = img_contents;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	
	
	

	
	
}
