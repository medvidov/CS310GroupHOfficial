<!DOCTYPE html><html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Restaurant Page</title>

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
    //to navigate to the results page
    	function toResult(){
    		window.location.href = "Results.jsp";
    	}
    	
    </script>


</head>

<body>

    <div class="container-fluid">
        <div class="row ">
            <div class="col-8">
                <div class="listTitle" style="margin-bottom: 50px;" id="title"></div>
              </div>
              <!--  navigation bar -->
               <div col="col-4">
                <div class="mt-20">
                    <a href="javascript:window.print();"><button class="btn btn-secondary wth" >Printable View</button></a>
                </div>
                <div class="mt-20">
                	<!-- might need to change this -->
                    <button class="btn btn-secondary wth" onclick="toResult();">Return To Results</button>
                </div>
                <form action="" onsubmit="return add();" method="get">
                    <div class="mt-20">
                        <select name="list" class="btn bg-secondary wth" id="list">
                            <option value="nil" selected></option>
                            <option value="favorite">Favorite List</option>
                            <option value="explore">To Explore List</option>
                            <option value="not">Do Not Show List</option>
                        </select>
                    </div>
                    <div class="mt-20">
                        <button class="btn btn-secondary wth" type="submit" id="addButton">Add to List</button>
                    </div>
                </form>
				<div id="response" style="margin-top: 20px;color: red; width: 150px;"></div>
            </div>
           </div>
            
            <div class="row" style="margin-left: 5px; margin-bottom: 10px; margin-top: 10px;">
                <!-- content -->
                <div >
                    <div class="mt-20">
                    	<h4>Phone Number:</h4>
                       	<div id="phone"></div>
                    </div>
                    <div class="mt-20" style="width: 300px;font-size: 18px;">
                    	<h4>Website:</h4>
                        <a id="link" href=""></a>
                    </div>
                    <div class="mt-20" style="width: 300px;font-size: 18px;">
                    	<h4>Address:</h4>
                      <a href="" id="address">
                      	
                      </a>
                    </div>
                </div>


            </div>



            <!-- end of content-->

        </div>

    
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
    			xhttp.open("POST", "AddToServlet?id=" + id + "&item=Restaurant&list=" + list, true);
        		xhttp.send();
    		}
    		

    		return false;
    		
    	}

    	
	
		
	
	
	</script>

</body>

</html>
