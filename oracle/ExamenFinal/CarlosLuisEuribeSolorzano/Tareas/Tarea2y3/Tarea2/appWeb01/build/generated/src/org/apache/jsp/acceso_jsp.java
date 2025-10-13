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
            session.invalidate(); 
        }
    }

      out.write(" \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>JSP Page</title>\r\n");
      out.write("        <style type=\"text/css\">\r\n");
      out.write("<!--\r\n");
      out.write(".style1 {\r\n");
      out.write("\tcolor: #FFFFFF;\r\n");
      out.write("\tfont-weight: bold;\r\n");
      out.write("}\r\n");
      out.write("-->\r\n");
      out.write("        </style>\r\n");
      out.write("</head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <table width=\"100%\" border=\"0\">\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td>&nbsp;</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td>&nbsp;</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td><div align=\"center\"><img src=\"image/login.png\" width=\"225\" height=\"225\"></div></td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td>&nbsp;</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr>\r\n");
      out.write("           <td>\r\n");
      out.write("            <form  method=\"post\" action=\"validarEmpleado\">\r\n");
      out.write("             <table width=\"19%\" border=\"1\" align=\"center\">\r\n");
      out.write("               <tr>\r\n");
      out.write("                 <td colspan=\"2\" bgcolor=\"#000099\"><div align=\"center\" class=\"style1\">Acceso al Sistema </div></td>\r\n");
      out.write("               </tr>\r\n");
      out.write("               <tr>\r\n");
      out.write("                 <td width=\"31%\">Usuario</td>\r\n");
      out.write("                 <td width=\"69%\"><input name=\"txtUsuario\" type=\"text\" id=\"txtUsuario\"></td>\r\n");
      out.write("               </tr>\r\n");
      out.write("               <tr>\r\n");
      out.write("                 <td>Clave</td>\r\n");
      out.write("                 <td><input name=\"txtClave\" type=\"password\" id=\"txtClave\"></td>\r\n");
      out.write("               </tr>\r\n");
      out.write("               <tr>\r\n");
      out.write("                 <td colspan=\"2\"><div align=\"center\">\r\n");
      out.write("                   <input name=\"btnAceptar\" type=\"submit\" id=\"btnAceptar\" value=\"Aceptar\">                  \r\n");
      out.write("                   <input name=\"btnCamcelar\" type=\"reset\" id=\"btnCamcelar\" value=\"Cancelar\">\r\n");
      out.write("                 </div></td>\r\n");
      out.write("               </tr>\r\n");
      out.write("             </table>\r\n");
      out.write("            </form>\r\n");
      out.write("           </td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td>\r\n");
      out.write("                <div align=\"center\">\r\n");
      out.write("                    ");
if(request.getAttribute("validar")!=null){
      out.write("\r\n");
      out.write("                      <font color=\"#FF0000\" face=\"Arial\">\r\n");
      out.write("                        <b>Datos incorrectos!!</b>\r\n");
      out.write("                      </font>\r\n");
      out.write("                    ");
}
      out.write(" \r\n");
      out.write("                </div>\r\n");
      out.write("            </td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td>&nbsp;</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("        <h1>&nbsp;</h1>\r\n");
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
