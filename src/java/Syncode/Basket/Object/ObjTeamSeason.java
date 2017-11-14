/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Object;

/**
 *
 * @author Ferdinand
 */
public class ObjTeamSeason {
    private String id_musim = "";
    private String nama_m = "";

    public ObjTeamSeason(String id_musim, String nama_m) {
        this.id_musim = id_musim;
        this.nama_m = nama_m;
    }

    public String getId_musim() {
        return id_musim;
    }

    public void setId_musim(String id_musim) {
        this.id_musim = id_musim;
    }

    public String getNama_m() {
        return nama_m;
    }

    public void setNama_m(String nama_m) {
        this.nama_m = nama_m;
    }
    
    
    
}
