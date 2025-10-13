<%-- 
    Document   : listarPedidos
    Created on : 04-sep-2019, 20:34:25
    Author     : Carlos Euribe
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.appweb.dto.PedidoDto"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
    // validar si el usuario se ha logeado
    if(session.getAttribute("NombreCliente") == null){
        response.sendRedirect("accesoEstado.jsp");
    }
%>  
<!DOCTYPE html>
<%@include file="layaoutEstado/cabecera.jsp" %>

<div class="container-fluid">
    <div class="col-md-12 col-md-offset-0 centered">
        <div class="panel panel-default">
            <div class="panel-heading"><b>Listado de Pedidos</b></div>
              <table class="table table-bordered table-hover table-responsive">
                <tr>
                  <th class='text-center bg-primary'>ID Pedido</th>
                  <th class='text-center bg-primary'>Nro. Factura</th>
                  <th class='text-center bg-primary'>Fecha</th>
                  <th class='text-center bg-primary'>Descuento</th>
                  <th class='text-center bg-primary'>Sub Total</th>
                  <th class='text-center bg-primary'>IGV</th>
                  <th class='text-center bg-primary'>Total</th>
                  <th class='text-center bg-primary'>Estado Delivery</th>
                  <th class='text-center bg-primary'>Estado Pedido</th>
                  <th class='text-center bg-primary'>Empleado</th>
                  <th class='text-center bg-primary'>Teléfono</th>
                </tr>
                <% 
                  DecimalFormat priceFormatter = new DecimalFormat("0.00");
                  DecimalFormatSymbols dfs = priceFormatter.getDecimalFormatSymbols();
                  dfs.setDecimalSeparator('.');
                  priceFormatter.setDecimalFormatSymbols(dfs);
                  List<PedidoDto> pedidos = (ArrayList<PedidoDto>)request.getAttribute("list");
                  String cmdDetalle = "";
                  String colorfondo = "";
                  for(PedidoDto pedido : pedidos)
                  {
                      if(pedido.getDesDelivery().equals("ENTREGADO")){
                        colorfondo = "bg-success";
                      }
                      else{
                        colorfondo = "";
                      }
                      out.print("<tr class='" + colorfondo + "'>");
                      out.print("<td class='text-center'>" + pedido.getIdPedido() + "</td>");
                      out.print("<td>" + pedido.getNumDocumento() + "</td>");
                      out.print("<td>" + pedido.getFecha() + "</td>");
                      out.print("<td class='text-right'>" + priceFormatter.format(pedido.getDescuento()) + "</td>");
                      out.print("<td class='text-right'>" + priceFormatter.format(pedido.getSubTotal()) + "</td>");
                      out.print("<td class='text-right'>" + priceFormatter.format(pedido.getIgv()) + "</td>");
                      out.print("<td class='text-right'>" + priceFormatter.format(pedido.getTotal()) + "</td>");
                      out.print("<td class='text-center'><b>" + pedido.getDesDelivery() + "</b></td>");
                      out.print("<td class='text-center'>" + pedido.getDesEstado() + "</td>");
                      out.print("<td class='text-right'>" + pedido.getNomEmpleado() + "</td>");
                      out.print("<td class='text-right'>" + pedido.getTelEmpleado() + "</td>");
                      cmdDetalle = "onclick='return cmdDetallePedido(" + '"' + pedido.getIdPedido() + '"' + ");'";
                      out.print("<td class='text-center'><button type='button' class='btn btn-default btn-xs' " + cmdDetalle + ">Detalle</button></td>");
                      out.print("</tr>");
                  }
                %>
                </tr>
              </table>
            </div>
        </div>     
    </div>
</div>
<%@include file="layaoutEstado/pie.jsp" %>

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