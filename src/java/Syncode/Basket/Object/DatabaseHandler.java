/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Object;

import java.sql.SQLException;
import java.util.HashMap;
import org.json.JSONArray;

/**
 *
 * @author meiiko
 */
public class DatabaseHandler extends Connect {
     public HashMap getTeam(){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select ID_Team,Nama_Team,Logo from MsTeam"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){                
              tr.put(j++,new Team(rs.getString(1), rs.getString(2), rs.getString(3)));
              
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
     public HashMap getPosisi(){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select KD_Pos,Nama_Posisi from MsPosisi"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){                
              tr.put(j++,new Posisi(rs.getString(1), rs.getString(2)));
              
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    public boolean setMsPemain (String name,String id_team, String posisi, String no_punggung, String tinggi, String berat, String tgl, String tangan, String foto){
        try {         
                String query = "INSERT INTO MsPemain1 (Nama_Pemain,Id_Team,KD_Pos,No_Punggung,Tinggi,Berat,Tgl_Lahir,Tangan,Foto) values ('"+name+"','"+id_team+"',"
                        + "'"+ posisi+"','"+ no_punggung +"','"+ tinggi+ "','"+ berat +"','"+ tgl +"','"+ tangan +"','"+ foto +"')";
                ps = conn.prepareStatement(query);
                ps.executeUpdate();  
                return true;
            
        } catch (SQLException ex) {
            return false;   
        }         
    }
    public boolean setMsTeam(String nick, String nama_team, String logo){
        try {         
                String query = "INSERT INTO MsTeam (ID_Team,Nama_Team)values('"+nick+"','"+nama_team+"','"+logo+"')";
                ps = conn.prepareStatement(query);
                ps.executeUpdate();  
                return true;
            
        } catch (SQLException ex) {
            return false;   
        }         
    }
    public JSONArray getPlayer(){
        JSONArray hm = new JSONArray();
        try{
            int i = 1;
            String query = "select distinct a.ID_Pemain,a.Nama_Pemain,Convert(varchar(50), a.Tgl_Lahir,106),a.Tinggi,a.Berat,a.KD_Pos,c.Nama_Team,a.No_Punggung from MsPemain a,MsPosisi b,MsTeam c where a.ID_Team=c.ID_Team"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                ObjPlayer obj = new ObjPlayer(i++, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                hm.put(obj.toJson());
            }
        }catch (SQLException ex) {
                
        }
        return hm;
    }
    /*public HashMap getNickTeam(String nick){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select Id_Team from MsTeam WHERE ID_Mahasiswa = '"+nick+"'"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if(rs.next()){                
                tr.put(j++,new Team(rs.getString(1),rs.getString(2), true));              
            }else{
                tr.put(j++,new Team("","", false));    
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }*/
}
