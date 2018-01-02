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
public class ObjTopTenDashboard {
    private String id_pemain="";
    private String nama_pemain="";
    private String id_team="";
    private String nama_team="";
    private String logo="";
    private String point="";
    private int no=0;

    public ObjTopTenDashboard() {
    }
    
    public ObjTopTenDashboard(int no, String id_pemain, String nama_pemain, String id_team, String nama_team, String logo, String point) {
        this.no = no;
        this.id_pemain = id_pemain;
        this.nama_pemain = nama_pemain;
        this.id_team = id_team;
        this.nama_team = nama_team;
        this.logo = logo;
        this.point = point;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    
    public String getId_pemain() {
        return id_pemain;
    }

    public void setId_pemain(String id_pemain) {
        this.id_pemain = id_pemain;
    }

    public String getNama_pemain() {
        return nama_pemain;
    }

    public void setNama_pemain(String nama_pemain) {
        this.nama_pemain = nama_pemain;
    }

    public String getId_team() {
        return id_team;
    }

    public void setId_team(String id_team) {
        this.id_team = id_team;
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

    public String getPoint() {
        return point;
    }

    public void setPoint(String point) {
        this.point = point;
    }
    
    
    
    
}
