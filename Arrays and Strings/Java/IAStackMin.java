import java.util.Comparator;
import java.util.EmptyStackException;

public class IAStackMin<T extends Comparable<T>> {
  private class StackNode<T> {
    T data;
    StackNode<T> next;
    T min;
  
    StackNode(T data) {
      this.data = data;
      this.next = null;
    }
  }

  private StackNode<T> top;
  
  public T peek() {
    if (top == null) throw new EmptyStackException();
    return top.data;
  }

  public T pop() {
    if (top == null) throw new EmptyStackException();

    T data = top.data;
    top = top.next;

    return data;
  }

  void push(T data) {
    StackNode<T> node = new StackNode<>(data);

    if (top == null || data.compareTo(top.min) < 0) {
      node.min = data;
    } else {
      node.min = top.min;
    }

    node.next = top;
    top = node;
  }

  boolean isEmpty() {
    return top == null;
  }

  public T min() {
    if (top == null) throw new EmptyStackException();
    return top.min;
  }

  public static void main(String [] args) {
    IAStackMin<Integer> stack = new IAStackMin<>();
    assert(stack.isEmpty() == true): "A newly created stack must be empty";
    stack.push(1);
    assert(stack.isEmpty() == false): "A stack shouldn't be empty after being added a node";
    stack.push(2);
    stack.push(3);
    assert(stack.min() == 1): "Stack min value is wrong. Check it";
    assert(stack.peek() == 3): "A stack must be a LIFO data structure";
    assert(stack.peek() == 3): "A peek method shouldn't remove any node from a Stack";
    stack.push(0);
    assert(stack.min() == 0): "Stack min value is wrong. Check it";
    stack.pop();
    stack.pop();
    stack.pop();
    stack.pop();
    assert(stack.isEmpty() == true): "After removing all elements from a Stack, it should be empty";
  }
}

