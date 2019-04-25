<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Signup</title>
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
        function back() {
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
    <div class="container-fluid">
        <button class="btn btn-primary" onclick="back()" style="margin-top: 30px;">Back to Search</button>
        <!-- search -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="text-center">
                        <h1 id="main_title">Sign Up</h1>
                    </div>

                    <!-- forms -->

                    <form action="createUser" method="POST" id="form">
                        <div class="text-center" id="test">
                            <strong>
                                <div style="color:red;" id="error"></div>
                            </strong>
                            <br>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Username:*</label>
                            <div class="col-sm-9">
                                <input id="username" type="text" class="form-control" name="username">
                            </div>
                        </div> <!-- .form-group -->
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label ">Password:*</label>
                            <div class="col-sm-9">
                                <!-- Password field -->
                                <input type="password" class="form-control" name="password" id="myInput">
                                <input type="checkbox" onclick="myFunction()"> Show Password
                            </div>
                        </div> <!-- .form-group -->
                        <div class="form-group row ">
                            <label for="title-id" class="col-sm-4 col-form-label ">Confirm Password:*</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" name="password2" id="password2">
                            </div>
                        </div> <!-- .form-group -->
                        <!-- .form-group -->
                        <div class="row justify-content-center">
                            <input type="submit" name="submit" value="Sign Up" class="btn btn-primary">
                        </div>
                    </form>
                    <!-- end of form -->
                    
                    <p class="mt-5 mb-3 text-muted text-center">Our password policy:</p>
			        <ul class="text-center">
			            <li>Be at least 8 characters</li>
			            <li>Use of lowercase and uppercase characters</li>
			            <li>have at least one number</li>
			            <li>Have at least one special characters(!, %, _, -, $, %, @, #)</li>
			        </ul>
			        
                </div>
            </div>
        </div>
    </div>
	<script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
    <script>
    	
  		//check error
  		/*
		var boom = '<%= session.getAttribute("errorSign") %>';
		
		if(boom == "yes"){
			console.log("error");
			document.querySelector("#test").innerHTML = "<strong><div style=\"color:red;\" id=\"error\">Username has been taken!</div></strong><br>";
		}
		else if(boom == "no"){
			document.querySelector("#error").innerHTML = "User has been created!";
		}
		*/
    	
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
    
        function myFunction() {
            var x = document.getElementById("myInput");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }

        document.querySelector("#form").onsubmit = function() {
            console.log("hello");
            
            var pass = document.querySelector("#myInput").value;
            var username = document.querySelector("#username").value.trim();

            if (document.querySelector("#username").value.trim().length < 1 ||
                document.querySelector("#myInput").value.trim().length < 1 ||
                document.querySelector("#password2").value.trim().length < 1) {

                console.log("error");
                document.querySelector("#test").innerHTML = "<strong><div style=\"color:red;\" id=\"error\">Please fill up all fields!</div></strong><br>";

                return false;
            }
			
           
            if (document.querySelector("#password2").value != document.querySelector("#myInput").value) {
                document.querySelector("#test").innerHTML = "<strong><div style=\"color:red;\" id=\"error\">Password and Confirm Passwords are not the same!</div></strong><br>";
                return false;
            }
            
          //checks that the pass length is at least 12
            if (document.querySelector("#myInput").value.trim().length < 8) {
                document.querySelector("#test").innerHTML = "<strong><div style=\" color:red;\" id=\"error\">Password needs to be at least 8 characters!</div></strong><br>";
                return false;
            }


            //check that the password has a number
            if (!(/\d/.test(document.querySelector("#myInput").value))) {
                document.querySelector("#test").innerHTML = "<strong><div style=\"color:red;\" id=\"error\">Password needs to contain at least one number!</div></strong><br>";
                return false;
            }

            //checks at least one capital
            if (pass.toLowerCase() == pass || pass.toUpperCase() == pass) {
                document.querySelector("#test").innerHTML = "<strong><div style=\"color:red;\" id=\"error\">Password needs to have a mix of lower and upper case characters!</div></strong><br>";
                return false;
            }

            var special = false;
            //at least one special character
            for (var i in pass) {
                if (!pass[i].match(/[a-z]/i) &&
                    !pass[i].match(/[0-9]/)) {
                    special = true;
                    break;
                }
            }

            if (!special) {
                document.querySelector("#test").innerHTML = "<strong><div style=\"color:red;\" id=\"error\">Password needs to contain special characters!</div></strong><br>";
                return false;
            }
            
            done = false;
            
            //checks if username has been taken
            
            db.ref('/user').once('value').then(function(snapshot) {
  				var myusers = snapshot.val();
  				for(var key in myusers){
  					//console.log(key + "->" + myusers[key]);
  					var token = key.split("-");
  					if(token[0] == document.querySelector("#username").value){
  						document.querySelector("#test").innerHTML = "<strong><div style=\"color:red;\" id=\"error\">Username has already been taken!</div></strong><br>";
  						return false;
  					}
  				}
  				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function(){
					if(this.readyState == 4 && this.status == 200){
						document.querySelector("#error").innerHTML = "User has been created!";
						return false;
					}
				}
				xhttp.open("POST", "createUser?username=" + username + "&password=" + pass , true);
				xhttp.send();
			});
            
            //document.querySelector("#error").innerHTML = "User has been created!";

            return false;
        }

    </script>

</body>

</html>
