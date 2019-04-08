

//functions to create the recipe boxes in the html
function createRecipe(name, star, prep, cook, price, num, uniqueID){
	
	var page = Math.floor(num/5) + 1;
	var display = "none";
	if(page == 1){
		display = "flex";
	}
	
	//console.log("res" +page+ "-" + display);
	
	return "<div class=\"rec" + page + " card border-danger mb-3 z-depth-5\" style=\"height: 160px;display: "+ display + ";\">"
	+ "<div class=\"card-header\"><a style=\"float: left\" href=\"Recipe.jsp?id=" + uniqueID + "\">"
    + "<h3>" + name + "</h3></a><div style=\"float: left; margin-left: 50px;margin-top: 5px; font-size: 21px;\"><strong>"
    + star + "<i class=\"fa fa-star\" aria-hidden=\"true\" style=\"color: mediumvioletred;\"></i>"
    + "</strong></div></div><div class=\"card-body text-info\" style=\"font-size: 20px;\">"
    + "<div class=\"container-fluid\"><div class=\"row\"><div class=\"col-10\"><div class=\"container-fluid\">"
    + "<div class=\"row\"><div class=\"col-12 col-sm-6\"><div>Prep Time: " + prep + "</div></div>"
    + "<div class=\"col-12 col-sm-6\"><div>Cook Time: " + cook + "</div></div></div></div></div>"
    + "<div class=\"col-2\"><h3>" + star + "</h3></div></div></div></div></div>";
    
}

//function to create the restaurant boxes in the html
function createRestaurant(name, star, dist, price, id, num, address){
	
	if(price == null){
    	price = "$";
    }
	
	
	var page = Math.floor(num/5) + 1;
	var display = "none";
	if(page == 1){
		display = "flex";
	}
	
	//console.log("rec" +page+ "-" + display);
	
	return "<div class=\"res" + page + " card border-primary mb-3 z-depth-5\" style=\"height: 160px;display: " + display + ";\">" 
	+ "<div class=\"card-header\">"
	+ "<a style=\"float: left\" href=\"Restaurant.jsp?id=" + id + "\">"
	+ "<h3>" + name + "</h3></a>"
	+ "<div style=\"float: left; margin-left: 50px;margin-top: 5px; font-size: 21px;\"><strong>"
	+ star + "<i class=\"fa fa-star\" aria-hidden=\"true\" style=\"color: mediumvioletred;\"></i>"
	+ "</strong></div></div><div class=\"card-body text-info\"><div class=\"container-fluid\">"
	+ "<div class=\"row\"><div class=\"col-10\"><h5 class=\"card-title\">Distance: " + dist + "</h5>"
	+ "<p class=\"card-text\">" + address + "</p></div><div class=\"col-2\"><h3>" + price + "</h3>"
	+ " </div></div></div></div></div>";
	

	
}

//redirection from navbar
function toSearch(){
	window.location.href = "Search.jsp";
}
function toResult(){
	window.location.href = "Results.jsp";
}

function getQueries() {

    var xhttp = new XMLHttpRequest();
    console.log("inside");
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {

            var queries = JSON.parse('<%= session.getAttribute("queries") %>');
            if (queries == null || !queries) {
                return;
            } else {
                var q = document.getElementById('queries');
                for (var i = 0; i < queries.length; i++) {
                    var div = document.createElement('div');
                    div.classList.add("col-3");
                    div.innerHTML =
                        //q.innerHTML += "<div class=\"col-3\">"
                        "<form action=\"PreviousQuery\" method=\"POST\">" +
                        "<input type=\"hidden\" name=\"filename\" value=\"" + queries[i] + "\"> " +
                        "<button id=\"" + queries[i] + "\" class=\"btn btn-primary\">" + queries[i] + "</button></form></div>";
                    q.appendChild(div);
                }

                //$('#queries').load(document.URL +  ' #queries');
            }
            console.log(q);
        }
    }
    xhttp.open("GET", "GetQueries", false);
    xhttp.send();

}

//get previous query
//getQueries();

function prevQuery(filename) {
    var xhttp = new XMLHttpRequest();
    console.log("inside-a");
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {


        }
    }
    xhttp.open("GET", "PreviousQuery?filename=" + filename, true);
    xhttp.send();
}

// Add your javascript here

$('#right-button').click(function() {
    //event.preventDefault();
    $('.scrollmenu').animate({
        scrollLeft: "+=300px"
    }, "fast");
});

$('#left-button').click(function() {
    //event.preventDefault();
    $('.scrollmenu').animate({
        scrollLeft: "-=300px"
    }, "fast");
});
    
