public class LongestPalindromicSubstring2 {
  public static void main(String [] args) {
    System.out.println(new LongestPalindromicSubstring2().longestPalindrome("esbtzjaaijqkgmtaajpsdfiqtvxsgfvijpxrvxgfumsuprzlyvhclgkhccmcnquukivlpnjlfteljvykbddtrpmxzcrdqinsnlsteonhcegtkoszzonkwjevlasgjlcquzuhdmmkhfniozhuphcfkeobturbuoefhmtgcvhlsezvkpgfebbdbhiuwdcftenihseorykdguoqotqyscwymtjejpdzqepjkadtftzwebxwyuqwyeegwxhroaaymusddwnjkvsvrwwsmolmidoybsotaqufhepinkkxicvzrgbgsarmizugbvtzfxghkhthzpuetufqvigmyhmlsgfaaqmmlblxbqxpluhaawqkdluwfirfngbhdkjjyfsxglsnakskcbsyafqpwmwmoxjwlhjduayqyzmpkmrjhbqyhongfdxmuwaqgjkcpatgbrqdllbzodnrifvhcfvgbixbwywanivsdjnbrgskyifgvksadvgzzzuogzcukskjxbohofdimkmyqypyuexypwnjlrfpbtkqyngvxjcwvngmilgwbpcsseoywetatfjijsbcekaixvqreelnlmdonknmxerjjhvmqiztsgjkijjtcyetuygqgsikxctvpxrqtuhxreidhwcklkkjayvqdzqqapgdqaapefzjfngdvjsiiivnkfimqkkucltgavwlakcfyhnpgmqxgfyjziliyqhugphhjtlllgtlcsibfdktzhcfuallqlonbsgyyvvyarvaxmchtyrtkgekkmhejwvsuumhcfcyncgeqtltfmhtlsfswaqpmwpjwgvksvazhwyrzwhyjjdbphhjcmurdcgtbvpkhbkpirhysrpcrntetacyfvgjivhaxgpqhbjahruuejdmaghoaquhiafjqaionbrjbjksxaezosxqmncejjptcksnoq"));
  }

  public String longestPalindrome(String s) {
    String result = "";
    boolean[][] P = new boolean[s.length()][s.length()];

    for (int i = 1; i <= s.length(); i++) {
      for (int j = 0; j < s.length() && j + i <= s.length(); j++) {
        if (checkPalindrome(s, j, j + i - 1, P)) {
          P[j][j + i - 1] = true;
          if (result.length() < i) result = s.substring(j, j + i);
        }
      }
    }
    return result;
  }

  private boolean checkPalindrome(String s, int l, int r, boolean [][] P) {
    // base cases P[i][i] = true, single character is a palindrome string
    if (r == l) return true;

    final boolean b = s.charAt(l) == s.charAt(r);
    if (r - l == 1) return b;

    return b && P[l + 1][r - 1];
  }
}
