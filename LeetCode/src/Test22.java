import java.io.*;
import java.util.*;

class Test22 {

  static HashMap<String, String> result = new HashMap<>();
  static HashMap<String, String> flattenDictionary(HashMap<String, Object> dict) {
    helper(dict, "");
    return result;
  }

  static void helper(HashMap<String, Object> dict, String key) {
    for (Map.Entry<String, Object> entry: dict.entrySet()) {
      if (key.isEmpty()) {
        key = entry.getKey();
      } else {
        key = key + "." + entry.getKey();
      }
      System.out.println(key);
      if (entry.getValue() instanceof String) {
        result.put(key, (String)entry.getValue());
      } else {
        helper((HashMap<String, Object>)entry.getValue(), key);
      }
    }
  }

  // Key2.a" : "2",
  public static void main(String[] args) {
    HashMap<String, Object> dict = new HashMap<>();
    dict.put("Key1", "323");
//    Object o = new HashMap<>().put("c", 3);
    dict.put("Key2", "bbb");
    flattenDictionary(dict);
  }

}