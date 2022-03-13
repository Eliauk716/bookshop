package entity;

public class Shopcar {
    private String img;
    private String bookname;
    private Double price;
    private Integer amount;

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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Shopcar(String img, String bookname, Double price, Integer amount) {
        this.img = img;
        this.bookname = bookname;
        this.price = price;
        this.amount = amount;
    }
}
