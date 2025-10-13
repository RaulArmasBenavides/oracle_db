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
public class DetalleDto extends ProductoDto{

    private long idpedido;
    private String idarticulo;
    private double cantidad;
    private long preventa;
    private double subtotal;

    public long getIdPedido() {
        return idpedido;
    }

    public void setIdPedido(long idpedido) {
        this.idpedido = idpedido;
    }

    public String getIdArticulo() {
        return idarticulo;
    }

    public void setIdArticulo(String idarticulo) {
        this.idarticulo = idarticulo;
    }

    public double getCantidad() {
        return cantidad;
    }

    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }

    public long getPreVenta() {
        return preventa;
    }

    public void setPreVenta(long preventa) {
        this.preventa = preventa;
    }

    public double getSubTotal() {
        return subtotal;
    }

    public void setSubTotal(double subtotal) {
        this.subtotal = subtotal;
    }

}
