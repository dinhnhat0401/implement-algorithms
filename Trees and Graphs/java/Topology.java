import java.util.ArrayList;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.List;
import java.util.Hashtable;

class Topology {
  static Deque<Node> printOrder(Graph g) {
    Deque<Node> order = new ArrayDeque<>();

    for (Node node : g.getNodes()) {
      node.setStatus(Status.WHITE);
    }

    for (Node node : g.getNodes()) {
      if (node.getStatus() == Status.WHITE) {
        if (!doDFS(node, order)) return null;
      }
    }

    return order;
  }

  static boolean doDFS(Node node, Deque<Node> order) {
    if (node.getStatus() == Status.GRAY) { return false; }
    if (node.getStatus() == Status.BLACK) { return true; }

     node.setStatus(Status.GRAY);
     for (Node adj : node.getAdjacencies()) {
       if (!doDFS(adj, order)) { return false; }
     }
     node.setStatus(Status.BLACK);
     System.out.println("Node added : " + node.getName());
     order.addLast(node);

     return true;
  }

  public static void main(String [] args) {
    String [] names = {"CSC100", "CSC200", "CSC300"};
    String [][] dependencies = {{"CSC300", "CSC100"}, {"CSC300", "CSC200"}, {"CSC200", "CSC100"}, {"CSC100", ""}};
    Graph g = Graph.buildGraph(names, dependencies);
    Deque<Node> order = printOrder(g);
    while (!order.isEmpty()) {
      System.out.println(order.removeFirst().getName());
    }
  }
}

class Graph {
  private List<Node> nodes;
  private Hashtable<String, Node> map;
  public Graph() {
    nodes = new ArrayList<>();
    map = new Hashtable<>();
  }

  public static Graph buildGraph(String [] names, String [][] dependencies) {
    Graph g = new Graph();
    for (String name : names) {
      g.getOrCreateNode(name); 
    }

    for (String [] dependency : dependencies) {
      String name1 = dependency[0];
      String name2 = dependency[1];
      g.addEdge(name1, name2);
    }
    
    printGraph(g);

    return g;
  }

  public static void printGraph(Graph g) {
    for (Node node : g.getNodes()) {
      System.out.print("Name = " + node.getName() + ": ");
      for (Node adj : node.getAdjacencies()) {
        System.out.print(adj.getName() + ", ");
      }
      System.out.print("\n");
    }
  }

  Node getOrCreateNode(String name) {
    if (this.map.containsKey(name)) {
      System.out.println("Contained");
      return this.map.get(name);
    }

    Node newNode = new Node(name);
    this.nodes.add(newNode);
    this.map.put(name, newNode);
    return newNode;
  }

  public void addEdge(String name1, String name2) {
    if (name1.isEmpty() || name2.isEmpty()) return;

    Node node1 = getOrCreateNode(name1);
    Node node2 = getOrCreateNode(name2);

    if (!node1.getAdjacencies().contains(node2)) {
      node1.getAdjacencies().add(node2);
    }
  }

  public List<Node> getNodes() { return this.nodes; }
}

enum Status {
  WHITE, GRAY, BLACK;
}

class Node {
  private String name;
  private List<Node> adjacencies;
  private Status status;

  public Node(String name) {
    this.name = name;
    this.adjacencies = new ArrayList<>();
    this.status = Status.WHITE;
  }

  public void setStatus(Status status) { this.status = status; }

  public String getName() { return this.name; }
  public List<Node> getAdjacencies() { return this.adjacencies; }
  public Status getStatus() { return this.status; }
}

