<!DOCTYPE html><html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
    <title>Recipe Page</title>

    <!-- maxcdn -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


    <script src="https://use.fontawesome.com/c3025a07db.js"></script>

    <!-- style  -->
    <link href="./css/main.css?version=5" rel="stylesheet">
    
    <script>
    
    //to navigate to results page
    	function toResult(){
    		window.location.href = "Results.jsp";
    	}
    
    	function tolist(list){
    		var xhttp = new XMLHttpRequest();
    			xhttp.onreadystatechange = function(){
    				if(this.readyState == 4 && this.status == 200){
    					if(list == 'favorite'){
    						location.href = "Favorite.jsp";
    					}
    					else if(list == "explore"){
    						location.href = "ToExplore.jsp";
    					}
    					else if(list == 'not'){
    						location.href = "DoNotShow.jsp";
    					}
    					else{
    						location.href = "Grocery.jsp";
    					}
    					
    				}
    			}
    			xhttp.open("POST", "ToList?list=" + list, false);
      		xhttp.send();
    	}
    </script>
   

</head>

<body>

    
    <div class="bg"></div>

	<!--  navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="Search.jsp">I'm Hungry</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="Results.jsp">Results</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Lists Management
                    </a>
                     <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <button class="dropdown-item" id="favorite" onclick="tolist('favorite');">Favorite List</button>
                        <button class="dropdown-item" id="explore" onclick="tolist('explore');">To Explore List</button>
                        <button class="dropdown-item" id="not" onclick="tolist('not');">Do Not Show List</button>
                        <button class="dropdown-item" id="grocery"onclick="tolist('grocery');">Grocery List</button>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    
      
     <div class="container-fluid">

        <div class="row text-center justify-content-center">
            <div class="col-8">
                <div class="listTitle" id="title" style="font-weight: bold;font-size: 5vw;">Feta-Stuffed Hamburgers</div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12  col-md-4">
                            <a href="javascript:window.print();"><button class="btn btn-info wth">Printable View</button></a>
                        </div>
                        <div class="col-12 col-md-4">
                            <button class="btn btn-info " style="width:200px;" onclick="AddToGrocery();" id="addGrocery">Add to Grocery List</button>
                        </div>
                        <div class="col-12 col-md-4">
                           <div class="dropdown">
							  <button class="btn btn-info dropdown-toggle" type="button" id="addTo" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    Add To List
							  </button>
							  <div class="dropdown-menu" aria-labelledby="addTo">
							    <button id="addFavorite" class="dropdown-item"  onclick="add('favorite');">Favorite List</button>
							    <button id = "addExplore" class="dropdown-item" onclick="add('explore');">To Explore List</button>
							    <button id = "addNot" class="dropdown-item" onclick="add('not');">Do Not Show List</button>
							  </div>
							</div>
                        </div>
                    </div>
                    <div class="text-center"  id="response" style="margin-top: 20px; color: red;">
                    </div>
                </div>
            </div>
        </div>



        <div class="row justify-content-center text-center" style="margin-left: 5px; margin-bottom: 10px; margin-top: 10px;">

            <!-- content -->
            <img id="image" src="" width="500">
            <div style="font-size: 20px;">
                <div class="mt-20" id="prep"></div>
                <div class="mt-20" id="cook"></div>
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
    	function add(list){
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
    	//var form = document.getElementById("myform"); 
    	//function handleForm(event) { 
    	//	event.preventDefault(); 
    	//} 
    	//form.addEventListener('submit', handleForm);
      
    	
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
	
		//add items to grocery
    	function AddToGrocery(){
    		
  			var xhttp = new XMLHttpRequest();
  			xhttp.onreadystatechange = function(){
  				if(this.readyState == 4 && this.status == 200){
  					
  					var r = document.getElementById('response');
					r.innerHTML = "Added Ingredients to Grocery List";
					document.getElementById('addGrocery').classList.replace('btn-info', 'btn-danger');
  				}
  			}
  			xhttp.open("POST", "AddToGrocery?id=" + id, true);
      		xhttp.send();
    		
    	}
    
    </script>

</body>

</html>
