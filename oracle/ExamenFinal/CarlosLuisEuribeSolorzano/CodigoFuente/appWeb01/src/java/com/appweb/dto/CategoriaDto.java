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
public class CategoriaDto {

    private long idcategoria;
    private String nomcategoria;
    private String pregijo;
    private long concategoria;

    public long getIdCategoria() {
        return idcategoria;
    }

    public void setIdCategoria(long idcategoria) {
        this.idcategoria = idcategoria;
    }

    public String getNomCategoria() {
        return nomcategoria;
    }

    public void setNomCategoria(String nomcategoria) {
        this.nomcategoria = nomcategoria;
    }

    public String getPrefijo() {
        return pregijo;
    }

    public void setPrefijo(String pregijo) {
        this.pregijo = pregijo;
    }

    public long getConCategoria() {
        return concategoria;
    }

    public void setConCategoria(long concategoria) {
        this.concategoria = concategoria;
    }

}
