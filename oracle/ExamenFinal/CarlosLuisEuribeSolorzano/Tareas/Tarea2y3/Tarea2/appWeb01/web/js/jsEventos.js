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

function cmdEliminarProducto(codigo){
    $("#confirmarEliminarModal #title").text("Eliminar Producto");
    $("#confirmarEliminarModal").modal('show');
    $("#confirmarEliminarModal #ebtnOk").click(function () {
        window.location.href = "eliminarProducto?txtCodigo=" + codigo;
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
