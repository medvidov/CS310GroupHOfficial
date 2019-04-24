<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
    <title>Results Page</title>

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
    
    <!--  for pagination -->
    <script src="jquery.twbsPagination.js"></script>
    
    <!-- Firebase App is always required and must be first -->
    <script src="https://www.gstatic.com/firebasejs/5.9.3/firebase-app.js"></script>

    <!-- Add additional services that you want to use -->
    <script src="https://www.gstatic.com/firebasejs/5.9.3/firebase-database.js"></script>

    <script>
    
    	var url;
    	var user;
    	
    	//get the image results and create the images
        function getResults() {

            var q = '<%= session.getAttribute("query") %>';
            document.getElementById('title').innerHTML = "Results for " + q;
   
            url = JSON.parse('<%= session.getAttribute("imageURLs") %>');
               
            var min = 0;
            var max = 8;
            var ran = 0

            //set random angle to images and create the images
            for (let i = 1; i < 11; i++) {
            	var image = document.getElementById(i);
            	image.src = url[i - 1];
            }
            
            
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
  			xhttp.open("POST", "ToList?list=" + list, true);
      		xhttp.send();
    	}
        
    </script>
</head>

<body onload="getResults()">


    <div id="back"></div>
	<!--  navbar  -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="Search.jsp">I'm Hungry</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Results<span class="sr-only">(current)</span></a>
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
        <div style="float:left;font-weight: bold;font-size: 25px;color: white;width: 200px;" id="login">
        </div>
        <button class="btn btn-secondary" style="visibility: hidden;" onclick="logout();" id="logout">Logout</button>
    </nav>

<!-- collage  -->
 <div class="container-fluid" id="collage">
        <div class="row justify-content-center">
            <div class="imgWTH">
                <img src="" class="googleImage " id="1">
            </div>
            <div class="imgWTH">
                <img src="" class="googleImage " id="2">
            </div>
            <div class="imgWTH">
                <img src="" class="googleImage " id="3">
            </div>
            <div class="imgWTH">
                <img src="" class="googleImage " id="4">
            </div>
            <div class="imgWTH">
                <img src="" class="googleImage " id="5">
            </div>

        </div>
        <div class="row justify-content-center">

            <div class="imgWTH">
                <img src="" class="googleImage " id="6">
            </div>
            <div class="imgWTH">
                <img src="" class="googleImage " id="7">
            </div>
            <div class="imgWTH">
                <img src="" class="googleImage " id="8">
            </div>
            <div class="imgWTH">
                <img src="" class="googleImage " id="9">
            </div>
            <div class="imgWTH">
                <img src="" class="googleImage " id="10">
            </div>
        </div>
</div>

<!--  TITLE -->     
<div class="row">
    <div class="col-12 text-center">
        <h1 id="title">
        </h1>
    </div>
