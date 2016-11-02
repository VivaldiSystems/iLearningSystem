{config_load file="test.conf" section="setup"}


{include file="headerlogin.tpl" title=Innovakids}


<div id="wrapper">
   
  <div class="content">

 
    <div class="container">
        
        <div class="row">
                   
            
         <script type="text/javascript">

  // Original JavaScript code by Chirp Internet: www.chirp.com.au
  // Please acknowledge use of this code by including this header.

         var Type;
         var Url;
         var Data;
         var ContentType;
         var DataType;
         var ProcessData;
    
             
   
        function GetLogin() 
        {
                 
                document.getElementById('invalid').innerHTML =  'Logging In...';
                        
                
            var strpw = document.getElementById('Password').value;
             
                strpw = encode(strpw);
            
              //alert(strpw);
            
                
        window.location="index.php?username="+document.getElementById('EmailLogin').value+"&zipzot="+strpw;
                 
         }
            

function encode(str) {
    var encoded = "";
    for (i=0; i<str.length;i++) {
        var a = str.charCodeAt(i);
        var b = a ^ 123;    // bitwise XOR with any number, e.g. 123
        encoded = encoded+String.fromCharCode(b);
    }
    return encoded;
}



    </script>
    
    
    
                    <!-- Right Column -->
 <div class="account-wrapper">

    <div class="account-body">

      <h3>Welcome to Innovakids.</h3>
        <h3>Administrative Login</h3>

      <h5>Please sign in to get access.</h5>

    

        <div class="form-group">
          <label for="login-username" class="placeholder-hidden">Email Login</label>
          <input type="text" class="form-control" id="EmailLogin" placeholder="Username" tabindex="1">
        </div> <!-- /.form-group -->

        <div class="form-group">
          <label for="login-password" class="placeholder-hidden">Password</label>
          <input type="Password" class="form-control" id="Password" placeholder="Password" tabindex="2">
        </div> <!-- /.form-group -->

        <div class="form-group clearfix">
          <div class="pull-left">                                       
            <label class="checkbox-inline">
            <input type="checkbox" class="" value="" tabindex="3"> <small>Remember me</small>
            </label>
            
          </div>


 <label for="invalid" id="invalid" class="placeholder-hidden" style="color:Red"></label>

          <div class="pull-right">
            <small><a href="./account-forgot.html">Forgot Password?</a></small>
          </div>
        </div> <!-- /.form-group -->

        <div class="form-group">
          <button type="button" class="btn btn-primary btn-block btn-lg" tabindex="4"
               onclick="GetLogin();" >
            Signin &nbsp; <i class="fa fa-play-circle"></i>
          </button>
        </div> <!-- /.form-group -->

    <!--   onclick="window.location.href='mainmenu.html'" -->


    </div> <!-- /.account-body -->

    <div class="account-footer">
      <p>
      Ver 1.2    Don't have an account? &nbsp;
      <a href="./account-signup.php" class="">Create an Account!</a>
           <label class="checkbox-inline">
          <a href="account-terms.php" target="_blank">Terms of Service</a> &amp; <a href="account-privacy.php" target="_blank">Privacy Policy</a>
          </label>
      </p>
    </div> <!-- /.account-footer -->

  </div> <!-- /.account-wrapper -->
                <!-- End Right Column -->
    
    
    
    
    
  </div>
</div>
</div>                


<!-- Plugin JS -->


{include file="footer.tpl"}
