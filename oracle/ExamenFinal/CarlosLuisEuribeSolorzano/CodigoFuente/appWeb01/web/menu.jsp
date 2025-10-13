<%-- 
    Document   : menu
    Created on : 17/08/2019, 11:46:46 AM
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
    // validar si el usuario se ha logeado
    if(session.getAttribute("NombreUsuario") == null){
        response.sendRedirect("acceso.jsp");
    }
%>    
<!DOCTYPE html>
<%@include file="layaout/cabecera.jsp" %>

<div class="container">
    <!--
    <div class="col-md-4 col-md-offset-4 centered">
        <br/>
        <div class="panel panel-primary">
            <div class="panel-heading">SUPERMERCADOS UNI</div>
            <div class="panel-body">
                <div class="col-md-12">
                  <div align="center"><img src="image/menu.jpg" width="100%"></div>  
                  <br/>
                  <a href="insertarProducto.jsp" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;&nbsp;Nuevo Producto</a>                  
                  <a href="listarProducto" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;Listar Productos</a>
                  <a href="listarCliente" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;Listar Clientes</a>
                  <a href="insertarRespuesta" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-paste" aria-hidden="true"></span>&nbsp;&nbsp;Llenar Encuesta</a>
                  <button class="btn btn-warning btn-block" onclick="return cmdSalirSistema();"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;&nbsp;Salir del Sistema</button>
                </div>
            </div>  
        </div>
    </div>
    -->
</div>
<%@include file="layaout/pie.jsp" %>

