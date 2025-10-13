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
public class ReporteDto {

    private int nropedidos;
    private double totalpedidos;

    public int getNroPedidos() {
        return nropedidos;
    }

    public void setNroPedidos(int nropedidos) {
        this.nropedidos = nropedidos;
    }

    public double getTotalPedidos() {
        return totalpedidos;
    }

    public void setTotalPedidos(double totalpedidos) {
        this.totalpedidos = totalpedidos;
    }
}
