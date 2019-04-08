<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Search</title>
	
    <!-- maxcdn -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://use.fontawesome.com/c3025a07db.js"></script>
    <!-- style  -->
    <link href="./css/main.css?version=5" rel="stylesheet">
    
     <!-- Firebase App is always required and must be first -->
    <script src="https://www.gstatic.com/firebasejs/5.9.3/firebase-app.js"></script>

    <!-- Add additional services that you want to use -->
    <script src="https://www.gstatic.com/firebasejs/5.9.3/firebase-database.js"></script>
    
    <script>
    
    function toLog(){
    	location.href="Login.jsp";
    }
    
    function toSign(){
    	location.href="Sign.jsp";
    }
    
    </script>
     <style>
        .bg {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0px;
            left: 0px;
            z-index: -10;
            background-image: url('img/background.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
        }
        #buttonDiv{
        	display: flex;
        	width: 100%;
        	flex-direction: column;
        	align-content: flex-end;
        }
        
        #buttonDiv button{
       		width: 120px;
       }
        

    </style>



</head>

<body >

	
   <div class="bg"></div>
	<div class = "container" id = "buttonDiv">
		<button onclick = "toLog()" type="button" class="btn btn-secondary">Log In</button>
		<button onclick = "toSign()" type="button" class="btn btn-secondary">Sign Up</button>
	</div>
    <div class="container-fluid text-center content">
        <!--  title -->
        <div class="title">I'm Hungry</div>
        <div style="color:red" id="error"></div>
        <div class="container mt-20">
            <!-- main query form -->
            <form method="get" action="ReturnResults" onsubmit="return check();" id="searchForm">
                <div class="form-row">
                    <div class="col-1 text-center" style="padding-left: 20px;padding-bottom: 10px;">
                        <label><i class="fa fa-search fa-3x" aria-hidden="true"></i></label>
                    </div>
                    <div class="col-7">
                        <input type="text" class="form-control" placeholder="Enter Food" name="query" value="" id="query">
                    </div>
                    <div class="col-2">
                        <input style="width: 80px;display: inline;" type="number" value="10.0" step="0.1" class="form-control" id="radius" name="radius" min="0.1">
                        <label style="display: inline;">miles</label>
                    </div>
                    <div class="col-2">
                        <input style="width: 80px;" type="number" value="5" class="form-control" id="num" name="options" min="1" max="100">
                    </div>
                </div>
                <div style="padding-top: 100px;height: 100px;">
                    <div class="form-row">
                        <div class="col-12">
                            <button type="submit" class="btn" onmouseenter="larger()" onmouseleave="smaller()" id="searchBtn" style="color: deeppink"><strong>Feed Me!</strong></button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="text-center" style="margin-top: 150px;" id="test">
        	
        	
        </div>
    </div>
    <script type="application/javascript">
    
        //change the grumpy emoji to smiley emoji when clicked
        function larger() {
            var btn = document.getElementById('searchBtn');
            btn.setAttribute('id', 'searchBtnBigger');
        }

        function smaller() {
            var btn = document.getElementById('searchBtnBigger');
            btn.setAttribute('id', 'searchBtn');
        }

        var btn = document.getElementById('searchBtn');

        btn.onmousedown = function() {
            btn.style.background = "url('img/smiley.gif') no-repeat";
            btn.style.backgroundSize = "100%";
        }

        btn.onmouseup = function() {
            setTimeout(change, 300);
        }

        function change() {
            btn.style.background = "url('img/grumpy.gif') no-repeat";
            btn.style.backgroundSize = "100%";
        }

        //checks that the query is not empty or illegal 
        function check() {
            document.getElementById("error").innerHTML = "";
            var query = document.getElementById("query").value;
            query = query.replace(/\s/g, "");

            if (query === "" || !query) {
                document.getElementById("error").innerHTML = "*Please enter a valid query";
                return false;
            }

            return true;
        }
        
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
        
       
    </script>
    <!--  firebase to get previous query -->
    <script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
    <script>
 // Initialize Firebase
    var config = {
        apiKey: "AIzaSyBCz9u8fUjOWyCTARyuNI4iE85gMUPIYHw",
        authDomain: "imhungry-64e63.firebaseapp.com",
        databaseURL: "https://imhungry-64e63.firebaseio.com",
        projectId: "imhungry-64e63",
        storageBucket: "imhungry-64e63.appspot.com",
        messagingSenderId: "577193628400"
    };
    firebase.initializeApp(config);

    //get a reference to the database
    var db = firebase.database();
    
    function allQueries(data){
    	var doc = document.getElementById('test');
    	for(var i = 0; i < data.length; i++){
				console.log(data[i]);
				doc.innerHTML += "<button class=\"btn btn-primary\" id=\"" + data[i] + "\" onclick=\"prevQuery(\'" + data[i] + "\')\">" + data[i] + "</button>";
		}
    }
   	
    </script>
    <!--  this gets the queries and calls allQueries -->
	<script src="https://imhungry-64e63.firebaseio.com/queries.json?callback=allQueries"></script>
</body>

</html>
