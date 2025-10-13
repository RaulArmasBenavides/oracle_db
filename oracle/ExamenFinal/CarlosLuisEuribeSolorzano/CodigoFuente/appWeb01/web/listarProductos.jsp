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
<%@include file="layaout/cabecera.jsp" %>

<div class="container">
    <div class="col-md-12 col-md-offset-0 centered">
        <div class="panel panel-default">
            <div class="panel-heading"><b>Listado de Productos</b></div>
              <table class="table table-bordered table-hover">
                <tr>
                  <th class='text-center bg-primary'>Código</th>
                  <th class='text-center bg-primary'>Nombre</th>
                  <th class='text-center bg-primary'>Precio</th>
                  <th class='text-center bg-primary'>Stock</th>
                  <th class='text-center bg-primary' colspan="2">Mantenimiento</th>
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
                      String colorfondo = "";
                      if(producto.getStock() < 20){
                          colorfondo = "bg-danger";
                      }
                      out.print("<tr class='" + colorfondo + "'>");
                      out.print("<td class='text-center'>" + producto.getCodigo() + "</td>");
                      out.print("<td>" + producto.getNombre() + "</td>");
                      out.print("<td class='text-right'>" + priceFormatter.format(producto.getCosto()) + "</td>");
                      out.print("<td class='text-right'>" + producto.getStock() + "</td>");
                      out.print("<td class='text-center'><a class='btn btn-default btn-xs' href='verProducto?txtCodigo=" + producto.getCodigo() + "'>Modificar</a></td>");
                      cmdEliminar = "onclick='return cmdEliminarProducto(" + '"' + producto.getCodigo() + '"' + ");'";
                      out.print("<td class='text-center'><button type='button' class='btn btn-default btn-xs' " + cmdEliminar + ">Eliminar</button></td>");
                      out.print("</tr>");
                  }
                %>
                </tr>
              </table>
        </div>
    </div>     
</div>
<%@include file="layaout/pie.jsp" %>

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
