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
public class PlayerDetailHistory {
    private String season="";
    private String age="";
    private String team="";
    private String pos="";
    private String gp="";
    private String logo ="";
    private String nteam ="";

    public PlayerDetailHistory() {
    }

    public PlayerDetailHistory(String season, String age, String logo, String team,  String nteam, String pos, String gp) {
        this.season = season;
        this.age = age;
        this.logo = logo;
        this.team = team;
        this.nteam = nteam;
        this.pos = pos;
        this.gp = gp;
    }

    public String getSeason() {
        return season;
    }

    public void setSeason(String season) {
        this.season = season;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }

    public String getNteam() {
        return nteam;
    }

    public void setNteam(String nteam) {
        this.nteam = nteam;
    }

    public String getPos() {
        return pos;
    }

    public void setPos(String pos) {
        this.pos = pos;
    }

    public String getGp() {
        return gp;
    }

    public void setGp(String gp) {
        this.gp = gp;
    }
    
    
    
}
