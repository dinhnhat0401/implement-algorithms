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
    return top.data;
  }

  public T pop() {
    T data = top.data;
    top = top.next;

    return data;
  }

  void push(T data) {
    StackNode<T> node = new StackNode<>(data);
    node.next = top;
    top = node;
  }


  public static void main(String [] args) {
    IAStack<Integer> stack = new IAStack<>();
    stack.push(1);
    stack.push(2);
    stack.push(3);
    assert(stack.peek() == 3): "A stack must be a LIFO data structure";
    assert(stack.peek() == 3): "A peek method shouldn't remove any node from Stack";
    assert(stack.pop() == 3): "A pop method should return current top and remove it from current stack";
    assert(stack.peek() == 2): "A stack must be a LIFO data structure";
  }
}

