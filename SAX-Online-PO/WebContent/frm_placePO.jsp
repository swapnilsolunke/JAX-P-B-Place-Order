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
<link rel="stylesheet" href="resourcess/css/TableCSSCode.css">

<script src="resourcess/js/jquery.min.1.11.1.js"></script>
<script src="resourcess/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="resourcess/js/jquery.ajaxfileupload.js"></script>
<style>
        .loaderBg{
            top:0;
            margin-top : 6%;
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
        /* .loaderImg{
        	width: ;
        	height: 70%;
        } */
        .invoice{
			background: #353e47;
		    border: 1px solid #4a545e;
		    border-radius:8px;
		    -webkit-border-radius:8px;
		    -moz-border-radius:8px;
		    box-shadow: 5px 5px 22px -2px rgba(0, 0, 0, 0.5);
		    -webkit-box-shadow: 5px 5px 22px -2px rgba(0, 0, 0, 0.5);
		    -moz-box-shadow: 5px 5px 22px -2px rgba(0, 0, 0, 0.5);
		    margin-bottom:20px;
		    padding: 15px 26px;
		}
		.invoiceBody{
			background: rgb(117, 165, 114);
		    border: 1px solid rgb(117, 165, 114);
		    border-radius:0px;
		    -webkit-border-radius:0px;
		    -moz-border-radius:0px;
		    box-shadow: 5px 5px 22px -2px rgba(0, 0, 0, 0.7);
		    -webkit-box-shadow: 5px 5px 22px -2px rgba(0, 0, 0, 0.7);
		    -moz-box-shadow: 5px 5px 22px -2px rgba(0, 0, 0, 0.7);
		    margin-bottom:20px;
		    padding: 15px 26px;
		}
        .label_title{
			background:url(resourcess/img/ribbons.png) repeat-y; height: 40px; line-height: 30px; padding-left:40px;
			width: 200px;
		}

		.invoiceHeading{
			background: rgba(76, 175, 80, 0.02);
		    border: 1px solid rgba(74, 84, 94, 0.08);
		    border-radius:8px;
		    -webkit-border-radius:8px;
		    -moz-border-radius:8px;
		    box-shadow: 5px 5px 22px -2px rgba(0, 0, 0, 0.7);
		    -webkit-box-shadow: 5px 5px 22px -2px rgba(0, 0, 0, 0.7);
		    -moz-box-shadow: 5px 5px 22px -2px rgba(0, 0, 0, 0.7);
		    margin-bottom:20px;
		    padding: 15px 26px;
		}


		body{
			color: white;
		}
		
		#customFormView{
			display: none;
		}
		
		#xmlFormView{
			display: none;
		}
		#customFormView td{
			padding: 2px;
			text-align: center;
		}
		
		
		.my-btn, .my-btn:link, .my-btn:visited {
		    color: #FFFFFF;
		    background-color: rgba(255, 152, 0, 0.65);
		    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
		}
		.my-btn {
		    border: none;
		    display: inline-block;
		    outline: 0;
		    padding: 6px 16px;
		    vertical-align: middle;
		    overflow: hidden;
		    text-decoration: none !important;
		    color: #fff;
		    background-color: #D59E30;
		    text-align: center;
		    transition: .2s ease-out;
		    cursor: pointer;
		    white-space: nowrap;
		}
		.my-btn:hover,.my-btn:active {
		    background-color:#ffffff;
		    color:#8AC007;
		    box-shadow:0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
		}
		
		.box {
		  position: relative;
		  background-color: #fff;
		  box-shadow: 0 1px 5px rgba(0,0,0,0.25), 0 0 50px rgba(0,0,0,0.1) inset;
		  border-radius: 0%     12%     14%     27% /     40%     0%     0%     13%;
		}
		.box:before {
		      position: absolute;
		      width: 94%;
		      height: 22%;
		      left: 3%;
		      border-radius: 48%;
		      z-index: -1;
		      top: 1%;
		      content: "";
		      box-shadow: 0 -7px 19px rgba(0,0,0,0.41);
		      }
		.box:after {
		      position: absolute;
		      width: 94%;
		      height: 22%;
		      left: 3%;
		      border-radius: 48%;
		      z-index: -1;
		      bottom: 1%;
		      content: "";
		      box-shadow: 0 7px 19px rgba(0,0,0,0.41);
		      }
		 select option {
		    margin:40px;
		    background: rgb(117, 165, 114);
		    color:#fff;
		    text-shadow:0 1px 0 rgba(0,0,0,0.4);
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
 $(document).ready(function() {
	$('input[type="file"]').ajaxfileupload({
		'action' : 'plcaepo/uploadXML',
		'onComplete' : function(response) {
			$('#loader').fadeOut(1000);
	        $('#loaderImg').fadeOut(1000);
	        $('#message').show();
			
			var statusVal = JSON.stringify(response.status);
			console.log("Respose :::> "+JSON.stringify(response));
			if(statusVal == "false")
			{
				$("#message").html("<font color='red'>"+ JSON.stringify(response.message) +" </font>");
			}	
			if(statusVal == "true")
			{
				$("#message").html("<font color='green'>"+ JSON.stringify(response.message) +" </font>");
			}			
		},
		'onStart' : function() {
			$('#loader').fadeIn(1000); 
			$('#loaderImg').fadeIn(1000);
			$('#message').hide();
		}
	});
}); 
 
  //Register User
/*  //callback handler for form submit
$("#frmPO").submit(function(e)
{
    var postData = $(this).serializeArray();
    var formURL = $(this).attr("action");
    $.ajax(
    {
        url : formURL,
        type: "POST",
        data : postData,
        success:function(data, textStatus, jqXHR) 
        {
            //data: return data from server
        },
        error: function(jqXHR, textStatus, errorThrown) 
        {
            //if fails      
        }
    });
    e.preventDefault(); //STOP default action
    e.unbind(); //unbind. to stop multiple form submit.
});
 
$("#frmPO").submit(); //Submit  the FORM */
//=================================================================
  
  
 $(document).ready(function() {

    // process the form
    $('#frmPO').submit(function(event) {
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
            },
            error: function(jqXHR, textStatus, errorThrown) 
            {
            	alert('error!!!!!!!!!');
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
 
 /**
 
 */
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