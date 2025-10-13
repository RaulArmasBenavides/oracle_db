/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.servlet;

import com.appweb.dto.ClienteDto;
import com.appweb.service.ClienteService;
import com.appweb.service.PedidoService;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Carlos Euribe
 */
@WebServlet(name = "ValidarClienteServlet", urlPatterns = {"/validarCliente"})
public class ValidarClienteServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
        String Usuario = "";
        String Clave = "";
                    
        // captura de los datos desde el formulario
        HttpSession sesion = request.getSession();
        if(sesion.getAttribute("NombreCliente") != null){
            Usuario = sesion.getAttribute("Usuario").toString().trim();
            Clave = sesion.getAttribute("Usuario").toString().trim();
            System.out.println("Usuario--->" + Usuario);
            System.out.println("Clave--->" + Clave);
        }
            
        // creamos una instancia de la clase service
        ClienteService service = new ClienteService();

        // creamos una instancia de la clase Cliente
        ClienteDto obj = new ClienteDto();
        obj.setIdCliente(Usuario);
        obj.setClave(Clave);
        
        // ejecutamos el metodo validar del objeto service y como parametro
        // le pasamos el objeto Cliente
        String sResultado = service.validarClientes(obj);
        
        if (sResultado.equals("TRUE")) {
            // trear todos los pedidos de un cliente
            PedidoService pservice = new PedidoService();
            ClienteDto pobj = new ClienteDto();
            pobj.setIdCliente(Usuario);
            ArrayList list = pservice.listarPedidos(pobj);
            request.setAttribute("list", list);
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/listarPedidosCliente.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("validar", "1");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/accesoEstado.jsp");
            rd.forward(request, response);
        }
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
        
        response.setContentType("text/html;charset=UTF-8");
        
        String Usuario = "";
        String Clave = "";
                    
        // captura de los datos desde el formulario
        HttpSession sesion = request.getSession();
        if(sesion.getAttribute("NombreCliente") == null){
            Usuario = request.getParameter("txtUsuario");
            Clave = request.getParameter("txtClave");
        }
        else{
            Usuario = sesion.getAttribute("Usuario").toString().trim();
            Clave = sesion.getAttribute("Usuario").toString().trim();
            System.out.println("Usuario--->" + Usuario);
            System.out.println("Clave--->" + Clave);
        }
            
        // creamos una instancia de la clase service
        ClienteService service = new ClienteService();

        // creamos una instancia de la clase Cliente
        ClienteDto obj = new ClienteDto();
        obj.setIdCliente(Usuario);
        obj.setClave(Clave);
        
        // ejecutamos el metodo validar del objeto service y como parametro
        // le pasamos el objeto Cliente
        String sResultado = service.validarClientes(obj);
        
        if (sResultado.equals("TRUE")) {
            sesion.setAttribute("NombreCliente", "Cliente");
            sesion.setAttribute("Usuario", Usuario);

            // trear todos los pedidos de un cliente
            PedidoService pservice = new PedidoService();
            ClienteDto pobj = new ClienteDto();
            pobj.setIdCliente(Usuario);
            ArrayList list = pservice.listarPedidos(pobj);
            request.setAttribute("list", list);
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/listarPedidosCliente.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("validar", "1");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/accesoEstado.jsp");
            rd.forward(request, response);
        }
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
