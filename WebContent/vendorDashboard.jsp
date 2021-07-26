<%if(session.getAttribute("uid")==null)
	response.sendRedirect("index.jsp");
	%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/angular.min.js"></script>
   
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
        .card-img-top {
            
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
            background-color: darkkhaki;
            height: 100;
        }
      body
      {
         overflow-x:hidden;
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
       	#outcard:hover
        {
           box-shadow: 7px 7px 9px 10px black;
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
     #modpwd
        {
            width: 400px; height: 400px;
            border: 1px black solid;
            padding: 20px;
            background-color: white;
            box-shadow: 0px 0px 20px 5px black;
            margin-top: 5%;
            border-radius: 20px;
			position: absolute;
			display: none;
            z-index: 10;
            
        }
    </style>
   <script>
        $(document).ready(function(){
		$("#chng").click(function(){
			$("#modpwd").fadeToggle(1000);	
		});
            
		
            $(".cross").click(function(){
			$("#modpwd").hide(500);
});
        });
        
    </script>
    <script>
    var map=angular.module("myModule",[]);
    map.controller("myController",function($scope,$http){
    	$scope.doChange=function()
    	{
    		alert(txt.value);
    		 $http.get("changePwd?pwd="+pwd.value+"&uid="+txt.value).then(fun1,fun2);
    	     function fun1(response)
    	     {
    	    	alert(response.data);
    	    	// $scope.jsonobj=response.data;
    	     }
    	     function fun2()
    	     {
    	    	 
    	     }	
    	}
    })
    
    </script>
</head>

<body ng-app="myModule" ng-controller="myController">
    <form action="AdminController" method="post">
        <div class="outerdiv">
            <div class="" id="top">
                <div class="col-md-12" style="padding-top: 5;">
                    <h3 style="color: white;float: right;font-size: 30;padding-right:600">Welcome To Your Dashboard</h3>


                </div>

            </div>
            <div id="maindiv">
                <div id="outcard">
                    <div class="card " style="width: 18rem; height: 200;border: 0;">
                        <center> <img src="pics/prof.png" class="card-img-top" alt="..."></center>
                        <br>
                        <div class="card-body">
                            <br>
                            <p>Edit Profile</p><br>
                            <a href="vendorprofile.jsp" class="btn btn-primary">Edit</a>
                        </div>
                    </div>
                </div>
                
                
              
               
               
                <div id="outcard">
                    <div class="card " style="width: 18rem; height: 200;border:0;">
                        <center> <img src="pics/sett.png" class="card-img-top" alt="..."></center>
                       <br> <div class="card-body">
                            <br>
                            <p>Settings</p><br>
                            <input type="button" id="chng" value="Change Password" class="btn btn-primary">
                        </div>
                    </div>
                </div>
                
                <div id="modpwd" >
           <div class="cross"></div>
            
               
              <label for="pwdc">Enter Password</label>
              <input type="password" placeholder="Confirm Password" id="pwd" class="form-control">
              <br>
              
             <br><br>
            <center> <input type="button" class="btn btn-primary" name="btn" value="Change Password" ng-click="doChange()"></center>
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
        <input type="text" class="form-control" value=<%=session.getAttribute("uid") %> hidden name="uid" id="txt" style="width: 200">
        
    </form>
</body>
</html>