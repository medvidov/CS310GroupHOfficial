<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Results Page</title>

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
                ran = Math.floor(Math.random() * (+max - +min)) + +min;
                setAngel(image, ran, i);
            }
        }

        //set angle of the image based on random number
        function setAngel(image, num, id) {
            if (num == 0) {
                image.classList.add("rt-45");
            } else if (num == 1) {
                image.classList.add("rt-35");
            } else if (num == 2) {
                image.classList.add("rt-25");
            } else if (num == 3) {
                image.classList.add("rt-15");
            } else if (num == 4) {
                image.classList.add("rt15");
            } else if (num == 5) {
                image.classList.add("rt25");
            } else if (num == 6) {
                image.classList.add("rt35");
            } else if (num == 7) {
                image.classList.add("rt45");
            }

            return;
        }
        
        //redirect to search page
        function toSearch(){
        	window.location.href = "Search.jsp";
        }
        
      //redirect to Grocery List
        function toGrocery(){
        	window.location.href = "Grocery.jsp";
        }
        
        //check that redirection to list management page is legal
		function check(){
    		var list = document.getElementById("list").value;
    		if(list == null || list == "nil"){
    			return false;
    		}
    		return true;
    	}
	    
	

    </script>

</head>

<body onload="getResults()">

    <div class="container-fluid">
        <div class="row justify-content-center" style="padding-left: 100px;margin-top: 100px; margin-bottom: 100px;">
            <!-- images -->
            <div class="col-12 col-sm-9">
                <div class="container" id="collage" style="">
                    <div class="row">
                        <img src="" class="googleImage " id="1">
                        <img src="" class="googleImage " id="2">
                        <img src="" class="googleImage " id="3">
                        <img src="" class="googleImage " id="4">
                        <img src="" class="googleImage " id="5">
                    </div>
                    <div class="row">
                        <img src="" class="googleImage " id="6">
                        <img src="" class="googleImage " id="7">
                        <img src="" class="googleImage " id="8">
                        <img src="" class="googleImage " id="9">
                        <img src="" class="googleImage " id="10">
                    </div>
                </div>
            </div>
            <!-- navbar -->
            <div class="col-12 col-sm-3" style="padding-top: 50px;">
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
				<button class="btn btn-secondary wth" onclick="toGrocery();">Grocery List</button>
				</div>
                <div class="mt-20">
                    <button class="btn btn-secondary wth" onclick="toSearch();">Return to Search Page</button>
                </div>
            </div>
        </div>
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
        
        <div class="row justify-content-center">
            <nav aria-label="...">
                <ul class="pagination" id="pagination">
                   
                </ul>
            </nav>
        </div>
        
    </div>
    
    <script>
    
    	var curN = "1";
		var pageN = "page1";
    	var maxN = "";
		
    	function createPagination(num){
    		num = Math.floor(num) + 1;
    		console.log(num);
    		maxN = "page" + num;
    		var pagi = document.getElementById('pagination');
    		var setup;
    		setup = "<li class=\"page-item disabled\" id=\"prev\" onclick=\"prevN();\"><span class=\"page-link\">Previous</span></li>";
    		
    		for(var i = 1; i < num; i++){
    			if(i == 1){
    				setup += "<li id=\"page"+i+"\"class=\"page-item active\"><button class=\"page-link\" onclick=\"return toN(\'"+i+"\');\">"+i+"</button></li>";
    			}
    			else{
    				setup += "<li id=\"page"+i+"\"class=\"page-item\"><button class=\"page-link\" href=\"\" onclick=\"return toN(\'"+i+"\');\">"+i+"</button></li>";
    			}
    		}
    		
    		setup += "<li class=\"page-item";
    		if(parseInt(curN) == (num - 1)){
    			setup += " disabled";
    		}
    		setup += "\" id=\"next\" onclick=\"nextN();\"><span class=\"page-link\">Next</span></li>";
    		console.log(setup);
    		pagi.innerHTML = setup;
    	}
    	
    	

    	function set(curClass, toClass, nextN) {
    	    var prev = document.getElementById('prev');
    	    var next = document.getElementById('next');
    	    for(var i = 0; i < curClass.length; i++){
    	    	curClass[i].style.display = "none";
    	    	//console.log(curClass.length);
    	    }
    	    for(var i = 0; i < toClass.length; i++){
    	    	toClass[i].style.display = "flex";
    	    	//console.log(toClass.length);
    	    }
    	    console.log("hi");
    	    document.getElementById(pageN).classList.remove('active');
    	    document.getElementById(nextN).classList.add('active');
    	    if (prev.classList.contains('disabled')) {
    	        prev.classList.remove("disabled");
    	    }
    	    if (next.classList.contains('disabled')) {
    	        next.classList.remove("disabled");
    	    }
    	    if (nextN == "page1") {
    	        prev.classList.add('disabled');
    	    } else if (nextN == maxN) {
    	        next.classList.add('disabled');
    	    }

    	}
    	
    	function toN(num) {
    		
    	    var curClass = document.getElementsByClassName(curN);
    	    var toClass = document.getElementsByClassName(num);
    	    var nextN = "page" + num;
    	    set(curClass, toClass, nextN);
    	    curN = num;
    	    pageN = nextN;
    	    return false;
    	}

    	function prevN() {
    		if(document.getElementById('prev').classList.contains('disabled')){
    			return;
    		}
    	    var num = (parseInt(curN) - 1).toString();
    	    var curClass = document.getElementsByClassName(Math.floor(curN).toString());
    	    var toClass = document.getElementsByClassName(Math.floor(num).toString());
    	    var nextN = "page" + num;
    	    set(curClass, toClass, nextN);
    	    curN = num;
    	    pageN = nextN;
    	    return false;

    	}

    	function nextN() {
    		if(document.getElementById('next').classList.contains('disabled')){
    			return;
    		}
    	    var num = (parseInt(curN) + 1).toString();
    	    var curClass = document.getElementsByClassName(Math.floor(curN).toString());
    	    var toClass = document.getElementsByClassName(Math.floor(num).toString());
    	    var nextN = "page" + num;
    	    set(curClass, toClass, nextN);
    	    curN = num;
    	    pageN = nextN;
    	    return false;
    	}
    	
    	var restList = document.getElementById('restList');
		var recList = document.getElementById('recList');
		
    	
		//create all the html elemnts for the page
    	function create(){
			
			
    		
    		//get session information about restaurant and recipe lists
            var restaurant = JSON.parse('<%= session.getAttribute("restaurantResults") %>');
    		console.log(restaurant);
            //console.log('<%= session.getAttribute("recipeResults") %>');
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
            //var recipe = JSON.parse('<%= session.getAttribute("recipeResults") %>');
            
            var query = '<%= session.getAttribute("query") %>';
          

            var head = document.createElement('h2');
            head.classList.add('text-center');
            var u = document.createElement('u');
            u.innerHTML = "Restaurant";
            head.appendChild(u);
            
            restList.appendChild(head);
            
            var head2 = document.createElement('h2');
            head2.classList.add('text-center');
            var u2 = document.createElement('u');
            u2.innerHTML = "Recipe";
            head2.appendChild(u2);
            
            recList.appendChild(head2);
            
            createPagination(restaurant.length/5);
    	
			//for every restaurant create it
            for (let num = 0; num < restaurant.length; num++){
            	var res = restaurant[num];
            	createRestaurant(res.name, res.rating, res.travelTime, res.price, res.uniqueID, num,res.address);
            }
            
            //for every recipe create it
            for (let num = 0; num < recipe.length; num++){
            	var rec = recipe[num];
            	createRecipe(rec.recipeName, rec.rating, rec.prepTime, rec.cookTime, rec.price, num, rec.uniqueID);
            
            }
          
            
    	}
    	
    	
    	//function to create the recipe boxes in the recipe list
		function createRecipe(name, star, prep, cook, price, num, id){
            
    		
            var div1 = document.createElement('div');
            if(num % 2 == 0){
            	div1.className = "";
            }
            else{
            	div1.className = "alt ";
            }
            div1.classList.add((Math.floor(num/5) + 1).toString());
            if(Math.floor(num/5) == 0){
            	div1.style.display = "flex";
            }
            else{
            	div1.style.display = "none";
            }
            
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
            link.href = "Recipe.jsp?id=" + id;
            link.appendChild(h1);
            
            div5.appendChild(link);
            
            var newDiv = document.createElement('div');
            var h2 = document.createElement('div');
            if(star == 0){
            	h2.innerHTML = "no rating";
            }
            else{
            	h2.innerHTML = star + "&#9734";
            }
            newDiv.appendChild(h2);
            
            
            var div6 = document.createElement('div');
            div6.className = "container-fluid";
            var rdiv = document.createElement('div');
            rdiv.className = "row";
            
            var p = document.createElement('div');
            p.className = "col-12 col-sm-6";
            var h3 =  document.createElement('div');
            
            h3.innerHTML = "Prep Time: " + prep;
            p.appendChild(h3);
            
            var c = document.createElement('div');
            c.className = "col-12 col-sm-6";
            var h4 =  document.createElement('div');
            h4.innerHTML = "Cook Time: " + cook;
            c.appendChild(h4);
           
            
            rdiv.appendChild(p);
            rdiv.appendChild(c);
            div6.appendChild(rdiv);
         
            
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
           	recList.appendChild(div1);
            
        }
        
    	//function to add a restaurant box to the restaurant list
        function createRestaurant(name, star, dist, price, id, num, address){
        	
        	var div1 = document.createElement('div');
            if(num % 2 == 0){
            	div1.className = "alt ";
            }
            else{
            	div1.className = "";
            }
            div1.classList.add(Math.floor((num/5) + 1).toString());
            if(Math.floor(num/5) == 0){
            	div1.style.display = "flex";
            }
            else{
            	div1.style.display = "none";
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
            var h2 = document.createElement('div');
            if(star == 0){
            	h2.innerHTML = "no rating";
            }
            else{
            	h2.innerHTML = star + "&#9734";
            }
            newDiv.appendChild(h2);
            
            
            var div6 = document.createElement('div');
            var h3 =  document.createElement('div');
            h3.innerHTML = "Distance: " + dist + "<br>Address: " + address;
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

           	restList.appendChild(div1);
          
            
        }
    
    //create all the html elements for images, restaurants and recipes
	create();
    
    </script>

</body>

</html>
