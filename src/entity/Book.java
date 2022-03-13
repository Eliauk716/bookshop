package entity;

public class Book {
    private Integer b_id;
    private String b_name;
    private String author;
    private Double b_price;
    private String type;
    private Integer quantity;
    private String img;

    public Integer getB_id() {
        return b_id;
    }

    public void setB_id(Integer b_id) {
        this.b_id = b_id;
    }

    public String getB_name() {
        return b_name;
    }

    public void setB_name(String b_name) {
        this.b_name = b_name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Double getB_price() {
        return b_price;
    }

    public void setB_price(Double b_price) {
        this.b_price = b_price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Book(Integer b_id, String b_name, String author, Double b_price, String type, Integer quantity, String img) {
        this.b_id = b_id;
        this.b_name = b_name;
        this.author = author;
        this.b_price = b_price;
        this.type = type;
        this.quantity = quantity;
        this.img = img;
    }

    public Book(String img, String b_name, Double b_price){
        this.img = img;
        this.b_name = b_name;
        this.b_price = b_price;
    }

    @Override
    public String toString() {
        return "Book{" +
                "b_name='" + b_name + '\'' +
                ", b_price=" + b_price +
                ", img='" + img + '\'' +
                '}';
    }
}
