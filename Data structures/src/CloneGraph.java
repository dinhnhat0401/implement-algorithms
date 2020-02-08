import java.util.ArrayList;
import java.util.Hashtable;
import java.util.HashSet;
import java.util.List;

// Definition for a Node.
class Node {
    public int val;
    public List<Node> neighbors;

    public Node() {
        val = 0;
        neighbors = new ArrayList<Node>();
    }

    public Node(int _val) {
        val = _val;
        neighbors = new ArrayList<Node>();
    }

    public Node(int _val, ArrayList<Node> _neighbors) {
        val = _val;
        neighbors = _neighbors;
    }
}

class CloneGraph {
  public static void main(String [] args) {
    Node one = new Node(1);
    Node two = new Node(2);
    Node three = new Node(3);
    Node four = new Node(4);
    one.neighbors.add(two);
    one.neighbors.add(four);
    two.neighbors.add(one);
    two.neighbors.add(three);
    three.neighbors.add(two);
    three.neighbors.add(four);
    four.neighbors.add(one);
    four.neighbors.add(three);
    Node newOne = new CloneGraph().cloneGraph(one);

  }

  Hashtable<Integer, Node> newNodes = new Hashtable<>();
  HashSet<Integer> visiting = new HashSet<>();
  public Node cloneGraph(Node node) {
    Node newNode = new Node(node.val);
    newNodes.put(newNode.val, newNode);
    dfs(node, null);
    return newNode;
  }

  public void dfs(Node cur, Node from) {
    if (visiting.contains(cur.val)) {
      return;
    }
    visiting.add(cur.val);

    Node newCur = newNodes.get(cur.val);
    if (newCur == null) {
      newCur = new Node(cur.val);
      newNodes.put(cur.val, newCur);
    }
    if (from != null) {
      from.neighbors.add(newCur);
    }

    for (Node nei : cur.neighbors) {
      dfs(nei, newCur);
    }

    visiting.remove(cur.val);
  }
}