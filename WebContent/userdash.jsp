<%if(session.getAttribute("uid")==null)
	response.sendRedirect("index.jsp");
	%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript">
    function fillServices(event)
    {
 	   var url="FetchServices?event="+event;
 	   
 	   $.getJSON(url,function(jsonObject){
 		//  alert(JSON.stringify(jsonObject));
 		  $("#evetxt").val(jsonObject[0].service);
 		  //alert(jsonObjects.service);
 		   
 	   });
    }
    </script>
    <style>
        body
        {
        
           overflow-x:hidden;
        }
    
        .card-img-top {
            border-radius: 30%;
            height: 225;
            width: 225;
        }
         
        .card-body {
            text-align: center;
        }

        #maindiv {
            
            display: flex;
            height: 500;
            flex-wrap: wrap;
            padding-top:50;
            justify-content: space-around;            
        }

        #top {

            box-sizing: border-box;
            background-color: darkkhaki;
            height: 100;
        }

        

        #outerdiv {
            box-sizing: border-box;

        }

        #outcard {
            border: 1px solid black;
            padding-top: 10;
            border-radius: 5%;
            height: 400;
            background-color: white;
        }
        .card-body
        {
            z-index: 4;
            
        }
       #events
        {
            width: 400px; height: 400px;
            border: 1px black solid;
            padding: 20px;
            background-color: beige;
            box-shadow: 0px 0px 20px 5px black;
            margin-top: 5%;
            border-radius: 20px;
			position: absolute;
			
			display: none;
            z-index: 10;
            
        }
        .cross
        {
            background-color: aqua;
            display: inline;
            float: right;
            background-image: url(pics/notok.png);
            width: 28px; height: 30px;
            cursor: pointer;
        }
        	#outcard:hover
        {
           box-shadow: 7px 7px 9px 10px black;
        }
    </style>
    <script>
        $(document).ready(function(){
		
		$("#eve").click(function(){
			//$("#events").css("display","block");
			//$(".outer").slideDown(2000);
			//$(".outer").fadeIn(2000);
			$("#events").fadeToggle(1000);
            
           // $(".outerdiv").css('opacity',0.5);
            //$("#events").css('opacity',1);
            
            
			
		});
            
            $(".cross").click(function(){
			//$(".outer").css("display","none")	;
			//$(".outer").slideUp();
			//$("#events").fadeOut(1000);
			$("#events").hide(500);
			//$(".outer").fadeTo("slow",0);
			//$(".outerdiv").css('opacity',1);

   
		});
        });
    </script>
</head>

<body>
    <form action="AdminController" method="post">
        <div class="outerdiv">
            <div class="" id="top">
                <div class="col-md-12" style="padding-top: 5;">
                    <center><h3 style="color: white;font-size: 30;margin-top:20">Welcome To Your Dashboard	</h3></center>


                </div>

            </div>
            <div id="maindiv">
                <div id="outcard">
                    <div class="card " style="width: 18rem; height: 200;border: 0;">
                        <center> <img src="pics/prof.png" class="card-img-top" alt="..."></center>
                        <br>
                        <div class="card-body">
                            <br>
                            <p>Update Profile</p><br>
                            <a href="userprofile.jsp" class="btn btn-primary" id="eve" value="Events">Edit</a>
                        </div>
                    </div>
                </div>
                
                
                
               <div id="outcard">
                    <div class="card " style="width: 18rem; height: 200;border:0;">
                        <center> <img src="pics/plan.jpg" class="card-img-top" alt="..."></center>
                       <br> <div class="card-body">
                            <br>
                            <p>Plan Function</p><br>
                            <a href="plan-func.jsp" class="btn btn-primary">Plan</a>
                        </div>
                    </div>
                </div>
               
                <div id="outcard">
                    <div class="card " style="width: 18rem; height: 200;border:0;">
                        <center> <img src="pics/favo.png" class="card-img-top" alt="..."></center>
                       <br> <div class="card-body">
                            <br>
                            <p>Manage your favorites</p><br>
                            <a href="favorites.jsp" class="btn btn-primary">Favorites</a>
                        </div>
                    </div>
                </div>
                <div id="outcard">

                    <div class="card" style="width: 18rem; height: 200;border: 0;">
                        <center> <img src="pics/logout.png" class="card-img-top" alt="..."></center>
                       <br> <div class="card-body">
                            <br><br><br>
                            <a href="logout" class="btn btn-primary">LOGOUT</a>
                        </div>
                    </div>
                </div>
               
            </div>
          
        </div>
        
        
    </form>
</body>
</html>