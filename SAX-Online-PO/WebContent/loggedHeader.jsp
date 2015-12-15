<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="#" style="text-shadow:#2e2e2e 0 4px 5px;">Bulk Order System.</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li id="m1" class="active"><a href="home.htm">Home</a></li>
        <li id="m2"><a href="plcaepo.htm">Place Order</a></li> 
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span>
        <% 
        	if(session.getAttribute("fname") != null){
        		String fname = (String)session.getAttribute("fname");
        		String lname = (String)session.getAttribute("lname");
        		out.print(fname+" "+lname);
        	}else{
        		response.sendRedirect("login.htm");
        	}
        %>
        </a>
       </li>
        <li><a href="logout"><span class="glyphicon glyphicon-off"></span> Log Out</a></li>
      </ul>
    </div>
  </div>
  <script type="text/javascript">
  	function activeMenue(menue) {
		
	}
  </script>
</nav>