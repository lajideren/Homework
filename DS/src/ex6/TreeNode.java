package ex6;

public class TreeNode {

    private char val;
    private TreeNode lChild;
    private TreeNode rChild;


    public TreeNode(char val) {
        this.val = val;
        this.lChild = null;
        this.rChild = null;
    }

    public char getVal() {
        return val;
    }

    public void setVal(char val) {
        this.val = val;
    }

    public TreeNode getlChild() {
        return lChild;
    }

    public void setlChild(TreeNode lChild) {
        this.lChild = lChild;
    }

    public TreeNode getrChild() {
        return rChild;
    }

    public void setrChild(TreeNode rChild) {
        this.rChild = rChild;
    }


}
