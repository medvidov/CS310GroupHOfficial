<!DOCTYPE html><html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>To Explore List</title>


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
    

</head>

<body>

    <div class="container-fluid">
        <div class="row ">
        <!--  title -->
            <div class="col-10">
                <div class="listTitle text-center" style="margin-bottom: 150px;">To Explore List</div>
         
            </div>
            <!--  navigation bar -->
            <div class="col-2">
                <form action="ToList" onsubmit="return check();" method="get">
                    <div class="mt-20">
                        <select name="list" class="btn bg-secondary wth" id="list">
                            <option value="nil" selected></option>
                            <option value="favorite">Favorite List</option>
                            <option value="explore">To Explore List</option>
                            <option value="not">Do Not Show List</option>
                        </select>
                    </div>
                    <div class="mt-20">
                        <button class="btn btn-secondary wth" type="submit">Manage List</button>
                    </div>
                </form>
                <div class="mt-20">
                    <button class="btn btn-secondary wth" onclick="toResult();">Back to Results</button>
                </div>
                <div class="mt-20">

                    <button class="btn btn-secondary wth" onclick="toSearch();">Back to Search</button>

                </div>

            </div>
        </div>
        <div class="row" style="padding-top: 50px;">
         <!-- content -->
                <div class="container-fluid foodstuff" id="listResult">
                	<!-- the restaurant and recipe items will appear her from javascript -->

                </div>
        </div>
    </div>
    <script src= "Functions.js"></script>
    <script>
    
   /*  //redirection functions
    function toSearch(){
		window.location.href = "Search.jsp";
	}
	function toResult(){
		window.location.href = "Results.jsp";
	}
	//check that redirection is legal
	function check(){
		var list = document.getElementById("list").value;
		if(list == null || list == "nil" || list == "explore"){
		
			return false;
		}
		return true;
	}
	*/
    //sends the index of items and the list to move to MoveListSevlet
	function mv(list2, itemType, index){
    	var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
	            location.reload();
			}
		}
		xhttp.open("POST", "MoveListServlet?list1=explore&list2=" + list2 + "&itemType=" + itemType + "&index=" + index, true);
		xhttp.send();
    	
		return false;
    
    }
	/*
	$(".foodstuff").sortable({
		  
		  axis: "y",
		  revert: true,
		  scroll: false,
		  placeholder: "sortable-placeholder",
		  cursor: "move"

		});
    */
    //functions to remove item from the list, send index and itemtype to RemoveListServlet
	function rm(itemType, index){
    	
    	
    	var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
	            location.reload();
			}
		}
		
		xhttp.open("POST", "RemoveListServlet?list=explore&itemType=" + itemType + "&index=" + index, true);
		xhttp.send();
    	
		return false;
    
    }
    
    	//get session to explore lists
	    var restaurant = JSON.parse('<%= session.getAttribute("expRes") %>');
	    var s = ('<%= session.getAttribute("expRec") %>').replace(/\\n/g, "\\n")  
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
	    //var recipe = JSON.parse('<%= session.getAttribute("expRec") %>');
	    
	    
	    var num = 0;
	    var i;
	    var li = document.getElementById('listResult');
	    var alt = "alt";
	    //for every restaurant items create it
	    for(i = 0;i < restaurant.length; i++){
	    	var res = restaurant[i];
	    	if(num % 2 == 0){
	    		alt = "alt";
	    	}
	    	else{
	    		alt = "";
	    	}
	    	li.innerHTML += 
	    	    "<div class=\"row\"><div class=\"col-12 col-sm-8\"><!-- --><div class=\"" + alt + "\">"
	    	    +
	    	    createRestaurant(res.name, res.rating, res.travelTime, res.price, res.uniqueID, num, res.address)
	    	    + "</div><!-- --></div><div class=\"col-12 col-sm-4 mt-20\"><div><button class=\"btn btn-primary wth\" onclick=\"rm(\'restaurant\',\'"+ i +"\')\">Remove</button>"
    	    + "</div><div class=\"mt-10\"><div class=\"dropdown\"><button class=\"btn btn-primary wth dropdown-toggle\" data-toggle=\"dropdown\">"
			+ "Move To...</button><div class=\"dropdown-menu\"><button class=\"dropdown-item\" onclick=\"mv(\'favorite\',\'restaurant\',\'"+ i +"\');\">Favorite </button>"
			+ "<button class=\"dropdown-item\" onclick=\"mv(\'not\',\'restaurant\',\'"+ i +"\');\"> Do Not Show </button></div></div></div></div></div>";
				num += 1;
				
				
	    }
	    
	    //for every recipe items create it
	    for(i = 0;i < recipe.length; i++){
	    	var rec = recipe[i];
	    	if(num % 2 == 0){
	    		alt = "alt";
	    	}
	    	else{
	    		alt = "";
	    	}
	    	li.innerHTML += "<div class=\"row\"><div class=\"col-12 col-sm-8\"><!-- --><div class=\"" + alt + "\">"
    	    + createRecipe(rec.recipeName, rec.rating, rec.prepTime, rec.cookTime, rec.price, num, rec.uniqueID)
    	    + "</div><!-- --></div><div class=\"col-12 col-sm-4 mt-20\"><div><button class=\"btn btn-primary wth\" onclick=\"rm(\'recipe\',\'"+ i +"\')\">Remove</button>"
    	    + "</div><div class=\"mt-10\"><div class=\"dropdown\"><button class=\"btn btn-primary wth dropdown-toggle\" data-toggle=\"dropdown\">"
			+ "Move To...</button><div class=\"dropdown-menu\"><button class=\"dropdown-item\" onclick=\"mv(\'favorite\',\'recipe\',\'"+ i +"\');\">Favorite</button>"
			+ "<button class=\"dropdown-item\" onclick=\"mv(\'not\',\'recipe\',\'"+ i +"\');\"> Do Not Show</button></div></div></div></div></div>";
			num += 1;
			
			
	    }
	    
	    
	   /*  //making the inner html for recipe items
		function createRecipe(name, star, prep, cook, price, num, uniqueID){
            
            var div1 = document.createElement('div');
            
            
            var div2 = document.createElement('div');
            div2.classList.add("container");
            
            var div3 = document.createElement('div');
            div3.classList.add("row");
            
            var div4 = document.createElement('div');
            div4.classList.add("col-11");
            
            var div5 = document.createElement('div');
            var h1 = document.createElement('h3');
            h1.innerHTML = name;
            
            var link = document.createElement('a');
            link.href = "Recipe.jsp?id=" + uniqueID;
            link.appendChild(h1);
            
            div5.appendChild(link);
            
            var newDiv = document.createElement('div');
            var h2 = document.createElement('h4');
            if(star == 0){
            	h2.innerHTML = "no rating";
            }
            else{
            	h2.innerHTML = star + "&#9734";
            }
            newDiv.appendChild(h2);
            
            
            var div6 = document.createElement('div');
            var h3 =  document.createElement('h4');
            h3.innerHTML = "Prep Time: " + prep;
            h3.style.cssText = "float: left; margin-right: 20px;";
            var h4 =  document.createElement('h4');
            h4.innerHTML = "Cook Time: " + cook;
            var clear = document.createElement('div');
            clear.cssText = "clear: both";
            div6.appendChild(h3);
            div6.appendChild(h4);
            div6.appendChild(clear);
          
            
            div4.appendChild(div5);
            div4.appendChild(newDiv);
            div4.appendChild(div6);
            
            var div7 = document.createElement('div');
            div7.className = " col-1 mt50";
            var dollar = document.createElement('h3');
            if(price == null){
            	dollar.innerHTML = "$";
            }
            else{
            	dollar.innerHTML = price;
            }
            div7.appendChild(dollar);
            
            div3.appendChild(div4);
            div3.appendChild(div7);
            
            div2.appendChild(div3);
            div1.appendChild(div2);
            return div1.innerHTML;
            
        }
        
	    //making the inner HTMl for restaurant items
        function createRestaurant(name, star, dist, price, id, num, address){
        	
        	var div1 = document.createElement('div');
            if(num % 2 == 0){
            	div1.className = "alt ";
            }
            else{
            	div1.className = "";
            }
            
            var div2 = document.createElement('div');
            div2.classList.add("container");
            
            var div3 = document.createElement('div');
            div3.classList.add("row");
            
            var div4 = document.createElement('div');
            div4.classList.add("col-10");
            
            var div5 = document.createElement('div');
            var h1 = document.createElement('h3');
            h1.innerHTML = name;
            
            var link = document.createElement('a');
            link.href = "Restaurant.jsp?id=" + id;
            link.appendChild(h1);
            
            div5.appendChild(link);
          
            
            var newDiv = document.createElement('div');
            var h2 = document.createElement('h4');
            if(star == 0){
            	h2.innerHTML = "no rating";
            }
            else{
            	h2.innerHTML = star + "&#9734";
            }
            newDiv.appendChild(h2);
            
           
            var div6 = document.createElement('div');
            var h3 =  document.createElement('h4');
            h3.innerHTML = "Distance: " + dist + " <br>Address: " + address;
            div6.appendChild(h3);
          
            
            div4.appendChild(div5);
            div4.appendChild(newDiv);
            div4.appendChild(div6);
            
            var div7 = document.createElement('div');
            div7.className = " col-2 mt50";
            var dollar = document.createElement('h3');
            if(price == null){
            	dollar.innerHTML = "$";
            }
            else{
            	dollar.innerHTML = price;
            }
            div7.appendChild(dollar);
            
            div3.appendChild(div4);
            div3.appendChild(div7);
            
            div2.appendChild(div3);
            div1.appendChild(div2);
     		return div1.innerHTML;
        	
        }
    
     */
    </script>

</body>

</html>
