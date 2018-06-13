package po;

import java.sql.Timestamp;

public class Institution {

    private String eid;
    private String name;
    private String password;
    private String location;
    private String info;
    private int approved;
    private double sales;
    private double income;
    private Timestamp createTime;

    public Institution() {
    }



    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int getApproved() {
        return approved;
    }

    public void setApproved(int approved) {
        this.approved = approved;
    }

    public double getSales() {
        return sales;
    }

    public void setSales(double sales) {
        this.sales = sales;
    }

    public double getIncome() {
        return income;
    }

    public void setIncome(double income) {
        this.income = income;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Institution{" +
                "eid='" + eid + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", location='" + location + '\'' +
                ", info='" + info + '\'' +
                ", approved=" + approved +
                ", sales=" + sales +
                ", income=" + income +
                ", createTime=" + createTime +
                '}';
    }
}
