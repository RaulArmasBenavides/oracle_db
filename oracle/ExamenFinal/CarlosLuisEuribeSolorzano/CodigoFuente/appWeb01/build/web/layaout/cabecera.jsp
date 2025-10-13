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
            <a class="navbar-brand" href="#"><b>GLOVO UNI</b> - CONTROL DE PEDIDOS</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;Clientes <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="listarCliente"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;Listar Clientes</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-tag" aria-hidden="true"></span>&nbsp;&nbsp;Productos <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="insertarProducto.jsp"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;&nbsp;Nuevo Producto</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="listarProducto"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;Listar Productos</a></li>
              </ul>
            </li>
            <li><a onclick="return cmdSalirSistema();" style="cursor:pointer;"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;&nbsp;Salir</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <br/>
    <br/>
    <br/>
