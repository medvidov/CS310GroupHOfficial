/**
 * 
 */
	//sending data to MoveListServlet to move items 
function mv(list2, itemType, index){

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		if(this.readyState == 4 && this.status == 200){
            location.reload();
		}
	}
	xhttp.open("POST", "MoveListServlet?list1=not&list2=" + list2 + "&itemType=" + itemType + "&index=" + index, true);
	xhttp.send();
	
	return false;

}

//sending data to RemoveListServlet to remove items
function rm(itemType, index){
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		if(this.readyState == 4 && this.status == 200){

            location.reload();
		}
	}
	
	xhttp.open("POST", "RemoveListServlet?list=not&itemType=" + itemType + "&index=" + index, true);
	xhttp.send();	
	return false;

}

//functions to create the recipe boxes in the html
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

//function to create the restaurant boxes in the html
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
		return div1.innerHTML;
	
}

//redirection from navbar
function toSearch(){
	window.location.href = "Search.jsp";
}
function toResult(){
	window.location.href = "Results.jsp";
}

//checking if redirection to list is legal
function check(){
		var list = document.getElementById("list").value;
		if(list == null || list == "nil" || list == "not"){
			
			return false;
		}
	
		return true;
}

$(".foodstuff").sortable({
	  
	  axis: "y",
	  revert: true,
	  scroll: false,
	  placeholder: "sortable-placeholder",
	  cursor: "move"

	});

    
