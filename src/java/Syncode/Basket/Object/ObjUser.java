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
public class ObjUser {
    private String ID="";
    private String Password="";
    private String Nama="";

    public ObjUser(String ID, String Password, String Nama) {
        this.ID = ID;
        this.Password = Password;
        this.Nama = Nama;
    }

    public ObjUser() {
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getNama() {
        return Nama;
    }

    public void setNama(String Nama) {
        this.Nama = Nama;
    }
    
    
    
}
