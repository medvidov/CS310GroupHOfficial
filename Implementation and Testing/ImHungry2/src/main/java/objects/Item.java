package objects;

import java.io.Serializable;

public class Item implements Serializable {
	public boolean isFavorite = false;
	public boolean isDoNotExplore = false;
	public boolean isToExplore = false;
	public String uniqueID;
	public String price;
	public double rating;
	public String websiteLink;
	public String name;
	public String query;
}
