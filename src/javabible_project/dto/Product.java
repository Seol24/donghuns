package javabible_project.dto;

public class Product {
	private String code;
	private String name;
	private int salePrice;
	private int origiPrice;
	
	public Product(String code, String name, int salePrice, int origiPrice) {
		this.code = code;
		this.name = name;
		this.salePrice = salePrice;
		this.origiPrice = origiPrice;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getOrigiPrice() {
		return origiPrice;
	}

	public void setOrigiPrice(int origiPrice) {
		this.origiPrice = origiPrice;
	}

	@Override
	public String toString() {
		return String.format("Product [code=%s, name=%s, salePrice=%s, origiPrice=%s]", code, name, salePrice,
				origiPrice);
	}
	
	
}
