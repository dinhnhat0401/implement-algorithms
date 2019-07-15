import java.util.EmptyStackException;

public class IAStack<T> {
  private class StackNode<T> {
    T data;
    StackNode<T> next;
  
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
    node.next = top;
    top = node;
  }

  boolean isEmpty() {
    return top == null;
  }

  public static void main(String [] args) {
    IAStack<Integer> stack = new IAStack<>();
    assert(stack.isEmpty() == true): "A newly created stack must be empty";
    stack.push(1);
    assert(stack.isEmpty() == false): "A stack shouldn't be empty after being added a node";
    stack.push(2);
    stack.push(3);
    assert(stack.peek() == 3): "A stack must be a LIFO data structure";
    assert(stack.peek() == 3): "A peek method shouldn't remove any node from a Stack";
    stack.pop();
    stack.pop();
    assert(stack.pop() == 1): "A pop method should remove top from a Stack and return that element";
    assert(stack.isEmpty() == true): "After removing all elements from a Stack, it should be empty";
  }
}

