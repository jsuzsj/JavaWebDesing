package cn.jsu.bean;

public class User extends ProductBean {
    public User(String name, String pswd, Integer id) {
        this.name = name;
        this.pswd = pswd;
        this.id = id;
    }

    public User(String name, String pswd) {
        this.name = name;
        this.pswd = pswd;
    }

    public User() {
    }

    private String name ;
    private String pswd ;
    private Integer id;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPswd() {
        return pswd;
    }

    public void setPswd(String pswd) {
        this.pswd = pswd;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
