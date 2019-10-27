import java.util.Iterator;
import java.util.LinkedList;

public class LinkedListTest {
    public static void main(String [] args) {
        LinkedList<String> linkedList = new LinkedList<>();
        linkedList.add("first");
        linkedList.add("second");
        linkedList.add("third");
        Iterator<String> itr = linkedList.iterator();
        while (itr.hasNext()) {
            System.out.print(itr.next() + " ");
        }
        System.out.println(linkedList.listIterator(2).next());
        System.out.println(linkedList.listIterator(2).previous());
        System.out.println(linkedList.iterator().next());
        System.out.println(linkedList.listIterator(0).hasPrevious());
    }
}
