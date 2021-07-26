<%if(session.getAttribute("uid")==null)
	response.sendRedirect("index.jsp");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
<script src="js/angular.min.js"></script>
<script>
     var module=angular.module("myModule",[]);
     module.controller("myController",function($scope,$http){
    	 $scope.showVendors=function()
    	 {
    		 $scope.jsonObjects;
    		$http.get("FetchAllVendors").then(fun1,fun2)
    		function fun1(response)
    		{
    		    //alert(JSON.stringify(response.data));
    			$scope.jsonObjects=response.data;
    		}
    		function fun2(response)
    		{
    			alert();
    		}
    	 }
    	 $scope.showdetails=function(i)
    	 	{
    	 		$scope.i=i;
    	 		$("#moredet").fadeToggle(1000);
    	 	}
    	 $scope.doDelete=function(uid)
    	 {
    		 $http.get("deleteRecord?uid="+uid).then(fun1,fun2);
    		 function fun1(response)
    		 {
    			 if(response.data!="0")
    				 $scope.showVendors();
    			 else
    				 alert("invalid id");
    		 }
    	 }
     });
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
     
    /* $(document).ready(function(){
    	 //showVendors();
     });*/
</script>
<style>
body
{
  background-image:url(pics/bg2.jpg);
  background-size:cover;
  overflow-x:hidden;
}
     #moredet
        {
            
            width: 400px; height: 750px;
            border: 1px black solid;
            padding: 20px;
            background-color: beige;
            box-shadow: 0px 0px 20px 5px black;
           
            border-radius: 20px;
			position: absolute;
			margin-left:500px;
			margin-bottom:400px;
			display: none;
            z-index: 10;
            
        }
    </style>
</head>
<body data-ng-init="showVendors()" ng-app="myModule" ng-controller="myController">
      <form action="FetchAllVendors">
      	<center>
           
         <br><br><br>
		<div>
		
		<table class="table table-striped " border="1" rules="all" width="600">
			<tr><th width: 100>User ID<th width: 100>Name<th width: 100>Mobile<th width: 100>Address<th width: 100>City<th width: 100><th width: 100>
			<tr ng-repeat="object in jsonObjects">
				<td width: 100>{{object.uid}}
				<td width: 100>{{object.name}}
				<td width: 100>{{object.mobile}}
				<td width: 100>{{object.address}}
				<td width: 100>{{object.city}}
				<td width: 50><input class="btn-primary" type="button" value="more details" ng-click="showdetails($index);">
				<td width: 50><input class="btn-primary" type="button" value="delete" ng-click="doDelete(object.uid);">
		</table>
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
					<img src="pics/{{jsonObjects[i].pic1}}" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						
					</div>
				</div>
				<div class="carousel-item active">
					<img src="pics/{{jsonObjects[i].pic2}}" class="d-block w-100" alt="...">
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
                         <tr></tr>
                         <td colspan="2"><input type="button" class="btn btn-danger" style="float:right" value="close" id="close"></td>
                       </table></center>
                    </div>
                </div></div>	
	</center> 
      </form>
</body>
</html>