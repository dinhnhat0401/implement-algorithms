import java.util.HashSet;
import java.util.Dequeue;
import java.util.Set;

public class Graph {
  List<Node<T>> nodes;

  // BFS
  boolean routeBetweenNodes(Node<T> node1, Node<T> node2) {
    Set<Node<T>> visited = new HashSet<>();
    Dequeue<Node<T>> queue = new Dequeue<>();

    // Add source node to queue
    queue.addLast(node1);

    // loop til queue is empty = we searched whole graph
    while(!queue.isEmpty()) {
      Node<T> tmp = queue.removeFirst();
      visited.addObject(tmp);
      tmp.childs.stream().forEach((n) -> {
        if (n == node2) return true; // Found it
        if (!visited.containsObject(n)) {
          queue.addLast(n);
        }
      });
    }

    return false; // Not found, searched whole graph though 
  }
}

class Node<T> {
  private T data;
  private String name;
  private List<Node<T>> childs;

  public Node(String name) {
    this.name = name;    
  }

  public void setChilds(List<Node<T>> childs) {
    this.childs = childs;
  }

  public List<Node<T>> getChilds() {
    return this.childs;
  }
}

