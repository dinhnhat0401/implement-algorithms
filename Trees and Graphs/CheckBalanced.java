class CheckBalanced {
  static boolean checkBalanced(Node node) {
    if (node == null) return true;

    if (Math.abs(height(node.leftChild) - height(node.rightChild)) > 1) return false;
    return checkBalanced(node.leftChild) && checkBalanced(node.rightChild);
  }

  static int height(Node node) {
    if (node == null) return -1;

    return Math.max(height(node.leftChild) + 1, height(node.rightChild) + 1);
  }

  public static void main(String [] args) {
    int[] array = {1, 2, 3, 5, 11, 15, 90, 99};
    Node root = MinimalBST.createMinimalBST(array);
    System.out.println("the tree is balanced = " + checkBalanced(root));
  }
}

