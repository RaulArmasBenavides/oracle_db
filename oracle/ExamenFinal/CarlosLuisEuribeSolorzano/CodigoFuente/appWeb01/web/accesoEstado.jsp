<%-- 
    Document   : accesoEstado
    Created on : 04-sep-2019, 19:26:06
    Author     : Carlos Euribe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
    // validar si el usuario se ha logeado
    if(session.getAttribute("NombreCliente") != null){
        if(session.getAttribute("NombreCliente") == "Cliente"){
            session.setAttribute("NombreCliente", null);
            session.setAttribute("Usuario", null);
            //session.invalidate(); 
        }
    }
%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">   	
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js"></script> 
    </head>
    <body class="col-md-4 col-md-offset-4 centered">
        <form class="form-signin" method="post" action="validarCliente">
            <center><img class="text-center" src="image/controldelivery.png" alt=""></center>
            <h1 class="h3 mb-3 font-weight-normal text-center"><b>ESTADO DE PEDIDOS</b></h1>
            <h3 class="h3 mb-3 font-weight-normal text-center">Por favor ingrese</h3>
            <label for="txtUsuario" class="sr-only">Usuario</label>
            <input type="text" id="txtUsuario" name="txtUsuario" class="form-control" placeholder="Usuario" required autofocus>
            <br/>
            <label for="txtClave" class="sr-only">Password</label>
            <input type="password" id="txtClave" name="txtClave" class="form-control" placeholder="Contraseña" required>
            <br/>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>
            <p class="mt-5 mb-3 text-muted text-center">Glovo UNI&copy; 2019</p>
            <div align="center">
                <%if(request.getAttribute("validar")!=null){%>
                  <font color="#FF0000" face="Arial">
                    <b>Datos incorrectos!!</b>
                  </font>
                <%}%> 
            </div>
        </form>
    </body>
</html>