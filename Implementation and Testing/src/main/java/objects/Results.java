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
	public double rad = 0.0;
	public int options = 0;
	
	public Results(ArrayList<Restaurant> a, ArrayList<Recipe> b, ArrayList<String> c, double radius, int opt){
		restList = a;
		recList = b;
		imageList = c;
		rad = radius;
		options = opt;
	}
	
	public Results() {
		
	}

}
