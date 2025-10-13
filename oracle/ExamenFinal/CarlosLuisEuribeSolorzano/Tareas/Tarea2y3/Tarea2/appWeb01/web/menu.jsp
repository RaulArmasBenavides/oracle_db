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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">   		
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script> 
        <script src="js/jsEventos.js" type="text/javascript"></script>
        <title>SUPERMERCADOS UNI</title>
    </head>
    <body class="col-md-4 col-md-offset-4 centered">
        <br/>
        <div class="panel panel-primary">
            <div class="panel-heading">SUPERMERCADOS UNI</div>
            <div class="panel-body">
                <div class="col-md-12">
                  <div align="center"><img src="image/menu.jpg" width="100%"></div>  
                  <br/>
                  <a href="insertarProducto.jsp" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;&nbsp;Nuevo Producto</a>                  
                  <a href="listarProducto" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;Listar Productos</a>
                  <a href="insertarRespuesta" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-paste" aria-hidden="true"></span>&nbsp;&nbsp;Llenar Encuesta</a>
                  <button class="btn btn-warning btn-block" onclick="return cmdSalirSistema();"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;&nbsp;Salir del Sistema</button>
                </div>
            </div>  
        </div>
    </body>
</html>

<!--Modal Confirmacion-->
<div id="confirmarSalirSistemaModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><label id="title"></label></h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    Está seguro de salir del sistema ?
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="sbtnOk" class="btn btn-primary">Si</button>
                <button type="button" id="sbtnCancel" class="btn btn-default" data-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>
