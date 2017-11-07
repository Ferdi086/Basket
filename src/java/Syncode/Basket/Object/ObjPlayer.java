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
    private String IdPemain="";
    private String NamaPemain ="";
    private String Tgl="";
    private String Tinggi="";
    private String Berat="";
    private String Pos="";
    private String NamaPos="";
    private String Team="";
    private String NoPunggung="";
    private String Tangan="";
    private String Foto="";
    private String IdTeam="";
    private String Logo="";
    private int No=0;
    
    private JSONObject json = new JSONObject();

    public ObjPlayer() {
    }

    public ObjPlayer(int No,String IdPemain, String NamaPemain, String Tgl, String Tinggi, String Berat, String Pos, String NamaPos, String IdTeam, String Team, String NoPunggung, String Foto, String Logo) {
        this.IdPemain = IdPemain;
        this.NamaPemain = NamaPemain;
        this.Tgl = Tgl;
        this.Tinggi = Tinggi;
        this.Berat = Berat;
        this.Pos = Pos;
        this.NamaPos = NamaPos;
        this.Team = Team;
        this.NoPunggung = NoPunggung;
        this.No=No;
        this.Foto=Foto;
        this.IdTeam=IdTeam;
        this.Logo = Logo;
    }
    public ObjPlayer(String IdPemain, String NamaPemain){
        this.IdPemain = IdPemain;
        this.NamaPemain = NamaPemain;
    }

    public String getLogo() {
        return Logo;
    }

    public void setLogo(String Logo) {
        this.Logo = Logo;
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

    public String getTgl() {
        return Tgl;
    }

    public void setTgl(String Tgl) {
        this.Tgl = Tgl;
    }

    public String getTinggi() {
        return Tinggi;
    }

    public void setTinggi(String Tinggi) {
        this.Tinggi = Tinggi;
    }

    public String getBerat() {
        return Berat;
    }

    public void setBerat(String Berat) {
        this.Berat = Berat;
    }

    public String getPos() {
        return Pos;
    }

    public void setPos(String Pos) {
        this.Pos = Pos;
    }

    public String getNamaPos() {
        return NamaPos;
    }

    public void setNamaPos(String NamaPos) {
        this.NamaPos = NamaPos;
    }

    public String getTeam() {
        return Team;
    }

    public void setTeam(String Team) {
        this.Team = Team;
    }

    public String getNoPunggung() {
        return NoPunggung;
    }

    public void setNoPunggung(String NoPunggung) {
        this.NoPunggung = NoPunggung;
    }

    public String getTangan() {
        return Tangan;
    }

    public void setTangan(String Tangan) {
        this.Tangan = Tangan;
    }

    public String getFoto() {
        return Foto;
    }

    public void setFoto(String Foto) {
        this.Foto = Foto;
    }

    public String getIdTeam() {
        return IdTeam;
    }

    public void setIdTeam(String IdTeam) {
        this.IdTeam = IdTeam;
    }

    public int getNo() {
        return No;
    }

    public void setNo(int No) {
        this.No = No;
    }

    
       
    public JSONObject toJson(){ 
         json.put("No",No);
         json.put("Id_Pemain",IdPemain);
         json.put("Nama_Pemain", NamaPemain);
         json.put("Tgl",Tgl);
         json.put("Tinggi", Tinggi);
         json.put("Berat", Berat);
         json.put("Pos", Pos);
         json.put("Team", IdTeam +"--"+ Team);
         json.put("No_Punggung", NoPunggung);
         json.put("Foto",Foto);
         //json.put("Tangan", Tangan);
         json.put("action","<button class=\"btn btn-warning button\" data-target=\"#updatemodal\" "
                 + "onclick =\"update('"+IdPemain+"','"+NamaPemain+"','"+IdTeam+"','"+Pos+"','"+NoPunggung+"','"+Tinggi+"',"
                    + "'"+Berat+"','"+Tgl+"','"+Tangan+"','"+Foto+"');\""
                    + " data-toggle=\"modal\"><span class=\"glyphicon glyphicon-edit\">"
                    + "</span></button>");
           
         return json;
    }
    public JSONObject getJson(){
        return json;
    }

   

    
     
}
