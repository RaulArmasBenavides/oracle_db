<%-- 
    Document   : editarProducto
    Created on : 21-ago-2019, 22:24:05
    Author     : Carlos Euribe
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.appweb.dto.ProductoDto"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.util.*"%>
<%
    // validar si el usuario se ha logeado
    if(session.getAttribute("NombreUsuario") == null){
        response.sendRedirect("acceso.jsp");
    }
%>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="panel-heading">Modificar Producto</div>
            <div class="panel-body">
                <div class="col-md-12">
                    <form id="frmActualizarProducto" class="form-horizontal" method="post" action="actualizarProducto">
                        <% 
                            DecimalFormat priceFormatter = new DecimalFormat("0.00");
                            DecimalFormatSymbols dfs = priceFormatter.getDecimalFormatSymbols();
                            dfs.setDecimalSeparator('.');
                            priceFormatter.setDecimalFormatSymbols(dfs);
                            List<ProductoDto> productos = (ArrayList<ProductoDto>)request.getAttribute("list");
                            for(ProductoDto producto : productos)
                            {
                        %>
                        <div class="form-group">
                           <label>Codigo</label>
                           <input name="txtCodigo" class="form-control" type="text" id="txtCodigo" value="<%=producto.getCodigo()%>">
                        </div>
                        <div class="form-group">
                           <label>Nombre</label>
                           <input name="txtNombre" class="form-control" type="text" id="txtNombre" value="<%=producto.getNombre()%>">
                        </div>
                        <div class="form-group">
                           <label>Costo</label>
                           <input name="txtCosto" class="form-control" type="text" id="txtCosto" value="<%=priceFormatter.format(producto.getCosto())%>">
                        </div>    
                        <div class="form-group">
                           <label>Stock</label>
                           <input name="txtStock" class="form-control" type="text" id="txtStock" value="<%=producto.getStock()%>">
                        </div>
                        <% 
                           }
                        %>
                        <button name="btnGrabar" type="button" class="btn btn-primary" id="btnGrabar" onclick="return cmdActualizarProducto();">Grabar</button>  
                        <a href="listarProducto" type="button" class="btn btn-success btn pull-right" style="margin-left: 10px">Ir a Productos</a>
                        <a href="menu.jsp" type="button" class="btn btn-success btn pull-right">Ir al Menu</a>
                    </form>
                </div>
            </div>  
        </div>
    </body>
</html>

<!--Modal Confirmacion-->
<div id="confirmarActualizarModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><label id="title"></label></h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    Está seguro de actualizar el Producto ?
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="mbtnOk" class="btn btn-primary">Si</button>
                <button type="button" id="mbtnCancel" class="btn btn-default" data-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>