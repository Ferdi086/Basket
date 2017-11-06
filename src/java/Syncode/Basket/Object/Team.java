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
    private String Team;
    private String Logo;
    private String Gambar;
    
public Team(){
}
   
public Team(String id, String Team, String Logo, String Gambar) {
    this.id = id;
    this.Team = Team;
    this.Logo = Logo;
    this.Gambar = Gambar;
}

    public String getGambar() {
        return Gambar;
    }

    public void setGambar(String Gambar) {
        this.Gambar = Gambar;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTeam() {
        return Team;
    }

    public void setTeam(String Team) {
        this.Team = Team;
    }
    
     public String getLogo() {
        return Logo;
    }

    public void setLogo(String Logo) {
        this.Logo = Logo;
    }

    
}
