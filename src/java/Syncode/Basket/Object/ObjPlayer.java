/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Object;

import java.util.Date;
import org.json.JSONObject;

/**
 *
 * @author meiiko
 */
public class ObjPlayer {
    private String Id_Pemain="";
    private String Nama_Pemain ="";
    private String Tgl="";
    private String Tinggi="";
    private String Berat="";
    private String Pos="";
    private String Team="";
    private String No_Punggung="";
    private String Tangan="";
    private int No=0;
    
    private JSONObject json = new JSONObject();

    public ObjPlayer() {
    }

    public ObjPlayer(int No,String Id_Pemain, String Nama_Pemain, String Tgl, String Tinggi, String Berat, String Pos, String Team, String No_Punggung) {
        this.Id_Pemain = Id_Pemain;
        this.Nama_Pemain = Nama_Pemain;
        this.Tgl = Tgl;
        this.Tinggi = Tinggi;
        this.Berat = Berat;
        this.Pos = Pos;
        this.Team = Team;
        this.No_Punggung = No_Punggung;
        this.No=No;
    }

  
     
    
      
    public JSONObject toJson(){ 
         json.put("No",No);
         json.put("Id_Pemain",Id_Pemain);
         json.put("Nama_Pemain", Nama_Pemain);
         json.put("Tgl",Tgl);
         json.put("Tinggi", Tinggi);
         json.put("Berat", Berat);
         json.put("Pos", Pos);
         json.put("Team", Team);
         json.put("No_Punggung", No_Punggung);
         //json.put("Tangan", Tangan);
         json.put("action","<button class=\"btn btn-warning button\" data-target=\"#Edit\" "
                 + "onclick =\"Edit('"+Id_Pemain+"','"+Nama_Pemain+"','"+Tgl+"','"+Tinggi+"',"
                    + "'"+Berat+"','"+Pos+"','"+Team+"','"+No_Punggung+"','"+Tangan+"');\""
                    + " data-toggle=\"modal\"><span class=\"glyphicon glyphicon-edit\">"
                    + "</span></button>");
           
         
         return json;
    }
    public JSONObject getJson(){
        return json;
    }

   

    
     
}
