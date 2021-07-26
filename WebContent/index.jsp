
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/angular.min.js"></script>
<style>
    #top
    {
       height: 100;
        background-color:dodgerblue;
        width: 100%;
    }
    #icon
    {
        border-radius: 50%;
        height: 50;
        width: 50;
        margin-top: 20;
        margin-left: 50;
    }
    #heading
    {
        margin-top: 25;
        margin-left: 250;
    }
    #txt-uid
    {
        height: 30;
        padding-left: 100;
        width: 280;
        margin-left: 150;
    }
    #txt-pwd
    {
        height: 30;
        padding-left: 20;
        width: 200;
    }
    #login
    {
        margin-top: 31;
        margin-left: 20;
    }
    #sign
    {
        margin-top: 31;
        margin-left: 25;
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
    #modsign
        {
            width: 400px; height: 400px;
            border: 1px black solid;
            padding: 20px;
            background-color: white;
            box-shadow: 0px 0px 20px 5px black;
            margin-top: 5%;
            border-radius: 20px;
			position: absolute;
			margin-left:550;
			display: none;
            z-index: 10;
            
        }
        #carouselExampleControls
        {
          margin-top:0;
          width:100%;
          height:640;
        }
        .label
        {
          text-align:center;
          height:50;
          width:100%;
          background-color:dodgerblue;
        }
        #waiting
{
display:none;
position: absolute;
left:25%;
top:25%;
width:200px;
height:200px;

}
body
{
   overflow-x:hidden;
}
</style>
  <script>
        $(document).ready(function(){
		
        	$(document).ajaxStart(function(){
    			$("#waiting").css("display","inline-block");
    			
    		});
    		$(document).ajaxStop(function(){
    			$("#waiting").css("display","none");
    		});
        	
		$("#sign").click(function(){
			$("#modsign").fadeToggle(1000);
            
            
            
			
		});
            
		$("#uidsign").blur(function(){
			//	alert($("#uidsign").val());
			let url="checkUserServlet?uid="+$("#uidsign").val();
			
			$.get(url,function(response){
				$("#errUid").html(response);
			});
		});
            $(".cross").click(function(){
			$("#modsign").hide(500);

   
		});
        });
    </script>
     <script>
      var map=angular.module("myModule",[]);
      map.controller("myController",function($scope,$http){
    	  $scope.jsonobj;
    	  $scope.doSave=function(){
    	     $http.get("signservlet?uid="+uidsign.value+"&pwd="+pwdsign.value+"&type="+type.value).then(fun1,fun2);
    	     function fun1(response)
    	     {
    	    	alert(response.data);
    	    	// $scope.jsonobj=response.data;
    	     }
    	     function fun2()
    	     {
    	    	 
    	     }
    	  }
    	  $scope.jsonobject;
    	  $scope.doLogin=function()
    	  {
    		  $http.get("loginServlet?uid="+uidlog.value+"&pwd="+pwdlog.value).then(fun1,fun2);
    		  function fun1(type)
    		  {
    			 //alert(type.data);
    			 type.data=type.data.substr(1,type.data.length-2);
    			 //alert(type.data);
    			  if(type.data=="user")
    				  location.href="userdash.jsp";
    			  else
    				  if(type.data=="vendor")
        				  location.href="vendorDashboard.jsp";
    				  else if(type.data=="admin")
    					  location.href="admindash.jsp";
    				  else
    					  alert("Invalid uid/Password");
        				  
    		  }
    		  function fun2(response)
    		  {
    			  
    		  }
    	  }
      });
    
    </script>
</head>
<body ng-app="myModule" ng-controller="myController">
    <div id="top" class="form-row">
        <img src="pics/giphy.gif" id="icon">
        <h3 id="heading">FUNCTION ORGANIZERS</h3>
       <div id="txt-uid" class="form-row">
       <label for="uid">User ID</label>
       <input type="text" class="form-control" placeholder="User ID" id="uidlog">
       </div>
       <div id="txt-pwd" class="form-row">
       <label for="uid">Password</label>
       <input type="password" class="form-control" placeholder="Password" id="pwdlog">
       </div>   
       <div>
         <input type="button" class="form-control btn-secondary" id="login" value="Login" ng-click="doLogin();">
       </div>
       <div>
         <input type="button" class="form-control btn-secondary" id="sign" value="SignUp">
       </div> 
       <div id="modsign">
           <div class="cross"></div>
              <label for="uid">User ID</label><span style="color:red ;margin-left:20;" id="errUid"></span>
              <input type="text" placeholder="Enter User ID" id="uidsign"  class="form-control" >
              <br>
              <img id="waiting" src="pics/loading1.gif" >
              <label for="pwd">Password</label>
              <input type="password" placeholder="Enter Password" id="pwdsign" class="form-control">
              <br>
              <label for="type">User/Vendor</label>
              <select id="type" class="form-control" name="type" style="width: 200;" >
              <option selected>Choose...</option>
             <option value="user">User</option>
			<option value="vendor">Vendor</option>
			 </select>
             <br><br>
            <center> <input type="button" class="btn btn-primary" name="btn" value="Sign Up" ng-click="doSave()"></center>
       </div></div>
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
            <div class="carousel-item active">
               <img src="pics/mar1.jpg" style="height:640" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="pics/mar2.jpg" style="height:640" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="pics/mar3.jpg" style="height:640" class="d-block w-100" alt="...">
            </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
            </a>
       </div>
       <div class="label">
           <h2>Users</h2>
        </div>
        
       <div class="container " style="padding-top:10;">
       <div class="form-row" style="display:flex;justify-content:space-between;">
           <div class="card col-md-3" style="width: 18rem;" >
               <img src="pics/prof.png" style="border-radius:36%" class="card-img-top" >
               <div class="card-body">
               <center><h3>Vendors</h3></center>
                      <b><i><p class="card-text">Vendors can enter their details to serve their best service to customers</p></i></b>
                      </div>
               </div>
       
       
           <div class="card col-md-3" style="width: 18rem;" >
               <img src="pics/favo.png" style="border-radius:36%" class="card-img-top" >
               <div class="card-body"><br><br>
               <center><h3>Customer</h3></center>
                      <b><i><p class="card-text"></p></i></b>
                      </div>
               </div>
       
       
           <div class="card col-md-3" style="width: 18rem;" >
               <img src="pics/adminnew.png" style="border-radius:36%" class="card-img-top" >
               <div class="card-body"><br><br>
               <center><h3>Admin</h3></center>
                      <b><i><p class="card-text">I manage this site</p></i></b>
                      </div>
               </div>
        </div>
      
</div>
  <div class="label" style="margin-top:10;">
           <h2>Events</h2>
        </div>
        <div style="display:flex; justify-content:space-evenly; margin-top:10;">
        <div class="images">
            <img src="pics/mar3.jpg" style="border-radius:50%" width="200px;" height="200px" >
            <div><center><label><b>Marriage</b></label></center></div>
        </div>
        <div class="images">
            <img src="pics/bday.jpg" style="border-radius:50%" width="200px;" height="200px" >
            <div><center><label><b>Birthday Party</b></label></center></div>
        </div>
        <div class="images">
            <img src="pics/farewell.jpg" style="border-radius:50% ;border:1px solid black" width="200px;" height="200px" >
            <div><center><label><b>Farewell Party</b></label></center></div>
        </div>
        <div class="images">
            <img src="pics/jagrata.jpg" style="border-radius:50%" width="200px;" height="200px" >
            <div><center><label><b>Jagran</b></label></center></div>
        </div>
        </div>
        
         <div class="label" style="margin-top:10;">
           <h2>About Us</h2>
        </div>
         <div class="form-row" style="display:flex;justify-content:space-evenly;">
           <div class="card col-md-3" style="width: 18rem;">
               <img src="pics/me.JPG" style="border-radius:36%" class="card-img-top" >
               <div class="card-body">
               <center><h3>Ronit Chhabra</h3></center>
                      <i><p class="card-text">1. Final Year Student</p></i>
                      <i><p class="card-text">2. Placed in TCS</p></i>
                    
                      </div>
               </div>
               
               <div class="card col-md-3" style="width: 18rem;" >
               <img src="pics/rajeshsir.jpg" style="border-radius:36%" class="card-img-top" >
               <div class="card-body">
               <center><h3>Rajesh Bansal</h3></center>
                      <i><p class="card-text">1. 18 Years Training &Development Experience</p></i>
                      <i><p class="card-text">2. Sun Certified Java Programmer</p></i>
                      <i><p class="card-text">3. Microsoft Certified Specialist</p></i>
                      <i><p class="card-text">4. Author of Java Book(Real Java)</p></i>
                      </div>
               </div>
               </div>
               <div class="label" style="margin-top:10;">
           <h2>Copyrights @Sun-Soft Technologies</h2>
        </div>
</body>
</html>