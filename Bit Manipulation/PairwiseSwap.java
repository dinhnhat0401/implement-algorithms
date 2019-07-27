class PairwiseSwap {
  static int swap(int a) {
    return ((a & 0xaaaaaaaa) >> 1) | ((a & 0x55555555) << 1);
  }

  public static void main(String [] args) {
    System.out.println("swap 174, result should be 93. Got = " + swap(174));
  }
}

