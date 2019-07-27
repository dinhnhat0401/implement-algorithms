import java.lang.Math;

class BinaryRepresentation {
  static String binaryRepresentation(double number) {
    double rest = Math.abs(number);
    StringBuffer binaryRepresentation = number > 0 ? new StringBuffer("0.") : new StringBuffer("-0.");
    double i = 1.0/2.0;

    while (rest > 0) {
      while (i > rest) {
        binaryRepresentation.append("0");
        if (binaryRepresentation.length() > 32) return "ERROR";
        i = i / 2;
      }
      binaryRepresentation.append("1");
      if (binaryRepresentation.length() > 32) return "ERROR";
      rest = rest - i;
      i = i / 2.0;
    }

    return binaryRepresentation.toString();
  }

  public static void main(String [] args) {
    System.out.println("Binary representation of 0.72 = " +  binaryRepresentation(0.72));
    System.out.println("Binary representation of 0.125 = " +  binaryRepresentation(0.125));
  }
}

