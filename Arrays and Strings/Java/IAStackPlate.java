import java.util.EmptyStackException;

class IAStackPlate<T> {
  private int threshold = 20;
  private IAStack<IAStack<T>> plate = new IAStack<>();
  private int stackSize = 0;

  T pop() {
    if (stackSize == 0) throw new EmptyStackException();

    stackSize -= 1;
    IAStack<T> topStack;
    if (stackSize % threshold == 0) {
      topStack = plate.pop();
    } else {
      topStack = plate.peek();
    }

    return topStack.pop();
  }

  T peek() {
    if (stackSize == 0) throw new EmptyStackException();

    return plate.peek().peek();
  }

  void push(T data) {
    IAStack<T> topStack;
    if (stackSize % threshold == 0) {
      topStack = new IAStack<>();
      plate.push(topStack);
    } else {
      topStack = plate.peek();
    }
    topStack.push(data);
    stackSize += 1;
  }

  boolean isEmpty() {
    return stackSize == 0;
  }

  public static void main(String [] args) {
    testPop();
    testPush();
  }

  static void testPop() {
    IAStackPlate<Integer> stackPlate = new IAStackPlate<>();
    for (int i = 0; i < 21; i++) {
      stackPlate.push(i);
    }
    assert(stackPlate.pop() == 20): "should return top of the top stack";
    assert(stackPlate.pop() == 19): "should return top element";
  }

  static void testPush() {
    IAStackPlate<Integer> stackPlate = new IAStackPlate<>();
    for (int i = 0; i < 100; i++) { 
      stackPlate.push(i);
    }
    assert(stackPlate.peek() == 99): "Peek should return the most recently added element";
  }
}

