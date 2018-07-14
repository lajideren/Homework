package pobject;

import java.sql.Timestamp;

public class Order {

    private int oid;
    private String username;
    private String cid;
    private int price;
    private Timestamp createTime;

    public Order() {
    }

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

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Order{" +
                "oid=" + oid +
                ", username='" + username + '\'' +
                ", cid='" + cid + '\'' +
                ", price=" + price +
                ", createTime=" + createTime +
                '}';
    }


}
