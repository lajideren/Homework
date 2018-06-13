package po;

public class Section {

    private int sid;
    private int cid;
    private String teacher;
    private String location;
    private int selected;
    private int amount;
    private int rank;

    public Section() {
    }

    public Section(int sid, int cid, String teacher, String location, int selected, int amount, int rank) {
        this.sid = sid;
        this.cid = cid;
        this.teacher = teacher;
        this.location = location;
        this.selected = selected;
        this.amount = amount;
        this.rank = rank;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getSelected() {
        return selected;
    }

    public void setSelected(int selected) {
        this.selected = selected;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    @Override
    public String toString() {
        return "Section{" +
                "sid=" + sid +
                ", cid=" + cid +
                ", teacher='" + teacher + '\'' +
                ", selected=" + selected +
                ", amount=" + amount +
                '}';
    }
}
