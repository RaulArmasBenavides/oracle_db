package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class acceso_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    // validar si el usuario se ha logeado
    if(session.getAttribute("NombreUsuario") != null){
        if(session.getAttribute("NombreUsuario") == "Carlos Euribe"){
            session.setAttribute("NombreUsuario", null);
            //session.invalidate(); 
        }
    }

      out.write(" \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">   \t\r\n");
      out.write("        <script src=\"js/jquery-1.10.2.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script> \r\n");
      out.write("    </head>\r\n");
      out.write("    <body class=\"col-md-4 col-md-offset-4 centered\">\r\n");
      out.write("        <form class=\"form-signin\" method=\"post\" action=\"validarEmpleado\">\r\n");
      out.write("            <center><img class=\"text-center\" src=\"image/controldelivery.png\" alt=\"\"></center>\r\n");
      out.write("            <h1 class=\"h3 mb-3 font-weight-normal text-center\"><b>CONTROL DE PEDIDOS</b></h1>\r\n");
      out.write("            <h3 class=\"h3 mb-3 font-weight-normal text-center\">Por favor ingrese</h3>\r\n");
      out.write("            <label for=\"txtUsuario\" class=\"sr-only\">Usuario</label>\r\n");
      out.write("            <input type=\"text\" id=\"txtUsuario\" name=\"txtUsuario\" class=\"form-control\" placeholder=\"Usuario\" required autofocus>\r\n");
      out.write("            <br/>\r\n");
      out.write("            <label for=\"txtClave\" class=\"sr-only\">Password</label>\r\n");
      out.write("            <input type=\"password\" id=\"txtClave\" name=\"txtClave\" class=\"form-control\" placeholder=\"Contraseña\" required>\r\n");
      out.write("            <input name=\"txtTipo\" type=\"hidden\" id=\"txtTipo\" value=\"0\">\r\n");
      out.write("            <br/>\r\n");
      out.write("            <button class=\"btn btn-lg btn-primary btn-block\" type=\"submit\">Ingresar</button>\r\n");
      out.write("            <p class=\"mt-5 mb-3 text-muted text-center\">Glovo UNI&copy; 2019</p>\r\n");
      out.write("            <div align=\"center\">\r\n");
      out.write("                ");
if(request.getAttribute("validar")!=null){
      out.write("\r\n");
      out.write("                  <font color=\"#FF0000\" face=\"Arial\">\r\n");
      out.write("                    <b>Datos incorrectos!!</b>\r\n");
      out.write("                  </font>\r\n");
      out.write("                ");
}
      out.write(" \r\n");
      out.write("            </div>\r\n");
      out.write("        </form>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
