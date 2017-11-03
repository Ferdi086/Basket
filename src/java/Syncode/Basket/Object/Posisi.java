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
public class Posisi {
    private String kd_pos;
    private String nama_pos;
    public Posisi(){
    }

    public Posisi(String kd_pos, String nama_pos) {
        this.kd_pos = kd_pos;
        this.nama_pos = nama_pos;
    }

    public String getKd_pos() {
        return kd_pos;
    }

    public void setKd_pos(String kd_pos) {
        this.kd_pos = kd_pos;
    }

    public String getNama_pos() {
        return nama_pos;
    }

    public void setNama_po(String nama_pos) {
        this.nama_pos = nama_pos;
    }

   
    
}
