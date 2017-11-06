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
    private String Foto="";
    private String Id_Team="";
    private int No=0;
    
    private JSONObject json = new JSONObject();

    public ObjPlayer() {
    }

    public ObjPlayer(int No,String Id_Pemain, String Nama_Pemain, String Tgl, String Tinggi, String Berat, String Pos, String Id_Team, String Team, String No_Punggung, String Foto) {
        this.Id_Pemain = Id_Pemain;
        this.Nama_Pemain = Nama_Pemain;
        this.Tgl = Tgl;
        this.Tinggi = Tinggi;
        this.Berat = Berat;
        this.Pos = Pos;
        this.Team = Team;
        this.No_Punggung = No_Punggung;
        this.No=No;
        this.Foto=Foto;
        this.Id_Team=Id_Team;
    }
       
    public JSONObject toJson(){ 
         json.put("No",No);
         json.put("Id_Pemain",Id_Pemain);
         json.put("Nama_Pemain", Nama_Pemain);
         json.put("Tgl",Tgl);
         json.put("Tinggi", Tinggi);
         json.put("Berat", Berat);
         json.put("Pos", Pos);
         json.put("Team", Id_Team +"--"+ Team);
         json.put("No_Punggung", No_Punggung);
         json.put("Foto",Foto);
         //json.put("Tangan", Tangan);
         json.put("action","<button class=\"btn btn-warning button\" data-target=\"#updatemodal\" "
                 + "onclick =\"update('"+Id_Pemain+"','"+Nama_Pemain+"','"+Id_Team+"','"+Pos+"','"+No_Punggung+"','"+Tinggi+"',"
                    + "'"+Berat+"','"+Tgl+"','"+Tangan+"','"+Foto+"');\""
                    + " data-toggle=\"modal\"><span class=\"glyphicon glyphicon-edit\">"
                    + "</span></button>");
           
         return json;
    }
    public JSONObject getJson(){
        return json;
    }

   

    
     
}
