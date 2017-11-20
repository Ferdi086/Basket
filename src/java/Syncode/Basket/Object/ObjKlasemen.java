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
public class ObjKlasemen {
    private String id_musim="";
    private String nama="";
    private String id_team="";
    private String gp="";
    private String w="";
    private String l="";
    private String pts="";
    private String logo="";
    private int no=0;

    public ObjKlasemen() {
    }
    
    public ObjKlasemen(int no, String id_musim, String nama, String id_team, String gp, String w, String l, String pts, String logo) {
        this.no = no;
        this.id_musim = id_musim;
        this.nama = nama;
        this.id_team = id_team;
        this.gp = gp;
        this.w = w;
        this.l = l;
        this.pts = pts;
        this.logo = logo;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getId_musim() {
        return id_musim;
    }

    public void setId_musim(String id_musim) {
        this.id_musim = id_musim;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getId_team() {
        return id_team;
    }

    public void setId_team(String id_team) {
        this.id_team = id_team;
    }

    public String getGp() {
        return gp;
    }

    public void setGp(String gp) {
        this.gp = gp;
    }

    public String getW() {
        return w;
    }

    public void setW(String w) {
        this.w = w;
    }

    public String getL() {
        return l;
    }

    public void setL(String l) {
        this.l = l;
    }

    public String getPts() {
        return pts;
    }

    public void setPts(String pts) {
        this.pts = pts;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }
    
    
    
    
}
