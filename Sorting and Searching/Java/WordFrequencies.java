import java.util.Hashtable;

class WordFrequencies {
  int findWordFrequencies(Hashtable<String, Integer> table, String word) {
    if (table == null || word == null) return -1;

    if (!table.contains(word)) return 0;

    return table.get(word);
  }

  Hashtable<String, Integer> buildTable(String [] book) {
    if (book == null) return null;

    Hashtable<String, Integer> table = new Hashtable<>();
    for (String word : book) {
      String editedWord = wordHelper(word);
      int count = 1;
      if (table.contains(editedWord)) {
        count = table.get(editedWord) + 1;
      }
      table.put(editedWord, count);
    }

    return table;
  }

  String wordHelper(String word) {
    return word.trim().toLowerCase();
  }
}

