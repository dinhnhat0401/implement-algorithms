public class LookAndSaySequence{

    public static void main(String []args){
        assert getNthTerm(1).compareTo("1") == 0;
	assert getNthTerm(2).compareTo("11") == 0;
	assert getNthTerm(5).compareTo("111221") == 0;
    }

    public static String getNthTerm(int n) {
        int count = 0;
        String first = "1";
        while (count < n-1) {
            first = getNext(first);
            count++;
        }

        return first;
    }     
     
    public static String getNext(String current) {
        String result = "";
        int count = 1;
        int i = 1;

        while (i < current.length()) {
            if (current.charAt(i) == current.charAt(i - 1)) {
                count++;
            } else {
                result += (Integer.toString(count) + current.charAt(i - 1));
                count = 1;
            }

            i++;
        }
        
        result += (Integer.toString(count) + current.charAt(i - 1));
        
        return result;
     }
}

