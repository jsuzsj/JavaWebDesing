package cn.jsu.bean;

public class Shop  extends ProductBean{
    private Integer id;
    private String name;
    private Double price;
    private Double discount;
    private String desc;

    public Shop() {
    }

    public Shop(String name, Double price, Double discount, String desc) {
        this.name = name;
        this.price = price;
        this.discount = discount;
        this.desc = desc;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
