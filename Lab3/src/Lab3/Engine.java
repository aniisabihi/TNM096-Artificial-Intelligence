package Lab3;

import java.util.Vector;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Engine {
	
	public Vector<Clause> clauseVec = new Vector<Clause>();
	
	Engine(String[] stringClauses)
	{
		for(int i = 0; i < stringClauses.length; i ++)
		{
			Clause c = new Clause(stringClauses[i]);
			
			if(!c.isEmpty())
			{
				clauseVec.addElement(c);
				c.display();
			}
		}
		
	}
	
	public Clause resolution(Clause A, Clause B)
	{
		Clause newClause = new Clause();
		
		
		
		return newClause;
		
	}
	
}
