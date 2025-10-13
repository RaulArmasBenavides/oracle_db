/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function cmdRegistrarProducto() {
    $("#confirmarRegistrarModal #title").text("Registrar Producto");
    $("#confirmarRegistrarModal").modal('show');
    $("#confirmarRegistrarModal #rbtnOk").click(function () {
        $("#frmRegistrarProducto").submit();
    });
}

function cmdActualizarProducto() {
    $("#confirmarActualizarModal #title").text("Actualizar Producto");
    $("#confirmarActualizarModal").modal('show');
    $("#confirmarActualizarModal #mbtnOk").click(function () {
        $("#frmActualizarProducto").submit();
    });
}

function cmdSalirSistema(){
    $("#confirmarSalirSistemaModal #title").text("Salir del Sistema");
    $("#confirmarSalirSistemaModal").modal('show');
    $("#confirmarSalirSistemaModal #sbtnOk").click(function () {
        window.location.href = "acceso.jsp";
    });
}

function cmdSalirSistemaEntrega(){
    $("#confirmarSalirSistemaEntregaModal #title").text("Salir del Sistema");
    $("#confirmarSalirSistemaEntregaModal").modal('show');
    $("#confirmarSalirSistemaEntregaModal #sebtnOk").click(function () {
        window.location.href = "accesoEntrega.jsp";
    });
}

function cmdSalirSistemaEstado(){
    $("#confirmarSalirSistemaEstadoModal #title").text("Salir del Sistema");
    $("#confirmarSalirSistemaEstadoModal").modal('show');
    $("#confirmarSalirSistemaEstadoModal #setbtnOk").click(function () {
        window.location.href = "accesoEstado.jsp";
    });
}

function cmdEliminarProducto(codigo){
    $("#confirmarEliminarModal #title").text("Eliminar Producto");
    $("#confirmarEliminarModal").modal('show');
    $("#confirmarEliminarModal #ebtnOk").click(function () {
        window.location.href = "eliminarProducto?txtCodigo=" + codigo;
    });
}

function cmdEliminarCliente(codigo){
    $("#confirmarEliminarClienteModal #title").text("Eliminar Cliente");
    $("#confirmarEliminarClienteModal").modal('show');
    $("#confirmarEliminarClienteModal #ecbtnOk").click(function () {
        window.location.href = "eliminarCliente?codigo=" + codigo;
    });
}

function cmdRegistrarRespuesta() {
    $("#confirmarRegistrarRespuestaModal #title").text("Registrar Encuesta");
    $("#confirmarRegistrarRespuestaModal").modal('show');
    $("#confirmarRegistrarRespuestaModal #rrbtnOk").click(function (e) {
         $.ajax({
            url: "/appWeb01/insertarRespuesta",
            type: "POST",
            data: { nombre     : $('#nombre').val(),
                    apellido   : $('#apellido').val(),
                    opcion     : $('input[name=opcion]:checked').val(),
                    comentario : $('#comentario').val()},
            success: function (respuesta) {
                $("#confirmarRegistrarRespuestaModal").modal('hide');
                if (respuesta === "TRUE") {
                    $("#validarRegistroRespuestaModal #title").text("Registro exitoso");
                    $("#validarRegistroRespuestaModal #mensajeModal").text("Los datos se registraron exitosamente.");
                    $("#validarRegistroRespuestaModal").modal('show');
                    $("#validarRegistroRespuestaModal #rebtnOk").click(function (e) {
                        window.location.href = "menu.jsp";
                    });
                }
                else{
                    if (respuesta === "FALSE") {
                        $("#validarRegistroRespuestaModal #title").text("Registro fallido");
                        $("#validarRegistroRespuestaModal #mensajeModal").text("Los datos no se registraron.");
                        $("#validarRegistroRespuestaModal").modal('show');
                        $("#validarRegistroRespuestaModal #rebtnOk").click(function (e) {
                            window.location.href = "menu.jsp";
                        });
                    }
                }
            },
            error: function (err) {
                alert("Error: " + err.responseText);
            }
        });
        e.stopImmediatePropagation();
    });
}

function cmdDetallePedido(pedido) {
     $.ajax({
        url: "/appWeb01/listarDetalle",
        type: "POST",
        data: { idpedido     : pedido},
        dataType: "json",
        success: function (data) {
            if (data.length > 0) {
                $('#tblItemsPedidos tbody tr').remove();
                $("#detallePedidoClienteModal #title").text("Productos del Pedido");
                $.each(data, function (i, item) {
                    var rows = "<tr>"
                    + "<td class ='text-center'>" + item.idarticulo + "</td>"
                    + "<td class ='text-right'>" + item.nombre + "</td>"
                    + "<td class ='text-center'>" + item.cantidad + "</td>"
                    + "<td class ='text-right'>" + item.subtotal.toFixed(2) + "</td>"
                    + "</tr>";
                    $('#tblItemsPedidos tbody').append(rows);
                });
                $("#detallePedidoClienteModal").modal('show');
            }
        },
        error: function (err) {
            alert("Error: " + err.responseText);
        }
    });
}

function cmdPedidosCliente(cliente) {
     $.ajax({
        url: "/appWeb01/listarPedido",
        type: "POST",
        data: { idcliente     : cliente},
        dataType: "json",
        success: function (data) {
            //console.log(data);
            if (data.length > 0) {
                $('#tblPedidosCliente tbody tr').remove();
                $("#pedidosClienteModal #title").text("Pedidos del Cliente");
                var colorfondo = "bg-danger";
                $.each(data, function (i, item) {
                    if(item.desdelivery === "ENTREGADO"){
                        colorfondo = "bg-success";
                    }
                    else{
                        colorfondo = "bg-danger";
                    }
                    var rows = "<tr style='cursor:pointer;' class='" + colorfondo + "'  onclick='cmdDetallePedido(" + item.idpedido + ");'>"
                    + "<td>" + item.idpedido + "</td>"
                    + "<td>" + item.numdocumento + "</td>"
                    + "<td>" + item.fecha + "</td>"
                    + "<td class ='text-right'>" + item.importe.toFixed(2) + "</td>"
                    + "<td class ='text-right'>" + item.descuento.toFixed(2) + "</td>"
                    + "<td class ='text-right'>" + item.subtotal.toFixed(2) + "</td>"
                    + "<td class ='text-right'>" + item.igv.toFixed(2) + "</td>"
                    + "<td class ='text-right'><b>" + item.total.toFixed(2) + "</b></td>"
                    + "<td class ='text-center'><b>" + item.desdelivery + "</b></td>"
                    + "<td class ='text-center'>" + item.desestado + "</td>"
                    + "<td>" + item.nomempleado + "</td>"
                    + "<td>" + item.telempleado + "</td>"
                    + "</tr>";
                    $('#tblPedidosCliente tbody').append(rows);
                });
                $("#pedidosClienteModal").modal('show');
            }
        },
        error: function (err) {
            alert("Error: " + err.responseText);
        }
    });
}

function cmdPedidoEntregado(pedido){
    $("#confirmarEntregaPedidoModal #title").text("Entrega de Pedido");
    $("#confirmarEntregaPedidoModal").modal('show');
    $("#confirmarEntregaPedidoModal #repbtnOk").click(function () {
        window.location.href = "pedidoEntregado?pedido=" + pedido;
    });
}