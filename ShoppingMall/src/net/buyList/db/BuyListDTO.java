package net.buyList.db;

public class BuyListDTO {
	private int buynum;
	private String id;
	private int product_num;
	private int product_count;
	private String delivery_name;
	private String delivery_mtel;
	private String delivery_address;
	
	
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
