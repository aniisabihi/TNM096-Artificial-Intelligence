package Lab1;

public class main {
	
	public static void main(String[] args) {
	
	int[] start = {2, 3, 8, 1, 4, 6, 0, 5, 7};
	
	long timeStart = System.currentTimeMillis(); 
	AStar.search(start);  
	long timeEnd = System.currentTimeMillis();
	
	long duration = (timeEnd - timeStart); 
	
	System.out.print("Runtime: " + duration + " milliseconds.");
	
	}
}