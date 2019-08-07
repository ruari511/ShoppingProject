package product;

public class ProductDTO {
	private int product_num;
	private String product_name;
	private int product_price;
	private String product_contents;
	private int category_main;
	private int category_sub;
	private int price_count;
	private String img;
	private int discount;
	
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
