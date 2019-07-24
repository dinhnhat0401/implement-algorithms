import java.util.Map;
import java.util.HashMap;

class Node {
  private String name;
  private Node left;
  private Node right;
  private Node parent;
  private boolean visited;

  public Node(String name) {
    this.name = name;
    this.left = null;
    this.right = null;
    this.parent = null;
    this.visited = false;
  }

  public String getName() {
    return this.name;
  }

  public Node getParent() {
    return this.parent;
  }

  public void setVisited(boolean visited) {
    this.visited = visited;
  }

  public boolean getVisited() {
    return this.visited;
  }

  public void setParent(Node parent) {
    this.parent = parent;
  }
}

public class BinaryTree {
  private Map<String, Node> nodes = new HashMap<>();

  public Node getNode(String name) {
    if (!this.nodes.containsKey(name)) {
      return null;
    } else {
      return nodes.get(name);
    }
  }

  public void addNode(Node n) {
    this.nodes.put(n.getName(), n);
  }

  public Node findCommonAncestor(Node node1, Node node2) {
    if (node1 == null || node2 == null) return null;

    this.nodes.values().stream().forEach(n -> n.setVisited(false));
    Node n = node1;
    while (n.getParent() != null) {
      System.out.println(n.getName());
      n = n.getParent();
      n.setVisited(true); 
    }

    n = node2;
    while (n.getParent() != null) {
      System.out.println("why2");
      System.out.println(n.getName());
      n = n.getParent();
      if (n.getVisited()) {
        return n;
      }
    }

    return null;
  }

  public static void main(String [] args) {
    BinaryTree binaryTree = new BinaryTree();

    Node root = new Node("19");
    binaryTree.addNode(root);

    Node lv11 = new Node("12");
    lv11.setParent(root);
    binaryTree.addNode(lv11);

    Node lv12 = new Node("30");
    lv12.setParent(root);
    binaryTree.addNode(lv12);    

    Node lv21 = new Node("7");
    lv21.setParent(lv11);
    binaryTree.addNode(lv21);

    Node lv22 = new Node("15");
    lv22.setParent(lv11);
    binaryTree.addNode(lv22);

    Node lv23 = new Node("20");
    lv23.setParent(lv12);
    binaryTree.addNode(lv23);

    Node lv24 = new Node("56");
    lv24.setParent(lv12);
    binaryTree.addNode(lv24);

    Node lv31 = new Node("1");
    lv31.setParent(lv21);
    binaryTree.addNode(lv31);

    System.out.println("Common ancestor of 1 and 20 is: " +  binaryTree.findCommonAncestor(lv31, lv23).getName());
  }
}

