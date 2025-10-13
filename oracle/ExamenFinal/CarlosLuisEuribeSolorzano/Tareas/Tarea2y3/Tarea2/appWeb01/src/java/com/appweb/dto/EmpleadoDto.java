/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appweb.dto;

/**
 *
 * @author Carlos Euribe
 */
public class EmpleadoDto {

    private String idempleado;
    private String apeempleado;
    private String nomempleado;
    private String dirempleado;
    private String telempleado;
    private String claveempleado;
    
    public String getIdEmpleado() {
        return idempleado;
    }

    public void setIdEmpleado(String idempleado) {
        this.idempleado = idempleado;
    }
    
    public String getApeEmpleado() {
        return apeempleado;
    }

    public void setApeEmpleado(String apeempleado) {
        this.apeempleado = apeempleado;
    }
    
    public String getNomEmpleado() {
        return nomempleado;
    }

    public void setNomEmpleado(String nomempleado) {
        this.nomempleado = nomempleado;
    }
    
    public String getDirEmpleado() {
        return dirempleado;
    }

    public void setDirEmpleado(String dirempleado) {
        this.dirempleado = dirempleado;
    }
    
    public String getTelEmpleado() {
        return telempleado;
    }

    public void setTelEmpleado(String telempleado) {
        this.telempleado = telempleado;
    }
    
    public String getClaveEmpleado() {
        return claveempleado;
    }

    public void setClaveEmpleado(String claveempleado) {
        this.claveempleado = claveempleado;
    }
    
}
