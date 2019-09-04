package net.product.db;

public class ProductDTO {
	private int product_num; // 상품번호
	private String product_name; // 상품이름
	private String product_subname; // 상품세부이름
	private int product_price; // 가격
	private String img_main; // 이미지메인
	private String img_contents; // 이미지
	private String category_main; // 메인카테고리
	private String category_sub; // 서브카테고리
	private int price_count; // 구매갯수
	private int product_sale_price; // 할인
	private String brand; // 브랜드
	private int product_count;
	
	
	
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getProduct_subname() {
		return product_subname;
	}
	public void setProduct_subname(String product_subname) {
		this.product_subname = product_subname;
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
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
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
	public int getPrice_count() {
		return price_count;
	}
	public void setPrice_count(int price_count) {
		this.price_count = price_count;
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
	public int getProduct_sale_price() {
		return product_sale_price;
	}
	public void setProduct_sale_price(int product_sale_price) {
		this.product_sale_price = product_sale_price;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	
	
	
}
