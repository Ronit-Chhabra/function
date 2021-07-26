<%if(session.getAttribute("uid")==null)
	response.sendRedirect("index.jsp");
	%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Favorites</title>
<script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/angular.min.js"></script>
    <script type="text/javascript">
    
    var module=angular.module("myModule",[]);
    
    module.controller("myController",function($scope,$http){
    	//alert();
    	$scope.jsonobj;
    	
    	$scope.fetchVendors=function()
    	{
    		$http.get("fetchFavVendor?service="+service.value+"&uid="+uid.value).then(fun1,fun2);
    		function fun1(response)
    		{
    		  $scope.jsonobj=response.data;
    		  // alert(response.data);
    		}
    		function fun2(response)
    		{
    			//alert(response.data);
    		}
    	}
    	$scope.showdetails=function(i)
    	{
    		$scope.i=i;
    		$("#moredet").fadeToggle(1000);
    	}
    })
    </script>
    <script type="text/javascript">
    fillServices();
    function fillServices()
    {
    	
    	 var url="ServiceFetch";
		  $.getJSON(url,function(jsonObjects)
				 {
			//alert(JSON.stringify(jsonObjects));
			  for(i=0;i<jsonObjects.length;i++)
				  {
				    var item=document.createElement("option");
				    item.text=jsonObjects[i];
				    item.value=jsonObjects[i];
				    $("#service").append(item);
				  }
		  })
          
    }
    $(document).ready(function(){
    	$("#close").click(function(){
			//$(".outer").css("display","none")	;
			//$(".outer").slideUp();
			//$("#events").fadeOut(1000);
			$("#moredet").hide(500);
			//$(".outer").fadeTo("slow",0);
			//$(".outerdiv").css('opacity',1);

   
		});
    })
    </script>
    <style>
     #moredet
        {
            
            width: 400px; height: 750px;
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
        body
        {
            background-image:url(pics/bg2.jpg);
            overflow-x:hidden;
        }
  	.card:hover
        {
           box-shadow: 7px 7px 9px 10px black;
        }
    </style>
</head>
<body ng-app="myModule" ng-controller="myController">
<div class="container">
     
     <div>
          <center><h1><u><i>Your Favorites</i></u></h1></center>
     </div>

     <div class="form-row">
    <div class="form-group col-md-4 offset-md-4">
      <center><label for="inputState">Services</label></center>
      <select id="service" name="function" class="form-control" ng-model="q" ng-change="fetchVendors();">
       <option ng-selected="true">select</option> 
        
      </select>
    </div>
   
    </div>
    </div>
    <hr>
    <div class="container">
   <div class="form-row">
   
             <div class="card col-md-3" style="width: 18rem;border:1px solid black;" ng-repeat="obj in jsonobj">
               <img src="uploads/{{obj.pic1}}" style="border-radius:36%" class="card-img-top" >
               <div class="card-body">
                      <p class="card-text"><b>Name : </b>{{obj.name}}</p>
                      <p class="card-text"><b>Mobile Number : </b>{{obj.mobile}}</p>
                      <p class="card-text"><b>Address : </b>{{obj.address}}</p>
                      
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
					<img src="pics/{{jsonobj[i].pic1}}" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						
					</div>
				</div>
				<div class="carousel-item active">
					<img src="pics/{{jsonobj[i].pic2}}" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						
					</div>
				</div>
			</div>
		</div>
	</div>
                       </td>
                         <tr></tr>
                         <th>Name :</th>
                         <td>{{jsonobj[i].name}}</td>
                         
                         <tr></tr>
                         <th>Mobile :</th>
                         <td>{{jsonobj[i].mobile}}</td>
                         <tr></tr>
                         <th>Firm :</th>
                         <td>{{jsonobj[i].firm}}</td>
                         <tr></tr>
                         <tr></tr>
                         <th>Address :</th>
                         <td>{{jsonobj[i].address}}</td>
                         <tr></tr>
                         <th>City :</th>
                         <td>{{jsonobj[i].city}}</td>
                         <tr></tr>
                         <th>Previoes Work :</th>
                         <td>{{jsonobj[i].pwork}}</td>
                         <tr></tr>
                         <th>Established :</th>
                         <td>{{jsonobj[i].est}}</td>
                         <tr></tr>
                         <td colspan="2"><input type="button" class="btn btn-danger" style="float:right" value="close" id="close"></td>
                       </table></center>
                    </div>
                </div>
                </div></div>
    <input type="text" value=<%=session.getAttribute("uid") %> id="uid" style="display:none">
</body>
</html>