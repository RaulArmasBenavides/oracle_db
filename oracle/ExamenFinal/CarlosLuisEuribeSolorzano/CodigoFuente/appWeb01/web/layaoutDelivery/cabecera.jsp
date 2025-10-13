<%-- 
    Document   : cabecera
    Created on : 06-sep-2019, 20:17:56
    Author     : Carlos Euribe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">   	
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js"></script> 
        <script src="js/jsEventos.js" type="text/javascript"></script>
    </head>
    <body>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
            <a class="navbar-brand" href="#"><b>GLOVO UNI</b> - ENTREGA DE PEDIDOS</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="validarEmpleado" style="cursor:pointer;"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>&nbsp;&nbsp;Actualizar</a></li>
            <li><a onclick="return cmdSalirSistemaEntrega();" style="cursor:pointer;"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;&nbsp;Salir</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <br/>
    <br/>
    <br/>

