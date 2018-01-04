/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Object;

import org.json.JSONObject;

/**
 *
 * @author Ferdinand
 */
public class ObjMatchStatistic {
    private String match="";
    private String tgl="";
    private String team1="";
    private String logo1="";
    private String pts1="";
    private String wl1="";
    private String team2="";
    private String logo2="";
    private String pts2="";
    private String wl2="";
    
    private JSONObject json = new JSONObject();
    
    public ObjMatchStatistic(String match, String tgl, String team1, String logo1, String pts1, String wl1, String team2, String logo2, String pts2, String wl2) {
        this.match = match;
        this.tgl = tgl;
        this.team1 = team1;
        this.logo1 = logo1;
        this.pts1 = pts1;
        this.wl1 = wl1;
        this.team2 = team2;
        this.logo2 = logo2;
        this.pts2 = pts2;
        this.wl2 = wl2;
    }

    public JSONObject toJson(){ 
         json.put("tgl","<a href='#' data-toggle='tooltip' title='"+match+"'>"+tgl+"</a>" );
         json.put("team1","<a href='#'><img src='../img/Team/Logo/"+logo1+"' width='30px' height='30px'> "+team1+"</a>");
         json.put("pts1", pts1);
         json.put("team2","<a href='#'><img src='../img/Team/Logo/"+logo2+"' width='30px' height='30px'> "+team2+"</a>");
         json.put("pts2", pts2);
          return json;
    }
    public JSONObject getJson(){
        return json;
    }
    public String getMatch() {
        return match;
    }

    public void setMatch(String match) {
        this.match = match;
    }

    public ObjMatchStatistic() {
    }

    public String getTgl() {
        return tgl;
    }

    public void setTgl(String tgl) {
        this.tgl = tgl;
    }

    public String getTeam1() {
        return team1;
    }

    public void setTeam1(String team1) {
        this.team1 = team1;
    }

    public String getLogo1() {
        return logo1;
    }

    public void setLogo1(String logo1) {
        this.logo1 = logo1;
    }

    public String getPts1() {
        return pts1;
    }

    public void setPts1(String pts1) {
        this.pts1 = pts1;
    }

    public String getWl1() {
        return wl1;
    }

    public void setWl1(String wl1) {
        this.wl1 = wl1;
    }

    public String getTeam2() {
        return team2;
    }

    public void setTeam2(String team2) {
        this.team2 = team2;
    }

    public String getLogo2() {
        return logo2;
    }

    public void setLogo2(String logo2) {
        this.logo2 = logo2;
    }

    public String getPts2() {
        return pts2;
    }

    public void setPts2(String pts2) {
        this.pts2 = pts2;
    }

    public String getWl2() {
        return wl2;
    }

    public void setWl2(String wl2) {
        this.wl2 = wl2;
    }

    
    
}
