import java.util.List;
import java.util.LinkedList;

class ListOfDepths {
  int depth;
  List<Node>list = new LinkedList<>();

  public ListOfDepths(int depth) {
    this.depth = depth;
  }

  void addNode(Node node, int _depth) {
    if (node == null) return;
    if (_depth == this.depth) {
      list.add(node);
      return;
    }

    addNode(node.leftChild, _depth + 1);
    addNode(node.rightChild, _depth + 1);
  }

  public static void main(String[] args) {
    int[] array = {1, 2, 3, 5, 11, 15, 90, 99};
    Node root = MinimalBST.createMinimalBST(array);    
    ListOfDepths listOfDepths = new ListOfDepths(2);
    listOfDepths.addNode(root, 0);
    listOfDepths.list.stream().forEach((n) -> System.out.print(n.value + " "));
  }
}

