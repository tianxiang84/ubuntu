package binary_tree;

public class BinaryTree {
    class Node {
        public int data;
        public Node left;
        public Node right;
        public Node parent;

        public Node(int value) {
            data = value;
            left = null;
            right = null;
            parent = null;
        }
    }

    private Node root;

    public BinaryTree(){root = null;}

    //public Node find(int key){}

    public static void main(String[] args){
        System.out.println("test. created a binary tree.");
        return;
    }

}
