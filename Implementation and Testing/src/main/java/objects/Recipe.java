package objects;

import java.io.Serializable;
import java.util.ArrayList;

import org.apache.commons.codec.digest.DigestUtils;

public class Recipe extends Item implements Serializable {
	public String recipeName;
	public String imageLink;
	public String prepTime;
	public String cookTime;
	public String ingredients[];
	public String instructions[];
	
	//create recipe object and initialize member variables 
	public Recipe(String recipename, String imagelink, String preptime, String cooktime,ArrayList<String> ingredient,ArrayList<String> instruction, String q, double ratingIn) {
		recipeName = recipename;
		imageLink = imagelink;
		prepTime = preptime;
		cookTime = cooktime;
		query = q;
		rating = ratingIn;
		ingredients = new String[ingredient.size()];
		instructions = new String[instruction.size()];
		for(int i = 0; i < ingredient.size(); i++) {
			ingredients[i] = ingredient.get(i);
		}
		for(int i = 0; i < instruction.size(); i++) {
			instructions[i] = instruction.get(i);
		}
		uniqueID = DigestUtils.sha256Hex(recipename);
	}
	
	public Recipe() {}
	
}