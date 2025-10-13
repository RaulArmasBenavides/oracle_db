/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.servlet;

import com.appweb.dto.RespuestaDto;
import com.appweb.service.RespuestaService;
import java.io.IOException;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
/**
 *
 * @author Carlos Euribe
 */
@WebServlet(name = "InsertarRespuestaServlet", urlPatterns = {"/insertarRespuesta"})
public class InsertarRespuestaServlet extends HttpServlet {

    private static final long serialVersionUID = 2L;

    public InsertarRespuestaServlet() {
        super();
    }

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
        request.getRequestDispatcher("insertarRespuesta.jsp").forward(request, response);
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
            RespuestaDto obj = new RespuestaDto();
            obj.setNombre(request.getParameter("nombre"));
            obj.setApellido(request.getParameter("apellido"));
            obj.setOpcion(request.getParameter("opcion"));
            obj.setComentario(request.getParameter("comentario"));
            
            // realizamos el proceso de validación
            ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
            Validator validator = validatorFactory.getValidator();
            Set<ConstraintViolation<RespuestaDto>> constraintViolations = validator.validate(obj);
            if (!constraintViolations.isEmpty()) {
                String errors = "<ul>";
                for (ConstraintViolation<RespuestaDto> constraintViolation : constraintViolations) {
                   errors += "<li>" + constraintViolation.getPropertyPath() + " " + constraintViolation.getMessage() + "</li>";
                }
                errors += "</ul>";
                request.setAttribute("respuesta", obj);
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("insertarRespuesta.jsp").forward(request, response);
            }
            else{
                // creamos una instancia de la clase service
                RespuestaService service = new RespuestaService();
                
                // ejecutamos el metodo insertar del objeto service 
                String sResultado = service.insertar(obj);
                
                // si la ejecucion retorna un valor TRUE se ejecuto correctamente
                response.setContentType("text/plain");
                String respuesta = "";
                if (sResultado.equals("TRUE")) {
                    respuesta = "TRUE";
                    response.getWriter().print(respuesta);
                } else {
                    respuesta = "FALSE";
                    response.getWriter().print(respuesta);
                }
            }
        } catch (Exception e) {
            System.out.println(e + "--->" + e.getMessage());
            request.setAttribute("errors", "");
            request.getRequestDispatcher("insertarRespuesta.jsp").forward(request, response);
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
