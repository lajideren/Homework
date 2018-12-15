package ex6;

import java.util.LinkedList;
import java.util.Queue;

public class Tree {

    /**
     * 根据树的层序建立二叉树，空节点以#表示,返回根节点
     * 示例输入:ABCDE##F##GH
     */
    public static TreeNode createTree(String str) {

        Queue<TreeNode> q = new LinkedList<>();
        TreeNode root = new TreeNode(str.charAt(0));
        q.offer(root);

        str = str.substring(1);
        int i = 0;
        while (i < str.length()) {

            TreeNode temp = q.poll();

            TreeNode lChild = new TreeNode(str.charAt(i));
            i++;
            TreeNode rChild;
            //若最后一个父节点只有一个左子节点，则补上一个#
            if (i == str.length()) {
                rChild = new TreeNode('#');
            } else {
                rChild = new TreeNode(str.charAt(i));
            }

            //非空节点添加子节点
            if (temp.getVal() != '#') {

                if (lChild.getVal() != '#') {
                    temp.setlChild(lChild);
                }
                if (rChild.getVal() != '#') {
                    temp.setrChild(rChild);
                }
            }

            q.offer(lChild);
            q.offer(rChild);
            i++;

        }

        return root;

    }

    /**
     * 前序输出二叉树
     */
    public static void preOrder(TreeNode root){

        System.out.print(root.getVal()+" ");
        if(root.getlChild()!=null){
            preOrder(root.getlChild());
        }
        if(root.getrChild()!=null){
            preOrder(root.getrChild());
        }

    }

    /**
     * 中序输出二叉树
     */
    public static void inOrder(TreeNode root){

        if(root.getlChild()!=null){
            inOrder(root.getlChild());
        }
        System.out.print(root.getVal()+" ");
        if(root.getrChild()!=null){
            inOrder(root.getrChild());
        }

    }

    /**
     * 后序输出二叉树
     */
    public static void postOrder(TreeNode root){

        if(root.getlChild()!=null){
            postOrder(root.getlChild());
        }
        if(root.getrChild()!=null){
            postOrder(root.getrChild());
        }
        System.out.print(root.getVal()+" ");
    }


    public static void main(String[] args) {

        TreeNode root=createTree("ABCDE#F##GH");
//        TreeNode root=createTree("123##4#####67");
        preOrder(root);
        System.out.println();
        inOrder(root);
        System.out.println();
        postOrder(root);

    }



}
