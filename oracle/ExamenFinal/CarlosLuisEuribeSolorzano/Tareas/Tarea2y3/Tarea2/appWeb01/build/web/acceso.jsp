<%-- 
    Document   : acceso
    Created on : 17/08/2019, 10:01:53 AM
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
    // validar si el usuario se ha logeado
    if(session.getAttribute("NombreUsuario") != null){
        if(session.getAttribute("NombreUsuario") == "Carlos Euribe"){
            session.invalidate(); 
        }
    }
%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
<!--
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
-->
        </style>
</head>
    <body>
        <table width="100%" border="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><div align="center"><img src="image/login.png" width="225" height="225"></div></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
           <td>
            <form  method="post" action="validarEmpleado">
             <table width="19%" border="1" align="center">
               <tr>
                 <td colspan="2" bgcolor="#000099"><div align="center" class="style1">Acceso al Sistema </div></td>
               </tr>
               <tr>
                 <td width="31%">Usuario</td>
                 <td width="69%"><input name="txtUsuario" type="text" id="txtUsuario"></td>
               </tr>
               <tr>
                 <td>Clave</td>
                 <td><input name="txtClave" type="password" id="txtClave"></td>
               </tr>
               <tr>
                 <td colspan="2"><div align="center">
                   <input name="btnAceptar" type="submit" id="btnAceptar" value="Aceptar">                  
                   <input name="btnCamcelar" type="reset" id="btnCamcelar" value="Cancelar">
                 </div></td>
               </tr>
             </table>
            </form>
           </td>
          </tr>
          <tr>
            <td>
                <div align="center">
                    <%if(request.getAttribute("validar")!=null){%>
                      <font color="#FF0000" face="Arial">
                        <b>Datos incorrectos!!</b>
                      </font>
                    <%}%> 
                </div>
            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>
        <h1>&nbsp;</h1>
    </body>
</html>
