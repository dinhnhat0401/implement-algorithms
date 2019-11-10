import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class ReconstructMatrix {
  public static void main(String [] args) {
    System.out.println(new ReconstructMatrix().reconstructMatrix(5, 5, new int[]{2,1,2,0,1,0,1,2,0,1}));
  }

  public List<List<Integer>> reconstructMatrix(int upper, int lower, int[] colsum) {
    List<List<Integer>> result = new ArrayList<>();
    result.add(new ArrayList<>(Collections.nCopies(colsum.length, 0)));
    result.add(new ArrayList<>(Collections.nCopies(colsum.length, 0)));

    for (int c = 0; c < colsum.length; c++) {
      if (colsum[c] == 2) {
        upper--;
        lower--;
        result.get(0).set(c, 1);
        result.get(1).set(c, 1);
      }
    }

    for (int c = 0; c < colsum.length; c++) {
       if (colsum[c] == 1) {
        if (upper > 0) {
          upper--;
          result.get(0).set(c, 1); result.get(1).set(c, 0);
        } else {
          lower--;
          result.get(0).set(c, 0); result.get(1).set(c, 1);
        }
      }
    }

    return upper == 0 && lower == 0 ? result : new ArrayList<>();
  }
}
