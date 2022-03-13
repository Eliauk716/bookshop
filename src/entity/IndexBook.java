package entity;

public class IndexBook {
	String bname;
	String price;
	String author;
	String path;
	Integer b_id;
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	public IndexBook(String bname, String author, String price, String path) {
		this.bname = bname;
		this.price = price;
		this.author = author;
		this.path = path;
	}
	
	public IndexBook(String bname, String author, String price) {
		this.bname = bname;
		this.price = price;
		this.author = author;
	}
	
	public IndexBook(String bname) {
		this.bname = bname;
	}
	@Override
	public String toString() {
		return "Book [bname=" + bname + ", price=" + price + ", author=" + author + ", path=" + path + "]";
	}

	public IndexBook(int b_id, String bname, String price, String author, String path) {
		this.b_id = b_id;
		this.bname = bname;
		this.price = price;
		this.author = author;
		this.path = path;
	}
}
