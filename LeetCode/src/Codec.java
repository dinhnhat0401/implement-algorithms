public class Codec {

  // Encodes a tree to a single string.
  public String serialize(TreeNode root) {
    if (root == null) {
      return "null,";
    }
    return Integer.toString(root.val) + "," + serialize(root.left) + "," + serialize(root.right) + ",";
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