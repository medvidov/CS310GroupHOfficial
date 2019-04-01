<!DOCTYPE html><html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Recipe Page</title>

    <!-- maxcdn -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    

    <!-- style  -->
    <link href="./css/main.css?version=5" rel="stylesheet">
    
    <script>
    //to navigate to results page
    	function toResult(){
    		window.location.href = "Results.jsp";
    	}
    
    	//add items to grocery
    	function AddToGrocery(){
    		console.log("adding");
    		
  			var xhttp = new XMLHttpRequest();
  			xhttp.onreadystatechange = function(){
  				if(this.readyState == 4 && this.status == 200){
  					
  					var r = document.getElementById('response');
					if(list == "favorite"){
						list = "Favorite List";
					}
					else if(list == "explore"){
						list = "To Explore List";
					}
					else{
						list = "Do Not Show List";
					}
					r.innerHTML = "Added Ingredients to Grocery List";
					document.getElementById('addGrocery').classList.replace('btn-secondary', 'btn-danger');
  				}
  			}
  			xhttp.open("POST", "AddToGrocery?id=" + id, true);
      		xhttp.send();
    		
    	}
    </script>
   

</head>

<body>

    <div class="container-fluid">
        <div class="row ">
            <div class="col-8">
            	<!--  title -->
                <div class="listTitle" style="margin-bottom: 50px;" id="title"></div>
             </div>
               <!-- navigation bar -->
             <div col="col-4">
                <div class="mt-20">
                    <a href="javascript:window.print();"><button class="btn btn-secondary wth" >Printable View</button></a>
                </div>
                <div class="mt-20">
                    <button class="btn btn-secondary wth" id="results" onclick="toResult();">Return To Results</button>
                </div>
                <form action="" onsubmit="return add();" method="get" id="myform">
                    <div class="mt-20">
                        <select name="list" class="btn bg-secondary wth" id="list">
                            <option value="nil" selected></option>
                            <option value="favorite">Favorite List</option>
                            <option value="explore">To Explore List</option>
                            <option value="not">Do Not Show List</option>
                        </select>
                    </div>
                    <div class="mt-20">
                        <button class="btn btn-secondary wth" type="submit">Add to List</button>
                    </div>
                </form>
                <div class="mt-20">
                    <button class="btn btn-secondary " style="width:200px;" onclick="AddToGrocery();" id="addGrocery">Add to Grocery List</button>
                </div>
				<div id="response" style="margin-top: 20px;color: red; width: 150px;"></div>
            </div>
        </div>
    
      
      <div class="row" style="margin-left: 5px; margin-bottom: 10px; margin-top: 10px;">
      
                <!-- content -->
                <img id="image" src="" width="200">
                <div style="font-size: 20px;">
                    <div class="mt-20" id="prep">
                        <!-- show prep time here -->
                    </div>
                    <div class="mt-20" id="cook">
              			<!--  show cook time here -->
                    </div>
                    <div class="mt-20" id="ingredients">
						<!--  show ingredients here -->
                    </div>
                    <div class="mt-20" id="instructions">
 						<!-- show instructions here -->
                    </div>
                </div>

            <!-- end of content -->
	</div>

	</div>
    
    
    <script>
       //change this
      //this sends the id of recipe and which list to add it to the AddToServlet
    	function add(){
    		
    		var list = document.getElementById("list").value;
    		if(list == null || list == "nil"){
    			return false;
    		}
    		else{
    			var xhttp = new XMLHttpRequest();
    			xhttp.onreadystatechange = function(){
    				if(this.readyState == 4 && this.status == 200){
    					
    					var r = document.getElementById('response');
    					if(list == "favorite"){
    						list = "Favorite List";
    					}
    					else if(list == "explore"){
    						list = "To Explore List";
    					}
    					else{
    						list = "Do Not Show List";
    					}
    					r.innerHTML = "Added to " + list;
    				}
    			}
    			xhttp.open("POST", "AddToServlet?id=" + id + "&item=r&list=" + list, true);
        		xhttp.send();
    		}
    		
    		return false;
    		
    	}
      
      	//this prevents reloading when submitting forms
    	var form = document.getElementById("myform"); 
    	function handleForm(event) { 
    		event.preventDefault(); 
    	} 
    	form.addEventListener('submit', handleForm);
      
    	
    	//get the id of recipe
	    var link = window.location.href;
		var url = new URL(link);
		var id = url.searchParams.get("id");
		
		//get the recipe object
		//var tmp = '<%= session.getAttribute("recipeResults") %>';
		var s = ('<%= session.getAttribute("recipeResults") %>').replace(/\\n/g, "\\n")  
        .replace(/\\'/g, "\\'")
        .replace(/\\"/g, '\\"')
        .replace(/\\&/g, "\\&")
        .replace(/\\r/g, "\\r")
        .replace(/\\t/g, "\\t")
        .replace(/\\b/g, "\\b")
        .replace(/\\f/g, "\\f");
		//remove non-printable and other non-valid JSON chars
		s = s.replace(/[\u0000-\u0019]+/g,""); 
		var recipe = JSON.parse(s);
	    //var recipe = JSON.parse(tmp);
	    var current;
	    for(var i = 0; i < recipe.length; i++){
			if(recipe[i].uniqueID == id){
				current = recipe[i];
			}
		}
		
		
		//fill up the html with required information
		console.log(current);
		document.getElementById('title').innerHTML = current.recipeName;
		document.getElementById('prep').innerHTML = "Prep Time: " + current.prepTime;
		document.getElementById('cook').innerHTML = "Cook Time: " + current.cookTime;
		document.getElementById('image').src = current.imageLink;
		var ingre = document.getElementById('ingredients');
		var u = document.createElement('u');
		u.innerHTML = "Ingredients: ";
		ingre.appendChild(u);
		var ul = document.createElement('ul');
		for(var i = 0; i < current.ingredients.length; i++){
			var li = document.createElement("li");
			li.innerHTML = current.ingredients[i];
			ingre.appendChild(li);
		}
		
		var instr = document.getElementById('instructions');
		var u2 = document.createElement('u');
		u2.innerHTML = "Instructions:";
		
		instr.appendChild(u2);
		var ul = document.createElement('ol');
		for(var i = 0; i < current.instructions.length; i++){
			var li = document.createElement("li");
			li.innerHTML = current.instructions[i];
			instr.appendChild(li);
		}
	

    
    </script>

</body>

</html>
