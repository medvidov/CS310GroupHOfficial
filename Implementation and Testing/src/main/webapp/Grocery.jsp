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
    


</head>

<body>

    <div class="container-fluid">
        <div class="row ">
            <div class="col-10">
            <!--  title -->
                <div class="listTitle text-center" style="margin-bottom: 150px;">Grocery List</div>

            </div>
            <!--  navigation bar -->
            <div class="col-2">
                <div class="mt-20">
                    <button class="btn btn-secondary wth" id="results" onclick="toResult();">Back to Results</button>
                </div>
                <div class="mt-20">
                    <button class="btn btn-secondary wth" onclick="toSearch();">Back to Search</button>

                </div>

            </div>
        </div>
        <div class="row" style="padding-top: 50px;">
        <!-- content -->
                <div class="container-fluid" id="listResult">
                	<!-- this is where the items will be shown -->

                </div>
        </div>
    </div>
    
    <script>
    
    //for redirection purposes 
    function toSearch(){
		window.location.href = "Search.jsp";
	}
	function toResult(){
		window.location.href = "Results.jsp";
	}
	
	
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
	var groList = JSON.parse(s);
	//var groList = JSON.parse('<%= session.getAttribute("gList") %>');
	var gList = groList.gList;
	console.log(groList);
	var head = document.getElementById("listResult");
	var ol = document.createElement('ol');
	ol.style.fontSize = "23px";
	console.log(groList.gList);
	for(var i = 0; i < gList.length; i++){
		var li = document.createElement('li');
		li.innerHTML = gList[i];
		ol.appendChild(li);
		//console.log("hello");
	}
	head.appendChild(ol);
    
    
    //send data to RemoveListServlet to remove items
	function rm(itemType, index){
    	var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
	            location.reload();
			}
		}
		xhttp.open("POST", "RemoveListServlet?list=favorite&itemType=" + itemType + "&index=" + index, true);
		xhttp.send();
    	
		return false;
    
    }
    
  		
    
    </script>

</body>

</html>
