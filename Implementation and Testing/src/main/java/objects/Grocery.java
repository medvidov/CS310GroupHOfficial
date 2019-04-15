package objects;

import java.io.Serializable;

/*
 * This is a class to store grocery items and compare with other grocery
 * 
 */

public class Grocery implements Serializable {
	public boolean check;
	public String amount;
	public String itemName;
	public String str;
	
	public Grocery() {
		
	}
	
	public Grocery(String s){
		check = false;
		str = s;
		itemName = " ";
		String[] token = s.split("\\s");
		if(!isNumeric(token[0]) &&  !token[0].contains("/")) {
			amount = "nothing";
			itemName = s;
			return;
		}
		else {
			amount = token[0] + " " + token [1];
			for(int i = 2; i < token.length; i++) {
				itemName += token[i] + " ";
			}
		}
	}
	
	//return true if combines recipe
	public boolean compare(Grocery a) {
		
		//both are not normal string
		if(amount.equals("nothing") && a.amount.equals("nothing")) {
			//same string
			if(str.equals(a.str)){
				return true;
			}
			else {
				return false;
			}
		}
		
		//if the same recipe
		if(itemName.equals(a.itemName)) {
			amount += " plus " + a.amount;
			str = amount + " " + itemName;
			return true;
		}
		
		return false;
	}
	
	//check if the first token is numeric
	public static boolean isNumeric(String strNum) {
	    try {
	        int d = Integer.parseInt(strNum);
	    } catch (NumberFormatException | NullPointerException nfe) {
	        return false;
	    }
	    return true;
	}
}
