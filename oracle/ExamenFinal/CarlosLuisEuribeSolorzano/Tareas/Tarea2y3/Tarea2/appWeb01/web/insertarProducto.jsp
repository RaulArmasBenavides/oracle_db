<%-- 
    Document   : insertProducto
    Created on : 17/08/2019, 11:54:36 AM
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
            ${errors}
            <div class="panel-heading">Nuevo Producto</div>
            <div class="panel-body">
                <div class="col-md-12">
                    <form id="frmRegistrarProducto" class="form-horizontal" method="post" action="insertarProducto">
                        <div class="form-group">
                           <label>Código</label>
                           <input name="codigo" class="form-control" type="text" id="codigo" value="${producto.codigo}" placeholder="código del producto">
                        </div>
                        <div class="form-group">
                           <label>Nombre</label>
                           <input name="nombre" class="form-control" type="text" id="nombre" value="${producto.nombre}" placeholder="nombre del producto">
                        </div>
                        <div class="form-group">
                           <label>Costo</label>
                           <input name="costo" class="form-control" type="text" id="costo" value="${producto.costo}" placeholder="costo del producto">
                        </div>    
                        <div class="form-group">
                           <label>Stock</label>
                           <input name="stock" class="form-control" type="text" id="stock" value="${producto.stock}" placeholder="stock del producto">
                        </div>    
                        <button name="btnGrabar" type="button" class="btn btn-primary" id="btnGrabar" onclick="return cmdRegistrarProducto();">Grabar</button>   
                        <a href="listarProducto" type="button" class="btn btn-success btn pull-right" style="margin-left: 10px">Ir a Productos</a>
                        <a href="menu.jsp" type="button" class="btn btn-success btn pull-right">Ir al Menu</a>
                    </form>
                </div>
            </div>  
        </div>  
    </body>
</html>

<!--Modal Confirmacion-->
<div id="confirmarRegistrarModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><label id="title"></label></h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    Está seguro de registrar el Producto ?
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="rbtnOk" class="btn btn-primary">Si</button>
                <button type="button" id="rbtnCancel" class="btn btn-default" data-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>