<!DOCTYPE html><html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Restaurant Page</title>

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
    <style>
    .btn {
            border: 1px solid black;
        }
    </style>
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
 <div id="back" class="bg"></div>
	<!-- navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a style = "font-size: 25px;" class="navbar-brand" href="Search.jsp">I'm Hungry</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a style = "font-size: 20px;" class="nav-link" href="Results.jsp">Results</a>
                </li>
                <li class="nav-item dropdown">
                    <a style = "font-size: 20px;" class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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

	<!--  content -->
    <div class="container-fluid">
        <div class="row text-center justify-content-center">
            <div class="col-6">
                <div class="listTitle" id="title" style="font-weight: bold;font-size: 7vw;"></div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12  col-md-6">
                            <a " href="javascript:window.print();"><button style = "font-size: 25px;" class="btn btn-info wth">Printable View</button></a>
                        </div>
                        <div class="col-12 col-md-6">
                        
                        	<div class="dropdown">
							  <button style = "font-size: 25px;"class="btn btn-info dropdown-toggle" type="button" id="addTo" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    Add To List
							  </button>
							  <div class="dropdown-menu" aria-labelledby="addTo">
							    <button class="dropdown-item"  onclick="add('favorite');">Favorite List</button>
							    <button class="dropdown-item" onclick="add('explore');">To Explore List</button>
							    <button class="dropdown-item" onclick="add('not');">Do Not Show List</button>
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
            <div>
                <div class="mt-20">
                    <h2>Phone Number:</h2>
                    <div id="phone"></div>
                </div>
                <div class="mt-20" style="width: 300px;font-size: 18px;">
                    <h2>Website:</h2>
                    <a id="link" href=""></a>
                </div>
                <div class="mt-20" style="width: 300px;font-size: 18px;">
                    <h2>Address:</h2>
                    <a href="" id="address"></a>
                </div>
            </div>


        </div>
    </div>
     <!-- end of content-->
    
    <script>
    
    
    //get the current id of the restaurant item
    var link = window.location.href;
	var url = new URL(link);
	var id = url.searchParams.get("id");
	var addButton = document.getElementById('addButton');
	
	//find and get the current restaurant item from the list
	var restaurant = JSON.parse('<%= session.getAttribute("restaurantResults") %>');
	var current;
	for(var i = 0; i < restaurant.length; i++){
		if(restaurant[i].uniqueID == id){
			current = restaurant[i];
		}
	}
	
	//update the the html elements with information
	document.getElementById('title').innerHTML = current.name;
	document.getElementById('phone').innerHTML = current.phoneNumber;
	document.getElementById('link').href = current.websiteLink;
	document.getElementById('link').innerHTML = current.websiteLink;
	document.getElementById('address').href = current.googleMapsLink;
	document.getElementById('address').innerHTML = current.address;
    	
    	//Sends the id of restaurant item and which list to add to the AddToSevlet
    	function add(list){
    		console.log("adding");
    		//var list = document.getElementById("list").value;
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
    			xhttp.open("POST", "AddToServlet?id=" + id + "&item=Restaurant&list=" + list, true);
        		xhttp.send();
    		}
    		

    		return false;
    		
    	}

    	
	
		
	
	
	</script>

</body>

</html>
