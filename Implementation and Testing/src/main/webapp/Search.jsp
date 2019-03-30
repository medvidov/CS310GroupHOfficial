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

    <!-- style  -->
    <link href="./css/main.css?version=5" rel="stylesheet">




</head>

<body>

    <div class="container-fluid text-center content">
        <!--  title -->
        <div class="title">I'm Hungry</div>
        <div style="color:red" id="error"></div>
        <div class="container mt-20">
            <!-- main query form -->
            <form method="get" action="ReturnResults" onsubmit="return check();" id="searchForm">
                <div class="form-row">
                    <div class="col-8">
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
                <div class="form-row mt-20 ">
                    <div class="col-12">
                        <button type="submit" class="btn" id="searchBtn" style="color: deeppink"><strong>Feed Me!</strong></button>
                    </div>
                </div>
            </form>
        </div>
        <div class="container" style="margin-top: 100px;">

        </div>
    </div>

    <script type="application/javascript">
        //change the grumpy emoji to smiley emoji when clicked
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

    </script>

</body>

</html>
