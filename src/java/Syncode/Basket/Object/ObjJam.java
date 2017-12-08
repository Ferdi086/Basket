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

    private String jam="";
    private String menit="";
    private String detik="";
    private String tgl="";
    
    public ObjJam() {
    } 
    
    public ObjJam(String jam, String menit, String detik,String tgl) {
        this.jam = jam;
        this.menit = menit;
        this.detik = detik;
        this.tgl = tgl;
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

    public String getTgl() {
        return tgl;
    }

    public void setTgl(String tgl) {
        this.tgl = tgl;
    }
    
}
