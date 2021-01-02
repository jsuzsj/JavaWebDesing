package cn.jsu.bean;

public class Admin extends ProductBean{
    private Integer id;

    private Integer uid;

    public Admin(Integer uid) {
        this.uid = uid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Admin() {
    }

    public Admin(Integer id, Integer uid) {
        this.id = id;
        this.uid = uid;
    }


}
