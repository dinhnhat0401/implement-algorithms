class PreviousNumber {
  static int getSmallerNumber(int a) {
    int count0s = 0;
    int count1s = 0;
    while (a > 0) {
      if ((a & 1) == 0) { count0s ++; }
      else {
        if (count0s == 0) { count1s ++; }
        else { break; }
      }
      a >>>= 1;
    }
    a -=1;
    System.out.println("count0s = " + count0s + ", count1s = " + count1s);
    int b = ((1 << (count1s + 1)) - 1) << (count0s - 1);
    System.out.println("b = " + b);
    return (a << (count1s + count0s)) + b;
  }

  public static void main(String [] args) {
    System.out.println("smaller number of 8 = " + getSmallerNumber(8));
    System.out.println("smaller number of 23 = " + getSmallerNumber(23));
  }
}


