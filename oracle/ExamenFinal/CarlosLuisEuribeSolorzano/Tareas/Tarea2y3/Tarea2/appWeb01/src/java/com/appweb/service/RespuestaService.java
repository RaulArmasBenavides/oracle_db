/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.service;

import com.appweb.dao.RespuestaDao;
import com.appweb.dto.RespuestaDto;

/**
 *
 * @author Carlos Euribe
 */
public class RespuestaService {

    public String insertar(RespuestaDto obj) {
        RespuestaDao dao = new RespuestaDao();
        return dao.insertar(obj);
    }
}
