<%if(session.getAttribute("uid")==null)
	response.sendRedirect("index.jsp");
	%>
<html>
<head>
    <meta charset="UTF-8">
    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/bootstrap.js"></script>
    
    <link rel="stylesheet" href="css/bootstrap.css">
    <title>Document</title>
    <script src="js/angular.min.js"></script>
    <style>
    body
{
  background-image:url(pics/bg2.jpg);
  background-size:cover;
  overflow-x:hidden;
}
        #fun-lab
        {
            margin-left: 100;
            
            margin-right: 20;
        }
        #ser-lab 
        {
            margin-left:  100;
            margin-right: 20;
            
        }
        #city-lab
        {
            margin-left: 100;
            margin-right: 20;
            
        }
          
      .card
      {
        border:1px solid black;
      }
         	.card:hover
        {
           box-shadow: 7px 7px 9px 10px black;
        }
        #top
        {
             
            text-align: center;
            font-size: 40;
            font-family: cursive;
            color: black;
            height: 80;
            padding-top: 10;
        }
        #s-top
        {
            margin-top: 40;
        }
         #moredet
        {
            
            width: 400px; height: 860px;
            border: 1px black solid;
            padding: 20px;
            background-color: beige;
            box-shadow: 0px 0px 20px 5px black;
            margin-top: 5%;
            border-radius: 20px;
			position: absolute;
			margin-left:300px;
			margin-bottom:300px;
			display: none;
            z-index: 10;
            
        }
        #text
        {
           height:100;
           width:100%;
        }
    </style>
    <script type="text/javascript">
    var module=angular.module("myModule",[]);
    module.controller("myController",function($scope,$http){
    	$scope.jsonObject; 
    	$scope.jsonObjects;
        $scope.mob;
    	$scope.fillCity=function()
   	        {
   	        	
   	        	$http.get("FetchCity").then(fun1,fun2)
   	        	function fun1(response)
   	        	{
   	        		$scope.jsonObject=response.data;
   	        		//alert(response.data);
   	        	    
   	        	}
   	        	function fun2(response)
   	        	{
   	        		alert(response.data);
   	        	}
   	        }
    	$scope.fetchVendor=function()
    	{
    		$http.get("FetchVendors?function="+func.value+"&service="+service.value+"&city="+city.value).then(func1,func2);
    		function func1(response)
	        	{
    			  //alert(response.data);
	        		$scope.jsonObjects=response.data;
	        		
	        	    
	        	}
	        	function func2(response)
	        	{
	        		alert(response.data);
	        	}
    		
    	}
    	$scope.showdetails=function(i)
    	{
    		
    		$scope.i=i;
    		$scope.mob=$scope.jsonObjects[i].mobile;
    		//alert($scope.mob);
    		$("#moredet").fadeToggle(1000);
    	}
    	$scope.addfav=function(vid)
    	{
    		$scope.vid=vid;
    		 //alert(vid);
      	   //alert(uid);
      	   var service=document.getElementById("service").value;
      	  // alert(service);
      	   
      	   $http.get("AddFav?uid="+uid.value+"&vid="+vid+"&service="+service).then(func1,func2);
      	   function func1(response)
                {
      		   alert(response.data);
      		       $scope.jsonobj=response.data;
                }
      	   function func2()
      	   {
      		   alert(response.data);
      	   }
    	}
    	$scope.sendSms=function()
    	{
    		var mob=$scope.mob;
    		alert(mob);
    		$http.get("SendSms?txt="+text.value+"&mob="+mob).then(fun1,fun2);
    		function fun1(response)
    		{
    			alert(response.data);
    		}
    		function fun2(response)
    		{
    			alert();
    		}
    	}
    });
    $(document).ready(function(){
		  loadAllEvents();
		  function loadAllEvents()
		  {
			  var url="EventResultFetch";
			  $.getJSON(url,function(jsonObjects)
					 {
				//alert(JSON.stringify(jsonObjects));
				  for(i=0;i<jsonObjects.length;i++)
					  {
					    var item=document.createElement("option");
					    item.text=jsonObjects[i].Event;
					    item.value=jsonObjects[i].Event;
					    $("#func").append(item);
					  }
			  })
		  }
		  /*$("#more").click(function(){
				//$("#events").css("display","block");
				//$(".outer").slideDown(2000);
				//$(".outer").fadeIn(2000);
				$("#moredet").fadeToggle(1000);
	            
	           // $(".outerdiv").css('opacity',0.5);
	            //$("#events").css('opacity',1);
	            
	            
				
			});
	            */
	            $("#close").click(function(){
				//$(".outer").css("display","none")	;
				//$(".outer").slideUp();
				//$("#events").fadeOut(1000);
				$("#moredet").hide(500);
				//$(".outer").fadeTo("slow",0);
				//$(".outerdiv").css('opacity',1);

	   
			});
	  })
	   function fillServices(event)
        	  {
        		  $("#service").html("");
        		  var item=document.createElement("option");
				    item.text="Choose....";
				    item.value="none";
				    $("#service").append(item);
				    
        		  var url="ServiceResultFetch?event="+event;
        		  $.getJSON(url,function(jsonObject){
              		//alert(JSON.stringify(jsonObject));
              		var ary=jsonObject[0].service.split(",");
              		
              		for(i=0;i<ary.length;i++)
					  {
					    var item=document.createElement("option");
					    item.text=ary[i];
					    item.value=ary[i];
					    $("#service").append(item);
					  }
        		  });
        	  }
       function addfav(vid)
       {
    	   //alert();
    	   var uid=document.getElementById("uid").value;
    	   alert(uid);
    	   var service=document.getElementById("service").value;
    	   alert(service);
    	   var url="AddFav?uid="+uid+"&vid="+vid+"&service"+service;
    	   $.getJSON(url,function(jsonObject)
              {
    		       var res=jsonObject;
    		       alert(res);
              })
       }
   
    </script>
