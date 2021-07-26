<%if(session.getAttribute("uid")==null)
	response.sendRedirect("index.jsp");
	%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
     <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/angular.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
     <script type="text/javascript" >
function preview_image1(event) 
{
 var reader = new FileReader();
 reader.onload = function()
 {
  var output = document.getElementById('img1');
  output.src = reader.result;
 }
 reader.readAsDataURL(event.target.files[0]);
}
function preview_image2(event) 
{
 var reader = new FileReader();
 reader.onload = function()
 {
  var output = document.getElementById('img2');
  output.src = reader.result;
 }
 reader.readAsDataURL(event.target.files[0]);
}
</script>
    <script>
      var map=angular.module("myModule",[]);
      map.controller("myController",function($scope){
    	  $scope.All=$scope.selected;
    	  $scope.doShow=function(){
    	  alert(JSON.stringify($scope.All));
    	  }
      });
    
    </script>
    <script type="text/javascript">
       
        function fetchOne()
          {
        	  var url="FetchServlet?uid="+$("#uid").val();
        	  $.getJSON(url,function(jsonObject){
        		//alert(JSON.stringify(jsonObject));
        		  $("#name").val(jsonObject.name);
        		  $("#mobile").val(jsonObject.mobile);
        		  $("#firm").val(jsonObject.firm);
        		  $("#est").val(jsonObject.est);
        		  $("#address").val(jsonObject.address);
        		  $("#city").val(jsonObject.city);
        		  $("#site").val(jsonObject.site);
        		  $("#pwork").val(jsonObject.pwork);
        	  });
          }
          function fillTextService()
          {
        	 // alert($("#service").val());
        	  var service=$("#txtservice").val();
        	 // alert(service);
        	  var temp=$("#service").val();
        	 // alert(temp);
        	 /* var ary=service.split(",");
        	  var ary1=service.split(",");
        	  var flag=false;
        	  //alert(ary.length);
        	  for(j=0;j<ary1.length;j++)
        		  {
        	  for(i=0;i<ary.length;i++)
        		  {
        		 // alert(i);
        		  if(ary1[j]==ary[j])
        			  {
        			  //alert(flag);
        			  flag=true;
        			  break;
        			  }
        		  }
        	  }
        	  alert(flag);
        	  if(flag==false)
          {
        		  if(str!="")
        			  {
        			  str+=",";
        			  }
        		  str+=$("#service").val();
        		 // alert(str);
        		  
          }*/
        	  $("#txtservice").val(temp);
          } 
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
        					    $("#event").append(item);
        					  }
        			  })
        		  }
        	  })
        	 function fillServices(event)
        	  {
        		  $("#service").html("");
        		  var item=document.createElement("option");
				    item.text="Select";
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
          
    </script>
    
    <style>
    
         body
         {
           overflow-x:hidden;
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
        .photo
        {
            height: 100;
            width: 100;
        }
    </style>
</head>
<body ng-app="myModule" ng-controller="myController">
  
      <center><span id="top">Update Profile</span></center>
  <br><br>
   <div class="container">
    <form action="VendorController" enctype="multipart/form-data" method="post">
    <div class="form-group ">
    <label for="inputAddress">User ID</label>
    <div class="form-row">
    <input type="text" class="form-control" value=<%=session.getAttribute("uid") %>  name="uid" style="width:800" id="uid"  >
    <input type="button" class="btn-primary" value="Fetch" id="fetch" onclick="fetchOne()"></div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="name">Name</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="Name">
    </div>
    <div class="form-group col-md-6">
      <label for="mobile">Contact Number</label>
      <input type="text" class="form-control" name="mobile" id="mobile"  placeholder="number">
    </div>
  </div>
   <div class="form-row">
    <div class="form-group col-md-6">
      <label for="firm">Firm</label>
      <input type="text" class="form-control" id="firm" name="firm">
    </div>
    <div class="form-group col-md-6">
      <label for="est">Established</label>
      <input type="text" name="est" id="est" class="form-control">
    </div>
  </div>
  <div class="form-row">
   <div class="form-group col-md-6">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" name="address" id="address"  placeholder="1234 Main St"></div>
  

    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" name="city" id="city" class="form-control" >
      </div>
      </div>
      <div class="form-row">
           <div class="form-group col-md-6">
      <label for="inputCity">Website</label>
      <input type="text" name="site" id="site" class="form-control" >
      </div>
      </div>
      <div class="form-row">
    <div class="form-group col-md-5">
      <label for="inputState">Provide Services For</label>
      <select id="event" name="function" class="form-control" onchange="fillServices(this.value)">
        <option selected>Choose...</option>
        
      </select>
    </div>
    </div>
    <div class="form-row">
    <div class=" form-group col-md-5">
      <label for="inputState">Services</label>
      <select id="service" name="services" multiple size="4" ng-model="selected"  onchange="fillTextService()" class="form-control"> <!--  onchange="fillTextService()" -->
        <option selected>Select</option>
    </select>
        </div></div>
        <div class="form-row " >
         <div class=" form-group col-md-5">
        <label for="inputState">Selected Services</label>
          <input type="text" id="txtservice" name="selservice" class="form-control">
        </div></div>
        <div class="form-row">
    <div class="form-group col-md-10 " >
      <label for="inputZip">Previous Work</label>
      <input type="text" class="form-control" name="pwork" id="pwork" style="height: 100;">
    </div>
  </div>
  <label for="photo">Upload Pics</label><br><br>
  <div class="form-row" style="height: 150">
     
      <div class="col-md-6 " style="text-align: center;">
          <img src="" height="150" width="150" id="img1" class="photo" alt="">
          <input type="file" name="pic1" onchange="preview_image1(event)">
      </div>
      <div class="col-md-6 " style="text-align: center">
          <img src="" height="150" width="150" class="photo" id="img2" alt="">
          <input type="file" name="pic2" onchange="preview_image2(event)">
      </div>
  </div>
 <center> 
<!--  <input type="button" ng-click="doShow();"> -->
  <input type="submit" class="btn btn-primary" value="Save" name="btn">
    <input type="submit" class="btn btn-primary" value="Update" name="btn">
</center>
</form>
</div>
</body>
</html>