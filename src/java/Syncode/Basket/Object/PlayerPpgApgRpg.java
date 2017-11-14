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
public class PlayerPpgApgRpg {
    private String nama="";
    private String ppg="";
    private String apg="";
    private String rpg="";

    public PlayerPpgApgRpg() {
    }

    public PlayerPpgApgRpg(String nama, String ppg, String apg, String rpg) {
        this.nama = nama;
        this.ppg = ppg;
        this.apg = apg;
        this.rpg = rpg;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getPpg() {
        return ppg;
    }

    public void setPpg(String ppg) {
        this.ppg = ppg;
    }

    public String getApg() {
        return apg;
    }

    public void setApg(String apg) {
        this.apg = apg;
    }

    public String getRpg() {
        return rpg;
    }

    public void setRpg(String rpg) {
        this.rpg = rpg;
    }
    
    
}
