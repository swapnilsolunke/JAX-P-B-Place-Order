<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Server Caching Login Form</title>
<link rel="shortcut icon" href="resourcess/img/logo.png">
<link href='' rel='stylesheet' type='text/css'>
<style>
h1, input::-webkit-input-placeholder, btn1 {
  font-family: 'roboto', sans-serif;
  -webkit-transition: all 0.3s ease-in-out;
          transition: all 0.3s ease-in-out;
}

h1 {
  height: 100px !important;
  width: 100% !important;
  font-size: 18px !important;
  background: #18aa8d !important;
  color: white !important;
  line-height: 150% !important;
  border-radius: 3px 3px 0 0 !important;
  box-shadow: 0 2px 5px 1px rgba(0, 0, 0, 0.2) !important;
}

form {
  background-color: rgba(245, 242, 242, 0.9);
  box-sizing: border-box !important;
  width: 260px !important;
  margin: 100px auto 0 !important;
  box-shadow: 2px 2px 5px 1px rgba(0, 0, 0, 0.2) !important;
  padding-bottom: 40px !important;
  border-radius: 3px !important;
}
form h1 {
  box-sizing: border-box !important;
  padding: 20px !important;
}

input {
  margin: 40px 25px !important;
  width: 200px;
  display: block;
  border: none;
  padding: 10px 0 !important;
  border-bottom: solid 1px #1abc9c;
  -webkit-transition: all 0.3s cubic-bezier(0.64, 0.09, 0.08, 1) !important;
          transition: all 0.3s cubic-bezier(0.64, 0.09, 0.08, 1) !important;
  background: -webkit-linear-gradient(top, rgba(255, 255, 255, 0) 96%, #1abc9c 4%) !important;
  background: linear-gradient(to bottom, rgba(255, 255, 255, 0) 96%, #1abc9c 4%) !important;
  background-position: -200px 0 !important;
  background-size: 200px 100% !important;
  background-repeat: no-repeat !important;
  color: #0e6252 !important;
}
input:focus, input:valid {
  box-shadow: none ;
  outline: none;
  background-position: 0 0;
}
input:focus::-webkit-input-placeholder, input:valid::-webkit-input-placeholder {
  color: #1abc9c;
  font-size: 11px;
  -webkit-transform: translateY(-20px);
          transform: translateY(-20px);
  visibility: visible;
}

.btn1{
  border: none;
  background: #1abc9c;
  cursor: pointer;
  border-radius: 3px;
  padding: 6px;
  width: 200px;
  color: white;
  margin-left: 25px;
  box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.2);
}
.btn1:hover,a:hover {
  -webkit-transform: translateY(-3px);
      -ms-transform: translateY(-3px);
          transform: translateY(-3px);
  box-shadow: 0 6px 6px 0 rgba(0, 0, 0, 0.2);
}
link{
	margin-top: 10px;
}
</style>

<style>
        .loaderBg{
            top:0;
            /* margin-top : 6%; */
            width:100%;
            height:100%;
            opacity:0.9;
            background:#fff;
            position:fixed;
            display:none;
            z-index:300;
        }
        .loaderPs{
            padding:20px;
            position:fixed;
            top:30%;
            left:40%; 
            right:auto;
            display:none;
            width:20%;
            text-align:center;
            border-radius:30px;
            z-index:301;
            font-size: 15px;
        } 
        .errMsgContent{
            background-color:#8cf391;
            border:10px solid #34a53a;            
            color:#1a3009;
        }
        .errMsgContent1{
            background-color:#FFA500;
            border:10px solid #c58043;            
            color:#1a3009;
        }        
        .errMsgContent2{
            background-color:#FF761b;
            border:10px solid #ba5614;            
            color:#000000;
        }
    </style>

 

<!-- load our javascript file -->
<link rel="stylesheet" href="resourcess/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="resourcess/js/jquery.min.1.11.1.js"></script>
<script src="resourcess/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<%/*Background video library */ %>
<link rel="stylesheet" href="resourcess/Back_Vid/css/fullscreenDemo.css">
<script src="resourcess/Back_Vid/js/vidbg.js"></script>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
	<div id="loader" class="loaderBg">
		<div class="loaderPs" id="loaderImg">
			<img alt="" src="resourcess/img/loading.gif">
		</div>
	</div>
	<script type="text/javascript">
		$('#loader').fadeIn(1000); 
		$('#loaderImg').fadeIn(1000);
	</script>
	<div id="msg" style="font-size: 15px;"></div>
	<form>
	  
	  <h1>User Login</h1>
	  <div id="email-group" class="form-group">
	  	<input placeholder="Email" name="email" type="text" required="">
	  </div>
	  <input placeholder="Password" name="pwd" type="password" required="">
	  <button class="btn1">Submit</button>
	  <a class="link" href="#" style="margin-left: 1px;float: left;">Forgot password?</a> <a class="link" href="register.htm" style="margin-right: 1px;float: right;">Not a Member?</a> 
	  
	</form>
</div>


<script type="text/javascript">
$(document).ready(function() {

    // process the form
    $('form').submit(function(event) {
    	//$('.errorDiv').removeClass('has-error'); // remove the error class
    	$('#loader').fadeIn(1000); 
		$('#loaderImg').fadeIn(1000);
    	$('.form-group').removeClass('has-error'); 
        $('.help-block').remove(); // remove the error text
        $('#success-id').remove();
        //$('#success-id').remove();
        // get the form data
        // there are many ways to get this data using jQuery (you can use the class or id also)
        var formData = {
        		
                'email'    : $('input[name=email]').val(),
                'pwd'      : $('input[name=pwd]').val()
                
        };
		
        // process the form
        $.ajax({
            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url         : 'login/validate', // the url where we want to POST
            data        : formData, // our data object
            dataType    : 'json', // what type of data do we expect back from the server
            encode      : true
        })
            // using the done promise callback
            .done(function(data) {

                // log data to the console so we can see
                console.log(data); 

                // here we will handle errors and validation messages
                // here we will handle errors and validation messages
		        if ( ! data.success) {
		            
		            // handle errors for first name ---------------
		            if (data.errors.error) {
		                
		                $('#msg').append('<div id="success-id" class="alert alert-danger fade in">' + data.errors.error + '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>'); // add the actual error message under our input
		            }
		         	// handle errors for email ---------------
		            if (data.errors.email) {
		                $('#email-group').addClass('has-error'); // add the error class to show red input
		                $('#email-group').append('<div class="help-block">' + data.errors.email + '</div>'); // add the actual error message under our input
		            }
		            
		        } else {
		
		            // ALL GOOD! just show the success message!
		            $('#msg').append('<div id="success-id" class="alert alert-success fade in">' + data.message + '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>');
		            setTimeout(function(){ $('#success-id').fadeOut(); window.location = 'home.htm'; }, 3000);
		            
		            // usually after form submission, you'll want to redirect
		             // redirect a user to another page
		            //alert('success'); // for now we'll just alert the user
		
		        }
		        $('#loader').fadeOut(1000);
		        $('#loaderImg').fadeOut(1000);
            });

        // stop the form from submitting the normal way and refreshing the page
        event.preventDefault();
    });

});
$( window ).load(function() {
	  $('#loader').fadeOut(1000);
    $('#loaderImg').fadeOut(1000);
});

jQuery(function($){
    $('body').vidbg({
        'mp4': 'resourcess/Back_Vid/demo1/vid/Meeting-Room/Meeting-Room.mp4',
        'webm': 'resourcess/Back_Vid/demo1/vid/Meeting-Room/Meeting-Room.webm',
        'poster': 'resourcess/Back_Vid/demo1/vid/Meeting-Room/Meeting-Room.jpg'
    }, {
      // Options
      muted: true,
      loop: true,
		overlay: true,
    });
});
</script>

</body>
</html>