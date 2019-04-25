<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Login</title>
 	<!-- maxcdn -->
 	
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- style  -->
    <link href="./css/main.css?version=5" rel="stylesheet">
    
     <!-- Firebase App is always required and must be first -->
    <script src="https://www.gstatic.com/firebasejs/5.9.3/firebase-app.js"></script>

    <!-- Add additional services that you want to use -->
    <script src="https://www.gstatic.com/firebasejs/5.9.3/firebase-database.js"></script>
	
    <script>
    	
    	function back(){
    		location.href = "Search.jsp";
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
    </style>
</head>
<body>

<div class="bg"></div>
<div class="container">
<button class="btn btn-primary" onclick="back();" style="margin-top: 30px;">Back to Search</button>
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="text-center">
                        <h1 id="main_title">Log In</h1>
                    </div>
                    <div>
                        <!-- forms -->
                        <form action="CheckLogin" method="POST" id="form">
                            <div class="text-center" id="test">
                                <strong><div style="color:red;" id="error"></div></strong>
                                <br>
                            </div>
                            <div class="form-group row">
                                <label for="title-id" class="col-sm-3 col-form-label text-sm-right">Username:</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="username" name="username">
                                </div>
                            </div> <!-- .form-group -->
                            <div class="form-group row">
                                <label for="title-id" class="col-sm-3 col-form-label text-sm-right">Password:</label>
                                <div class="col-sm-9">
                                    <!-- Password field -->
                                    <input type="password" class="form-control" name="password" id="myInput">
                                    <input type="checkbox" onclick="myFunction()"> Show Password
                                </div>
                            </div> <!-- .form-group -->
                            <div class="row justify-content-center">
                                <input type="submit" name="submit" value="Log In" class="btn btn-primary">
                            </div>
                        </form>
                        <!-- end of form -->
                    </div>
                </div>
            </div>
            <script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
            <script>
            
            	//check error
	    		var boom = '<%= session.getAttribute("error") %>';
	    		
	    		if(boom == "no"){
	    			console.log("error");
	    			document.querySelector("#test").innerHTML = "<strong><div style=\"color:red;\" id=\"error\">Login Failed!</div></strong><br>";
	    		}
	    		
            
            	var config = {
                    apiKey: "AIzaSyBCz9u8fUjOWyCTARyuNI4iE85gMUPIYHw",
                    authDomain: "imhungry-64e63.firebaseapp.com",
                    databaseURL: "https://imhungry-64e63.firebaseio.com",
                    projectId: "imhungry-64e63",
                    storageBucket: "imhungry-64e63.appspot.com",
                    messagingSenderId: "577193628400"
                };
                firebase.initializeApp(config);
            
	            function myFunction() {
	                var x = document.getElementById("myInput");
	                if (x.type === "password") {
	                    x.type = "text";
	                } else {
	                    x.type = "password";
	                }
	            }
            	
	           document.querySelector("#form").onsubmit = function(){
	        	   
	        	   var username = document.querySelector("#username").value;
	        	   var password = document.querySelector("#myInput").value;
	                 
	               if (document.querySelector("#username").value.trim().length < 1 ||
	                  document.querySelector("#myInput").value.trim().length < 1 
	                ) {
	                   document.querySelector("#test").innerHTML = "<strong><div style=\"color:red;\" id=\"error\">Please fill up all fields!</div></strong><br>";
	   			  
	   			     return false;
	               }
	               
	             return true;
	           }
            
            </script>

</body>
</html>