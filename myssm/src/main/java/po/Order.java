package po;

import java.sql.Timestamp;

public class Order {

    private int oid;
    private String username;
    private int cid;
    private String cname;
    private String eid;
    private int sid;
    private int srank;
    private String members;
    private boolean payed;
    private boolean canceled;
    private boolean returned;
    private Timestamp createTime;
    private double totalMoney;
    private double realMoney;

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getSrank() {
        return srank;
    }

    public void setSrank(int srank) {
        this.srank = srank;
    }

    public String getMembers() {
        return members;
    }

    public void setMembers(String members) {
        this.members = members;
    }

    public boolean isPayed() {
        return payed;
    }

    public void setPayed(boolean payed) {
        this.payed = payed;
    }

    public boolean isCanceled() {
        return canceled;
    }

    public void setCanceled(boolean canceled) {
        this.canceled = canceled;
    }

    public boolean isReturned() {
        return returned;
    }

    public void setReturned(boolean returned) {
        this.returned = returned;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public double getRealMoney() {
        return realMoney;
    }

    public void setRealMoney(double realMoney) {
        this.realMoney = realMoney;
    }

    @Override
    public String toString() {
        return "Order{" +
                "oid=" + oid +
                ", username='" + username + '\'' +
                ", cid=" + cid +
                ", cname='" + cname + '\'' +
                ", sid=" + sid +
                ", srank=" + srank +
                ", members='" + members + '\'' +
                ", payed=" + payed +
                ", canceled=" + canceled +
                ", returned=" + returned +
                ", createTime=" + createTime +
                ", totalMoney=" + totalMoney +
                ", realMoney=" + realMoney +
                '}';
    }
}
