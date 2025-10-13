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
public class ClienteDto extends ReporteDto{

    private String idcliente;
    private String nomcliente;
    private String ruc;
    private String dircliente;
    private String telcliente;
    private String clave;

    public String getIdCliente() {
        return idcliente;
    }

    public void setIdCliente(String idcliente) {
        this.idcliente = idcliente;
    }

    public String getNomCliente() {
        return nomcliente;
    }

    public void setNomCliente(String nomcliente) {
        this.nomcliente = nomcliente;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getDirCliente() {
        return dircliente;
    }

    public void setDirCliente(String dircliente) {
        this.dircliente = dircliente;
    }

    public String getTelCliente() {
        return telcliente;
    }

    public void setTelCliente(String telcliente) {
        this.telcliente = telcliente;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

}
