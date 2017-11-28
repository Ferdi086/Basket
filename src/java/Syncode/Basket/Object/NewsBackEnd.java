/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Object;

/**
 *
 * @author meiiko
 */
public class NewsBackEnd {
     private String idnews;
    private String judul;
    private String tanggal;
    private String deskripsi;
    private String foto;
    private String flagactive;

    public NewsBackEnd() {
    }

    public NewsBackEnd(String idnews, String judul, String tanggal, String deskripsi, String foto, String flagactive) {
        this.idnews = idnews;
        this.judul = judul;
        this.tanggal = tanggal;
        this.deskripsi = deskripsi;
        this.foto = foto;
        this.flagactive = flagactive;
    }

    public String getIdnews() {
        return idnews;
    }

    public void setIdnews(String idnews) {
        this.idnews = idnews;
    }

    public String getJudul() {
        return judul;
    }

    public void setJudul(String judul) {
        this.judul = judul;
    }

    public String getTanggal() {
        return tanggal;
    }

    public void setTanggal(String tanggal) {
        this.tanggal = tanggal;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getFlagactive() {
        return flagactive;
    }

    public void setFlagactive(String flagactive) {
        this.flagactive = flagactive;
    }
    
}
