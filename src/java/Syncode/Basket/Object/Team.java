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
public class Team {
    /*
    private String id="";
    private String namateam="";
    private String divisi="";
    private String logo="";
    private String id_musim="";
    private String thn_awal="";
    private String thn_akhir="";
    private String flagactive="";
    */
    private String id;
    private String namateam;
    private String divisi;
    private String logo;
    private String id_musim;
    private String thn_awal;
    private String thn_akhir;
    private String flagactive;
    public Team() {
    }

    public Team(String id, String namateam, String divisi, String logo, String id_musim, String thn_awal, String thn_akhir, String flagactive) {
        this.id = id;
        this.namateam = namateam;
        this.divisi = divisi;
        this.logo = logo;
        this.id_musim = id_musim;
        this.thn_awal = thn_awal;
        this.thn_akhir = thn_akhir;
        this.flagactive = flagactive;
    }
        
    public Team(String id, String namateam, String divisi, String logo, String flagactive) {
        this.id = id;
        this.namateam = namateam;
        this.divisi = divisi;
        this.logo = logo;
        this.flagactive = flagactive;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNamateam() {
        return namateam;
    }

    public void setNamateam(String namateam) {
        this.namateam = namateam;
    }

    public String getDivisi() {
        return divisi;
    }

    public void setDivisi(String divisi) {
        this.divisi = divisi;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getFlagactive() {
        return flagactive;
    }

    public String getId_musim() {
        return id_musim;
    }

    public void setId_musim(String id_musim) {
        this.id_musim = id_musim;
    }

    public String getThn_awal() {
        return thn_awal;
    }

    public void setThn_awal(String thn_awal) {
        this.thn_awal = thn_awal;
    }

    public String getThn_akhir() {
        return thn_akhir;
    }

    public void setThn_akhir(String thn_akhir) {
        this.thn_akhir = thn_akhir;
    }

    
    
    public void setFlagactive(String flagactive) {
        this.flagactive = flagactive;
    }
   
}
