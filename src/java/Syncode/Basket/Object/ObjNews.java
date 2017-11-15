/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Object;

/**
 *
 * @author Yuga
 */
public class ObjNews {
    private String judul="";
    private String tgl="";
    private String desk="";
    private String foto="";
    private String id="";

    public ObjNews() {
    }

    public ObjNews(String id, String judul, String tgl, String desk, String foto) {
        this.id = id;
        this.judul = judul;
        this.tgl = tgl;
        this.desk = desk;
        this.foto = foto;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    public String getJudul() {
        return judul;
    }

    public void setJudul(String judul) {
        this.judul = judul;
    }

    public String getTgl() {
        return tgl;
    }

    public void setTgl(String tgl) {
        this.tgl = tgl;
    }

    public String getDesk() {
        return desk;
    }

    public void setDesk(String desk) {
        this.desk = desk;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    
    
    
    
}
