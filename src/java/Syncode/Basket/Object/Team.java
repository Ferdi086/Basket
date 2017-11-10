/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Object;

import org.json.JSONObject;

/**
 *
 * @author meiiko
 */
public class Team {
    private String Nick;
    private String Nama_Team;
    private String Logo;
    private String Gambar;
    private int No=0;
    private JSONObject json = new JSONObject();
public Team(){
}
   
public Team(int No, String Nick, String Nama_Team, String Logo, String Gambar) {
    this.Nick = Nick;
    this.Nama_Team = Nama_Team;
    this.Logo = Logo;
    this.Gambar = Gambar;
    this.No=No;
}
    public JSONObject toJson(){ 
         json.put("No",No);
         json.put("Nick",Nick);
         json.put("Nama_Team",Nama_Team);
         json.put("Logo", Logo);
         json.put("Gambar",Gambar);
         json.put("action","<button class=\"btn btn-warning button\" data-target=\"#updatemodal\" "
                 + "onclick =\"update('"+Nick+"','"+Nama_Team+"','"+Logo+"','"+Gambar+"');\""
                    + " data-toggle=\"modal\"><span class=\"glyphicon glyphicon-edit\">"
                    + "</span></button>");
           
         return json;
    }
    public JSONObject getJson(){
        return json;
    }

    public String getNick() {
        return Nick;
    }

    public void setNick(String Nick) {
        this.Nick = Nick;
    }

    public String getNama_Team() {
        return Nama_Team;
    }

    public void setNama_Team(String Nama_Team) {
        this.Nama_Team = Nama_Team;
    }

    public String getLogo() {
        return Logo;
    }

    public void setLogo(String Logo) {
        this.Logo = Logo;
    }

    public String getGambar() {
        return Gambar;
    }

    public void setGambar(String Gambar) {
        this.Gambar = Gambar;
    }

    public int getNo() {
        return No;
    }

    public void setNo(int No) {
        this.No = No;
    }
    
   
    
}
