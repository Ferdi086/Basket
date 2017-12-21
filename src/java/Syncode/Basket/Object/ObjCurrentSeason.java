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
public class ObjCurrentSeason {
    private String id="";
    private String thn_awal="";
    private String thn_akhir="";

    public ObjCurrentSeason(String id, String thn_awal, String thn_akhir) {
        this.id = id;
        this.thn_awal = thn_awal;
        this.thn_akhir = thn_akhir;
    }

    public ObjCurrentSeason() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getThn_awal() {
        return thn_awal;
    }

    public void setThn_awal(String thn_awal) {
        this.thn_awal = thn_awal;
    }

    public String getthn_akhir() {
        return thn_akhir;
    }

    public void setthn_akhir(String thn_akhir) {
        this.thn_akhir = thn_akhir;
    }
    
    
    
    
    
}
