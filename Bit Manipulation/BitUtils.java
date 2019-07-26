class BitUtils {
  boolean getBit(int num, int i) {
    int mask = 1 << i;
    return (num & mask) != 0;
  }

  boolean clearBit(int num, int i) {
    int mask = ~(1 << i);
    return num & mask;
  }

  int clearBitsMSBthoughI(int num, int i) {
    int mask = (1 << i) - 1;
    return num & mask;
  }

  int clearBitsIthrough0(int num, int i) {
    int mask = -1 << (i + 1);
    return num & mask;
  }

  boolean setBit(int num, int i, boolean is1s) {
    int value = is1s ? 1 : 0;
    int mask = ~(1 << i);
    return (num & mask) | (value << i);
  }
}

