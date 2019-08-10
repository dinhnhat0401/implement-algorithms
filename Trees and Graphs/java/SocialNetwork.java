import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class SocialNetwork {
  public static void main(String [] args) {
  
  }

  List<Person> BiBFS(BFSData source, BFSData destination) {
    while ((source.getToVisit().size() != 0) && (destination.getToVisit().size() != 0)) {
      Person collide = BFSLevel(source, destination);
      if (collide != null) return buildPath(source, destination, collide);
      source.renewal();
      destination.renewal();
    }

    return null;
  }

  Person BFSLevel(BFSData source, BFSData destination) {
    for (Person p : source.getToVisit()) {
      if (destination.getVisited().contains(p)) return p;
      source.getVisited().add(p);
    }

    for (Person p : destination.getToVisit()) {
      if (source.getVisited().contains(p)) return p;
      destination.getVisited().add(p);
    }

    return null;
  }

  List<Person> buildPath(BFSData source, BFSData destination, Person person) {
    List<Person> path = new ArrayList<>();
    Person current = person;
    while ((current = source.getPre().get(current)) != null) {
      path.add(0, current);
    }
    current = person;
    while ((current = destination.getPre().get(current)) != null) {
      path.add(current);
    }

    return path;
  }

  class BFSData {
    private List<Person> toVisit;
    private Set<Person> visited;
    private Map<Person, Person> pre;

    public BFSData(Person p) {
      toVisit = new ArrayList<>();
      toVisit.add(p);
      visited = new HashSet<>();
      pre = new HashMap<>();
    }

    public List<Person> getToVisit() { return this.toVisit; }
    public Set<Person> getVisited() { return this.visited; }
    public Map<Person, Person> getPre() { return this.pre; }
  
    public void renewal() {
      List<Person> newToVisit = new ArrayList<>();
      while (!this.toVisit.isEmpty()) {
        Person p = this.toVisit.remove(0);
        p.getFriends().stream().forEach((e) -> this.pre.put(e, p));
      }
      this.toVisit = newToVisit;
    }
  }

}

class Person {
  private static int count = 0;
  private int id;
  private String name;
  private List<Person> friends;

  public Person(String name) {
    this.id = count++;
    this.name = name;
    this.friends = new ArrayList<>();
  }

  public int getId() { return this.id; }
  public void setId(int id) { this.id = id; }

  public String getName() { return this.name; }
  public void setName(String name) { this.name = name; }

  public List<Person> getFriends() { return this.friends; }
}

class Machine {

}

class Server {
}

