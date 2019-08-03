class Multiply {
  public static int multiply(int A, int B, int sum, int count) {
    if (A == 0 || B == 0) return 0;
    // Note: without the parenthesis, B & 1 == 1 will caused compilation failed
    if ((B & 1) == 1) sum += A << count;
 
    count += 1;
    sum += multiply(A, B >> count, sum, count);
    return sum;
  }

  public static int multiply(int A, int B) {
    return multiply(A, B, 0, 0);
  }

  public static void main(String [] args) {
    System.out.println("Running test 1...");
    assert(multiply(12, 34) == 408);
    System.out.println("All tests passed successfully!");
  }
}

