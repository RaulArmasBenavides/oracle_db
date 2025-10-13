/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.servlet;

import com.appweb.dto.EmpleadoDto;
import com.appweb.dto.PedidoDto;
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
@WebServlet(name = "PedidoEntregadoServlet", urlPatterns = {"/pedidoEntregado"})
public class PedidoEntregadoServlet extends HttpServlet {

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
        
        // captura de los datos desde el formulario
        String Codigo = request.getParameter("pedido");

        // creamos una instancia de la clase service
        PedidoService service = new PedidoService();

        // creamos una instancia de la clase Producto
        PedidoDto obj = new PedidoDto();
        obj.setIdPedido(Long.parseLong(Codigo));

        // ejecutamos el metodo eliminar del objeto service y como parametro
        // le pasamos el objeto Producto
        String sResultado = service.entregaPedido(obj);
        System.out.println("--->" + sResultado);

        // si la ejecucion retorna un valor TRUE se ejecuto correctamente
        // dependiendo del resultado llamamos a la vista correspondiente
        if (sResultado.equals("TRUE")) {
            
            // trear todos los pedidos de un delivery
            PedidoService pservice = new PedidoService();
            EmpleadoDto pobj = new EmpleadoDto();
            HttpSession sesion = request.getSession();
            pobj.setIdEmpleado(sesion.getAttribute("EmpleadoDelivery").toString());
            ArrayList list = pservice.listarPedidos(pobj);
            request.setAttribute("list", list);
                
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/listarPedidosDelivery.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/error.jsp");
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
