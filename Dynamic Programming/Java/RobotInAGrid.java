//class RobotInAGrid {
//  class Point {
//    private int row;
//    private int col;
//
//    public Point(int row, int col) {
//      this.row = row;
//      this.col = col;
//    }
//  }
//
//  List<Point> getPath(boolean[][] matrix) {
//    List<Point> path = new List<>();
//    if (getPath(matrix, matrix.length() - 1, matrix[0].length() - 1, path)) {
//      return path;
//    }
//    return nil;
//  }
//
//  boolean getPath(boolean[][] matrix, int row, int col, List<Point> path) {
//    if (!matrix[row][col]) return false;
//
//    boolean isOrigin = (row == 0 && col == 0);
//    if (isOrigin || getPath(matrix, row - 1, col, path) || getPath(matrix, row, col - 1, path)) {
//      path.add(new Point(row, column));
//    }
//
//    return false;
//  }
//}
//
