class TripleStep {
  // Top down approach with memoization
  int countPossibleWays(int n) {
    int [] memo = new int[n + 1];
    memo[0] = 0;
    memo[1] = 1;
    memo[2] = 2;

    for (int i = 3; i <= n; i++) {
      memo[i] = memo[i - 1] + memo[i - 2] + memo[i - 3];
    }

    return memo[n];
  }

  // Bottom up approach
  int countPossibleWays2(int n, int [] memo) {
    if (n == 0) { return 0; }
    else if (n == 1) { return 1; }
    else if (n == 2) { return 2; }
    else if (memo[n] != 0) { return memo[n]; }

    memo[n] = countPossibleWays2(n - 1, memo) + countPossibleWays2(n - 2, memo) + countPossibleWays2(n -2, memo);
    return memo[n];
  }
}

