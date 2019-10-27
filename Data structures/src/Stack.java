import java.util.EmptyStackException;

public class Stack<T> {
    private static class Node<T> {
        T data;
        Node<T> next;

        Node(T data) {
            this.data = data;
            this.next = null;
        }
    }

    private Node<T> top;

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

    public void push(T data) {
        Node<T> node = new Node<>(data);
        node.next = top;
        top = node;
    }

    boolean isEmpty() {
        return top == null;
    }

    public static void main(String [] args) {
        Stack<Integer> stack = new Stack<>();
        assert(stack.isEmpty()): "A newly created stack must be empty";
    }
}
