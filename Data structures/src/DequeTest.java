import java.util.ArrayDeque;
import java.util.Deque;
import java.util.LinkedList;

// All Known Implementing Classes: //ArrayDeque, ConcurrentLinkedDeque, LinkedBlockingDeque, LinkedList
public class DequeTest {
    public static void main(String [] args) {
        // Use stack class
        Stack<String> stack1 = new Stack<>();
        stack1.push("a");
        stack1.push("b");
        System.out.println(stack1.peek());
        System.out.println(stack1.pop());

        // Use deque as a Stack
        Deque<String> stack = new ArrayDeque<>();
        stack.push("a");
        stack.push("b");
        stack.push("c");
        System.out.println(stack.isEmpty());
        System.out.println(stack.size());
        System.out.println(stack.peek()); // Get top element in stack WITHOUT removing it from stack
        System.out.println(stack.pop());  // Get top element in stack AND remove it from stack

        // Use deque as a Queue
        Deque<String> queue = new LinkedList<>();
        queue.offer("a");
        queue.offer("b");
        queue.offer("c");
        queue.add("d");
        System.out.println(queue.isEmpty());
        System.out.println(queue.size());
        System.out.println(queue.peek()); // Get first element WITHOUT removing it from queue
        System.out.println(queue.poll());  // Get first element AND remove it from queue
    }
}
