package po;

public class Member {

    private int cid;
    private int sid;
    private String username;
    private int grade;

    public Member() {
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "Member{" +
                "cid=" + cid +
                ", sid=" + sid +
                ", username='" + username + '\'' +
                ", grade=" + grade +
                '}';
    }

}
