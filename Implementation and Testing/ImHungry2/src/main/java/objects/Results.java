package objects;

import java.io.Serializable;
import java.util.ArrayList;

/*
 * This is to store results list so that we can store it in JSON
 */

public class Results implements Serializable{
	public ArrayList<Restaurant> restList;
	public ArrayList<Recipe> recList;
	public ArrayList<String> imageList;
	
	public Results(ArrayList<Restaurant> a, ArrayList<Recipe> b, ArrayList<String> c){
		restList = a;
		recList = b;
		imageList = c;
	}
	
	public Results() {
		
	}

}
