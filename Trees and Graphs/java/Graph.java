import java.io.BufferedReader;
import java.nio.charset.Charset;
import java.nio.file.*;

import java.util.ArrayList;
import java.util.Deque;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.LinkedList;
import java.util.Map;
import java.util.Set;

public class Graph {
  private static int time = 0;

  private int size;
  private Map<Integer, Node> nodes = new HashMap<>();

  public Graph(final Path path) {
    try (final BufferedReader br = Files.newBufferedReader(path, Charset.forName("UTF-8"));) {
      boolean firstLine = true;
      String data;
      while ((data = br.readLine()) != null) {
        if (firstLine) {
          this.size = Integer.parseInt(data);
          for (int i = 0; i < this.size; i++) {
            Node node = new Node(i);
            this.nodes.put(i, node);
          }
          firstLine = false;
          continue;
        }

        String[] line = data.trim().split(" ");
        int u = Integer.parseInt(line[0]);
        int v = Integer.parseInt(line[1]);
        addEdge(u, v);
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  }

  private void addEdge(final int u, final int v) {
    this.nodes.get(u).getAdjacent().add(this.nodes.get(v));
  }

  public void printGraph() {
    this.nodes.values().stream().forEach((node) -> {
      System.out.print(node.getId() + " -> ");
      node.getAdjacent().stream().forEach((adjNode) -> {
        System.out.print(adjNode.getId() + ",");
      });
      System.out.print("\n");
    });
  }

  // BFS
  boolean routeBetweenNodes(Node node1, Node node2) {
    Set<Node> visited = new HashSet<>();
    Deque<Node> queue = new LinkedList<>();

    // Add source node to queue
    queue.addLast(node1);

    // loop til queue is empty = we searched whole graph
    while(!queue.isEmpty()) {
      Node tmp = queue.removeFirst();
      if (tmp == node2) return true; // Found it
      visited.add(tmp);
      for (Node n : tmp.getAdjacent()) {
        if (!visited.contains(n)) {
          queue.addLast(n);
        }
      }
    }

    return false; // Not found, searched whole graph though 
  }

  void DFS() {
    for (Node n : this.nodes.values()) {
      n.setPre(null);
      n.setColor(Color.WHITE);
    }

    time = 0;
    for (Node n : this.nodes.values()) {
      if (n.getColor() == Color.WHITE) {
        DFSVisit(n);
      }
    }
  }

  void DFSVisit(Node n) {
    n.setColor(Color.GRAY);
    time = time + 1;
    n.setD(time);
    for (Node node : n.getAdjacent()) {
      if (node.getColor() == Color.WHITE) {
        node.setPre(n);
        DFSVisit(node);
      }
    }
    time = time + 1;
    n.setF(time);
    n.setColor(Color.BLACK);
    System.out.println("Node " + n.getId() + ": discorvered=" + n.getD() + ", finished = " + n.getF());
  }

  public static void main(String [] args) {
     final Path inputPath = Paths.get(args[0]);
     Graph g = new Graph(inputPath);
     g.printGraph();
     Node node1 = g.nodes.get(1);
     Node node7 = g.nodes.get(7);
     System.out.println("node1 to node7 ->" + g.routeBetweenNodes(node1, node7));
     System.out.println("node5 to node0 -> " + g.routeBetweenNodes(g.nodes.get(5), g.nodes.get(0)));
     System.out.println("node0 to node5 -> " + g.routeBetweenNodes(g.nodes.get(0), g.nodes.get(5)));

     g.DFS();
  } 
}

enum Color {
  WHITE, GRAY, BLACK;
}

class Node {
  private int id;
  private List<Node> adjacent;
  private Node pre; // predecessor
  private Color color;
  private int d;    // discorvered
  private int f;    // finished

  public Node(int id) {
    this.id = id;
    adjacent = new ArrayList<>();
  }

  public int getId() { return this.id; }
  public void setId(int id) { this.id = id; }

  public void setAdjacent(List<Node> adjacent) {
    this.adjacent = adjacent;
  }

  public List<Node> getAdjacent() {
    return this.adjacent;
  }

  public Node getPre() { return this.pre; }
  public void setPre(Node pre) { this.pre = pre; }

  public Color getColor() { return this.color; }
  public void setColor(Color color) { this.color = color; }

  public int getD() { return this.d; }
  public void setD(int d) { this.d = d; }

  public int getF() { return this.f; }
  public void setF(int f) { this.f = f; }
}

