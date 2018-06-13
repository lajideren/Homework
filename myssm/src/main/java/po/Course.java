package po;

import java.sql.Date;

public class Course {

    private int cid;
    private String eid;
    private String name;
    private String type;
    private Double price;
    private int number;
    private Date start_time;
    private int hours_weekly;
    private int weeks;
    private String detail;

    public Course() {
    }

    public Course(int cid, String eid, String name, String type, Double price, int number, Date start_time, int hours_weekly, int weeks, String detail) {
        this.cid = cid;
        this.eid = eid;
        this.name = name;
        this.type = type;
        this.price = price;
        this.number = number;
        this.start_time = start_time;
        this.hours_weekly = hours_weekly;
        this.weeks = weeks;
        this.detail = detail;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String  eid) {
        this.eid = eid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public int getHours_weekly() {
        return hours_weekly;
    }

    public void setHours_weekly(int hours_weekly) {
        this.hours_weekly = hours_weekly;
    }

    public int getWeeks() {
        return weeks;
    }

    public void setWeeks(int weeks) {
        this.weeks = weeks;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "Course{" +
                "cid=" + cid +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", price=" + price +
                ", number=" + number +
                ", start_time=" + start_time +
                ", hours_weekly=" + hours_weekly +
                ", weeks=" + weeks +
                ", detail='" + detail + '\'' +
                '}';
    }

}
