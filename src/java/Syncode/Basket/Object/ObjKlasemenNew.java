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
public class ObjKlasemenNew {
    private int no=0;
    private String id_team="";
    private String nama="";
    private String id_musim="";
    private String logo="";

    public ObjKlasemenNew(int no, String id_team, String nama, String id_musim, String logo) {
        this.no = no;
        this.id_team = id_team;
        this.nama = nama;
        this.id_musim = id_musim;
        this.logo = logo;
    }
    
    public ObjKlasemenNew() {
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    
    
    public String getId_team() {
        return id_team;
    }

    public void setId_team(String id_team) {
        this.id_team = id_team;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getId_musim() {
        return id_musim;
    }

    public void setId_musim(String id_musim) {
        this.id_musim = id_musim;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }
    
    
    
}
