/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.servlet;

import com.appweb.dto.ClienteDto;
import com.appweb.service.PedidoService;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import java.util.Arrays;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author Carlos Euribe
 */
@WebServlet(name = "ListarPedidoServlet", urlPatterns = {"/listarPedido"})
public class ListarPedidoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//    }
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
        try {
            // creamos una instancia de la clase Respuesta para capturar los datos del formulario
            ClienteDto cliente = new ClienteDto();
            cliente.setIdCliente(request.getParameter("idcliente"));
            System.out.println("--->" + request.getParameter("idcliente"));

            // creamos una instancia de la clase service
            PedidoService service = new PedidoService();

            // ejecutamos el metodo insertar del objeto service 
            ArrayList list = service.listarPedidos(cliente);
            System.out.println("--->" + Arrays.asList(list));

            response.setContentType("application/json");
            new Gson().toJson(list, response.getWriter());

        } catch (Exception e) {
            System.out.println(e + "--->" + e.getMessage());
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
