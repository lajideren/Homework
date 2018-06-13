package po;

import java.sql.Timestamp;

public class Apply {

    private String eid;
    private String name;
    private String location;
    private String info;
    private int approved;
    private Timestamp createTime;

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

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Apply{" +
                "eid='" + eid + '\'' +
                ", name='" + name + '\'' +
                ", location='" + location + '\'' +
                ", info='" + info + '\'' +
                ", approved=" + approved +
                ", createTime=" + createTime +
                '}';
    }
}
