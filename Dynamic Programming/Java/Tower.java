import java.util.ArrayDeque;
import java.util.Deque;

class Tower {
  private Deque<Integer> stack;
  public Tower(int n) {
    this.stack = new ArrayDeque<>();
    for (int i = n; i >= 1; i--) {
      this.stack.addFirst(i);
    }
  }

  public int top() {
    if (this.isEmpty()) return -1;
    return this.stack.peekFirst();
  }

  public boolean isEmpty() {
    return this.stack.size() == 0;
  }

  public int pop() {
    if (this.isEmpty()) return -1;
    return  this.stack.removeFirst();
  }

  public void push(int e) {
    if (!this.isEmpty() && e > this.top()) assert(false);

    this.stack.addFirst(e);
  }

  public void moveTop(Tower destination) {
    destination.push(this.pop());
  }

  public void moveDisks(Tower destination, Tower buffer, int n) {
    if (n <= 0) return;
    System.out.println("Moving disks ...");

    moveDisks(buffer, destination, n - 1);
    moveTop(destination);
    buffer.moveDisks(destination, this, n - 1);
  }
 
  private void printStack() {
    this.stack.stream().forEach(e -> System.out.print(e + ", "));
    System.out.print("\n");
  }
  
  public static void main(String [] args) {
    Tower t1 = new Tower(5);
    Tower t2 = new Tower(0);
    Tower t3 = new Tower(0);

    t1.moveDisks(t3, t2, 5);

    System.out.println("Source t1:");
    t1.printStack();
    System.out.println("Destination t3:");    
    t3.printStack();
  }
}

