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
    private String id="";
    private String namateam="";
    private String divisi="";
    private String logo="";
    private String flagactive="";

    public Team() {
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

    public void setFlagactive(String flagactive) {
        this.flagactive = flagactive;
    }
   
}
