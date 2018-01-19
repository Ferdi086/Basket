/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Object;

import java.util.Date;
import org.json.JSONObject;

/**
 *
 * @author meiiko
 */
public class ObjPlayer {
    private String idPemain="";
    private String namaPemain ="";
    private String region ="";
    private String tgl="";
    private String tinggi="";
    private String berat="";
    private String pos="";
    private String namaPos="";
    private String team="";
    private String noPunggung="";
    private String flagactive="";
    private String foto="";
    private String idTeam="";
    private String logo="";
    private String tangan="";
    private String nama = "";
    private String foto1="";
    
    private int No;
   
    public ObjPlayer() {
    }

    public ObjPlayer(int No,String idPemain, String namaPemain, String tgl, String tinggi, String berat, String pos, String namaPos, String idTeam, String team, String noPunggung, String foto, String logo) {
        this.idPemain = idPemain;
        this.namaPemain = namaPemain;
        this.tgl = tgl;
        this.tinggi = tinggi;
        this.berat = berat;
        this.pos = pos;
        this.namaPos = namaPos;
        this.team = team;
        this.noPunggung = noPunggung;
        this.foto=foto;
        this.idTeam=idTeam;
        this.logo=logo;
        this.No=No;
    }
    public ObjPlayer(String idPemain, String namaPemain, String region, String tgl, String tinggi, String berat, String pos, String namaPos, String idTeam, String team, String noPunggung, String tangan, String foto, String flagactive, String nama, String foto1) {
        this.idPemain = idPemain;
        this.namaPemain = namaPemain;
        this.region = region;
        this.tgl = tgl;
        this.tinggi = tinggi;
        this.berat = berat;
        this.pos = pos;
        this.namaPos = namaPos;
        this.team = team;
        this.noPunggung = noPunggung;
        this.tangan = tangan;
        this.foto=foto;
        this.idTeam=idTeam;
        this.flagactive=flagactive;
        this.nama = nama;
        this.foto1 = foto1;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getFoto1() {
        return foto1;
    }

    public void setFoto1(String foto1) {
        this.foto1 = foto1;
    }
    public ObjPlayer(String IdPemain, String NamaPemain){
        this.idPemain = IdPemain;
        this.namaPemain = NamaPemain;
    }

    public String getIdPemain() {
        return idPemain;
    }
    
    public void setIdPemain(String idPemain) {
        this.idPemain = idPemain;
    }

    public String getNamaPemain() {
        return namaPemain;
    }

    public void setNamaPemain(String namaPemain) {
        this.namaPemain = namaPemain;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }
    
    public String getTgl() {
        return tgl;
    }

    public void setTgl(String tgl) {
        this.tgl = tgl;
    }

    public String getTinggi() {
        return tinggi;
    }

    public void setTinggi(String tinggi) {
        this.tinggi = tinggi;
    }

    public String getBerat() {
        return berat;
    }

    public void setBerat(String berat) {
        this.berat = berat;
    }

    public String getPos() {
        return pos;
    }

    public void setPos(String pos) {
        this.pos = pos;
    }

    public String getNamaPos() {
        return namaPos;
    }

    public void setNamaPos(String namaPos) {
        this.namaPos = namaPos;
    }

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }

    public String getNoPunggung() {
        return noPunggung;
    }

    public void setNoPunggung(String noPunggung) {
        this.noPunggung = noPunggung;
    }

    public String getTangan() {
        return tangan;
    }

    public void setTangan(String tangan) {
        this.tangan = tangan;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getIdTeam() {
        return idTeam;
    }

    public void setIdTeam(String idTeam) {
        this.idTeam = idTeam;
    }

    public int getNo() {
        return No;
    }

    public void setNo(int No) {
        this.No = No;
    }

    public String getFlagactive() {
        return flagactive;
    }

    public void setFlagactive(String flagactive) {
        this.flagactive = flagactive;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }
    
    
       
    
   

    
     
}
