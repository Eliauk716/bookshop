package entity;

public class BookRecord {
    private String img;
    private String bookname;
    private String author;
    private String booktype;
    private Integer quantity;
    private Double price;
    private String check;

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBooktype() {
        return booktype;
    }

    public void setBooktype(String booktype) {
        this.booktype = booktype;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getCheck() {
        return check;
    }

    public void setCheck(String check) {
        this.check = check;
    }

    public BookRecord(String img, String bookname, String author, String booktype, Integer quantity, Double price, String check) {
        this.img = img;
        this.bookname = bookname;
        this.author = author;
        this.booktype = booktype;
        this.quantity = quantity;
        this.price = price;
        this.check = check;
    }

    @Override
    public String toString() {
        return "BookRecord{" +
                "img='" + img + '\'' +
                ", bookname='" + bookname + '\'' +
                ", author='" + author + '\'' +
                ", booktype='" + booktype + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                ", check='" + check + '\'' +
                '}';
    }
}
