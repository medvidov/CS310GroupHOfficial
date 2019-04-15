<!DOCTYPE html><html lang="en">

<head>
	
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Favorite List</title>

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
            <div class="listTitle" style="font-weight: bold;font-size: 7vw;">Grocery List</div>
        </div>
        <div class="row" style="padding-top: 50px;">
        <!-- content -->
                <div class="container-fluid" >
                	<div class="row text-center" id="listResult">
                		
                	<!-- this is where the items will be shown -->
						
					</div>
                </div>
        </div>
    </div>

    <script src="Functions.js"></script>
    <script>
	
	var s = ('<%= session.getAttribute("gList") %>').replace(/\\n/g, "\\n")  
    .replace(/\\'/g, "\\'")
    .replace(/\\"/g, '\\"')
    .replace(/\\&/g, "\\&")
    .replace(/\\r/g, "\\r")
    .replace(/\\t/g, "\\t")
    .replace(/\\b/g, "\\b")
    .replace(/\\f/g, "\\f");
	//remove non-printable and other non-valid JSON chars
	s = s.replace(/[\u0000-\u0019]+/g,""); 
	var gList = JSON.parse(s);
	console.log(gList);
	var head = document.getElementById("listResult");
	
	head.style.fontSize = "25px";
	for(var i = 0; i < gList.length; i++){
		if(!gList[i].check){
			head.innerHTML += "<div class=\"col-12\"><input type=\"checkbox\" id=\"" + i + "\" onclick=\"test(event);\"><span id=\"inner" + i + "\">" + gList[i].str + "</span></div>";
		}
		else{
			head.innerHTML += "<div class=\"col-12\"><input type=\"checkbox\" id=\"" + i + "\" onclick=\"test(event);\" checked><span id=\"inner" + i + "\"><strike><i>" + gList[i].str + "</strike></i></span></div>";
		}	
	}
	
	//add checked values
	function test(event){
		//console.log(event);
		//console.log(event.srcElement.attributes[1].nodeValue);
		var id = event.srcElement.attributes[1].nodeValue;
		var check = document.getElementById(id).checked;
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				console.log("updated");
			}
		}
		xhttp.open("POST", "GroceryChecked?id=" + id + "&check=" + check, true);
		xhttp.send();
		
		var wow = document.getElementById("inner" + id);
		if(check){
			wow.innerHTML = "<strike><i>" + wow.innerHTML + "</i></strike>";
		}
		else{
			wow.innerHTML = wow.innerHTML.slice(11, wow.innerHTML.length - 13);
		}
	}
  		
    
    </script>

</body>

</html>
