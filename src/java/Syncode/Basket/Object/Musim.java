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
public class Musim {
    private String id_musim;
    private String nama_musim;

    public Musim(String id_musim, String nama_musim) {
        this.id_musim = id_musim;
        this.nama_musim = nama_musim;
    }

    public String getId_musim() {
        return id_musim;
    }

    public void setId_musim(String id_musim) {
        this.id_musim = id_musim;
    }

    public String getNama_musim() {
        return nama_musim;
    }

    public void setNama_musim(String nama_musim) {
        this.nama_musim = nama_musim;
    }
    
    
    
}
