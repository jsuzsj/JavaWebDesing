package cn.jsu.bean;

public class Ticket  extends ProductBean{

    private Integer id;
    private String code;
    private Double price;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }


    public Ticket() {
    }

    public Ticket(String code, Double price) {
        this.code = code;
        this.price = price;
    }



}