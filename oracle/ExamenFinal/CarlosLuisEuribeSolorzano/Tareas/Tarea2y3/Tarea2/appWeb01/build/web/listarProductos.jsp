<%-- 
    Document   : listProductos
    Created on : 17/08/2019, 01:36:15 PM
    Author     : alumno
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.appweb.dto.ProductoDto"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
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
        <script src="js/bootstrap.min.js"></script> 
        <script src="js/jsEventos.js" type="text/javascript"></script>
        <title>SUPERMERCADOS UNI</title>
    </head>
    <body class="col-md-8 col-md-offset-2 centered">
        <br/>
        <div class="panel panel-primary">
            <div class="panel-heading">Listado de Productos</div>
              <table class="table table-bordered table-hover">
                <tr>
                  <th class='text-center'>Código</th>
                  <th class='text-center'>Nombre</th>
                  <th class='text-center'>Precio</th>
                  <th class='text-center'>Stock</th>
                  <th class='text-center'>Modificar</th>
                  <th class='text-center'>Eliminar</th>
                </tr>
                <% 
                  DecimalFormat priceFormatter = new DecimalFormat("0.00");
                  DecimalFormatSymbols dfs = priceFormatter.getDecimalFormatSymbols();
                  dfs.setDecimalSeparator('.');
                  priceFormatter.setDecimalFormatSymbols(dfs);
                  List<ProductoDto> productos = (ArrayList<ProductoDto>)request.getAttribute("list");
                  String cmdEliminar = "";
                  for(ProductoDto producto : productos)
                  {
                      out.print("<tr>");
                      out.print("<td class='text-center'>" + producto.getCodigo() + "</td>");
                      out.print("<td>" + producto.getNombre() + "</td>");
                      out.print("<td class='text-right'>" + priceFormatter.format(producto.getCosto()) + "</td>");
                      out.print("<td class='text-right'>" + producto.getStock() + "</td>");
                      out.print("<td class='text-center'><a class='btn btn-primary btn-xs' href='verProducto?txtCodigo=" + producto.getCodigo() + "'>Modificar</a></td>");
                      cmdEliminar = "onclick='return cmdEliminarProducto(" + '"' + producto.getCodigo() + '"' + ");'";
                      out.print("<td class='text-center'><button type='button' class='btn btn-danger btn-xs' " + cmdEliminar + ">Eliminar</button></td>");
                      out.print("</tr>");
                  }
                %>
                </tr>
                <tr><td colspan="6"><a href="menu.jsp" type="button" class="btn btn-success btn pull-right">Ir al Menu</a></td></tr>
              </table>
            </div>
        </div>     
    </body>
</html>

<!--Modal Confirmacion-->
<div id="confirmarEliminarModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><label id="title"></label></h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    Está seguro de eliminar el Producto ?
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="ebtnOk" class="btn btn-primary">Si</button>
                <button type="button" id="ebtnCancel" class="btn btn-default" data-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>
