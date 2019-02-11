package ppt;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Queue;

public class Tree {

    public static BinaryNode createTree(String preOrder, String inOrder) {

        if (preOrder == null) return null;


        char rootElement = preOrder.charAt(0);
        int len = inOrder.indexOf(rootElement);

        String lPreOrder = subOrder(preOrder, 1, 1 + len);
        String rPreOrder = subOrder(preOrder, 1 + len, preOrder.length());

        String lInOrder = subOrder(inOrder, 0, len);
        String rInOrder = subOrder(inOrder, len + 1, inOrder.length());


        BinaryNode lChild = createTree(lPreOrder, lInOrder);
        BinaryNode rChild = createTree(rPreOrder, rInOrder);


        return new BinaryNode(rootElement, lChild, rChild);

    }

    public static String subOrder(String order, int start, int end) {

        return start < end ? order.substring(start, end) : null;

    }

    public static void postOrder(BinaryNode root) {
        if (root != null) {
            postOrder(root.lChild);
            postOrder(root.rChild);
            System.out.print(root.element);
        }
    }

    public static void levelOrder(BinaryNode root) {

        Queue<BinaryNode> q = new LinkedList<>();
        q.offer(root);

        while (q.peek() != null) {
            BinaryNode node = q.poll();
            System.out.print(node.element);
            if (node.lChild != null)
                q.offer(node.lChild);
            if (node.rChild != null)
                q.offer(node.rChild);
        }


    }

    public static int height(BinaryNode root) {

        if (root == null) return -1;

        return Integer.max(height(root.lChild), height(root.rChild)) + 1;


    }

    public static int leafNum(BinaryNode root){

        if(root==null) return 0;

        if(root.lChild==null&&root.rChild==null)
            return 1;

        return leafNum(root.lChild)+leafNum(root.rChild);

    }


    public static void getNodeDegree(String preOrder,HashMap<Character,Integer> childNum,int low,int high){

        if(low>high) return;


        char root=preOrder.charAt(low);

        int degree=0;

        int low1,high1,low2,high2;

        if(low+1<=high) {

            degree++;
            //可能是左子节点，也可能是右子节点
            char childRoot = preOrder.charAt(low + 1);
            low1 = low + 1;
            high1 = low1 + childNum.get(childRoot);

            //存在右子节点
            if(high1+1<=high){
                degree++;
                low2=high1+1;
                high2=high;
            }else {
                low2=0;high2=-1;
            }

        }else {

            low1=0;high1=-1;low2=0;high2=-1;

        }


        System.out.println(root+": "+degree);
        getNodeDegree(preOrder,childNum,low1,high1);
        getNodeDegree(preOrder,childNum,low2,high2);


    }


    public static void main(String[] args) {

        HashMap<Character,Integer> childNum=new HashMap<>();
        childNum.put('A',8);
        childNum.put('B',1);
        childNum.put('C',5);
        childNum.put('D',0);
        childNum.put('E',1);
        childNum.put('F',2);
        childNum.put('G',0);
        childNum.put('H',0);
        childNum.put('I',0);

//        BinaryNode root = createTree("ABDCEGFHI", "DBAEGCHFI");
        String preOrder="ABDCEGFHI";
        getNodeDegree(preOrder,childNum,0,preOrder.length()-1);




    }



}
