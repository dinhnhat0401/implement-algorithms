package Java;

class RemoveKthNode {
  static class Node {
    private Node next;
    private int val;

    public Node(int val) {
      this.val = val;
      this.next = null;
    }

    public Node getNext() { return this.next; }
    public void setNext(Node next) { this.next = next; }

    public int getVal() { return this.val; }
  }

  public static int removeKthNode(Node head, int k) {
    if (head == null) return -1;

    Node slow = head;
    Node fast = head;
    for (int i = 0; i <= k; i++) {
      if (fast == null) return -1;
      fast = fast.next;
    }
    while (fast != null) {
      fast = fast.next;
      slow = slow.next;
    }

    Node remove = slow.next;
    slow.next = slow.next.next;
    return remove.getVal();
  }

  public static void main(String [] args) {
    Node head = new Node(1);
    head.setNext(new Node(2));
    head.getNext().setNext(new Node(3));
    head.getNext().getNext().setNext(new Node(4));
    head.getNext().getNext().getNext().setNext(new Node(5));
    assert(removeKthNode(head, 2) == 4);
    assert(removeKthNode(head, 1) == 5);
    assert(removeKthNode(head, 10) == -1);
  }
}

