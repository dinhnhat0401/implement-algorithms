import java.util.ArrayDeque;
import java.util.Deque;

class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;
    TreeNode(int x) { val = x; }
}

public class Codec {

  public static void main(String [] args) {
    TreeNode root = new TreeNode(1);
    root.left = new TreeNode(2);
    root.right = new TreeNode(3);
    root.right.left = new TreeNode(4);
    root.right.right = new TreeNode(5);
    String data = new Codec().serialize(root);
    TreeNode decoded = new Codec().deserialize(data);
  }

  // Encodes a tree to a single string.
  public String serialize(TreeNode root) {
    if (root == null) {
      return "null";
    }
    return Integer.toString(root.val) + "," + serialize(root.left) + "," + serialize(root.right);
  }

  // Decodes your encoded data to tree.
  public TreeNode deserialize(String data) {
    String[] values = data.split(",");
    Deque<String> q = new ArrayDeque<>();
    for (String v : values) {
      q.addLast(v);
    }

    return helper(q);
  }

  public TreeNode helper(Deque<String> q) {
    if (q.size() == 0) {
      return null;
    }

    String v = q.removeFirst();
    if (v.equals("null") || v.equals("")) {
      return null;
    }

    TreeNode n = new TreeNode(Integer.parseInt(v));
    n.left = helper(q);
    n.right = helper(q);
    return n;
  }
}