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
public class ObjPlayerlistTeam {
    private String id_musim;
    private String id_pemain;
    private String nama_pemain;
    private String nama_team;
    private String nama_posisi;
    private String foto;
    private String tinggi;

    public ObjPlayerlistTeam(String id_musim, String id_pemain, String nama_pemain, String nama_team, String nama_posisi, String foto, String tinggi) {
        this.id_musim = id_musim;
        this.id_pemain = id_pemain;
        this.nama_pemain = nama_pemain;
        this.nama_team = nama_team;
        this.nama_posisi = nama_posisi;
        this.foto = foto;
        this.tinggi = tinggi;
    }

    
    public ObjPlayerlistTeam() {
    }

    public String getId_musim() {
        return id_musim;
    }

    public void setId_musim(String id_musim) {
        this.id_musim = id_musim;
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

    public String getNama_team() {
        return nama_team;
    }

    public void setNama_team(String nama_team) {
        this.nama_team = nama_team;
    }

    public String getNama_posisi() {
        return nama_posisi;
    }

    public void setNama_posisi(String nama_posisi) {
        this.nama_posisi = nama_posisi;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getTinggi() {
        return tinggi;
    }

    public void setTinggi(String tinggi) {
        this.tinggi = tinggi;
    }
    
    
    
}