</head>

<body data-ng-init="fillCity()" ng-app="myModule" ng-controller="myController">
   <form>
   
        <center><span id="top">Plan It Here</span></center> 
    
    <div class="container">
     <input type="text" value=<%=session.getAttribute("uid") %> id="uid" style="display:none">
        <div id="s-top" class="col-md-12" style="display:flex;">
            <div class="col-md-4" style="display:flex;">
            <label for="func" id="fun-lab">Function:</label>
            <select name="function" class="form-control" width="100" id="func" onchange="fillServices(this.value)">
                <option value="Choose">Choose....</option>
            </select>
            </div>
            <div class="col-md-4" style="display:flex;">
            <label for="serv" id="ser-lab">Services:</label>
            <select name="service" class="form-control" id="service" >
                <option value="Choose">Choose....</option>
            </select>
            </div>
            <div class="col-md-4" style="display:flex;">
              <label for="city" id="city-lab">City:</label>
            <select name="city" class="form-control" id="city">
                <option value="Choose">Choose....</option>
                <option ng-repeat="object in jsonObject" value="{{object}}">{{object}}</option>
            </select>
            </div>
        </div>
        <br><br>
        
      <center>
         <input type="button" id="btn" class="btn btn-outline-secondary" ng-click="fetchVendor()" value="Search">    
      </center>
      <br>
       </div>
       <hr>
       <div class="container">
       <div class="form-row col-md-4">
             <div class="card" style="width: 18rem;" ng-repeat="obj in jsonObjects">
               <img src="uploads/{{obj.pic1}}" style="border-radius:36%" class="card-img-top" >
               <div class="card-body">
                      <p class="card-text"><b>Name : </b>{{obj.name}}</p>
                      <p class="card-text"><b>Mobile Number : </b>{{obj.mobile}}</p>
                      <p class="card-text"><b>Address : </b>{{obj.address}}</p>
                      <a href="#" ><img ng-click="addfav(obj.uid)" src="pics/star.jfif" height="40" width="40"></a>
                      <input type="button" class="btn btn-primary" ng-click="showdetails($index)" id="more" value="More Details" style="float:right">
               </div>
               </div>
                               
                <div id="moredet"  class="table form-row">
                    <div>
                    <center>
                       <table >
                       <tr>
                       <td colspan="2">	
                       <div class="bd-example">
		<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
				<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
				
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item ">
					<img src="uploads/{{jsonObjects[i].pic1}}" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						
					</div>
				</div>
				<div class="carousel-item active">
					<img src="uploads/{{jsonObjects[i].pic2}}" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						
					</div>
				</div>
			</div>
		</div>
	</div>
                       </td>
                         <tr></tr>
                         <th>Name :</th>
                         <td>{{jsonObjects[i].name}}</td>
                         
                         <tr></tr>
                         <th>Mobile :</th>
                         <td>{{jsonObjects[i].mobile}}</td>
                         <tr></tr>
                         <th>Firm :</th>
                         <td>{{jsonObjects[i].firm}}</td>
                         <tr></tr>
                         <tr></tr>
                         <th>Address :</th>
                         <td>{{jsonObjects[i].address}}</td>
                         <tr></tr>
                         <th>City :</th>
                         <td>{{jsonObjects[i].city}}</td>
                         <tr></tr>
                         <th>Previoes Work :</th>
                         <td>{{jsonObjects[i].pwork}}</td>
                         <tr></tr>
                         <th>Established :</th>
                         <td>{{jsonObjects[i].est}}</td>
                         <tr rowspan="2"></tr>
                         <td colspan="2"><input class="form-control" placeholder="Type a message...." type="text" id="text"></td>
                         <tr></tr>
                         <td><input type="button" class="btn btn-danger" style="float:right" value="close" id="close"></td>
                         <td><input type="button" class="btn btn-danger" style="float:right" value="Send Message" ng-click="sendSms()" id="send"></td>
                       </table></center>
                    </div>
                </div>
                </div>

                
                </div>
                         
                
    </form>
</body>
</html>