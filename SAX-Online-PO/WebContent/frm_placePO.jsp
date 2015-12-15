<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Purchase Order</title>
<link rel="shortcut icon" href="resourcess/img/logo.png">
<link rel="stylesheet" href="resourcess/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="resourcess/css/style.css">
<link rel="stylesheet" href="resourcess/css/custom-style.css">

<script src="resourcess/js/jquery.min.1.11.1.js"></script>
<script src="resourcess/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="resourcess/js/jquery.ajaxfileupload.js"></script>
<style>
        #customFormView{
			display: none;
		}
		
		#xmlFormView, #poNew{
			display: none;
		}
		#customFormView td{
			padding: 2px;
			text-align: center;
		}
    </style>
    
</head>
<body style="background-image: url('resourcess/img/bg_lea1.png');">
<div id="loader" class="loaderBg">
		<div class="loaderPs" id="loaderImg">
			<img alt="" class="loaderImg" src="resourcess/img/loading.gif">
		</div>
</div>
	<script type="text/javascript">
		$('#loader').fadeIn(1000); 
		$('#loaderImg').fadeIn(1000);
	</script>
<jsp:include page="loggedHeader.jsp"></jsp:include>
<div class="container invoiceBody">
	<h3 class="invoiceHeading" style="text-shadow:2px 2px 0 #bcbcbc, 4px 4px 0 #9c9c9c;">Place Order</h3>
	<div id="msg"></div>
	<div class="row">
		<div class="col-md-12">
				
				<div class="row" id="poNew">
					<div class="col-md-12">
						<input type="button" value="Place New Order" onclick="poNew();" class="my-btn"/>
					</div>
				</div>
				
				<div id="hidePOOp">
				<div class="row">
					<div class="col-md-12">
						  <div id="fname-group" class="form-group">
						  	<div class="col-md-12">
						    	<label for="poOption">Select Place Order Option:</label>
						    </div>
						    
						    <div class="col-md-6">
						    	<input type="radio" name="poOption" id="poXML" value="opt1" onclick="poType(this.value);">
						    	<label for="poXML"><span></span>Place Order By XML File</label>
						    </div>
						    <div class="col-md-6">
						    	<input type="radio" name="poOption" id="poForm" value="opt2" onclick="poType(this.value);">
						    	<label for="poForm"><span></span>Custom Place Order</label>
						    </div>
						    
						  </div>
					</div>
				</div>
				<hr>
				<div id="xmlFormView">
				<div class="row">
					<div class="col-md-12">
						  <div id="fname-group" class="form-group">
						    <label for="file">Select PO XML:</label>
						    <input type="file" name="file" class="form-control" id="file">
						  </div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						<div id="message"></div>
					</div>
				</div>
				</div>
				<div class="row" id="customFormView">
					<form role="form" action="plcaepo/frmSubmit" method="post" id="frmPO">
					
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-6">
								  <div id="fname-group" class="form-group">
								    <label for="addressLine1">Address Line1:</label>
								    <textarea rows="" cols="" name="addressLine1" id="addressLine1" class="form-control" required placeholder="Enter address line1"></textarea>
								  </div>
							</div>
							<div class="col-md-6">
								  <div id="fname-group" class="form-group">
								    <label for="addressLine2">Address Line2:</label>
								    <textarea rows="" cols="" name="addressLine2" id="addressLine2" class="form-control" required placeholder="Enter address line2"></textarea>
								  </div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								  <div id="email-group" class="form-group">
								    <label for="city">City:</label>
								    <input type="text" name="city" class="form-control" id="city" required placeholder="Enter city">
								  </div>
							</div>
							<div class="col-md-6">
								<div id="pwd-group" class="form-group">
								    <label for="state">State:</label>
								    <input type="text" name="state" class="form-control" id="state" required placeholder="Enter state">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								  <div id="email-group" class="form-group">
								    <label for="country">Country:</label>
								    <input type="text" name="country" class="form-control" id="country" required placeholder="Enter country">
								  </div>
							</div>
							<div class="col-md-6">
								<div id="pwd-group" class="form-group">
								    <label for="zip">Zip Code:</label>
								    <input type="number" name="zip" class="form-control" id="zip" required max="999999" placeholder="Enter country">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="table-responsive col-md-12">
								<INPUT type="button" class="my-btn" value="Add Item" onclick="addRow('dataTable')" />
		 
							    <INPUT type="button" class="my-btn" value="Delete Items" onclick="deleteRow('dataTable')" />
							 	<hr style="margin-top:0px;margin-bottom:0px; background: orange;">
							 	<table width="100%">
							    		<tr style="background: rgb(0, 139, 139);">
							    			<td style="width: 10%;">Select Multiple</td>
							    			<td style="width: 45%;">Item Code</td>
							    			<td style="width: 45%;">Item Quantity</td>
							    		</tr>
							 	</table>
							    <TABLE id="dataTable" width="100%" style="padding-top: 5px;">
							    	
							        <TR>
							            <TD style="width: 10%;"><INPUT type="checkbox" name="chk[]"/></TD>
							            
							            <TD style="width: 45%;">
							                <SELECT name="itemCode[]" class="form-control" required>
							                    <OPTION value="1">1</OPTION>
							                    <OPTION value="2">2</OPTION>
							                    <OPTION value="3">3</OPTION>
							                    <OPTION value="4">4</OPTION>
							                    <OPTION value="5">5</OPTION>
							                </SELECT>
							            </TD>
							            <TD style="width: 45%;"><INPUT type="number" min="1" class="form-control" name="quantity[]" required placeholder="Enter quantity"/></TD>
							        </TR>
							    </TABLE>
							</div>
							
						</div>
						<hr>
						<div class="row">
							<div class="col-md-12">
								<input type="submit" value="Place Order" class="my-btn btn-block"/>
							</div>
						</div>
					</div>
					
					
					
					</form>
				</div>
				</div>
			<div class="row">
				<div class="table-responsive col-md-12"> 
					<hr>
					<div id="res" class="invoice"></div>			
							
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">

