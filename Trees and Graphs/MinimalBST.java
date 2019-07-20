class Node {
  int value;
  Node leftChild;
  Node rightChild;

  public Node(int value) {
    this.value = value;
    this.leftChild = null;
    this.rightChild = null;
  }

  public static void printTree(Node node) {
    if (node == null) return;
    System.out.println(node.value + "");
    printTree(node.leftChild);
    printTree(node.rightChild);
  }
}

public class MinimalBST {
  static Node createMinimalBST(int[] array, int start, int end) {
    if (start > end) return null;

    int mid = (start + end)/2;
    Node node = new Node(array[mid]);
    node.leftChild = createMinimalBST(array, start, mid - 1);
    node.rightChild = createMinimalBST(array, mid + 1, end);
    return node;
  }

  static Node createMinimalBST(int[] array) {
    return createMinimalBST(array, 0, array.length - 1);
  }

  public static void main(String[] args) {
    int[] array = {1, 2, 3, 5, 11, 15, 90, 99};
    Node root = createMinimalBST(array);
    Node.printTree(root);
  }
}

