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
public class ObjPlayerFront {
    private String IdPemain="";
    private String NamaPemain="";
    private String Tinggi="";
    private String NamaPos="";
    private String Foto="";

    public ObjPlayerFront() {
    }

    public ObjPlayerFront(String IdPemain, String NamaPemain, String Tinggi, String NamaPos, String Foto) {
        this.IdPemain = IdPemain;
        this.NamaPemain = NamaPemain;
        this.Tinggi = Tinggi;
        this.NamaPos = NamaPos;
        this.Foto = Foto;
    }

    public String getIdPemain() {
        return IdPemain;
    }

    public void setIdPemain(String IdPemain) {
        this.IdPemain = IdPemain;
    }

    public String getNamaPemain() {
        return NamaPemain;
    }

    public void setNamaPemain(String NamaPemain) {
        this.NamaPemain = NamaPemain;
    }

    public String getTinggi() {
        return Tinggi;
    }

    public void setTinggi(String Tinggi) {
        this.Tinggi = Tinggi;
    }

    public String getNamaPos() {
        return NamaPos;
    }

    public void setNamaPos(String NamaPos) {
        this.NamaPos = NamaPos;
    }

    public String getFoto() {
        return Foto;
    }

    public void setFoto(String Foto) {
        this.Foto = Foto;
    }
    
    
}