///////////////////////////////////////////////////////////
/////////// Setting Place Order option xml/form //////////
/////////////////////////////////////////////////////////
function poType(poTypeVal) {
	if(poTypeVal == "opt1"){
		document.getElementById('xmlFormView').style.display = "block";
		document.getElementById('customFormView').style.display = "none";
		$("#res").html("");
		
	}else{
		document.getElementById('customFormView').style.display = "block";
		document.getElementById('xmlFormView').style.display = "none";
		$("#res").html("");
	}
}

function poNew() {
	document.getElementById('poNew').style.display = "none";
	document.getElementById('hidePOOp').style.display = "block";
	document.getElementById('xmlFormView').style.display = "none";
	document.getElementById('customFormView').style.display = "none";
	$("#res").html("");
	$("#msg").html("");
}

///////////////////////////////////////////////////////////
/////XML FIle uploding using ajax file upload/////////////
/////////////////////////////////////////////////////////
 $(document).ready(function() {
	$('input[type="file"]').ajaxfileupload({
		'action' : 'plcaepo/uploadXML',
		'onComplete' : function(response) {
			$('#loader').fadeOut(1000);
	        $('#loaderImg').fadeOut(1000);
	        $('#message').show();
	        $("#msg").html("");
			
			var statusVal = JSON.stringify(response.status);
			console.log("Respose :::> "+JSON.stringify(response));
			if(statusVal == "false")
			{
				$("#message").html("<font color='red'>"+ JSON.stringify(response.message) +" </font>");
				$('#msg').append('<div id="success-id" class="alert alert-danger fade in">'+ JSON.stringify(response.message) +'<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>');
			}	
			if(statusVal == "true")
			{
				$('#hidePOOp').fadeOut(1000);
		        $('#poNew').fadeIn(1000);
				$("#message").html("<font color='green'>"+ JSON.stringify(response.message) +" </font>");
				$('#msg').append('<div id="success-id" class="alert alert-success fade in">Your order is placed successfully<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>');
			}			
		},
		'onStart' : function() {
			$('#loader').fadeIn(1000); 
			$('#loaderImg').fadeIn(1000);
			$('#message').hide();
		}
	});
}); 
 

//=================================================================
 ///////////////////////////////////////////////////////////
///////////////////ajax form submit////////////////////////
/////////////////////////////////////////////////////////
  
 $(document).ready(function() {

    // process the form
    $('#frmPO').submit(function(event) {
    	$("#msg").html("");
    	$('#loader').fadeIn(1000); 
    	$('#loaderImg').fadeIn(1000);
    	$('.form-group').removeClass('has-error'); // remove the error class
        $('.help-block').remove(); // remove the error text
        //$('#success-id').remove();
        // get the form data
        // there are many ways to get this data using jQuery (you can use the class or id also)
       var postData = $(this).serializeArray();
        // process the form
        $.ajax({
            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url         : 'plcaepo/frmSubmit', // the url where we want to POST
            data        : postData, // our data object
            success:function(data, textStatus, jqXHR) 
            {
                //data: return data from server
                $('#res').html(data);
                $('#hidePOOp').fadeOut(1000);
    	        $('#poNew').fadeIn(1000);
    	        $('#msg').append('<div id="success-id" class="alert alert-success fade in">Your order is placed successfully<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>');
            },
            error: function(jqXHR, textStatus, errorThrown) 
            {
            	//alert('error!!!!!!!!!');
            	$('#msg').append('<div id="success-id" class="alert alert-danger fade in">Server internal problem, Please try again<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>');
                //if fails      
            }
        });
        $('#loader').fadeOut(1000);
        $('#loaderImg').fadeOut(1000);

        // stop the form from submitting the normal way and refreshing the page
        event.preventDefault();
    });

});
 $( window ).load(function() {
	  $('#loader').fadeOut(1000);
      $('#loaderImg').fadeOut(1000);
      
      $('#m2').addClass('active');
      $('#m1').removeClass('active');
 });
 
///////////////////////////////////////////////////////////
/////////////////Item row adder///////////////////////////
/////////////////////////////////////////////////////////
 function addRow(tableID) {
	 
     var table = document.getElementById(tableID);

     var rowCount = table.rows.length;
     var row = table.insertRow(rowCount);

     var colCount = table.rows[0].cells.length;

     for(var i=0; i<colCount; i++) {

         var newcell = row.insertCell(i);

         newcell.innerHTML = table.rows[0].cells[i].innerHTML;
         //alert(newcell.childNodes);
         switch(newcell.childNodes[0].type) {
             case "text":
                     newcell.childNodes[0].value = "";
                     break;
             case "checkbox":
                     newcell.childNodes[0].checked = false;
                     break;
             case "select-one":
                     newcell.childNodes[0].selectedIndex = 0;
                     break;
         }
     }
 }

///////////////////////////////////////////////////////////
/////////////////////Item row deleter/////////////////////
/////////////////////////////////////////////////////////
 function deleteRow(tableID) {
     try {
     var table = document.getElementById(tableID);
     var rowCount = table.rows.length;

     for(var i=0; i<rowCount; i++) {
         var row = table.rows[i];
         var chkbox = row.cells[0].childNodes[0];
         if(null != chkbox && true == chkbox.checked) {
             if(rowCount <= 1) {
                 alert("Cannot delete all the rows.");
                 break;
             }
             table.deleteRow(i);
             rowCount--;
             i--;
         }


     }
     }catch(e) {
         alert(e);
     }
 }
</script>
</html>