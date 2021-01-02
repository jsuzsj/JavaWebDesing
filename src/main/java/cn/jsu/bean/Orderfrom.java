package cn.jsu.bean;

public class Orderfrom  extends ProductBean{
    private Integer id;
    private String name;
    private String phone;
    private String city;
    private  String moreadd;
    private  String  email;
    private  String desc;
    private Double totalprice;
    private  Double transportprice;
    private Integer type =null;

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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getMoreadd() {
        return moreadd;
    }

    public void setMoreadd(String moreadd) {
        this.moreadd = moreadd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Double totalprice) {
        this.totalprice = totalprice;
    }

    public Double getTransportprice() {
        return transportprice;
    }

    public void setTransportprice(Double transportprice) {
        this.transportprice = transportprice;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
