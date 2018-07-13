package pobject;

import java.util.Date;
import java.text.SimpleDateFormat;

public class Course {

    static SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");

    private String cid;
    private String cname;
    private String sort;
    private String grade;
    private String subject;
    private String summary;
    private String crowd;
    private String goal;
    private String content;
    private String feature;
    private Date startTime;
    private Date endTime;
    private int price;
    private int period;
    private String time;
    private String city;
    private String location;
    private int count;

    public Course() {

    }

    public Course(String cid, String cname, String sort, String grade, String subject, String summary, String crowd, String goal, String content, String feature, Date startTime, Date endTime, int price, int period, String time, String city, String location, int count) {
        this.cid = cid;
        this.cname = cname;
        this.sort = sort;
        this.grade = grade;
        this.subject = subject;
        this.summary = summary;
        this.crowd = crowd;
        this.goal = goal;
        this.content = content;
        this.feature = feature;
        this.startTime = startTime;
        this.endTime = endTime;
        this.price = price;
        this.period = period;
        this.time = time;
        this.city = city;
        this.location = location;
        this.count = count;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getCrowd() {
        return crowd;
    }

    public void setCrowd(String crowd) {
        this.crowd = crowd;
    }

    public String getGoal() {
        return goal;
    }

    public void setGoal(String goal) {
        this.goal = goal;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }



    public String getStartTimeString(){
        return simpleDateFormat.format(startTime);
    }

    public String getEndTimeString(){
        return simpleDateFormat.format(endTime);
    }

    @Override
    public String toString() {
        return "Course{" +
                "cid='" + cid + '\'' +
                ", cname='" + cname + '\'' +
                ", sort='" + sort + '\'' +
                ", grade='" + grade + '\'' +
                ", subject='" + subject + '\'' +
                ", summary='" + summary + '\'' +
                ", crowd='" + crowd + '\'' +
                ", goal='" + goal + '\'' +
                ", content='" + content + '\'' +
                ", feature='" + feature + '\'' +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", price=" + price +
                ", period=" + period +
                ", time='" + time + '\'' +
                ", city='" + city + '\'' +
                ", location='" + location + '\'' +
                ", count=" + count +
                '}';
    }
}

