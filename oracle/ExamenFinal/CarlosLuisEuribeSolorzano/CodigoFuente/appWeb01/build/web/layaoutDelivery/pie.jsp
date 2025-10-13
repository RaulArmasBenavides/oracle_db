<%-- 
    Document   : pie
    Created on : 06-sep-2019, 20:19:30
    Author     : Carlos Euribe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <footer class="footer">
      <div class="container">
        <p class="text-muted"></p>
      </div>
    </footer>
  </body>
</html>

<!--Modal Confirmacion-->
<div id="confirmarSalirSistemaEntregaModal" class="modal fade">
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
                <button type="button" id="sebtnOk" class="btn btn-primary">Si</button>
                <button type="button" id="sebtnCancel" class="btn btn-default" data-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>