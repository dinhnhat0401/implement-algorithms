import java.util.*;
import java.io.*;

class Main {

  public static String LRUCache(String[] strArr) {
    Cache lru = new Cache(5);
    int i = 0;
    for (String s : strArr) {
      if (lru.get(s) == -1) {
        lru.put(s, i);
      }
      i += 1;
    }
    return lru.getOutput();
  }

  public static void main (String[] args) {
    // keep this function call here
    Scanner s = new Scanner(System.in);
    String[] arr = new String[] {"A", "B", "A", "C", "A", "B"};
    System.out.print(LRUCache(arr));
  }

}

class Cache {
  public Cache(int capacity) {
    this.capacity = capacity;
    this.count = 0;
    this.map = new Hashtable<>();
  }

  public int get(String key) {
    LRUCacheNode node = map.get(key);
    if (node == null) {
      return -1;
    }

    remove(node);
    add(node);
    return node.val;
  }

  public void put(String key, int val) {
    if (map.get(key) != null) { // the key exist in current cache
      LRUCacheNode n = map.get(key);
      n.val = val;
      remove(n);
      add(n);
      return;
    }

    LRUCacheNode newNode = new LRUCacheNode(key, val);
    add(newNode);
    if (this.count > this.capacity) {
      remove(tail);
    }
  }

  public String getOutput() {
    LRUCacheNode n = tail;
    String out = "";
    while (n != null) {
      out += n.key;
      if (n.prev != null) {
        out += "-";
      }
      n = n.prev;
    }
    return out;
  }

  private void add(LRUCacheNode n) {
    map.put(n.key, n);

    n.next = head;
    if (head != null) {
      head.prev = n;
    }
    head = n;

    count += 1;

    if (count == 1) {
      tail = head;
    }
  }

  private void remove(LRUCacheNode n) {
    map.remove(n.key);

    count -= 1;

    if (n == head) { // remove head
      if (head.next != null) {
        head.next.prev = head.prev;
      }
      head = head.next;
      return;
    }

    if (n == tail) { // remove tail
      if (tail.prev != null) {
        tail.prev.next = tail.next;
      }
      tail = tail.prev;
    }

    // remove a middle node
    if (n.next != null) {
      n.next.prev = n.prev;
    }
    if (n.prev != null) {
      n.prev.next = n.next;
    }
  }

  int capacity;
  LRUCacheNode head;
  LRUCacheNode tail;
  private int count;
  private Hashtable<String, LRUCacheNode> map;
}

class LRUCacheNode {
  int val;
  String key;
  LRUCacheNode next;
  LRUCacheNode prev;

  public LRUCacheNode(String key, int val) {
    this.val = val;
    this.key = key;
    this.next = null;
    this.prev = null;
  }
}