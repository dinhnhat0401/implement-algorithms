// https://leetcode.com/problems/sentence-similarity/
// Noted:
// 1. Because similarity is symmetric, in case we want to use a hashmap, we need to add 2 records to hashmap for each pair
// 2. Time complexity: O(n + 2m) with n = words1.count, m = pairs.count with hashmap
// or O(nm) without hashmap
// Have no idea why the first method is faster in term of runtime on Leetcode
// Follow up question: what happen in case similarity is transitive
// if "great" ~ "fine", "fine" ~ "ok" => "great" ~ "fine" ~ "ok"
// in this case, instead of a hashmap, we need to store pairs in a undirected graph
// each time we want to check, dfs
 
class SentenceSimilarity {
    func areSentencesSimilar(_ words1: [String], _ words2: [String], _ pairs: [[String]]) -> Bool {
        if words1.count != words2.count {
            return false
        }
        
        for (index, word) in words1.enumerated() { // O(n)
            if words2[index] == word || pairs.contains([word, words2[index]])  || pairs.contains([words2[index], word]){ // O(m)
                continue
            }
            
            return false
        }
        
        return true
    }


    func areSentencesSimilar2(_ words1: [String], _ words2: [String], _ pairs: [[String]]) -> Bool {
        if words1.count != words2.count {
            return false
        }
        
        var map = [String: [String]]()
        for pair in pairs { // O(2m)
            if map[pair[0]] == nil {
                map[pair[0]] = [String]()
            }
            map[pair[0]]?.append(pair[1]);
            
            
            if map[pair[1]] == nil {
                map[pair[1]] = [String]()
            }
            map[pair[1]]?.append(pair[0]); // because of similarity is symmetric
        }
        
        for (index, word) in words1.enumerated() { // O(n)
            if words2[index] == word || map[word]?.contains(words2[index]) ?? false {
                continue
            }
            
            return false
        }
        
        return true
    }
}

