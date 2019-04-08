<!DOCTYPE html><html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Do Not Show List</title>
	
    <!-- maxcdn -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- style  -->
    <link href="./css/main.css?version=5" rel="stylesheet">
    
     <script>
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

    <div id="back"></div>

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
    <!-- end of navbar -->
    
    <div class="container-fluid">
    	<div class="text-center">
            <!--  title -->
            <div class="listTitle" style="font-weight: bold;font-size: 7vw;">Do Not Show List</div>
        </div>
        <div class="row" style="padding-top: 50px;">
        <!-- content -->
                <div class="container-fluid foodstuff" id="listResult">
                	<!-- this is where the items will be shown -->

                </div>
        </div>
    </div>
    
    <script src= "Functions.js"></script>
    <script>
    
    
  //checking if redirection to list is legal
	function check(){
   		var list = document.getElementById("list").value;
   		if(list == null || list == "nil" || list == "not"){
   			
   			return false;
   		}
   	
   		return true;
	}
    
	//sending data to MoveListServlet to move items 
	function mv(list2, itemType, index){

    	var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				var a = new XMLHttpRequest();
	  			a.onreadystatechange = function(){
	  				if(this.readyState == 4 && this.status == 200){
	  						location.href = "DoNotShow.jsp";
	  				}
	  			}
	  			a.open("POST", "ToList?list=not", false);
	      		a.send();
			}
		}
		xhttp.open("POST", "MoveListServlet?list1=not&list2=" + list2 + "&itemType=" + itemType + "&index=" + index, true);
		xhttp.send();
    	
		return false;
    
    }
    
	//sending data to RemoveListServlet to remove items
	function rm(itemType, index){
    	var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				var a = new XMLHttpRequest();
	  			a.onreadystatechange = function(){
	  				if(this.readyState == 4 && this.status == 200){
	  						location.href = "DoNotShow.jsp";
	  				}
	  			}
	  			a.open("POST", "ToList?list=not", false);
	      		a.send();
			}
		}
		
		xhttp.open("POST", "RemoveListServlet?list=not&itemType=" + itemType + "&index=" + index, true);
		xhttp.send();	
		return false;
    
    } 
    
    	//get session do not show lists
	    var restaurant = JSON.parse('<%= session.getAttribute("notRes") %>');
	    var s = ('<%= session.getAttribute("notRec") %>').replace(/\\n/g, "\\n")  
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
	    //var recipe = JSON.parse('<%= session.getAttribute("notRec") %>');
	    var num = 0;
	    var i;
	    var li = document.getElementById('listResult');
	    var alt = "alt";
	    
	    //for every, restaurant create it
	    for(i = 0;i < restaurant.length; i++){
	    	var res = restaurant[i];
	    	li.innerHTML += "<div class=\"row justify-content-center\"><div class=\"col-8\">" 
	    	+ "<div class=\"res1 card border-primary mb-3 z-depth-5\">"
	    	+ "<div class=\"card-header\"><a style=\"float: left\" href=\"Restaurant.jsp?id=" + res.uniqueID + "\">"
	    	+ "<h3>" + res.name + "</h3></a><div style=\"float: left; margin-left: 50px;margin-top: 5px; font-size: 21px;\"><strong>"
	    	+ res.rating + "<i class=\"fa fa-star\" aria-hidden=\"true\" style=\"color: mediumvioletred;\"></i>"
	    	+ "</strong></div></div><div class=\"card-body text-info\"><div class=\"container-fluid\">"
	    	+ "<div class=\"row\"><div class=\"col-10\"><h5 class=\"card-title\">Distance: "+ res.travelTime + "</h5>"
	    	+ "<p class=\"card-text\">" + res.address + "</p></div>"
	    	+ "<div class=\"col-2\"><h3>" + res.price + "</h3></div></div></div></div>"
	    	+ "<div class=\"card-footer text-muted\"><div class=\"container-fluid\">"
	    	+ "<div class=\"row text-center\"><button class=\"btn btn-danger col-3\" onclick=\"rm(\'restaurant\',\'"+ i +"\')\">Remove"
	    	+ "</button><button class=\"btn btn-Secondary col-3 nav-item dropdown\"><div class=\"nav-link dropdown-toggle\" id=\"DropdownMenu\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">"
	    	+ "Move To</div><div class=\"dropdown-menu active\" aria-labelledby=\"DropdownMenu\">"
	    	+ "<a class=\"dropdown-item\" id=\"explore\"   onclick=\"mv(\'favorite\',\'restaurant\',\'"+ i +"\')\">Facorite</a>"
	    	+ "<a class=\"dropdown-item\" id=\"not\" onclick=\"mv(\'explore\',\'restaurant\',\'"+ i +"\');\">To Explore</a>"
	    	+ "</div></button><button class=\"btn btn-info col-3\">Up</button>"
	    	+ "<button class=\"btn btn-info col-3\">Down</button>"
	    	+ "</div></div></div></div></div></div>";

			num += 1;
				
	    }
	    
	    //for every recipe create it
	    for(i = 0;i < recipe.length; i++){
	    	var rec = recipe[i];
	    	if(rec.price == null){
	    		rec.price = "$";
	    	}
	    	li.innerHTML += "<div class=\"row justify-content-center\"><div class=\"col-8\"><div class=\"res1 card border-danger mb-3 z-depth-5\">"
	    		+ "<div class=\"card-header\"><a style=\"float: left\" href=\"Recipe.jsp?id=" + rec.uniqueID + "\">"
	    		+ "<h3>"+rec.recipeName+"</h3></a><div style=\"float: left; margin-left: 50px;margin-top: 5px; font-size: 21px;\"><strong>"
	    		+ rec.rating + " <i class=\"fa fa-star\" aria-hidden=\"true\" style=\"color: mediumvioletred;\"></i>"
	    		+ "</strong></div></div><div class=\"card-body text-info\" style=\"font-size: 20px;\"><div class=\"container-fluid\">"
	    		+ "<div class=\"row\"><div class=\"col-10\"><div class=\"container-fluid\"><div class=\"row\">"
	    		+ "<div class=\"col-12 col-sm-6\"><div>Prep Time: "+rec.prepTime + "</div></div><div class=\"col-12 col-sm-6\">"
	    		+ "<div>Cook Time: "+rec.cookTime +"</div></div></div></div></div>"
	    		+ "<div class=\"col-2\"><h3>"+ rec.price + "</h3></div></div></div></div>"
	    		+ "<div class=\"card-footer text-muted\"><div class=\"container-fluid\">"
	    		+ "<div class=\"row text-center\">"
	    		+ "<button class=\"btn btn-danger col-3\" onclick=\"rm(\'recipe\',\'"+ i +"\')\">"
	    		+ "Remove</button><button class=\"btn btn-Secondary col-3 nav-item dropdown\">"
	    		+ "<div class=\"nav-link dropdown-toggle\" href=\"#\" id=\"DropdownMenu\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">"
	    		+ "Move To</div><div class=\"dropdown-menu active\" aria-labelledby=\"DropdownMenu\">"
	    		+ "<a class=\"dropdown-item\" id=\"explore\" onclick=\"mv(\'favorite\',\'recipe\',\'"+ i +"\');\">Favorite</a>"
	    		+ "<a class=\"dropdown-item\" id=\"not\"  onclick=\"mv(\'explore\',\'recipe\',\'"+ i +"\');\">To Explore</a>"
	    		+ "</div></button><button class=\"btn btn-info col-3\">"
	    		+ "Up</button><button class=\"btn btn-info col-3\">"
	    		+ "Down</button></div></div></div></div></div></div>";

			num += 1;
			
	    }
	
    </script>

</body>

</html>
