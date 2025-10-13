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
public class PedidoDto extends EmpleadoDto implements java.io.Serializable{

    private static final long serialVersionUID = 1L;
    
    private long idpedido;
    private long iddocumento;
    private String numdocumento;
    private String fecha;
    private String idcliente;
    private String nomcliente;
    private double importe;
    private double descuento;
    private double subtotal;
    private double igv;
    private double total;
    private String desdelivery;
    private String desestado;
    private String dircliente;
    private String telcliente;

    public long getIdPedido() {
        return idpedido;
    }

    public void setIdPedido(long idpedido) {
        this.idpedido = idpedido;
    }

    public long getIdDocumento() {
        return iddocumento;
    }

    public void setIdDocumento(long iddocumento) {
        this.iddocumento = iddocumento;
    }

    public String getNumDocumento() {
        return numdocumento;
    }

    public void setNumDocumento(String numdocumento) {
        this.numdocumento = numdocumento;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

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

    public double getImporte() {
        return importe;
    }

    public void setImporte(double importe) {
        this.importe = importe;
    }

    public double getDescuento() {
        return descuento;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }

    public double getSubTotal() {
        return subtotal;
    }

    public void setSubTotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public double getIgv() {
        return igv;
    }

    public void setIgv(double igv) {
        this.igv = igv;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getDesDelivery() {
        return desdelivery;
    }

    public void setDesDelivery(String desdelivery) {
        this.desdelivery = desdelivery;
    }

    public String getDesEstado() {
        return desestado;
    }

    public void setDesEstado(String desestado) {
        this.desestado = desestado;
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
    
}
