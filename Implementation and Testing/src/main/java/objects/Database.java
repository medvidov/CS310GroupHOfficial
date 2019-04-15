package objects;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.codec.digest.DigestUtils;
import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.google.gson.Gson;

import net.sourceforge.htmlunit.corejs.javascript.ObjToIntMap.Iterator;

public class Database {
	//this is a reference to the database
	public static DatabaseReference root = null;
	public ArrayList<String> prev = null;
	public boolean finish = false;
	
	//Commenting to change
	
	//initialise 
	public Database() throws IOException {
		if(root != null) {
			return;
		}
		
		//CHANGE THIS
		FileInputStream serviceAccount =
				  new FileInputStream("C:\\Users\\Bram\\Desktop\\workspace\\310GroupH\\src\\main\\webapp\\imhungry-64e63-firebase-adminsdk-5u9ua-cef44f88a3.json");

				FirebaseOptions option = new FirebaseOptions.Builder()
				  .setCredentials(GoogleCredentials.fromStream(serviceAccount))
				  .setDatabaseUrl("https://imhungry-64e63.firebaseio.com")
				  .build();

		FirebaseApp.initializeApp(option);
		root = FirebaseDatabase.getInstance().getReference();
	}
	
	//add new query to database
	public void addNewQuery(String query, Results myres) {
		root.child("newQueries").child(query).setValueAsync(myres);
	}

	//returns the previous queries query-imageLink
	public void getPrevQuery(){
		
		root.child("newQueries").addListenerForSingleValueEvent(
				new ValueEventListener() {
					@Override
					public void onDataChange(DataSnapshot dataSnapshot) {
						prev = new ArrayList<String>();
						//System.out.println("SIZE: " + dataSnapshot.getChildrenCount());
						//go through each child
						for(DataSnapshot ds : dataSnapshot.getChildren()) {
							Results boom = ds.getValue(Results.class);
							//System.out.println(ds.getKey() + " -> " + boom.imageList.get(0));
							prev.add(ds.getKey() + " " + boom.imageList.get(0));
							//System.out.println(prev.get(0));
						}
						finish = true;
					}
					@Override
		            public void onCancelled(DatabaseError databaseError) {
		                // read query is cancelled.
		            }
				}
				);
	}
	
	//create user
	public boolean createUser(String username, String password) {
		
		User myuser = new User();
		myuser.username = username;
		String hash = DigestUtils.sha256Hex(password);
		//System.out.println("writting " + username + " " + hash);
		String all = username + "-" + hash;
		myuser.uid = all;
		root.child("user").child(all).setValueAsync(myuser);
		//System.out.println("success1");
		return true;
	}
	
	//get user data
	public User getUser(String username, String password) throws JSONException, IOException {
		
		ObjectMapper mapper = new ObjectMapper();
		
		String file = username + "-" + DigestUtils.sha256Hex(password);

		//using firebase
		JSONObject a = JsonReader.readJsonFromUrl("https://imhungry-64e63.firebaseio.com/user/" + file + ".json");
		
		//File file = new File(filename + ".json");
		User myres = mapper.readValue(a.toString(), User.class);
		
		return myres;
	}
	
	//check user and login exist
	public void checkUser() {
		root.child("user").addListenerForSingleValueEvent(
				new ValueEventListener() {
					@Override
					public void onDataChange(DataSnapshot dataSnapshot) {
						prev = new ArrayList<String>();
						//System.out.println("SIZE: " + dataSnapshot.getChildrenCount());
						//go through each child
						for(DataSnapshot ds : dataSnapshot.getChildren()) {
							//System.out.println(ds.getKey());
							prev.add(ds.getKey());
							//System.out.println(prev.get(0));
						}
						finish = true;
					}
					@Override
		            public void onCancelled(DatabaseError databaseError) {
		                // read query is cancelled.
		            }
				}
				);
	}
	
	
	//save into db
	public void logout(User myuser) {
		root.child("user").child(myuser.uid).setValueAsync(myuser);
	}
}
