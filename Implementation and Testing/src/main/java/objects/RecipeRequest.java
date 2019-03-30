package objects;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlAnchor;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class RecipeRequest {
	
	public ArrayList<Recipe> recipeResults = new ArrayList<Recipe>();
	
	public ArrayList<String> recipeURLs = new ArrayList<String>();
	public ArrayList<String> recipeNames = new ArrayList<String>();
	public ArrayList<String> recipeImageURLs = new ArrayList<String>();
	
	String urlOfPrintable;
	
	String urlOfSearch;
	String searchTerm;
	Integer numResults;
	
	public void reorganizeList() {
		Map <Recipe, Integer> byTime = new HashMap <>();
		for (Recipe r : recipeResults) {
			Scanner getTime = new Scanner (r.prepTime);
			int totalTime = 0;
			boolean done = false;
			while(!done && getTime.hasNext()) {
				int time = Integer.parseInt(getTime.next());
				String s = getTime.next();
				System.out.println(time + " , " + s);
				if (s.trim().equalsIgnoreCase("h")) {
					time *= 60;
				} else {
					done = true;
				}
				totalTime +=time;
			}
			System.out.println(r.name + " of " + r.prepTime + " calculated " + totalTime);
			byTime.put(r, totalTime);
		}
		ArrayList<Recipe> newlist = new ArrayList<>();
		int size = recipeResults.size();
		for (int i = 0; i < size; i++) {
			Recipe smallest = null;
			int min_time = 1000;
			for(Recipe r : byTime.keySet()) {
				if (byTime.get(r)< min_time) {
					smallest = r; 
					min_time = byTime.get(r);
				}
			}
			byTime.remove(smallest);
			if (min_time ==0) {
				smallest.prepTime = "N/A";
				smallest.cookTime = "N/A";
			} else {
				smallest.prepTime+= "in";
				smallest.cookTime+= "in";
			}
			newlist.add(smallest);
			
		}
		this.recipeResults = newlist;
	}
	
	
	public RecipeRequest(String query, int options) {
		
		searchTerm = query;
		numResults = options;
		
		if (!searchTerm.matches("[a-zA-Z ]+")) {
			searchTerm = ".";
		}
		
		//hard coding some values for testing - these results are consistent from the API
		Recipe ham1;
		Recipe ham2;
		Recipe ham3;
		Recipe ham4;
		Recipe ham5;
		Recipe ch1;
		
		
		
		String rName = "Feta-Stuffed Hamburgers";
		String iLink = "https://images.media-allrecipes.com/userphotos/250x250/135923.jpg";
		String pTime = "5 m";
		String cTime = "15 m";
		ArrayList<String> ings = new ArrayList<String>();
		ArrayList<String> inst = new ArrayList<String>();
		
			
		ings.add("1 pound lean ground beef");
		ings.add("1/2 teaspoon Worcestershire sauce");
		ings.add("1 teaspoon dried parsley");
		ings.add("salt and pepper to taste");
		ings.add("1 cup crumbled feta cheese");
			
		inst.add("1. Preheat an outdoor grill for medium heat, and lightly oil the grate.");
		inst.add("2. Knead together the ground beef, Worcestershire sauce, parsley, salt, and pepper in a bowl. Form the mixture into 8 equal-sized balls; flatten to make thin patties. Place about 1/4 cup of feta cheese onto each of four of the patties. Top each of the patties with cheese with one of the patties without; press the edges together to seal the cheese into the center.");
		inst.add("3. Cook on the preheated grill until the burgers are cooked to your desired degree of doneness, 7 to 8 minutes per side for well done. An instant-read thermometer inserted into the center should read 160 degrees F (70 degrees C).");
		
		//clean data before adding
		for (String f : ings) {
			f = f.replaceAll("\'", "\\\\'");
			f = f.replaceAll("\"","\\\\\"");
		}
		
		for (String f : inst) {
			f = f.replaceAll("\'", "\\\\'");
			f = f.replaceAll("\"","\\\\\"");
		}
		
		rName = rName.replaceAll("\"","\\\\\"");
		
		ham1 = new Recipe(rName, iLink, pTime, cTime, ings, inst, searchTerm, 4.4);
		
		rName = "Best Hamburger Ever";
		iLink = "https://images.media-allrecipes.com/userphotos/250x250/5563136.jpg";
		pTime = "10 m";
		cTime = "20 m";
		ings = new ArrayList<String>();
		inst = new ArrayList<String>();
			
		ings.add("1 1/2 pounds lean ground beef");
		ings.add("1/2 onion, finely chopped");
		ings.add("1/2 cup shredded Colby Jack or Cheddar cheese");
		ings.add("1 teaspoon soy sauce");
		ings.add("1 teaspoon Worcestershire sauce");
		ings.add("1 egg");
		ings.add("1 (1 ounce) envelope dry onion soup mix");
		ings.add("1 clove garlic, minced");
		ings.add("1 tablespoon garlic powder");
		ings.add("1 teaspoon dried parsley");
		ings.add("1 teaspoon dried basil");
		ings.add("1 teaspoon dried oregano");
		ings.add("1/2 teaspoon crushed dried rosemary");
		ings.add("salt and pepper to taste");
			
		inst.add("1. Preheat a grill for high heat.");
		inst.add("2. In a large bowl, mix together the ground beef, onion, cheese, soy sauce, Worcestershire sauce, egg, onion soup mix, garlic, garlic powder, parsley, basil, oregano, rosemary, salt, and pepper. Form into 4 patties.");
		inst.add("3. Grill patties for 5 minutes per side on the hot grill, or until well done. Serve on buns with your favorite condiments.");
		
		//clean data before adding
		for (String f : ings) {
			f = f.replaceAll("\'", "\\\\'");
			f = f.replaceAll("\"","\\\\\"");
		}
		
		for (String f : inst) {
			f = f.replaceAll("\'", "\\\\'");
			f = f.replaceAll("\"","\\\\\"");
		}
		
		rName = rName.replaceAll("\"","\\\\\"");
		
		ham2 = new Recipe(rName, iLink, pTime, cTime, ings, inst, searchTerm, 4.1);
		
		rName = "Big Smokey Burgers";
		iLink = "https://images.media-allrecipes.com/userphotos/250x250/4045578.jpg";
		pTime = "25 m";
		cTime = "10 m";
		ings = new ArrayList<String>();
		inst = new ArrayList<String>();
			
		ings.add("2 pounds ground beef sirloin");
		ings.add("1/2 onion, grated");
		ings.add("1 tablespoon grill seasoning");
		ings.add("1 tablespoon liquid smoke flavoring");
		ings.add("2 tablespoons Worcestershire sauce");
		ings.add("2 tablespoons minced garlic");
		ings.add("1 tablespoon adobo sauce from canned chipotle peppers");
		ings.add("1 chipotle chile in adobo sauce, chopped");
		ings.add("salt and pepper to taste");
		ings.add("6 (1 ounce) slices sharp Cheddar cheese (optional)");
		ings.add("6 hamburger buns");
			
		inst.add("1. Preheat an outdoor grill for medium-high heat.");
		inst.add("2. Combine ground sirloin, onion, grill seasoning, liquid smoke, Worcestershire sauce, garlic, adobo sauce, and chipotle pepper in a large bowl. Form the mixture into 6 patties. Season with salt and pepper.");
		inst.add("3. Place burgers on preheated grill and cook until no longer pink in the center. Place a slice of Cheddar cheese on top of each burger one minute before they are ready. Place burgers on buns to serve.");
		
		//clean data before adding
		for (String f : ings) {
			f = f.replaceAll("\'", "\\\\'");
			f = f.replaceAll("\"","\\\\\"");
		}
		
		for (String f : inst) {
			f = f.replaceAll("\'", "\\\\'");
			f = f.replaceAll("\"","\\\\\"");
		}
		
		rName = rName.replaceAll("\"","\\\\\"");
		
		ham3 = new Recipe(rName, iLink, pTime, cTime, ings, inst, searchTerm, 4.5);
		
		rName = "Garlic and Onion Burgers";
		iLink = "https://images.media-allrecipes.com/userphotos/250x250/1055214.jpg";
		pTime = "";
		cTime = "";
		ings = new ArrayList<String>();
		inst = new ArrayList<String>();
			
		ings.add("2 pounds ground beef");
		ings.add("1 tablespoon Worcestershire sauce");
		ings.add("3 cloves garlic, minced");
		ings.add("1/2 cup minced onion");
		ings.add("1 teaspoon salt");
		ings.add("1/2 teaspoon ground black pepper");
		ings.add("1 teaspoon Italian-style seasoning");
			
		inst.add("1. In a large bowl, mix together the beef, Worcestershire sauce, garlic, onion, salt, pepper and Italian seasoning. Refrigerate for 2 to 4 hours.");
		inst.add("2. Preheat grill for high heat.");
		inst.add("3. Form burgers into 1/2 inch thick patties. Lightly oil grate. Place burgers on grill. Cook for approximately 6 minutes, turning once.");
		
		//clean data before adding
		for (String f : ings) {
			f = f.replaceAll("\'", "\\\\'");
			f = f.replaceAll("\"","\\\\\"");
		}
		
		for (String f : inst) {
			f = f.replaceAll("\'", "\\\\'");
			f = f.replaceAll("\"","\\\\\"");
		}
		
		rName = rName.replaceAll("\"","\\\\\"");
		
		ham4 = new Recipe(rName, iLink, pTime, cTime, ings, inst, searchTerm, 4.3);
		
		rName = "Slider-Style Mini Burgers";
		iLink = "https://images.media-allrecipes.com/userphotos/250x250/415758.jpg";
		pTime = "10 m";
		cTime = "40 m";
		ings = new ArrayList<String>();
		inst = new ArrayList<String>();
			
		ings.add("2 pounds ground beef");
		ings.add("1 (1.25 ounce) envelope onion soup mix");
		ings.add("1/2 cup mayonnaise");
		ings.add("2 cups shredded Cheddar cheese");
		ings.add("24 dinner rolls, split");
		ings.add("1/2 cup sliced pickles (optional)");
			
		inst.add("1. Preheat an oven to 350 degrees F (175 degrees C). Cover a baking sheet with aluminum foil and spray with cooking spray.");
		inst.add("2. Mix together the ground beef and onion soup mix in a large skillet; cook and stir over medium-high heat until the beef is crumbly, evenly browned, and no longer pink. Drain and discard any excess grease. Remove from heat. Stir the mayonnaise and Cheddar cheese into the ground beef mixture.");
		inst.add("3. Lay the bottoms of the dinner rolls on the prepared baking sheet. Spread the cheese and beef mixture on the bottom half of each roll. Replace the tops. Cover with another sheet of aluminum foil sprayed with cooking spray.");
		inst.add("4. Bake in the preheated oven until the burgers are heated through and cheese melts, about 30 minutes. Serve with sliced pickles.");
		
		//clean data before adding
		for (String f : ings) {
			f = f.replaceAll("\'", "\\\\'");
			f = f.replaceAll("\"","\\\\\"");
		}
		
		for (String f : inst) {
			f = f.replaceAll("\'", "\\\\'");
			f = f.replaceAll("\"","\\\\\"");
		}
		
		rName = rName.replaceAll("\"","\\\\\"");
		
		ham5 = new Recipe(rName, iLink, pTime, cTime, ings, inst, searchTerm, 4.5);
		
		rName = "Stir-Fried Chicken With Pineapple and Peppers";
		iLink = "https://images.media-allrecipes.com/userphotos/250x250/1816983.jpg";
		pTime = "";
		cTime = "";
		ings = new ArrayList<String>();
		inst = new ArrayList<String>();
			
		ings.add("1/4 cup reduced-salt soy sauce");
		ings.add("2 tablespoons white wine vinegar");
		ings.add("2 tablespoons mirin (sweetened Asian wine)");
		ings.add("1 teaspoon grated ginger root");
		ings.add("2 crushed garlic cloves");
		ings.add("1 tablespoon cornstarch");
		ings.add("2 tablespoons oil, preferably sesame oil");
		ings.add("1 pound boneless, skinless chicken breast, cut in 1-inch pieces");
		ings.add("6 large green onions, cut in 1-inch pieces");
		ings.add("2 cups fresh or frozen pepper strips");
		ings.add("1 (20 ounce) can chunk pineapple in juice");
		ings.add("1/4 cup sliced almonds (optional)");
		
			
		inst.add("1. Combine first six ingredients; stir well.");
		inst.add("2. Heat oil in a large skillet and stir-fry chicken until brown and done, about 5 minutes. Remove. Add green onions, peppers and pineapple to the skillet; heat through. Pour in sauce and stir until thickened. Return chicken to skillet; heat through. Serve with brown rice; top with optional almonds.");
		
		//clean data before adding
		for (String f : ings) {
			f = f.replaceAll("\'", "\\\\'");
			f = f.replaceAll("\"","\\\\\"");
		}
		
		for (String f : inst) {
			f = f.replaceAll("\'", "\\\\'");
			f = f.replaceAll("\"","\\\\\"");
		}
		
		rName = rName.replaceAll("\"","\\\\\"");
		
		ch1 = new Recipe(rName, iLink, pTime, cTime, ings, inst, searchTerm, 4.3);
		
		
		
		if (searchTerm.equals("hamburger") && options == 5) {
			recipeResults.add(ham1);
			recipeResults.add(ham2);
			recipeResults.add(ham3);
			recipeResults.add(ham4);
			recipeResults.add(ham5);
		} else if (searchTerm.equals("hamburger") && options == 4) {
			recipeResults.add(ham1);
			recipeResults.add(ham2);
			recipeResults.add(ham3);
			recipeResults.add(ham4);
		} else if (searchTerm.equals("hamburger") && options == 3) {
			recipeResults.add(ham1);
			recipeResults.add(ham2);
			recipeResults.add(ham3);
		} else if (searchTerm.equals("hamburger") && options == 2) {
			recipeResults.add(ham1);
			recipeResults.add(ham2);
		} else if (searchTerm.equals("hamburger") && options == 1) {
			recipeResults.add(ham1);
		} else if (searchTerm.equals("chinese") && options == 1) {
			recipeResults.add(ch1);
		} else {
		
			if (!searchTerm.equals(".")) {
				this.request();
				reorganizeList();
			}
		}
		
	}
	
	private void request() {
		
		//first step is to grab numResults recipes to get from the search page
		//based on https://www.allrecipes.com/search/results/?wt=chicken&sort=re
		
		urlOfSearch = "https://www.allrecipes.com/search/results/?wt=" + searchTerm + "&sort=re";

		WebClient client = new WebClient();  
		client.getOptions().setCssEnabled(false); 
		client.getOptions().setJavaScriptEnabled(false);
		
		HtmlPage page = null;
		
		try {  
		  page = client.getPage(urlOfSearch);
		}catch(Exception e){
		  e.printStackTrace();
		}
		
		//we want to first check if <article class="grid-col--fixed-tiles hub-card"> exists
		
		List<HtmlElement> items = (List<HtmlElement>) page.getByXPath("//article[@class='grid-col--fixed-tiles hub-card']");
		
		if (items.size() > 0) {
			HtmlElement item = items.get(0);
			HtmlAnchor itemAnchor = ((HtmlAnchor)item.getFirstByXPath(".//a"));
			try {
				page = client.getPage("https://allrecipes.com" + itemAnchor.getHrefAttribute());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//from this page, we need to pull the following values
		
		items = (List<HtmlElement>) page.getByXPath("//article[@class='fixed-recipe-card']"); 
		
		if (items.size() < numResults) {
			numResults = items.size();
		}
		
		for (int i = 0; i < numResults; i++) {
			
			HtmlElement item = items.get(i);
			HtmlAnchor itemAnchor = ((HtmlAnchor)item.getFirstByXPath(".//a"));
			
			//load a new result item into our arraylists for later parsing
			
			//recipes are noted by the <article class="fixed-recipe-card">
			//the following values are all within thius article class for that specific recipe
			
			//grab image urls from here ...
			//data-imageurl="url.com"
			
			//we can grab a URL from here...
			//<a href="https://www.allrecipes.com/recipe/228293/curry-stand-chicken-tikka-masala-sauce/"
			//TO THIS WE SHOULD ADD "print" to get a simplified page to scrape
			
			recipeURLs.add(itemAnchor.getHrefAttribute() + "print");
		}
		
		//from this page, we need to pull the following values
	
		for (String i : recipeURLs) {
			
			client = new WebClient();  
			client.getOptions().setCssEnabled(false);  
			client.getOptions().setJavaScriptEnabled(false);
			
			page = null;
			
			try {  
			  page = client.getPage(i);
			}catch(Exception e){
			  e.printStackTrace();
			}
			
			//begin analysis of printable page
			//we need to create a new recipe object with the following information
			
			String recipeName;
			
			String imageLink;
			
			double starRating;
			
			String prepTime;
			String cookTime;
			ArrayList<String> ingredients = new ArrayList<String>();
			ArrayList<String> instructions = new ArrayList<String>();
			
			//recipe name is page title
			items = (List<HtmlElement>) page.getByXPath("//title");
			
			recipeName = items.get(0).asText();
			String[] split = recipeName.split("Printer");
			recipeName = split[0].substring(0, split[0].length()-3);
			
			//prep time
			items = (List<HtmlElement>) page.getByXPath("//time");
			
			if (items.size() > 1) {
				prepTime = items.get(0).asText();
				//cook time
				cookTime = items.get(1).asText();
			} else {
				prepTime = "";
				cookTime = "";
			}
			
			//image URL
			
			//img class="recipe-print__recipe-img"
			items = (List<HtmlElement>) page.getByXPath("//img[@class='recipe-print__recipe-img']");
			
			if (items.size() > 0) {
				imageLink = items.get(0).getAttribute("src");
			} else {
				imageLink = "";
			}
			
			//ingredients
			items = (List<HtmlElement>) page.getByXPath("//ul");
			
			if (items.size() > 25) {
				String listIngredientsOne = items.get(25).asText();
				String listIngredientsTwo = items.get(26).asText();
				String[] s = listIngredientsOne.split("\n");
				String[] s2 = listIngredientsTwo.split("\n");
				for (String o : s) {
					ingredients.add(o);
				}
				for (String y : s2) {
					ingredients.add(y);
				}
				
				//ingredients.add(items.get(25).asText());
				//ingredients.add(items.get(26).asText());
			} else {
				ingredients.add("");
			}
			
			//instructions
			items = (List<HtmlElement>) page.getByXPath("//ol[@class='recipe-print__directions']");
			//<ol class="recipe-print__directions">
			for (HtmlElement j : items) {
				String listI = j.asText();
				String[] s = listI.split("\n");
				
				for (String o : s) {
					instructions.add(o);
				}
				
				//instructions.add(j.asText());
			}
			
			//star rating
			items = (List<HtmlElement>) page.getByXPath("//div[@class='rating-stars']");
			
			if (items.size() > 0) {
				starRating = Double.parseDouble(items.get(0).getAttribute("data-ratingstars"));
			} else {
				starRating = 0.0;
			}
			
			String rate = String.valueOf(starRating);
			starRating = Double.parseDouble(rate.substring(0,3));
			
			

			//clean data before adding
			for (String f : ingredients) {
				f = f.replaceAll("\'", "\\\\'");
				f = f.replaceAll("\"","\\\\\"");
			}
			
			for (String f : instructions) {
				f = f.replaceAll("\'", "\\\\'");
				f = f.replaceAll("\"","\\\\\"");
			}
			

			recipeName = recipeName.replaceAll("\"","\\\\\"");
			
			recipeResults.add(new Recipe(recipeName, imageLink, prepTime, cookTime, ingredients, instructions, searchTerm, starRating));
		}
		
	}
	
	
	
	/*
	
	 
	public static void main (String args []) {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("What would you like to search?");
		String query = scan.nextLine();
		System.out.println("How many search results?");
		int options = scan.nextInt();
		scan.nextLine();
		RecipeRequest y = new RecipeRequest(query, options);
		
		System.out.println("");
		
		for (Recipe i : y.recipeResults) {
			System.out.println(i.recipeName);
			System.out.println("Image URL: " + i.imageLink);
			System.out.println("Prep Time: " + i.prepTime);
			System.out.println("Cook Time: " + i.cookTime);
			System.out.println("Star Rating: " + i.rating);
			System.out.println("Ingredients: ");
			for (String j : i.ingredients) {
				System.out.println(j);
			}
			System.out.println("Instructions: ");
			for (String j : i.instructions) {
				System.out.println(j);
			}
			System.out.println("");
		}
		
	}
	
	*/
	
	

}