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
    private String jenis_musim;
    private String tgl_awal;
    private String tgl_akhir;
    private String flagactive;
    
    public Musim(){
    }
    public Musim(String id_musim, String nama_musim) {
        this.id_musim = id_musim;
        this.nama_musim = nama_musim;
    }
   
    
    public Musim(String id_musim, String nama_musim, String jenis_musim, String tgl_awal, String tgl_akhir, String flagactive) {
        this.id_musim = id_musim;
        this.nama_musim = nama_musim;
        this.jenis_musim = jenis_musim;
        this.tgl_awal = tgl_awal;
        this.tgl_akhir = tgl_akhir;
        this.flagactive = flagactive;
    }

    public String getFlagactive() {
        return flagactive;
    }

    public void setFlagactive(String flagactive) {
        this.flagactive = flagactive;
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

    public String getJenis_musim() {
        return jenis_musim;
    }

    public void setJenis_musim(String jenis_musim) {
        this.jenis_musim = jenis_musim;
    }

    public String getTgl_awal() {
        return tgl_awal;
    }

    public void setTgl_awal(String tgl_awal) {
        this.tgl_awal = tgl_awal;
    }

    public String getTgl_akhir() {
        return tgl_akhir;
    }

    public void setTgl_akhir(String tgl_akhir) {
        this.tgl_akhir = tgl_akhir;
    }
    
    
    
}
