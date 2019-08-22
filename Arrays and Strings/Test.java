// Trying to access a non-public class from a different package caused error when compiling
import Java.RemoveKthNode;

class Test {
  public static void main(String [] args) {
    RemoveKthNode t = new RemoveKthNode();
  }
}

