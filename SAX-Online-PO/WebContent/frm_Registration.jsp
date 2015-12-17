<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Server Caching Registration form</title>
<link rel="shortcut icon" href="resourcess/img/logo.png">
<link rel="stylesheet" href="resourcess/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="resourcess/css/style.css">
<link rel="stylesheet" href="resourcess/css/custom-style.css">
<script src="resourcess/js/jquery.min.1.11.1.js"></script>
<script src="resourcess/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="resourcess/js/magic.js"></script> <!-- load our javascript file -->
</head>
<body>
	<div id="loader" class="loaderBg">
		<div class="loaderPs" id="loaderImg">
			<img alt="" src="resourcess/img/loading.gif">
		</div>
	</div>
	<script type="text/javascript">
		$('#loader').fadeIn(1000); 
		$('#loaderImg').fadeIn(1000);
	</script>
<jsp:include page="header.jsp"></jsp:include>
<div class="container invoiceBody">
	<h2 class="invoiceHeading">Registration Form</h2>
	<div id="msg"></div>
	<div class="row">
		<form role="form" action="register/save" method="post">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-6">
						  <div id="fname-group" class="form-group">
						    <label for="fname">Enter first Name:</label>
						    <input type="text" name="fname" class="form-control" id="fname" required placeholder="Enter First Name">
						  </div>
					</div>
					<div class="col-md-6">
						<div id="lname-group" class="form-group">
						    <label for="lname">Enter last name</label>
						    <input type="text" name="lname" class="form-control"  id="lname" required placeholder="Enter last name">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						  <div id="email-group" class="form-group">
						    <label for="email">Email address:</label>
						    <input type="email" name="email" class="form-control" id="email" required placeholder="Enter email id">
						  </div>
					</div>
					<div class="col-md-6">
						<div id="pwd-group" class="form-group">
						    <label for="pwd">Password:</label>
						    <input type="password" name="pwd" class="form-control" id="pwd" required placeholder="Enter password">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<button type="submit" class="btn my-btn btn-block">Submit</button>
					</div>
				</div>
				<input type="hidden" id="ip" name="ip">
			</div>
		</form>
	</div>
</div>
</body>
<script type="text/javascript">
  
  //Register User
  
 $(document).ready(function() {

    // process the form
    $('form').submit(function(event) {
    	$('#loader').fadeIn(1000); 
    	$('#loaderImg').fadeIn(1000);
    	$('.form-group').removeClass('has-error'); // remove the error class
        $('.help-block').remove(); // remove the error text
        //$('#success-id').remove();
        // get the form data
        // there are many ways to get this data using jQuery (you can use the class or id also)
        var formData = {
        		'fname'    : $('input[name=fname]').val(),
                'lname'    : $('input[name=lname]').val(),
                'email'    : $('input[name=email]').val(),
                'pwd'      : $('input[name=pwd]').val()
        };
        // process the form
        $.ajax({
            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url         : 'register/save', // the url where we want to POST
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
		            if (data.errors.fname) {
		                $('#fname-group').addClass('has-error'); // add the error class to show red input
		                $('#fname-group').append('<div class="help-block">' + data.errors.fname + '</div>'); // add the actual error message under our input
		            }
		            
		         	// handle errors for last name ---------------
		            if (data.errors.lname) {
		                $('#lname-group').addClass('has-error'); // add the error class to show red input
		                $('#lname-group').append('<div class="help-block">' + data.errors.lname + '</div>'); // add the actual error message under our input
		            }
		
		            // handle errors for email ---------------
		            if (data.errors.email) {
		                $('#email-group').addClass('has-error'); // add the error class to show red input
		                $('#email-group').append('<div class="help-block">' + data.errors.email + '</div>'); // add the actual error message under our input
		            }
		
		            // handle errors for superhero alias ---------------
		            if (data.errors.pwd) {
		                $('#pwd-group').addClass('has-error'); // add the error class to show red input
		                $('#pwd-group').append('<div class="help-block">' + data.errors.pwd + '</div>'); // add the actual error message under our input
		            }
		
		        } else {
		
		            // ALL GOOD! just show the success message!
		            $('#msg').append('<div id="success-id" class="alert alert-success">' + data.message + '<br></div>');
		            setTimeout(function(){ $('#success-id').fadeOut(); window.location = 'login.htm'; }, 3000);
		            
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
</script>
</html>