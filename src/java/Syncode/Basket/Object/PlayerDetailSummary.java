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
public class PlayerDetailSummary {
    private String sum="";
    private String gp="";
    private String ppg="";
    private String rpg="";
    private String apg="";
    private String fg="";
    private String ft="";

    public PlayerDetailSummary() {
    }

    
    public PlayerDetailSummary(String sum, String gp, String ppg, String rpg, String apg, String fg, String ft) {
        this.sum = sum;
        this.gp = gp;
        this.ppg = ppg;
        this.rpg = rpg;
        this.apg = apg;
        this.fg = fg;
        this.ft = ft;
    }

    public String getSum() {
        return sum;
    }

    public void setSum(String sum) {
        this.sum = sum;
    }

    public String getGp() {
        return gp;
    }

    public void setGp(String gp) {
        this.gp = gp;
    }

    public String getPpg() {
        return ppg;
    }

    public void setPpg(String ppg) {
        this.ppg = ppg;
    }

    public String getRpg() {
        return rpg;
    }

    public void setRpg(String rpg) {
        this.rpg = rpg;
    }

    public String getApg() {
        return apg;
    }

    public void setApg(String apg) {
        this.apg = apg;
    }

    public String getFg() {
        return fg;
    }

    public void setFg(String fg) {
        this.fg = fg;
    }

    public String getFt() {
        return ft;
    }

    public void setFt(String ft) {
        this.ft = ft;
    }
    
    
}
