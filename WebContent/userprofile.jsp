
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
       <script type="text/javascript" >
function preview_image(event) 
{
 var reader = new FileReader();
 reader.onload = function()
 {
  var output = document.getElementById('img');
  output.src = reader.result;
 }
 reader.readAsDataURL(event.target.files[0]);
}
  
</script>
<style type="text/css">
 body
 {
 overflow-x:hidden;
 }
</style>
</head>
<body>
<div style="background-color: dimgrey;text-align: center;padding-top: 8;border:2px solid black ">
        <h2 style="color:white">UPDATE PROFILE</h2>

    </div>
    <br><br>
    <div class="container">
        
            <form action="UserController" method="post" enctype="multipart/form-data">
                

                    <div class="form-row col-md-4"  style="display: flex;flex-wrap:wrap;justify-content: space-between;width: 400">


              <label for="">User ID</label>
                        <input type="text" class="form-control" value=<%=session.getAttribute("uid") %>  name="uid" style="width: 200">
                        </div>

                <div id="outer" style="display: flex;border: 0px solid black;box-sizing: border-box">
                    <div id="left" class="col-md-4" style="float: left;border: 0px solid black">
                        <div class="form-row">
                            
                                <label for="Name">Name</label>
                                <input type="text" class="form-control"  id="inputEmail4" name="name" placeholder="Name">
                            
                        </div>
                        <div class="form-row">
                            
                                <label for="Mobile">Mobile Number</label>
                                <input type="text" class="form-control" style="" name="phone" id="inputPassword4" placeholder="Mobile Number">
                            
                        </div>
                    </div>
                    <div id="right" class="col-md-8" style="float: right;text-align: center;border: 0px solid black;padding-top: 15">
                        <img src="" height=150 width=150 style="border-radius: 50%" alt="" id="img">
                        <input type="file" name="pic" onchange="preview_image(event)" >
                        
</div>
                    </div>
                <div class="form-row col-md-12" style="margin-left:30">
               
                    <label for="inputAddress">Address</label>
                    <input type="text" class="form-control" id="inputAddress" name="address" placeholder="1234 Main St">
               </div>
                <div class="form-row col-md-12">
                    <div class="col-md-6">
                        <label for="inputCity">City</label>
                        <input type="text" class="form-control" name="city" id="inputCity">
                    </div>
                    <div class=" col-md-4">
                        <label for="inputState">State</label>
                        <select id="inputState" name="state" class="form-control">
                            <option selected>Choose...</option>
                            <option value="Punjab">Punjab</option>
                            <option value="Himachal Pradesh">Himachal Pradesh</option>
                            <option value="Haryana">Haryana</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label for="inputZip">Zip</label>
                        <input type="text" class="form-control" name='code' id="inputZip">
                    </div>
                </div><br><br>
                    <center>
                    <input type="submit" class="btn btn-primary" name="btn" value="Save">
                    <input type="submit" class="btn btn-primary" name="btn" value="Update">
                    </center>
            
           </form>
        </div>
    
<div style="height: 140; background-color: dimgray"></div>
</body>
</html>