package buyList;

import java.sql.Timestamp;

public class BuyListDTO {
	//구매정보
	private int buynum;
	private String id;
	private String order_name;
	private String order_mtel;
	private String order_email;
	private Timestamp buydate;
	private int product_num;
	private int product_count;
	private String coupon_num;
	private int point;
	private int delivery_cost;
	private String delivery_result;
	private String delivery_name;
	private String delivery_mtel;
	private String delivery_address;
	private String delivery_message;
	private String payments;
	
	
	//제품정보
	private String product_name;
	private int product_price;
	private String product_contents;
	private int category_main;
	private int category_sub;
	private int price_count;
	private String img;
	private int discount;
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
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public String getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(String coupon_num) {
		this.coupon_num = coupon_num;
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
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_contents() {
		return product_contents;
	}
	public void setProduct_contents(String product_contents) {
		this.product_contents = product_contents;
	}
	public int getCategory_main() {
		return category_main;
	}
	public void setCategory_main(int category_main) {
		this.category_main = category_main;
	}
	public int getCategory_sub() {
		return category_sub;
	}
	public void setCategory_sub(int category_sub) {
		this.category_sub = category_sub;
	}
	public int getPrice_count() {
		return price_count;
	}
	public void setPrice_count(int price_count) {
		this.price_count = price_count;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	
	
	
}
