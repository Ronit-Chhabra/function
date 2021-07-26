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
      background-image:url(pics/bg.jpg);
      background-size:cover;
      overflow-x:hidden;
    }
        .card-img-top {
            border-radius: 30%;
            height: 200;
            width: 200;
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
            background-color: gray;
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
                    <h3 style="color: white;float: right;font-size: 20;">ADMIN DASH</h3>


                </div>

            </div>
            <div id="maindiv">
                <div id="outcard">
                    <div class="card " style="width: 18rem; height: 200;border: 0;">
                        <center> <img src="pics/manage.jpeg" class="card-img-top" alt="..."></center>
                        <br>
                        <div class="card-body">
                            <br>
                            <p>Manage Events</p><br>
                            <input type="button" class="btn btn-primary" id="eve" value="Events">
                        </div>
                    </div>
                </div>
                
                
                <div id="events" >
                <div class="cross"></div>
              <label for="event">Events</label>
              <select id="func" class="form-control" name="func" style="width: 200;" onchange="fillServices(this.value);">
              <option selected>Choose...</option>
             <option value="Birthday Party">Birthday Party</option>
			<option value="Marriage">Marriage</option>
			<option value="Jagran">Jagran</option>
			<option value="Kitty Parties">Kitty Parties</option>
             </select>
             <br><br>
             <label for="service">Services</label><br>
             <input type="text" name="events" id="evetxt"  class="form-control">
             <br><br>
            <center> <input type="submit" class="btn btn-primary" name="btn" value="Update"></center>
        </div>
               
               
                <div id="outcard">
                    <div class="card " style="width: 18rem; height: 200;border:0;">
                        <center> <img src="pics/favo.png" class="card-img-top" alt="..."></center>
                       <br> <div class="card-body">
                            <br>
                            <p>Manage Vendors</p><br>
                            <a href="vendormanager.jsp" class="btn btn-primary">Vendor Manager</a>
                        </div>
                    </div>
                </div>
                <div id="outcard">

                    <div class="card" style="width: 18rem; height: 200;border: 0;">
                        <center> <img src="pics/logout.png" class="card-img-top" alt="..."></center>
                       <br> <div class="card-body">
                            <br><br>
                            <a href="logout" class="btn btn-primary">LOGOUT</a>
                        </div>
                    </div>
                </div>
               
            </div>
          
        </div>
        
        
    </form>
</body>
</html>