<%-- 
    Document   : newjsplistarClientes
    Created on : 03-sep-2019, 22:11:48
    Author     : Carlos Euribe
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.appweb.dto.ClienteDto"%>
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
            <div class="panel-heading"><b>Listado de Clientes</b></div>
              <table class="table table-bordered table-hover">
                <tr>
                  <th class='text-center bg-primary'>Código</th>
                  <th class='text-center bg-primary'>Nombre</th>
                  <th class='text-center bg-primary'>RUC</th>
                  <th class='text-center bg-primary'>Dirección</th>
                  <th class='text-center bg-primary'>Teléfono</th>
                  <th class='text-center bg-primary'>Nro. Pedidos</th>
                  <th class='text-center bg-primary'>Total Compra</th>
                  <th class='text-center bg-primary' colspan="2">Mantenimiento</th>
                </tr>
                <% 
                  DecimalFormat priceFormatter = new DecimalFormat("0.00");
                  DecimalFormatSymbols dfs = priceFormatter.getDecimalFormatSymbols();
                  dfs.setDecimalSeparator('.');
                  priceFormatter.setDecimalFormatSymbols(dfs);
                  List<ClienteDto> clientes = (ArrayList<ClienteDto>)request.getAttribute("list");
                  String cmdEliminar = "";
                  String cmdDetalle = "";
                  for(ClienteDto cliente : clientes)
                  {
                      String colorfondo = "";
                      if(cliente.getNroPedidos() > 0){
                          colorfondo = "bg-danger";
                      }
                      out.print("<tr class='" + colorfondo + "'>");
                      out.print("<td class='text-center'>" + cliente.getIdCliente() + "</td>");
                      out.print("<td>" + cliente.getNomCliente() + "</td>");
                      out.print("<td class='text-right'>" + cliente.getRuc() + "</td>");
                      out.print("<td class='text-right'>" + cliente.getDirCliente() + "</td>");
                      out.print("<td class='text-right'>" + cliente.getTelCliente() + "</td>");
                      out.print("<td class='text-center'><b>" + cliente.getNroPedidos() + "</b></td>");
                      out.print("<td class='text-right'>" + priceFormatter.format(cliente.getTotalPedidos()) + "</td>");
                      if(cliente.getNroPedidos() > 0){
                        cmdDetalle = "onclick='return cmdPedidosCliente(" + '"' + cliente.getIdCliente() + '"' + ");'";
                        out.print("<td class='text-center'><button type='button' class='btn btn-default btn-xs' " + cmdDetalle + ">Detalle</button></td>");
                      }
                      else{
                        out.print("<td class='text-center'></td>");  
                      }
                      if(cliente.getNroPedidos() == 0){
                        cmdEliminar = "onclick='return cmdEliminarCliente(" + '"' + cliente.getIdCliente() + '"' + ");'";
                        out.print("<td class='text-center'><button type='button' class='btn btn-default btn-xs' " + cmdEliminar + ">Eliminar</button></td>");
                      }
                      else{
                        out.print("<td class='text-center'></td>");  
                      }
                      out.print("</tr>");
                  }
                %>
                </tr>
              </table>
            </div>
        </div>  
    </div>
</div>
<%@include file="layaout/pie.jsp" %>

<!--Modal Confirmacion-->
<div id="confirmarEliminarClienteModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><label id="title"></label></h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    Está seguro de eliminar el Cliente ?
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="ecbtnOk" class="btn btn-primary">Si</button>
                <button type="button" id="ecbtnCancel" class="btn btn-default" data-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>

<!--Modal Pedido-->
<div id="pedidosClienteModal" class="modal fade" >
    <div class="modal-dialog" style="width: 1200px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><label id="title"></label></h4>
            </div>
            <div class="modal-body">
                <table id="tblPedidosCliente" class="table table-condensed table-bordered table-hover">
                    <thead>
                        <th class="text-center bg-primary">Id Pedido</th>
                        <th class="text-center bg-primary">Nro. Factura</th>
                        <th class="text-center bg-primary">Fecha</th>
                        <th class="text-center bg-primary">Importe</th>
                        <th class="text-center bg-primary">Descuento</th>
                        <th class="text-center bg-primary">Sub Total</th>
                        <th class="text-center bg-primary">IGV</th>
                        <th class="text-center bg-primary">Total</th>
                        <th class="text-center bg-primary">Estado Delivery</th>
                        <th class="text-center bg-primary">Estado Pedido</th>
                        <th class="text-center bg-primary">Empleado</th>
                        <th class="text-center bg-primary">Teléfono</th>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!--Modal Detalle-->
<div id="detallePedidoClienteModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><label id="title"></label></h4>
            </div>
            <div class="modal-body">
                <table id="tblItemsPedidos" class="table table-condensed table-bordered table-hover">
                    <thead>
                        <th class="text-center bg-primary">Código</th>
                        <th class="text-center bg-primary">Producto</th>
                        <th class="text-center bg-primary">Cantidad</th>
                        <th class="text-center bg-primary">Sub Total</th>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</div>