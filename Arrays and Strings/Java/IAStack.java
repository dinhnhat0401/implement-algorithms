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
  }
}

