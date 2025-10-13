/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.service;

import com.appweb.dao.EmpleadoDao;
import com.appweb.dto.EmpleadoDto;

/**
 *
 * @author Carlos Euribe
 */
public class EmpleadoService {
    
    public String validarEmpleados(EmpleadoDto obj) {
        EmpleadoDao dao = new EmpleadoDao();
        return dao.validarEmpleados(obj);
    }
    
}
