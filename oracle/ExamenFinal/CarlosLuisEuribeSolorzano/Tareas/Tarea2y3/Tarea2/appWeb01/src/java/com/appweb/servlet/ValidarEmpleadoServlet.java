/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.servlet;

import com.appweb.dto.EmpleadoDto;
import com.appweb.dto.ProductoDto;
import com.appweb.service.EmpleadoService;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alumno
 */
@WebServlet(name = "ValidarEmpleadoServlet", urlPatterns = {"/validarEmpleado"})
public class ValidarEmpleadoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // captura de los datos desde el formulario
        String Usuario = request.getParameter("txtUsuario");
        String Clave = request.getParameter("txtClave");
        
        // creamos una instancia de la clase service
        EmpleadoService service = new EmpleadoService();

        // creamos una instancia de la clase Empleado
        EmpleadoDto obj = new EmpleadoDto();
        obj.setIdEmpleado(Usuario);
        obj.setClaveEmpleado(Clave);
        
        // ejecutamos el metodo validar del objeto service y como parametro
        // le pasamos el objeto Empleado
        String sResultado = service.validarEmpleados(obj);
        
        if (sResultado.equals("TRUE")) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("NombreUsuario", "Carlos Euribe");

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/menu.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("validar", "1");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/acceso.jsp");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
