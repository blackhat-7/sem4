import java.util.*;

class HuffmanNode
{
    char c;
    int freq;
    HuffmanNode left;
    HuffmanNode right;
}

public class Huffman
{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String s = sc.next();
        HashMap<Character, Integer> map = new HashMap<>();
        for(int i=0; i<s.length(); ++i)
        {
            if (map.containsKey(s.charAt(i)))
            {
                map.put(s.charAt(i), map.get(s.charAt(i))+1);
            }
            else
            {
                map.put(s.charAt(i), 1);
            }
        }

        map = sortByValue(map);
        
        

        sc.close();
    }
    
    private static HashMap<Character, Integer> sortByValue(HashMap<Character, Integer> hm) 
    { 
        // Create a list from elements of HashMap 
        List<Map.Entry<Character, Integer>> list = new LinkedList<Map.Entry<Character, Integer>>(hm.entrySet()); 
  
        // Sort the list 
        Collections.sort(list, new Comparator<Map.Entry<Character, Integer>>() 
        { 
            public int compare(Map.Entry<Character, Integer> o1, Map.Entry<Character, Integer> o2) 
            { 
                return (o1.getValue()).compareTo(o2.getValue()); 
            } 
        }); 
          
        // put data from sorted list to hashmap  
        HashMap<Character, Integer> temp = new LinkedHashMap<Character, Integer>(); 
        for (Map.Entry<Character, Integer> aa : list) { 
            temp.put(aa.getKey(), aa.getValue()); 
        } 
        return temp; 
    }
}