class ClosedIsland {
  boolean dfs(int [][] grid, int i, int j) {
    int row = grid.length;
    int col = grid[0].length;

    // go beyond of the border is not a good idea
    if (i < 0 || j < 0 || i >= row || j >= col) return false;

    // okay we hit the wall but at least we are okay
    if (grid[i][j] == 1 || grid[i][j] == 2) return true;

    // visit this cell, mark it as visited by changing the value to 2
    grid[i][j] = 2;

    // go go go
    boolean down = dfs(grid, i - 1, j);
    boolean up = dfs(grid, i + 1, j);
    boolean left = dfs(grid, i, j - 1);
    boolean right = dfs(grid, i, j + 1);

    // if this return true, we know that we are standing on a close island
    return down && up && left && right;
  }

  public int closedIsland(int[][] grid) {
    int row = grid.length;
    int col = grid[0].length;
    int result = 0;

    for (int r = 0; r < row; r++) {
      for (int c = 0; c < col; c++) {
        if (grid[r][c] == 0) {
          if (dfs(grid, r, c)) result++;
        }
      }
    }

    return result;
  }
}