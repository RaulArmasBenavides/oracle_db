<%-- 
    Document   : insertarRespuesta
    Created on : 30-ago-2019, 10:10:39
    Author     : Carlos Euribe
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
        <meta http-equiv="Expires" content="0">
        <meta http-equiv="Last-Modified" content="0">
        <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
        <meta http-equiv="Pragma" content="no-cache">
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
            <div class="panel-heading">Registrar Encuesta</div>
            <div class="panel-body">
                <div class="col-md-12">
                    <form id="frmRegistrarRespuesta" class="form-horizontal" method="post" action="insertarRespuesta">
                        <div class="form-group">
                           <label>Nombre</label>
                           <input name="nombre" class="form-control" type="text" id="nombre" value="${respuesta.nombre}" placeholder="nombre del encuestado">
                        </div>
                        <div class="form-group">
                           <label>Apellido</label>
                           <input name="apellido" class="form-control" type="text" id="apellido" value="${respuesta.apellido}" placeholder="apellido del encuestado">
                        </div>
                        <div class="form-group" id="opcion">
                          <label>Opinión que le ha merecido este sitio web:</label>
                          <br/>
                          <div class="radio">
                            <label><input type="radio" name="opcion" value="Buena">Buena</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="opcion" value="Regular">Regular</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="opcion" value="Mala">Mala</label>
                          </div>
                        </div>    
                        <div class="form-group">
                           <label>Comentarios:</label>
                           <textarea name="comentario" rows="5" cols="50" class="form-control" id="comentario" placeholder="comentario del encuestado">${respuesta.comentario}</textarea>
                        </div>    
                        <button name="btnGrabar" type="button" class="btn btn-primary" id="btnGrabar" onclick="return cmdRegistrarRespuesta();">Grabar</button>                  
                        <a href="menu.jsp" type="button" class="btn btn-success btn pull-right">Ir al Menu</a>
                    </form>
                </div>
            </div>  
        </div>  
    </body>
</html>

<!--Modal Confirmacion-->
<div id="confirmarRegistrarRespuestaModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><label id="title"></label></h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    Está seguro de registrar la Encuesta ?
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="rrbtnOk" class="btn btn-primary">Si</button>
                <button type="button" id="rrbtnCancel" class="btn btn-default" data-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>

<!--Modal Registro Exitoso-->
<div id="validarRegistroRespuestaModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><label id="title"></label></h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal" id="mensajeModal">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="rebtnOk" class="btn btn-primary">Ir al Menu</button>
            </div>
        </div>
    </div>
</div>