</div>

        <!-- my results here -->
        <div class="row">
        	<!--  restaurant -->
            <div class="col-12 col-md-6" id="restList">
                
            </div>

            <!-- recipe -->

            <div class="col-12 col-md-6" id="recList">
      
            </div>
            
        </div>
          
        <h2 class="text-center"><i>Previous Queries</i></h2>
    <div class="container-fluid">
        <div class="row">
            <div class="col-1 text-center">
                <div id="left-button" class="left" style="padding-top: 140px;">
                    <i class="fa fa-arrow-circle-left fa-3x"></i>
                </div>
            </div>

            <div class="col-10">
                <div class="scrollmenu" id="prevQuery">
               
                   
                </div>
            </div>

            <div class="col-1">
                <div id="right-button" class="right" style="padding-top: 140px;">
                    <i class="fa fa-arrow-circle-right fa-3x"></i>
                </div>
            </div>
        </div>
    </div>
        
    <script src="Functions.js"></script>
    <script>
    
  //check if user is set
	var s = ('<%= session.getAttribute("user") %>').replace(/\\n/g, "\\n")  
        .replace(/\\'/g, "\\'")
        .replace(/\\"/g, '\\"')
        .replace(/\\&/g, "\\&")
        .replace(/\\r/g, "\\r")
        .replace(/\\t/g, "\\t")
        .replace(/\\b/g, "\\b")
        .replace(/\\f/g, "\\f");
		//remove non-printable and other non-valid JSON chars
		s = s.replace(/[\u0000-\u0019]+/g,""); 
		var user = JSON.parse(s);
	if(user != null){
		//console.log(user)
		//console.log(user.username);
		if(user.username != ""){
			document.getElementById("login").innerHTML = "Hi " + user.username + "!";
			document.getElementById("logout").style.visibility = "visible";
		}
	}
	
	
	function logout(){
		var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					location.href = "Search.jsp";
				}
			}
			xhttp.open("POST", "Logout?uid=" + user.uid, true);
  		xhttp.send();
	}
    	
    	//sizes of pages 
    	var resSize = 0;
    	var recSize = 0;
    	var currentRes = 1;
    	var currentRec = 1;
    	
    	var restList = document.getElementById('restList');
		var recList = document.getElementById('recList');
		
    	
		//create all the html elemnts for the page
    	function create(){

    		//get session information about restaurant and recipe lists
            var restaurant = JSON.parse('<%= session.getAttribute("restaurantResults") %>');
    		console.log(restaurant);
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
			console.log(recipe);
            
            var query = '<%= session.getAttribute("query") %>';
          
            restList.innerHTML = "<h2 class=\"text-center\"><u>Restaurant</u></h2>";      
            recList.innerHTML = "<h2 class=\"text-center\"><u>Recipe</u></h2>";
            
           
            
            if(restaurant == null || restaurant.length == 0){
            	restList.innerHTML += "<h3 class=\"text-center\"><strong>No Restaurants within range!</strong></h3>";
            }
            else{
            	 resSize = Math.ceil(restaurant.length/5);
            	//for every restaurant create it
                for (let num = 0; num < restaurant.length; num++){
                	var res = restaurant[num];
                	restList.innerHTML += createRestaurant(res.name, res.rating, res.travelTime, res.price, res.uniqueID, num,res.address);
                }
    			restList.innerHTML += " <div class=\"container\"><div class=\"row justify-content-center\">"
                + "<nav aria-label=\"Page navigation\"><ul class=\"pagination\" id=\"resPagination\"></ul>"
                + "</nav></div></div>";
            	
            }
            
            if( recipe == null || recipe.length == 0){
            	recList.innerHTML += "<h3 class=\"text-center\"><strong>No Recipe available!</strong></h3>";
            	
            }
            else{
            	 recSize = Math.ceil(recipe.length/5);
                 
                 //for every recipe create it
                 for (let num = 0; num < recipe.length; num++){
                 	var rec = recipe[num];
                 	recList.innerHTML += createRecipe(rec.recipeName, rec.rating, rec.prepTime, rec.cookTime, rec.price, num, rec.uniqueID);
                 }
                 
                 recList.innerHTML += " <div class=\"container\"><div class=\"row justify-content-center\">"
                     + "<nav aria-label=\"Page navigation\"><ul class=\"pagination\" id=\"recPagination\"></ul>"
                     + "</nav></div></div>";
            }
    	
            
            //create previous query
            var queries = JSON.parse('<%= session.getAttribute("previousQ") %>');
            var images = JSON.parse('<%= session.getAttribute("previousI") %>');
            var prev = document.getElementById("prevQuery");
            
            if(queries != null){
	            for(var i = 0; i < queries.length; i++){
	            	//parse
	            	var collage = images[i].split(" ");
	            	
	            	
		            prev.innerHTML +=  "<a href=\"#home\" onclick=\"prevQuery(\'" + queries[i] +"\');\"><div class=\"card z-depth-5\" style=\"height: 300px;\">"
		            + "<div class=\"container-fluid\"><div class=\"row\">"
		            + "<img class=\"card-img-top\" src=\"" + collage[0] + "\" alt=\"Card image\" style=\"width: 60px;height: 100px;\">"
		            + "<img class=\"card-img-top\" src=\"" + collage[1] + "\" alt=\"Card image\" style=\"width: 60px;height: 100px;\">"
		            + "<img class=\"card-img-top\" src=\"" + collage[2] + "\" alt=\"Card image\" style=\"width: 60px;height: 100px;\">"
		            + "<img class=\"card-img-top\" src=\"" + collage[3] + "\" alt=\"Card image\" style=\"width: 60px;height: 100px;\">"
		            + "<img class=\"card-img-top\" src=\"" + collage[4] + "\" alt=\"Card image\" style=\"width: 60px;height: 100px;\">"
		            + "</div><div class=\"row\">"
		            + "<img class=\"card-img-top\" src=\"" + collage[5] + "\" alt=\"Card image\" style=\"width: 60px;height: 100px;\">"
		            + "<img class=\"card-img-top\" src=\"" + collage[6] + "\" alt=\"Card image\" style=\"width: 60px;height: 100px;\">"
		            + "<img class=\"card-img-top\" src=\"" + collage[7] + "\" alt=\"Card image\" style=\"width: 60px;height: 100px;\">"
		            + "<img class=\"card-img-top\" src=\"" + collage[8] + "\" alt=\"Card image\" style=\"width: 60px;height: 100px;\">"
		            + "<img class=\"card-img-top\" src=\"" + collage[9] + "\" alt=\"Card image\" style=\"width: 60px;height: 100px;\">"
		            + "</div></div><div class=\"card-body\"><h4 class=\"card-title\" style=\"color: black;\">" + queries[i] + "</h4>"
		            + "</div></div></a>";
	            }
            }
            
    	}
    //create all the html elements for images, restaurants and recipes
		create();
    
    	
    	$(function() {
            window.pagObj = $('#resPagination').twbsPagination({
                totalPages: resSize,
                visiblePages: 5,
                onPageClick: function(event, page) { //when it clicks
                    //console.info(page + ' (from options)');
                    if (page != currentRes) {
                        //get current Page
                    	var cur = document.getElementsByClassName("res" + currentRes);
                        var next = document.getElementsByClassName("res" + page);
                        for (var i = 0; i < cur.length; i++) {
                            cur[i].style.display = "none";
                        }
                        for (var i = 0; i < next.length; i++) {
                            next[i].style.display = "flex";
                        }
                        currentRes = page;
                    }
                }
            });
        });

    	
    	$(function() {
            window.pagObj = $('#recPagination').twbsPagination({
                totalPages: recSize,
                visiblePages: 5,
                onPageClick: function(event, page) { //when it clicks
                    //console.info(page + ' (from options)');
                    if (page != currentRec) {
                        //get current Page
                    	var cur = document.getElementsByClassName("rec" + currentRec);
                        var next = document.getElementsByClassName("rec" + page);
                        for (var i = 0; i < cur.length; i++) {
                            cur[i].style.display = "none";
                        }
                        for (var i = 0; i < next.length; i++) {
                            next[i].style.display = "flex";
                        }
                        currentRec = page;
                    }
                }
            });
        });
    	
    	function prevQuery(filename){
    		var xhttp = new XMLHttpRequest();
  			xhttp.onreadystatechange = function(){
  				if(this.readyState == 4 && this.status == 200){
  					location.href = "Results.jsp?query=" + filename;
  				}
  			}
  			xhttp.open("POST", "PreviousQuery?filename=" + filename, true);
      		xhttp.send();
    	}

    	
    	//console.log(document.getElementById('prevQuery').innerHTML);
    </script>

</body>

</html>
