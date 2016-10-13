<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
  <head>
    <meta charset="UTF-8">
    <title>9GAG</title>
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    
    <link rel="stylesheet" href="css/normalize.css">

    
        <link rel="stylesheet" href="css/style.css">

    
    
    
  </head>

  <body>

    <div class="form">
     
      <div class="tab-content">
        <form class ="login" action="LoginServlet" method="POST">  
       
          <h1>Please log in!</h1>
          
          
          
   
            <div class="field-wrap">
              <label>
                Username<span class="req">*</span>
              </label>
              <input type="text" name="username" maxlength="30" required autocomplete="off"/>
            </div>
          

          
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" name="password" maxlength="30" required autocomplete="off"/>
          </div>
          
          <button class="button button-block" type="submit">Log in</button>
         <br>
          <button class="button button-block" type="submit" onclick="window.location.href='/MyGag/register.html'"> Register</button>
          
          </form>

        
        
        
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/index.js"></script>

    
    
    
  </body>
</html>