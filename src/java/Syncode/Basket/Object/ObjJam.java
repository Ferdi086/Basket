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
public class ObjJam {

    String jam="";
    String menit="";
    String detik="";
    
    public ObjJam() {
    } 
    
    public String getJam() {
        return jam;
    }

    public void setJam(String jam) {
        this.jam = jam;
    }

    public String getMenit() {
        return menit;
    }

    public void setMenit(String menit) {
        this.menit = menit;
    }

    public String getDetik() {
        return detik;
    }

    public void setDetik(String detik) {
        this.detik = detik;
    }

    public ObjJam(String jam, String menit, String detik) {
        this.jam = jam;
        this.menit = menit;
        this.detik = detik;
    }
    
}
