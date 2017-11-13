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
public class ObjTopPoint {
    private int No = 0;
    private String Foto = "";
    private String NamaPemain = "";
    private String Pos = "";
    private String Point = "";

    public ObjTopPoint() {
    }
    
    public ObjTopPoint(int No, String Foto, String NamaPemain, String Pos, String Point) {
        this.No = No;
        this.Foto = Foto;
        this.NamaPemain = NamaPemain;
        this.Pos = Pos;
        this.Point = Point;
    }
    public int getNo() {
        return No;
    }

    public void setNo(int No) {
        this.No = No;
    }

    public String getFoto() {
        return Foto;
    }

    public void setFoto(String Foto) {
        this.Foto = Foto;
    }

    public String getNamaPemain() {
        return NamaPemain;
    }

    public void setNamaPemain(String NamaPemain) {
        this.NamaPemain = NamaPemain;
    }

    public String getPos() {
        return Pos;
    }

    public void setPos(String Pos) {
        this.Pos = Pos;
    }

    public String getPoint() {
        return Point;
    }

    public void setPoint(String Point) {
        this.Point = Point;
    }

}
