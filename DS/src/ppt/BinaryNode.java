package ppt;

class BinaryNode{
    char element;
    BinaryNode lChild;
    BinaryNode rChild;

    public BinaryNode(char element, BinaryNode lChild, BinaryNode rChild) {
        this.element = element;
        this.lChild = lChild;
        this.rChild = rChild;
    }
}