/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.servlet;

import com.appweb.dto.ProductoDto;
import com.appweb.service.ProductoService;
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
 * @author alumno
 */
@WebServlet(name = "InsertarProductoServlet", urlPatterns = {"/insertarProducto"})
public class InsertarProductoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public InsertarProductoServlet() {
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
        request.getRequestDispatcher("insertarProducto.jsp").forward(request, response);
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
        try{
            // creamos una instancia de la clase Producto para capturar los datos del formulario
            ProductoDto obj = new ProductoDto();
            obj.setCodigo(request.getParameter("codigo"));
            obj.setNombre(request.getParameter("nombre"));
            obj.setCosto(Double.parseDouble(request.getParameter("costo")));
            obj.setStock(Integer.parseInt(request.getParameter("stock")));

            // realizamos el proceso de validación
            ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
            Validator validator = validatorFactory.getValidator();
            Set<ConstraintViolation<ProductoDto>> constraintViolations = validator.validate(obj);
            if (!constraintViolations.isEmpty()) {
                String errors = "<ul>";
                for (ConstraintViolation<ProductoDto> constraintViolation : constraintViolations) {
                   errors += "<li>" + constraintViolation.getPropertyPath() + " " + constraintViolation.getMessage() + "</li>";
                }
                errors += "</ul>";
                request.setAttribute("producto", obj);
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("insertarProducto.jsp").forward(request, response);
            }
            else{
                // creamos una instancia de la clase service
                ProductoService service = new ProductoService();
            
                // ejecutamos el metodo insertar del objeto service 
                String sResultado = service.insertarProductos(obj);
                System.out.println("--->" + sResultado);

                // si la ejecucion retorna un valor TRUE se ejecuto correctamente
                if (sResultado.equals("TRUE")) {
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/listarProducto");
                    rd.forward(request, response);
                } else {
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/error.jsp");
                    rd.forward(request, response);
                }
            }
        } catch (Exception e) {
            request.setAttribute("errors", "");
            request.getRequestDispatcher("insertarProducto.jsp").forward(request, response);
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
