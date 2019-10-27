//import java.util.ArrayList;
//import java.util.ArrayDeque;
//import java.util.Deque;
//import java.util.List;
//import java.util.Hashtable;
//
//class Topology {
//  static Deque<GraphNode> printOrder(Graph g) {
//    Deque<GraphNode> order = new ArrayDeque<>();
//
//    for (GraphNode graphNode : g.getNodes()) {
//      graphNode.setStatus(Status.WHITE);
//    }
//
//    for (GraphNode graphNode : g.getNodes()) {
//      if (graphNode.getStatus() == Status.WHITE) {
//        if (!doDFS(graphNode, order)) return null;
//      }
//    }
//
//    return order;
//  }
//
//  static boolean doDFS(GraphNode graphNode, Deque<GraphNode> order) {
//    if (graphNode.getStatus() == Status.GRAY) { return false; }
//    if (graphNode.getStatus() == Status.BLACK) { return true; }
//
//     graphNode.setStatus(Status.GRAY);
//     for (GraphNode adj : graphNode.getAdjacencies()) {
//       if (!doDFS(adj, order)) { return false; }
//     }
//     graphNode.setStatus(Status.BLACK);
//     System.out.println("Node added : " + graphNode.getName());
//     order.addLast(graphNode);
//
//     return true;
//  }
//
//  public static void main(String [] args) {
//    String [] names = {"CSC100", "CSC200", "CSC300"};
//    String [][] dependencies = {{"CSC300", "CSC100"}, {"CSC300", "CSC200"}, {"CSC200", "CSC100"}, {"CSC100", ""}};
//    Graph g = Graph.buildGraph(names, dependencies);
//    Deque<GraphNode> order = printOrder(g);
//    while (!order.isEmpty()) {
//      System.out.println(order.removeFirst().getName());
//    }
//  }
//}
//
//class Graph {
//  private List<GraphNode> graphNodes;
//  private Hashtable<String, GraphNode> map;
//  public Graph() {
//    graphNodes = new ArrayList<>();
//    map = new Hashtable<>();
//  }
//
//  public static Graph buildGraph(String [] names, String [][] dependencies) {
//    Graph g = new Graph();
//    for (String name : names) {
//      g.getOrCreateNode(name);
//    }
//
//    for (String [] dependency : dependencies) {
//      String name1 = dependency[0];
//      String name2 = dependency[1];
//      g.addEdge(name1, name2);
//    }
//
//    printGraph(g);
//
//    return g;
//  }
//
//  public static void printGraph(Graph g) {
//    for (GraphNode graphNode : g.getNodes()) {
//      System.out.print("Name = " + graphNode.getName() + ": ");
//      for (GraphNode adj : graphNode.getAdjacencies()) {
//        System.out.print(adj.getName() + ", ");
//      }
//      System.out.print("\n");
//    }
//  }
//
//  GraphNode getOrCreateNode(String name) {
//    if (this.map.containsKey(name)) {
//      System.out.println("Contained");
//      return this.map.get(name);
//    }
//
//    GraphNode newGraphNode = new GraphNode(name);
//    this.graphNodes.add(newGraphNode);
//    this.map.put(name, newGraphNode);
//    return newGraphNode;
//  }
//
//  public void addEdge(String name1, String name2) {
//    if (name1.isEmpty() || name2.isEmpty()) return;
//
//    GraphNode graphNode1 = getOrCreateNode(name1);
//    GraphNode graphNode2 = getOrCreateNode(name2);
//
//    if (!graphNode1.getAdjacencies().contains(graphNode2)) {
//      graphNode1.getAdjacencies().add(graphNode2);
//    }
//  }
//
//  public List<GraphNode> getGraphNodes() { return this.graphNodes; }
//}
//
//enum Status {
//  WHITE, GRAY, BLACK;
//}
//
//class Node {
//  private String name;
//  private List<GraphNode> adjacencies;
//  private Status status;
//
//  public Node(String name) {
//    this.name = name;
//    this.adjacencies = new ArrayList<>();
//    this.status = Status.WHITE;
//  }
//
//  public void setStatus(Status status) { this.status = status; }
//
//  public String getName() { return this.name; }
//  public List<GraphNode> getAdjacencies() { return this.adjacencies; }
//  public Status getStatus() { return this.status; }
//}
//
