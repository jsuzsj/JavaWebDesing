package cn.jsu.bean;

public class ShopingCar  extends ProductBean{
    private Integer id;
    private Integer shopid;
    private Integer uid;

    public ShopingCar(Integer shopid,Integer uid) {
        this.shopid = shopid;
        this.uid = uid;
    }

    public ShopingCar() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getShopid() {
        return shopid;
    }

    public void setShopid(Integer shopid) {
        this.shopid = shopid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
}
