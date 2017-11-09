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
public class PlayerDetailGL {
    private String id_m = "";
    private String id_p = "";
    private String nama_m = "";

    public PlayerDetailGL() {
    }
    
    public PlayerDetailGL(String id_m, String id_p, String nama_m) {
        this.id_m = id_m;
        this.id_p = id_p;
        this.nama_m = nama_m;
    }

    public String getId_m() {
        return id_m;
    }

    public void setId_m(String id_m) {
        this.id_m = id_m;
    }

    public String getId_p() {
        return id_p;
    }

    public void setId_p(String id_p) {
        this.id_p = id_p;
    }

    public String getNama_m() {
        return nama_m;
    }

    public void setNama_m(String nama_m) {
        this.nama_m = nama_m;
    }
    
    
    
}
