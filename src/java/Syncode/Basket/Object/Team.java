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
    private String id;
    private String nama_team;
    private String logo;
    private String gambar;
    private String flagactive;
   // private int No=0;
    //private JSONObject json = new JSONObject();
public Team(){
}
   
public Team(String id, String nama_team, String logo, String gambar, String flagactive) {
    this.id = id;
    this.nama_team = nama_team;
    this.logo = logo;
    this.gambar = gambar;
    this.flagactive=flagactive;
    //this.No=No;
}
    /*public JSONObject toJson(){ 
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
*/
    public String getNick() {
        return id;
    }

    public void setNick(String Nick) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNama_team() {
        return nama_team;
    }

    public void setNama_team(String nama_team) {
        this.nama_team = nama_team;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getGambar() {
        return gambar;
    }

    public void setGambar(String gambar) {
        this.gambar = gambar;
    }

    public String getFlagactive() {
        return flagactive;
    }

    public void setFlagactive(String flagactive) {
        this.flagactive = flagactive;
    }

    

}
