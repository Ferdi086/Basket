/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Object;

import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author meiiko
 */
public class DatabaseHandler extends Connect {
    public HashMap getClock(){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "SELECT CAST(DATEPART(HOUR,GETDATE())AS VARCHAR(2))as h, CAST(DATEPART(MINUTE,GETDATE())AS VARCHAR(2))as m,CAST(DATEPART(SECOND,GETDATE())AS VARCHAR(2))as s, RIGHT('00' + CAST(DATEPART(DAY, GETDATE()) AS VARCHAR(2)), 2) + ' ' + DATENAME(MONTH, GETDATE()) + ' ' + CAST(DATEPART(YEAR, GETDATE())  AS VARCHAR(4)) as tgl"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){                
              tr.put(j++,new ObjJam(rs.getString(1), rs.getString(2), rs.getString(3),rs.getString(4)));
              
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    public HashMap getTeam(){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select ID_Team,Nama_Team,Divisi,Logo,Gambar,Flag_active from MsTeam"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){                
              tr.put(j++,new Team(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6)));
              
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    public HashMap getNamaTeam(String ID_Team){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select ID_Team from MsTeam where ID_Team='"+ID_Team+"'"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if(rs.next()){                
              tr.put(j++,new IdTeam(rs.getString(1)));              
            }else{
                tr.put(j++,new IdTeam(""));    
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    public HashMap getPlayerDetail(String id_team){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select ID_Pemain,Nama_Pemain from MsPemain where ID_Team='"+id_team+"' ORDER BY Nama_Pemain"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){                
              tr.put(j++,new ObjPlayer(rs.getString(1), rs.getString(2)));
              
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    public HashMap getMusim(){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select ID_Musim,Nama_Musim,Jenis,Tahun_Awal,Tahun_Akhir,Flag_active from MsMusim ORDER BY ID_Musim DESC"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){                
              tr.put(j++,new Musim(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
              
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    public HashMap getMusim(String id){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select ID_Musim,Nama_Musim,Jenis,Tahun_Awal,Tahun_Akhir,Flag_active from MsMusim WHERE ID_Musim='"+id+"'"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){                
              tr.put(j++,new Musim(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
              
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    public boolean setMusim(String nama, String awal, String akhir, String jenis){
        try {        
                    String query = "insert into MsMusim (Nama_Musim,Tahun_Awal,Tahun_Akhir,Jenis) values ('"+nama+"','"+awal+"','"+akhir+"','"+jenis+"')";
                    ps = conn.prepareStatement(query);
                    ps.executeUpdate();  
                return true;
            
        } catch (SQLException ex) {
            return false;   
        }         
    }
    public boolean setUpdateMusim(String id,String nama, String awal, String akhir, String jenis){
        try {        
                    String query = "Update MsMusim set Last_Update = GETDATE(),  Nama_Musim='"+nama+"',Tahun_Awal='"+awal+"',Tahun_Akhir='"+akhir+"',Jenis='"+jenis+"' where ID_Musim='"+id+"'";
                    ps = conn.prepareStatement(query);
                    ps.executeUpdate();  
                return true;
            
        } catch (SQLException ex) {
            return false;   
        }         
    }
     public boolean setAktivasiMusim(String id,String status){
        try {        
                    String query = "Update MsMusim set Last_Update = GETDATE(), Flag_active='"+status+"' where ID_Musim='"+id+"'";
                    ps = conn.prepareStatement(query);
                    ps.executeUpdate();  
                return true;
            
        } catch (SQLException ex) {
            return false;   
        }         
    }
    public HashMap getTeamDetail(String id){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select ID_Team,Nama_Team,Divisi,Logo,Gambar, Flag_active from MsTeam where ID_Team = '"+id+"'"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){                
              tr.put(j++,new Team(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
              
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
    public boolean setMsPemain (String name, String region, String id_team, String posisi, String no_punggung, String tinggi, String berat, String tgl, String tangan, String foto){
        try {         
                String query = "INSERT INTO MsPemain (Nama_Pemain,Asal,Id_Team,KD_Pos,No_Punggung,Tinggi,Berat,Tgl_Lahir,Tangan,Foto) values ('"+name+"','"+region+"','"+id_team+"',"
                        + "'"+ posisi+"','"+ no_punggung +"','"+ tinggi+ "','"+ berat +"','"+ tgl +"','"+ tangan +"','"+ foto +"')";
                ps = conn.prepareStatement(query);
                ps.executeUpdate();  
                return true;
            
        } catch (SQLException ex) {
            return false;   
        }         
    }
    
    public boolean setMsTeam(String nick, String nama_team, String divisi, String logo, String gambar_team){
        try {         
                String query = "INSERT INTO MsTeam (ID_Team,Nama_Team,Divisi,Logo,Gambar)values('"+nick+"','"+nama_team+"','"+divisi+"','"+logo+"','"+gambar_team+"')";
                ps = conn.prepareStatement(query);
                ps.executeUpdate();  
                return true;
            
        } catch (SQLException ex) {
            return false;   
        }         
    }
    public boolean setUpdateMsTeam(String nick, String nama_team,String divisi, String logo, String gambar_team){
        try {         
                if(logo.equals("") && gambar_team.equals("")){
                     String query = "update MsTeam set Last_Update = GETDATE(), ID_Team='"+nick+"',Nama_Team='"+nama_team+"',Divisi='"+divisi+"' where ID_Team='"+nick+"'";
                     ps = conn.prepareStatement(query);
                }else if(logo.equals("")){
                     String query = "update MsTeam set Last_Update = GETDATE(), ID_Team='"+nick+"',Nama_Team='"+nama_team+"',Divisi='"+divisi+"',Gambar='"+gambar_team+"' where ID_Team='"+nick+"'";
                     ps = conn.prepareStatement(query);
                }else if(gambar_team.equals("")){
                     String query = "update MsTeam set Last_Update = GETDATE(), ID_Team='"+nick+"',Nama_Team='"+nama_team+"',Divisi='"+divisi+"',Logo='"+logo+"' where ID_Team='"+nick+"'";
                     ps = conn.prepareStatement(query);
                }else{
                     String query = "update MsTeam set Last_Update = GETDATE(), ID_Team='"+nick+"',Nama_Team='"+nama_team+"',Divisi='"+divisi+"',Logo='"+logo+"',Gambar='"+gambar_team+"'where ID_Team='"+nick+"'";
                     ps = conn.prepareStatement(query);
                 }
               ps.executeUpdate();  
                return true;
            
        } catch (SQLException ex) {
            return false;   
        }         
    }
    public boolean setNonaktifTeam(String nick){
        try {        
                    String query = "update MsTeam set Flag_active='N', Last_Update = GETDATE() where ID_Team='"+nick+"'";
                    ps = conn.prepareStatement(query);
                    ps.executeUpdate();  
                return true;
            
        } catch (SQLException ex) {
            return false;   
        }         
    }
     public boolean setAktifTeam(String nick){
        try {        
                    String query = "update MsTeam set Flag_active='Y', Last_Update = GETDATE() where ID_Team='"+nick+"'";
                    ps = conn.prepareStatement(query);
                    ps.executeUpdate();  
                return true;
            
        } catch (SQLException ex) {
            return false;   
        }         
    }
     public boolean setNonaktifPlayer(String id){
        try {        
                    String query = "update MsPemain set Flag_active='N', Last_Update = GETDATE() where ID_Pemain='"+id+"'";
                    ps = conn.prepareStatement(query);
                    ps.executeUpdate();  
                return true;
            
        } catch (SQLException ex) {
            return false;   
        }         
    }
     public boolean setAktifPlayer(String id){
        try {        
                    String query = "update MsPemain set Flag_active='Y', Last_Update = GETDATE() where ID_Pemain='"+id+"'";
                    ps = conn.prepareStatement(query);
                    ps.executeUpdate();  
                return true;
            
        } catch (SQLException ex) {
            return false;   
        }         
    }
     
    public boolean setUpdatePemain(String nama,String region, String tgl, String tinggi, String berat, String pos, String id_team, String no, String tangan, String foto, String id_pemain){
        String query="";
        try {       
                if(foto==""){
                       query = "update MsPemain set Last_Update = GETDATE(), Nama_Pemain='"+nama+"', Asal='"+region+"', Tgl_Lahir='"+tgl+"', Tinggi="+tinggi+", Berat="+berat+", KD_Pos='"+pos+"', Id_Team='"+id_team+"', No_Punggung="+no+", Tangan='"+tangan+"' where Id_Pemain='"+ id_pemain +"'";
                        ps = conn.prepareStatement(query);
                }
                else {
                    query = "update MsPemain set Last_Update = GETDATE(), Nama_Pemain='"+nama+"', Asal='"+region+"', Tgl_Lahir='"+tgl+"', Tinggi="+tinggi+", Berat="+berat+", KD_Pos='"+pos+"', Id_Team='"+id_team+"', No_Punggung="+no+", Tangan='"+tangan+"', Foto='"+foto+"' where Id_Pemain='"+ id_pemain +"'";
                    ps = conn.prepareStatement(query);
                }    
                   ps.executeUpdate();  
                return true;            
        } catch (SQLException ex) {
            return false;   
        }         
    }
    public HashMap getPlayers(String ID){
        HashMap tr = new HashMap();
        try{
            int i = 1;
            String query = "select a.ID_Pemain, a.Nama_Pemain, Convert(varchar(50), a.Tgl_Lahir,106), a.Tinggi, a.Berat, a.KD_Pos, b.Nama_Posisi, a.Id_Team, c.Nama_Team, a.No_Punggung, a.Foto, c.Logo from MsPemain a,MsPosisi b,MsTeam c where a.ID_Team='"+ID+"' AND a.KD_Pos = b.KD_Pos AND a.ID_Team=c.ID_Team AND a.Flag_active='y'"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++,new ObjPlayer(i++, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),rs.getString(11),rs.getString(12)));
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public boolean setStatikPemain(String idmusim, String idpemain, String idteam, String match, String date, String wl,String mins,String fgm,String fga, String fgp,String twopm,String twopa,String twopp,String tripm,String tripa,String tripp,String ftm,String fta,String ftp,String ors,String dr,String tr,String ass,String tos,String st,String bl,String pf,String ef,String pts){
        try {
            String query = "INSERT INTO TrGameLogs(ID_musim,ID_Pemain,ID_Team,Match,Tgl_Match,WL,[MIN],[FGM],[FGA],[FG],[2PM],[2PA],[2P],[3PM],[3PA],[3P],[FTM],[FTA],[FT],[OR],[DR],[TR],[AS],[TO],[ST],[BL],[PF],[EF],[PTS]) "
                    + "values('"+ idmusim +"','"+ idpemain +"','"+ idteam +"','"+ match +"','"+ date +"' ,'"+ wl +"','"+ mins +"','"+ fgm +"' ,'"+ fga +"','"+ fgp +"' ,'"+ twopm +"','"+ twopa +"' ,'"+ twopp +"','"+ tripm +"' ,'"+ tripa +"','"+ tripp +"' ,'"+ ftm +"','"+ fta +"' ,'"+ ftp +"','"+ ors +"' ,'"+ dr +"','"+ tr +"','"+ ass +"','"+ tos +"','"+ st +"','"+ bl +"','"+ pf +"','"+ ef +"','"+ pts +"')";
            ps = conn.prepareStatement(query);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
             return false;   
        }
    }
    public HashMap getNews(){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select Id_News,Judul,Tanggal,LEFT(CONVERT(VARCHAR(100),Deskripsi),100),Foto,Flag_active from TrNews"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){                
              tr.put(j++,new NewsBackEnd(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
              
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    public boolean setNews (String judul,String tanggal, String deskripsi, String foto){
        try {         
                String query = "INSERT INTO TrNews (Judul,Tanggal,Deskripsi,Foto) values ('"+judul+"','"+tanggal+"','"+ deskripsi+"','"+ foto +"')";
                ps = conn.prepareStatement(query);
                ps.executeUpdate();  
                return true;
            
        } catch (SQLException ex) {
            return false;   
        }         
    }
    public boolean setUpdateNews(String id,String judul, String tanggal, String foto, String deskripsi){
        String query="";
        try {       
                if(foto==""){
                    query = "update TrNews set Judul='"+judul+"', Tanggal='"+tanggal+"', Deskripsi="+deskripsi+" where Id_News='"+ id +"'";
                    ps = conn.prepareStatement(query);
                }
                else{
                   query = "update TrNews set Judul='"+judul+"', Tanggal='"+tanggal+"', Deskripsi="+deskripsi+", Foto="+foto+" where Id_News='"+ id +"'";
                   ps = conn.prepareStatement(query);
                }    
                   ps.executeUpdate();  
                return true;            
        } catch (SQLException ex) {
            return false;   
        }         
    }
    public boolean setNonaktifNews(String id){
        try {        
                    String query = "update TrNews set Flag_active='N' where Id_News='"+id+"'";
                    ps = conn.prepareStatement(query);
                    ps.executeUpdate();  
                return true;
            
        } catch (SQLException ex) {
            return false;   
        }         
    }
     public boolean setAktifNews(String id){
        try {        
                    String query = "update TrNews set Flag_active='Y' where Id_News='"+id+"'";
                    ps = conn.prepareStatement(query);
                    ps.executeUpdate();  
                return true;
            
        } catch (SQLException ex) {
            return false;   
        }         
    }
    public HashMap getPlayersDetails(String ID){
        HashMap tr = new HashMap();
        try{
            int i = 1;
            String query = "select a.ID_Pemain,a.Nama_Pemain,CAST(DAY(a.Tgl_Lahir) AS VARCHAR(2)) + ' ' + DATENAME(MM, a.Tgl_Lahir) + ' ' + CAST(YEAR(a.Tgl_Lahir) AS VARCHAR(4)) AS [DD Month YYYY],a.Tinggi,a.Berat,a.KD_Pos,b.Nama_Posisi,a.Id_Team,c.Nama_Team,a.No_Punggung,a.Foto,c.Logo from MsPemain a,MsPosisi b,MsTeam c where a.ID_Pemain='"+ID+"' AND a.KD_Pos = b.KD_Pos AND a.ID_Team=c.ID_Team "; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if(rs.next()){
                tr.put(i++,new ObjPlayer(i++, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),rs.getString(11),rs.getString(12)));
            }else{
                tr.put(i++,new ObjPlayer(i++, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),"nopic.png",rs.getString(12)));
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    
    public HashMap getPlayer(){
        HashMap tr = new HashMap();
        try{
            int i = 1;
            String query = "select distinct a.ID_Pemain,a.Nama_Pemain,a.Asal,Convert(varchar(50), a.Tgl_Lahir,106),a.Tinggi,a.Berat,a.KD_Pos,b.Nama_Posisi,a.Id_Team,c.Nama_Team,a.No_Punggung,a.Tangan,a.Foto,a.Flag_active from MsPemain a,MsPosisi b,MsTeam c where a.KD_Pos = b.KD_Pos AND a.ID_Team=c.ID_Team order by ID_Team"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                    tr.put(i++,new ObjPlayer(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14)));
               }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public HashMap getPlayerRandom(String asal){
        HashMap tr = new HashMap();
        try{
            int i = 1;
            String query = "SELECT TOP 9 a.ID_Pemain,a.Nama_Pemain,Convert(varchar(50), a.Tgl_Lahir,106),a.Tinggi,a.Berat,a.KD_Pos,b.Nama_Posisi,a.Id_Team,c.Nama_Team,a.No_Punggung,a.Foto,a.Flag_active from MsPemain a,MsPosisi b,MsTeam c where a.Flag_active='Y' AND a.KD_Pos = b.KD_Pos AND a.ID_Team=c.ID_Team and Asal = '"+asal+"' ORDER BY NEWID()  "; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){ 
                tr.put(i++,new ObjPlayer(i++,rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),rs.getString(11),rs.getString(12)));
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public HashMap getPlayersByName(String Abc){
        HashMap tr = new HashMap();
        try{
            int i = 1;
            String query = "select a.ID_Pemain,a.Nama_Pemain,Convert(varchar(50), a.Tgl_Lahir,106),a.Tinggi,a.Berat,a.KD_Pos,b.Nama_Posisi,a.Id_Team,c.Nama_Team,a.No_Punggung,a.Foto,c.Logo from MsPemain a,MsPosisi b,MsTeam c where a.Flag_active = 'Y' AND a.Nama_Pemain like '"+Abc+"%' AND a.KD_Pos = b.KD_Pos AND a.ID_Team=c.ID_Team"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++,new ObjPlayer(i++, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),rs.getString(11),rs.getString(12)));
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public HashMap getPlayersFront(String ID){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = "select a.ID_Pemain, a.Nama_Pemain, a.Tinggi, b.Nama_Posisi, a.Foto from MsPemain a, MsPosisi b where a.Flag_active='Y' AND a.ID_Team = '"+ID+"' AND a.KD_Pos = b.KD_Pos";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new ObjPlayerFront(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public HashMap getPlayersFront2(String KD_pos){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = "select a.ID_Pemain, a.Nama_Pemain, a.Tinggi, b.Nama_Posisi, a.Foto from MsPemain a, MsPosisi b where a.Flag_active='Y' AND a.KD_Pos = '"+KD_pos+"' AND a.KD_Pos = b.KD_Pos";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new ObjPlayerFront(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public HashMap getPlayersFront3(String Nama_pem){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = "select a.ID_Pemain, a.Nama_Pemain, a.Tinggi, b.Nama_Posisi, a.Foto from MsPemain a, MsPosisi b where a.Flag_active = 'Y' AND a.Nama_Pemain Like '%"+Nama_pem+"%' AND a.KD_Pos = b.KD_Pos";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new ObjPlayerFront(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public HashMap getPlayerDetailStat(String id_p){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = "select a.Periode,a.ID_Team,COUNT([MIN]) as GP, CAST(AVG(a.[MIN]) as decimal(10,2)) as MIN, CAST(AVG(a.[FGM]) as decimal(10,2)) as FGM, CAST(AVG(a.[FGA]) as decimal(10,2)) as FGA, CAST(AVG(a.[FG])*100 as decimal(10,0)) as FG, " +
                        "	CAST(AVG(a.[2PM]) as decimal(10,2)) as PM2, CAST(AVG(a.[2PA]) as decimal(10,2)) as PA2, CAST(AVG(a.[2P])*100 as decimal(10,0)) as P2, CAST(AVG(a.[3PM]) as decimal(10,2)) as PM3, CAST(AVG(a.[3PA]) as decimal(10,2)) as PA3, " +
                        "	CAST(AVG(a.[3P])*100 as decimal(10,0)) as P3, CAST(AVG(a.[FTM]) as decimal(10,2)) as FTM, CAST(AVG(a.[FTA]) as decimal(10,2)) as FTA, CAST(AVG(a.[FT])*100 as decimal(10,0)) as FT, CAST(AVG(a.[OR]) as decimal(10,2)) as O_R, " +
                        "	CAST(AVG(a.[DR]) as decimal(10,2)) as DR, CAST(AVG(a.[TR]) as decimal(10,2)) as TR, CAST(AVG(a.[AS]) as decimal(10,2)) as A_S, CAST(AVG(a.[TO]) as decimal(10,2)) as T_O, CAST(AVG(a.[ST]) as decimal(10,2)) as ST, " +
                        "	CAST(AVG(a.[BL]) as decimal(10,2)) as BL, CAST(AVG(a.[PF]) as decimal(10,2)) as PF, CAST(AVG(a.[EF]) as decimal(10,2)) as EF, CAST(AVG(a.[PTS]) as decimal(10,2)) as PTS " +
                        "	from " +
                        "	(" +
                        "		select Jenis,CONVERT(VARCHAR(10),c.Tahun_Awal)+'-'+CONVERT(VARCHAR(10),Tahun_Akhir) as Periode,b.Nama_Pemain,a.ID_Team,[MIN],[FGM],[FGA],[FG], " +
                        "			[2PM],[2PA],[2P],[3PM],[3PA],[3P],[FTM],[FTA],[FT],[OR],[DR],[TR],[AS],[TO],[ST],[BL],[PF],[EF],[PTS] " +
                        "		from TrGameLogs a, MsPemain b, MsMusim c " +
                        "		where a.ID_Pemain = '"+id_p+"' and c.Jenis = 'REGULAR' and a.ID_Pemain=b.ID_Pemain and a.ID_Musim=c.ID_Musim " +
                        "	) a group by Jenis,a.Periode,a.Nama_Pemain,a.ID_Team " +
                        "order by a.Periode DESC";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new PlayerDetailStats(i++, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)+"%", rs.getString(8), rs.getString(9), rs.getString(10)+"%", rs.getString(11), rs.getString(12), rs.getString(13)+"%", rs.getString(14), rs.getString(15), rs.getString(16)+"%", rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25), rs.getString(26)));
                
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public HashMap getSumPlayerDetailStat(String id_p){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = "SELECT SUM(GP)AS GP, CAST(AVG([MIN]) as decimal(10,2)) as MIN, CAST(AVG([FGM]) as decimal(10,2)) as FGM, CAST(AVG([FGA]) as decimal(10,2)) as FGA, CAST(AVG([FG])*100 as decimal(10,0)) as FG, " +
                        "      CAST(AVG([PM2]) as decimal(10,2)) as PM2, CAST(AVG([PA2]) as decimal(10,2)) as PA2, CAST(AVG([P2])*100 as decimal(10,0)) as P2, CAST(AVG([PM3]) as decimal(10,2)) as PM3, CAST(AVG([PA3]) as decimal(10,2)) as PA3, " +
                        "      CAST(AVG([P3])*100 as decimal(10,0)) as P3, CAST(AVG([FTM]) as decimal(10,2)) as FTM, CAST(AVG([FTA]) as decimal(10,2)) as FTA, CAST(AVG([FT])*100 as decimal(10,0)) as FT, CAST(AVG([O_R]) as decimal(10,2)) as O_R, " +
                        "      CAST(AVG([DR]) as decimal(10,2)) as DR, CAST(AVG([TR]) as decimal(10,2)) as TR, CAST(AVG([A_S]) as decimal(10,2)) as A_S, CAST(AVG([T_O]) as decimal(10,2)) as T_O, CAST(AVG([ST]) as decimal(10,2)) as ST, " +
                        "      CAST(AVG([BL]) as decimal(10,2)) as BL, CAST(AVG([PF]) as decimal(10,2)) as PF, CAST(AVG([EF]) as decimal(10,2)) as EF, CAST(AVG([PTS]) as decimal(10,2)) as PTS  " +
                        " FROM(" +
                        "	select a.Periode,a.ID_Team,COUNT([MIN]) as GP, CAST(AVG(a.[MIN]) as decimal(10,2)) as MIN, CAST(AVG(a.[FGM]) as decimal(10,2)) as FGM, CAST(AVG(a.[FGA]) as decimal(10,2)) as FGA, CAST(AVG(a.[FG]) as decimal(10,2)) as FG, " +
                        "      CAST(AVG(a.[2PM]) as decimal(10,2)) as PM2, CAST(AVG(a.[2PA]) as decimal(10,2)) as PA2, CAST(AVG(a.[2P]) as decimal(10,2)) as P2, CAST(AVG(a.[3PM]) as decimal(10,2)) as PM3, CAST(AVG(a.[3PA]) as decimal(10,2)) as PA3, " +
                        "      CAST(AVG(a.[3P]) as decimal(10,2)) as P3, CAST(AVG(a.[FTM]) as decimal(10,2)) as FTM, CAST(AVG(a.[FTA]) as decimal(10,2)) as FTA, CAST(AVG(a.[FT]) as decimal(10,2)) as FT, CAST(AVG(a.[OR]) as decimal(10,2)) as O_R, " +
                        "      CAST(AVG(a.[DR]) as decimal(10,2)) as DR, CAST(AVG(a.[TR]) as decimal(10,2)) as TR, CAST(AVG(a.[AS]) as decimal(10,2)) as A_S, CAST(AVG(a.[TO]) as decimal(10,2)) as T_O, CAST(AVG(a.[ST]) as decimal(10,2)) as ST, " +
                        "      CAST(AVG(a.[BL]) as decimal(10,2)) as BL, CAST(AVG(a.[PF]) as decimal(10,2)) as PF, CAST(AVG(a.[EF]) as decimal(10,2)) as EF, CAST(AVG(a.[PTS]) as decimal(10,2)) as PTS " +
                        "      from " +
                        "       (" +
                        "         select Jenis,CONVERT(VARCHAR(10),c.Tahun_Awal)+'-'+CONVERT(VARCHAR(10),Tahun_Akhir) as Periode,b.Nama_Pemain,a.ID_Team,[MIN],[FGM],[FGA],[FG], " +
                        "         [2PM],[2PA],[2P],[3PM],[3PA],[3P],[FTM],[FTA],[FT],[OR],[DR],[TR],[AS],[TO],[ST],[BL],[PF],[EF],[PTS] " +
                        "         from TrGameLogs a, MsPemain b, MsMusim c " +
                        "         where a.ID_Pemain = '"+id_p+"' and c.Jenis = 'REGULAR' and a.ID_Pemain=b.ID_Pemain and a.ID_Musim=c.ID_Musim " +
                        "       ) a group by Jenis,a.Periode,a.Nama_Pemain,a.ID_Team " +
                        ")b ";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new PlayerDetailStats(i++, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)+"%", rs.getString(6), rs.getString(7), rs.getString(8)+"%", rs.getString(9), rs.getString(10), rs.getString(11)+"%", rs.getString(12), rs.getString(13), rs.getString(14)+"%", rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24)));
                
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public HashMap getPlayerDetailStat2(String id_p){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = "select a.Periode,a.ID_Team,COUNT([MIN]) as GP, CAST(AVG(a.[MIN]) as decimal(10,2)) as MIN, CAST(AVG(a.[FGM]) as decimal(10,2)) as FGM, CAST(AVG(a.[FGA]) as decimal(10,2)) as FGA, CAST(AVG(a.[FG])*100 as decimal(10,0)) as FG, " +
                        "	CAST(AVG(a.[2PM]) as decimal(10,2)) as PM2, CAST(AVG(a.[2PA]) as decimal(10,2)) as PA2, CAST(AVG(a.[2P])*100 as decimal(10,0)) as P2, CAST(AVG(a.[3PM]) as decimal(10,2)) as PM3, CAST(AVG(a.[3PA]) as decimal(10,2)) as PA3, " +
                        "	CAST(AVG(a.[3P])*100 as decimal(10,0)) as P3, CAST(AVG(a.[FTM]) as decimal(10,2)) as FTM, CAST(AVG(a.[FTA]) as decimal(10,2)) as FTA, CAST(AVG(a.[FT])*100 as decimal(10,0)) as FT, CAST(AVG(a.[OR]) as decimal(10,2)) as O_R, " +
                        "	CAST(AVG(a.[DR]) as decimal(10,2)) as DR, CAST(AVG(a.[TR]) as decimal(10,2)) as TR, CAST(AVG(a.[AS]) as decimal(10,2)) as A_S, CAST(AVG(a.[TO]) as decimal(10,2)) as T_O, CAST(AVG(a.[ST]) as decimal(10,2)) as ST, " +
                        "	CAST(AVG(a.[BL]) as decimal(10,2)) as BL, CAST(AVG(a.[PF]) as decimal(10,2)) as PF, CAST(AVG(a.[EF]) as decimal(10,2)) as EF, CAST(AVG(a.[PTS]) as decimal(10,2)) as PTS " +
                        "	from " +
                        "	(" +
                        "		select Jenis,CONVERT(VARCHAR(10),c.Tahun_Awal)+'-'+CONVERT(VARCHAR(10),Tahun_Akhir) as Periode,b.Nama_Pemain,a.ID_Team,[MIN],[FGM],[FGA],[FG], " +
                        "			[2PM],[2PA],[2P],[3PM],[3PA],[3P],[FTM],[FTA],[FT],[OR],[DR],[TR],[AS],[TO],[ST],[BL],[PF],[EF],[PTS] " +
                        "		from TrGameLogs a, MsPemain b, MsMusim c " +
                        "		where a.ID_Pemain = '"+id_p+"' and c.Jenis = 'PLAYOFF' and a.ID_Pemain=b.ID_Pemain and a.ID_Musim=c.ID_Musim " +
                        "	) a group by Jenis,a.Periode,a.Nama_Pemain,a.ID_Team " +
                        "order by a.Periode DESC";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new PlayerDetailStats(i++, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)+"%", rs.getString(8), rs.getString(9), rs.getString(10)+"%", rs.getString(11), rs.getString(12), rs.getString(13)+"%", rs.getString(14), rs.getString(15), rs.getString(16)+"%", rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25), rs.getString(26)));
                
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public HashMap getSumPlayerDetailStat2(String id_p){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = "SELECT SUM(GP)AS GP, CAST(AVG([MIN]) as decimal(10,2)) as MIN, CAST(AVG([FGM]) as decimal(10,2)) as FGM, CAST(AVG([FGA]) as decimal(10,2)) as FGA, CAST(AVG([FG])*100 as decimal(10,0)) as FG, " +
                        "      CAST(AVG([PM2]) as decimal(10,2)) as PM2, CAST(AVG([PA2]) as decimal(10,2)) as PA2, CAST(AVG([P2])*100 as decimal(10,0)) as P2, CAST(AVG([PM3]) as decimal(10,2)) as PM3, CAST(AVG([PA3]) as decimal(10,2)) as PA3, " +
                        "      CAST(AVG([P3])*100 as decimal(10,0)) as P3, CAST(AVG([FTM]) as decimal(10,2)) as FTM, CAST(AVG([FTA]) as decimal(10,2)) as FTA, CAST(AVG([FT])*100 as decimal(10,0)) as FT, CAST(AVG([O_R]) as decimal(10,2)) as O_R, " +
                        "      CAST(AVG([DR]) as decimal(10,2)) as DR, CAST(AVG([TR]) as decimal(10,2)) as TR, CAST(AVG([A_S]) as decimal(10,2)) as A_S, CAST(AVG([T_O]) as decimal(10,2)) as T_O, CAST(AVG([ST]) as decimal(10,2)) as ST, " +
                        "      CAST(AVG([BL]) as decimal(10,2)) as BL, CAST(AVG([PF]) as decimal(10,2)) as PF, CAST(AVG([EF]) as decimal(10,2)) as EF, CAST(AVG([PTS]) as decimal(10,2)) as PTS  " +
                        " FROM(" +
                        "	select a.Periode,a.ID_Team,COUNT([MIN]) as GP, CAST(AVG(a.[MIN]) as decimal(10,2)) as MIN, CAST(AVG(a.[FGM]) as decimal(10,2)) as FGM, CAST(AVG(a.[FGA]) as decimal(10,2)) as FGA, CAST(AVG(a.[FG]) as decimal(10,2)) as FG, " +
                        "      CAST(AVG(a.[2PM]) as decimal(10,2)) as PM2, CAST(AVG(a.[2PA]) as decimal(10,2)) as PA2, CAST(AVG(a.[2P]) as decimal(10,2)) as P2, CAST(AVG(a.[3PM]) as decimal(10,2)) as PM3, CAST(AVG(a.[3PA]) as decimal(10,2)) as PA3, " +
                        "      CAST(AVG(a.[3P]) as decimal(10,2)) as P3, CAST(AVG(a.[FTM]) as decimal(10,2)) as FTM, CAST(AVG(a.[FTA]) as decimal(10,2)) as FTA, CAST(AVG(a.[FT]) as decimal(10,2)) as FT, CAST(AVG(a.[OR]) as decimal(10,2)) as O_R, " +
                        "      CAST(AVG(a.[DR]) as decimal(10,2)) as DR, CAST(AVG(a.[TR]) as decimal(10,2)) as TR, CAST(AVG(a.[AS]) as decimal(10,2)) as A_S, CAST(AVG(a.[TO]) as decimal(10,2)) as T_O, CAST(AVG(a.[ST]) as decimal(10,2)) as ST, " +
                        "      CAST(AVG(a.[BL]) as decimal(10,2)) as BL, CAST(AVG(a.[PF]) as decimal(10,2)) as PF, CAST(AVG(a.[EF]) as decimal(10,2)) as EF, CAST(AVG(a.[PTS]) as decimal(10,2)) as PTS " +
                        "      from " +
                        "       (" +
                        "         select Jenis,CONVERT(VARCHAR(10),c.Tahun_Awal)+'-'+CONVERT(VARCHAR(10),Tahun_Akhir) as Periode,b.Nama_Pemain,a.ID_Team,[MIN],[FGM],[FGA],[FG], " +
                        "         [2PM],[2PA],[2P],[3PM],[3PA],[3P],[FTM],[FTA],[FT],[OR],[DR],[TR],[AS],[TO],[ST],[BL],[PF],[EF],[PTS] " +
                        "         from TrGameLogs a, MsPemain b, MsMusim c " +
                        "         where a.ID_Pemain = '"+id_p+"' and c.Jenis = 'PLAYOFF' and a.ID_Pemain=b.ID_Pemain and a.ID_Musim=c.ID_Musim " +
                        "       ) a group by Jenis,a.Periode,a.Nama_Pemain,a.ID_Team " +
                        ")b ";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new PlayerDetailStats(i++, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)+"%", rs.getString(6), rs.getString(7), rs.getString(8)+"%", rs.getString(9), rs.getString(10), rs.getString(11)+"%", rs.getString(12), rs.getString(13), rs.getString(14)+"%", rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24)));
                
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public HashMap getPlayerDetailGL(String id_p){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = "select ID_Musim,ID_Pemain,Nama_Musim from( " +
                            "	select distinct a.ID_Musim,a.Nama_Musim, b.ID_Pemain, c.Nama_Pemain from MsMusim a, TrGameLogs b, MsPemain c where a.ID_Musim = b.ID_Musim and b.ID_Pemain="+id_p+" and b.ID_Pemain = c.ID_Pemain " +
                            ")a order by a.ID_Musim desc";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new PlayerDetailGL(rs.getString(1), rs.getString(2), rs.getString(3)));
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public HashMap getPlayerDetailGLogs(String id_p, String id_m){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = "select Match,WL,[MIN],FGM,FGA,CAST(FG*100 as decimal(10,0)) as FG,[2PM],[2PA],CAST([2P]*100 as decimal(10,0)) as P2,[3PM],[3PA],CAST([3P]*100 as decimal(10,0)) as P3,FTM,FTA,CAST(FT*100 as decimal(10,0)) as FT,[OR],DR,TR,[AS],[TO],ST,BL,PF,EF,PTS from TrGameLogs where ID_Musim = "+id_m+" and ID_Pemain = "+id_p+"";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new PlayerDetailGLogs(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25)));
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public HashMap getTopPoint(String id_team){
        HashMap tr = new HashMap();
        try {      
            int i=0;
            String query = "select TOP 1 ID_Musim from(" +
                            "select distinct a.ID_Musim,a.Nama_Musim, b.ID_Team from MsMusim a, TrGameLogs b where a.ID_Musim = b.ID_Musim and b.ID_Team='"+id_team+"'" +
                        ")a order by a.ID_Musim desc";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if(rs.next()){                  
                String query1 = "select TOP 3 a.Foto,a.Nama_Pemain,a.KD_Pos as POS, CAST(AVG(a.[PTS]) as decimal(10,2)) as PTS " +
                                    " from " +
                                    " (" +
                                        " select Nama_Musim,b.Foto,b.Nama_Pemain,b.KD_Pos,a.ID_Team,[MIN],[TR],[AS],[PTS] " +
                                        " from TrGameLogs a, MsPemain b, MsMusim c " +
                                        " where a.ID_Team = '"+id_team+"' and a.ID_Musim = '"+rs.getString(1)+"' and a.ID_Pemain=b.ID_Pemain and a.ID_Musim=c.ID_Musim "+
                                    " ) a group by a.Nama_Pemain,a.Foto,a.KD_Pos,a.ID_Team " +
                                " order by PTS DESC"; 
                ps1 = conn.prepareStatement(query1);
                rs1 = ps1.executeQuery();
                while(rs1.next()){
                    tr.put(i++,new ObjTopPoint(i++, rs1.getString(1), rs1.getString(2), rs1.getString(3), rs1.getString(4)));
                }         
                 
            }else{
                tr.put(i++,new ObjTopPoint(i++, "nopic.png", "", "", "0.0"));
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    public HashMap getTopAssist(String id_team){
        HashMap tr = new HashMap();
        try {      
            int i=0;
            String query = "select TOP 1 ID_Musim from(" +
                            "select distinct a.ID_Musim,a.Nama_Musim, b.ID_Team from MsMusim a, TrGameLogs b where a.ID_Musim = b.ID_Musim and b.ID_Team='"+id_team+"'" +
                        ")a order by a.ID_Musim desc";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if(rs.next()){                  
                String query1 = "select TOP 3 a.Foto,a.Nama_Pemain,a.KD_Pos as POS, CAST(AVG(a.[AS]) as decimal(10,2)) as A_S " +
                                    " from " +
                                    " (" +
                                        " select Nama_Musim,b.Foto,b.Nama_Pemain,b.KD_Pos,a.ID_Team,[MIN],[TR],[AS],[PTS] " +
                                        " from TrGameLogs a, MsPemain b, MsMusim c " +
                                        " where a.ID_Team = '"+id_team+"' and a.ID_Musim = '"+rs.getString(1)+"' and a.ID_Pemain=b.ID_Pemain and a.ID_Musim=c.ID_Musim "+
                                    " ) a group by a.Nama_Pemain,a.Foto,a.KD_Pos,a.ID_Team " +
                                " order by A_S DESC"; 
                ps1 = conn.prepareStatement(query1);
                rs1 = ps1.executeQuery();
                while(rs1.next()){
                    tr.put(i++,new ObjTopAssist(i++, rs1.getString(1), rs1.getString(2), rs1.getString(3), rs1.getString(4)));
                } 
            }else{
                tr.put(i++,new ObjTopAssist(i++, "nopic.png", "", "", "0.0"));
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    public HashMap getTopRebound(String id_team){
        HashMap tr = new HashMap();
        try {      
            int i=0;
            String query = "select TOP 1 ID_Musim from(" +
                            "select distinct a.ID_Musim,a.Nama_Musim, b.ID_Team from MsMusim a, TrGameLogs b where a.ID_Musim = b.ID_Musim and b.ID_Team='"+id_team+"'" +
                        ")a order by a.ID_Musim desc";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if(rs.next()){                  
                String query1 = "select TOP 3 a.Foto,a.Nama_Pemain,a.KD_Pos as POS, CAST(AVG(a.[TR]) as decimal(10,2)) as TR " +
                                    " from " +
                                    " (" +
                                        " select Nama_Musim,b.Foto,b.Nama_Pemain,b.KD_Pos,a.ID_Team,[MIN],[TR],[AS],[PTS] " +
                                        " from TrGameLogs a, MsPemain b, MsMusim c " +
                                        " where a.ID_Team = '"+id_team+"' and a.ID_Musim = '"+rs.getString(1)+"' and a.ID_Pemain=b.ID_Pemain and a.ID_Musim=c.ID_Musim "+
                                    " ) a group by a.Nama_Pemain,a.Foto,a.KD_Pos,a.ID_Team " +
                                " order by TR DESC"; 
                ps1 = conn.prepareStatement(query1);
                rs1 = ps1.executeQuery();
                while(rs1.next()){
                    tr.put(i++,new ObjTopRebound(i++, rs1.getString(1), rs1.getString(2), rs1.getString(3), rs1.getString(4)));
                }    
            }else{
                tr.put(i++,new ObjTopRebound(i++, "nopic.png", "", "", "0.0"));
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    public HashMap getPpgApgRpg(String id_p){
        HashMap tr = new HashMap();
        try{//*100 as decimal(10,0)
            int i = 0;
            String query = "select top 1 Nama_Musim,CAST(AVG(a.[PTS]) as decimal(10,2)) as PPG, CAST(AVG(a.[AS]) as decimal(10,2)) as APG,CAST(AVG(a.[TR]) as decimal(10,2)) as RPG" +
                            "	from " +
                            "	( " +
                            "		select c.ID_Musim,Nama_Musim,b.Nama_Pemain,b.KD_Pos,a.ID_Team,[MIN],[TR],[AS],[PTS]  " +
                            "		from TrGameLogs a, MsPemain b, MsMusim c " +
                            "		where a.ID_Pemain='"+id_p+"' and a.ID_Pemain=b.ID_Pemain and a.ID_Musim=c.ID_Musim " +
                            " " +
                            "	) a group by Nama_Musim,a.Nama_Pemain,a.KD_Pos,a.ID_Team,a.ID_Musim " +
                            " " +
                            "order by a.ID_Musim desc";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if(rs.next()){
                tr.put(i++, new PlayerPpgApgRpg(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }else{
                tr.put(i++, new PlayerPpgApgRpg("", "0.0", "0.0", "0.0"));
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    
    public HashMap getTeamSeason(String id_team){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = "SELECT ID_Musim,Nama_Musim from(" +
                            "	select distinct a.ID_Musim,a.Nama_Musim FROM MsMusim a, TrGameLogs b, MsTeam c where a.ID_Musim = b.ID_Musim and b.ID_Team = c.ID_Team and b.ID_Team = '"+id_team+"' " +
                            ")a order by a.ID_Musim desc";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new ObjTeamSeason(rs.getString(1), rs.getString(2)));
            }
            if(!rs.next()){
                tr.put(i++, new ObjTeamSeason("", ""));
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public HashMap getGeneralStat(String id_team, String id_musim){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = "SELECT Nama_Pemain,a.KD_Pos,COUNT([MIN]) as GP, CAST(AVG(a.[MIN]) as decimal(10,2)) as MIN, CAST(AVG(a.[FGM]) as decimal(10,2)) as FGM, CAST(AVG(a.[FGA]) as decimal(10,2)) as FGA, CAST(AVG(a.[FG])*100 as decimal(10,0)) as FG, " +
                    "	CAST(AVG(a.[2PM]) as decimal(10,2)) as PM2, CAST(AVG(a.[2PA]) as decimal(10,2)) as PA2, CAST(AVG(a.[2P])*100 as decimal(10,0)) as P2, CAST(AVG(a.[3PM]) as decimal(10,2)) as PM3, CAST(AVG(a.[3PA]) as decimal(10,2)) as PA3, " +
                    "	CAST(AVG(a.[3P])*100 as decimal(10,0)) as P3, CAST(AVG(a.[FTM]) as decimal(10,2)) as FTM, CAST(AVG(a.[FTA]) as decimal(10,2)) as FTA, CAST(AVG(a.[FT])*100 as decimal(10,0)) as FT, CAST(AVG(a.[OR]) as decimal(10,2)) as O_R, " +
                    "	CAST(AVG(a.[DR]) as decimal(10,2)) as DR, CAST(AVG(a.[TR]) as decimal(10,2)) as TR, CAST(AVG(a.[AS]) as decimal(10,2)) as A_S, CAST(AVG(a.[TO]) as decimal(10,2)) as T_O, CAST(AVG(a.[ST]) as decimal(10,2)) as ST, " +
                    "	CAST(AVG(a.[BL]) as decimal(10,2)) as BL, CAST(AVG(a.[EF]) as decimal(10,2)) as EF, CAST(AVG(a.[PTS]) as decimal(10,2)) as PTS " +
                    "	from " +
                    "	( " +
                    "		SELECT b.Nama_Pemain,b.KD_Pos,a.ID_Team,[MIN],[FGM],[FGA],[FG], " +
                    "			[2PM],[2PA],[2P],[3PM],[3PA],[3P],[FTM],[FTA],[FT],[OR],[DR],[TR],[AS],[TO],[ST],[BL],[EF],[PTS] " +
                    "		from TrGameLogs a, MsPemain b, MsMusim c, MsTeam d " +
                    "		where a.ID_Musim = '"+id_musim+"' and a.ID_Team = '"+id_team+"' and a.ID_Pemain = b.ID_Pemain and a.ID_Musim=c.ID_Musim and a.ID_Team = d.ID_Team " +
                    "	) a group by a.ID_Team,a.Nama_Pemain,a.KD_Pos " +
                    "order by Nama_Pemain";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new ObjGeneralStat(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),rs.getString(16),rs.getString(17),rs.getString(18),rs.getString(19),rs.getString(20),rs.getString(21),rs.getString(22),rs.getString(23),rs.getString(24),rs.getString(25)));
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public HashMap getNews(String id){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = " select Id_News, Judul, DATENAME(MONTH, Tanggal) " +
"         + RIGHT(CONVERT(VARCHAR(12), Tanggal, 107), 9) AS tgl, deskripsi, Foto from TrNews where Flag_active = 'Y' and Id_News = "+id+" ";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new ObjNews(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)));
            }
        }catch (SQLException ex){
            
        }
        return tr;
    }
    public HashMap getNewsList(){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = " select Id_News, Judul, DATENAME(MONTH, Tanggal) " +
"         + RIGHT(CONVERT(VARCHAR(12), Tanggal, 107), 9) AS tgl, LEFT(CONVERT(VARCHAR(153),Deskripsi),153)as deskripsi, Foto from TrNews where Flag_active = 'Y' order by Tanggal desc ";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new ObjNews(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)));
            }
        }catch (SQLException ex){
            
        }
        return tr;
    }
    
    public HashMap getPPGbySeason(String id){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = " select TOP 1 a.ID_Pemain,a.Nama_Pemain,a.KD_Pos as POS, CAST(AVG(a.[PTS]) as decimal(10,2)) as PTS " +
"                                     from " +
"                                     (" +
"                                         select Nama_Musim,b.ID_Pemain,b.Nama_Pemain,b.KD_Pos,a.ID_Team,[MIN],[TR],[AS],[PTS] " +
"                                         from TrGameLogs a, MsPemain b, MsMusim c " +
"                                         where a.ID_Musim = "+id+" and a.ID_Pemain=b.ID_Pemain and a.ID_Musim=c.ID_Musim " +
"                                     ) a group by a.Nama_Pemain,a.ID_Pemain,a.KD_Pos,a.ID_Team " +
"                                 order by PTS DESC  ";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new ObjTopPoint(i++,rs.getString(1),rs.getString(2),rs.getString(1),rs.getString(1)));
            }
        }catch (SQLException ex){
            
        }
        return tr;
    }
    public HashMap getAPGbySeason(String id){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = " select TOP 1 a.ID_Pemain,a.Nama_Pemain,a.KD_Pos as POS, CAST(AVG(a.[AS]) as decimal(10,2)) as PTS " +
"                                     from " +
"                                     (" +
"                                         select Nama_Musim,b.ID_Pemain,b.Nama_Pemain,b.KD_Pos,a.ID_Team,[MIN],[TR],[AS],[PTS] " +
"                                         from TrGameLogs a, MsPemain b, MsMusim c " +
"                                         where a.ID_Musim = "+id+" and a.ID_Pemain=b.ID_Pemain and a.ID_Musim=c.ID_Musim " +
"                                     ) a group by a.Nama_Pemain,a.ID_Pemain,a.KD_Pos,a.ID_Team " +
"                                 order by PTS DESC  ";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new ObjTopPoint(i++,rs.getString(1),rs.getString(2),rs.getString(1),rs.getString(1)));
            }
        }catch (SQLException ex){
            
        }
        return tr;
    }
    public HashMap getRPGbySeason(String id){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = " select TOP 1 a.ID_Pemain,a.Nama_Pemain,a.KD_Pos as POS, CAST(AVG(a.[TR]) as decimal(10,2)) as PTS " +
"                                     from " +
"                                     (" +
"                                         select Nama_Musim,b.ID_Pemain,b.Nama_Pemain,b.KD_Pos,a.ID_Team,[MIN],[TR],[AS],[PTS] " +
"                                         from TrGameLogs a, MsPemain b, MsMusim c " +
"                                         where a.ID_Musim = "+id+" and a.ID_Pemain=b.ID_Pemain and a.ID_Musim=c.ID_Musim " +
"                                     ) a group by a.Nama_Pemain,a.ID_Pemain,a.KD_Pos,a.ID_Team " +
"                                 order by PTS DESC  ";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new ObjTopPoint(i++,rs.getString(1),rs.getString(2),rs.getString(1),rs.getString(1)));
            }
        }catch (SQLException ex){
            
        }
        return tr;
    }
    public HashMap getTrendingPlayer(){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = " select TOP 5 a.ID_Pemain,a.Nama_Pemain,a.KD_Pos as POS, CAST(AVG(a.[PTS]) as decimal(10,2)) as PTS " +
"                         from " +
"                                   (" +
"                                       select Nama_Musim,b.ID_Pemain,b.Nama_Pemain,b.KD_Pos,a.ID_Team,[MIN],[TR],[AS],[PTS]  from TrGameLogs a, MsPemain b, MsMusim c " +
"                                       where a.ID_Musim = 5 and a.ID_Pemain=b.ID_Pemain and a.ID_Musim=c.ID_Musim " +
"                                   ) a group by a.Nama_Pemain,a.ID_Pemain,a.KD_Pos,a.ID_Team " +
"                               order by PTS DESC  ";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new ObjTopPoint(i++,rs.getString(1),rs.getString(2),rs.getString(1),rs.getString(1)));
            }
        }catch (SQLException ex){
            
        }
        return tr;
    }
    public HashMap getKlasemen(){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = " select a.ID_Musim,a.Nama_Team,a.ID_Team,a.TotalGame,a.TotalWin,a.TotalGame-a.TotalWin as TotalLost,b.Point,a.Logo  from " +
"                            ( " +
"                            	select a.ID_Musim,a.Nama_Team,a.Logo,a.ID_Team,a.TotalGame,  " +
"                            	CASE  " +
"                            	WHEN b.TotalWin IS NOT NULL THEN TotalWin " +
"                            	ELSE '0' " +
"                            	END AS TotalWin " +
"                            	from " +
"                           	( " +
"                            	select a.ID_Musim,b.Nama_Team,a.ID_Team,COUNT(a.WL) as TotalGame, b.Logo,b.Divisi " +
"                          		from TrGameLogs a, MsTeam b where a.ID_Team = b.ID_Team and b.Divisi='M' " +
"                          		group by a.ID_Musim,a.ID_Team,b.Nama_Team,b.Logo,b.Divisi " +
"                            	) a LEFT JOIN  " +
"                            	(  " +
"                           		select ID_Musim,ID_Team,COUNT(WL) as TotalWin  " +
"                           		from TrGameLogs  " +
"                            		where WL='W'  " +
"                            		group by ID_Musim,ID_Team  " +
"                            	) b " +
"                            	ON a.ID_Musim=b.ID_Musim and a.ID_Team=b.ID_Team " +
"                            ) a, " +
"                            (  " +
"                            	select top 11 a.ID_Musim,a.ID_Team,Sum(a.PTS)  as Point " +
"                            	from TrGameLogs a, MsMusim b where a.ID_Musim=b.ID_Musim and b.Jenis = 'REGULAR' " +
"                            	group by a.ID_Musim,a.ID_Team order by a.ID_Musim DESC " +
"                            ) b  " +
"                            Where a.ID_Musim=b.ID_Musim  " +
"                            and a.ID_Team=b.ID_Team  " +
"                            order by Point desc ";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new ObjKlasemen(i, rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)));
            }
        }catch (SQLException ex){
            
        }
        return tr;
    }
    
    public HashMap getMatchStatistic(String id_m){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = "SELECT Match,Tgl_Match from TrGameLogs where ID_Musim = '"+id_m+"' GROUP BY Match,Tgl_Match ORDER BY Tgl_Match DESC";
            String query1;
            String query2;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                query1 = "SELECT DISTINCT TOP 1 ID_Team From TrGameLogs Where Match = '"+rs.getString(1)+"' AND ID_Musim = '"+id_m+"'";
                ps1 = conn.prepareStatement(query1);
                rs1 = ps1.executeQuery();
                if(rs1.next()){
                    query2 = "select c.Match,CAST(DAY(c.Tgl_Match) AS VARCHAR(2)) + ' ' + DATENAME(MM, c.Tgl_Match) + ' ' + CAST(YEAR(c.Tgl_Match) AS VARCHAR(4)) As Tgl_Match,c.Team1,c.Logo1,CAST(AVG(c.PTS1) as decimal(10,2)) as PTS1,c.WL1 as WL1,c.Team2,c.Logo2,CAST(AVG(c.PTS2) as decimal(10,2)) as PTS2, c.WL2 as WL2  " +
"                            from(   " +
"                            	select distinct a.Tgl_Match,a.Match,a.ID_Team as Team1,a.Logo as Logo1,a.PTS as PTS1,a.WL as WL1,b.ID_Team as Team2,b.Logo as Logo2,b.PTS as PTS2,b.WL as WL2  " +
"                            	from  " +
"                            	(  " +
"                            		select a.ID_Team,d.Logo,b.Match,b.Tgl_Match,b.PTS,b.WL  " +
"                            		from MsPemain a,TrGameLogs b, MsMusim c, MsTeam d    "+
"                            		where a.ID_Pemain = b.ID_Pemain and b.ID_Musim = c.ID_Musim and b.ID_Team = d.ID_Team and b.ID_Musim = "+id_m+" and b.Match = '"+rs.getString(1)+"' and b.Tgl_Match = '"+rs.getString(2)+"' and b.ID_Team = '"+rs1.getString(1)+"'  " +
"                            	) a LEFT JOIN  " +
"                            	(  " +
"                            		select a.ID_Team,d.Logo,b.Match,b.Tgl_Match,b.PTS,b.WL  " +
"                            		from MsPemain a,TrGameLogs b, MsMusim c, MsTeam d   " +
"                            		where a.ID_Pemain = b.ID_Pemain and b.ID_Musim = c.ID_Musim and b.ID_Team = d.ID_Team and b.ID_Musim = "+id_m+" and b.Match = '"+rs.getString(1)+"' and b.Tgl_Match = '"+rs.getString(2)+"' and b.ID_Team != '"+rs1.getString(1)+"'  " +
"                            	) b  " +
"                             ON a.Match = b.Match  " +
"                            )c group by c.Match,c.Tgl_Match,c.Team1,c.Logo1,c.WL1,c.Team2,c.Logo2,c.WL2 "; 
                    ps2 = conn.prepareStatement(query2);
                    rs2 = ps2.executeQuery();
                    //String tgl, String team1, String logo1, String pts1, String wl1, String team2, String logo2, String pts2, String wl2
                    if(rs2.next()){
                        if(rs2.getString(4)==null){
                            tr.put(i++,new ObjMatchStatistic(rs2.getString(1),rs2.getString(2),"-","-","0.00","-",rs2.getString(7),rs2.getString(8),rs2.getString(9),rs2.getString(10)));
                        }else if(rs2.getString(7)==null){
                            tr.put(i++,new ObjMatchStatistic(rs2.getString(1),rs2.getString(2),rs2.getString(3),rs2.getString(4),rs2.getString(5),rs2.getString(6),"-","-","0.00","-"));
                        }else{
                            tr.put(i++,new ObjMatchStatistic(rs2.getString(1),rs2.getString(2),rs2.getString(3),rs2.getString(4),rs2.getString(5),rs2.getString(6),rs2.getString(7),rs2.getString(8),rs2.getString(9),rs2.getString(10)));
                        }  
                    }
                }
            }
        }catch (SQLException ex){
            
        }
        return tr;
    }
    
    public HashMap getKlasemen2(){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = " select top 6 a.ID_Musim,a.Nama_Team,a.ID_Team,a.TotalGame,a.TotalWin,a.TotalGame-a.TotalWin as TotalLost,b.Point,a.Logo  from " +
"                            ( " +
"                            	select a.ID_Musim,a.Nama_Team,a.Logo,a.ID_Team,a.TotalGame,  " +
"                            	CASE  " +
"                            	WHEN b.TotalWin IS NOT NULL THEN TotalWin " +
"                            	ELSE '0' " +
"                            	END AS TotalWin " +
"                            	from " +
"                           	( " +
"                            	select a.ID_Musim,b.Nama_Team,a.ID_Team,COUNT(a.WL) as TotalGame, b.Logo,b.Divisi " +
"                          		from TrGameLogs a, MsTeam b where a.ID_Team = b.ID_Team and b.Divisi='P' " +
"                          		group by a.ID_Musim,a.ID_Team,b.Nama_Team,b.Logo,b.Divisi " +
"                            	) a LEFT JOIN  " +
"                            	(  " +
"                           		select ID_Musim,ID_Team,COUNT(WL) as TotalWin  " +
"                           		from TrGameLogs  " +
"                            		where WL='W'  " +
"                            		group by ID_Musim,ID_Team  " +
"                            	) b " +
"                            	ON a.ID_Musim=b.ID_Musim and a.ID_Team=b.ID_Team " +
"                            ) a, " +
"                            (  " +
"                            	select top 12 a.ID_Musim,a.ID_Team,Sum(a.PTS)  as Point " +
"                            	from TrGameLogs a, MsMusim b where a.ID_Musim=b.ID_Musim and b.Jenis = 'REGULAR' " +
"                            	group by a.ID_Musim,a.ID_Team order by a.ID_Musim DESC " +
"                            ) b  " +
"                            Where a.ID_Musim=b.ID_Musim  " +
"                            and a.ID_Team=b.ID_Team  " +
"                            order by Point desc ";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new ObjKlasemen(i, rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)));
            }
        }catch (SQLException ex){
            
        }
        return tr;
    }
    public HashMap getPlayersFront4(String Nama_pem, String ID_Team, String Pos){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = "select a.ID_Pemain, a.Nama_Pemain, a.Tinggi, b.Nama_Posisi, a.Foto from MsPemain a, MsPosisi b where a.Flag_active = 'Y' AND a.Nama_Pemain Like '%"+Nama_pem+"%' AND a.KD_Pos = b.KD_Pos AND a.KD_Pos = '"+Pos+"' AND a.ID_Team = '"+ID_Team+"'";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new ObjPlayerFront(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public ObjUser getUsr(String Id_User, String Password){
        ObjUser tes = new ObjUser();
        try{
            String query = "select ID_User, Password, Nama from MsUser where ID_User=? and Password=? and FlagActive = 'Y'";
            ps = conn.prepareStatement(query);
            ps.setString(1, Id_User);
            ps.setString(2, Password);
            rs = ps.executeQuery();
            if(rs.next()){
                tes = new ObjUser(rs.getString(1), rs.getString(2), rs.getString(3));
            }else{
                tes = new ObjUser();
            }
        }catch (SQLException ex){
            
        }
        return tes;
    }
    public HashMap getPlayerDetail2(String id_team, String asal){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select ID_Pemain,Nama_Pemain from MsPemain where Flag_active = 'Y' AND ID_Team='"+id_team+"' and asal = '"+asal+"' ORDER BY Nama_Pemain"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){                
              tr.put(j++,new ObjPlayer(rs.getString(1), rs.getString(2)));
              
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    
    public HashMap getSummaryRegular(String id){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select a.Tahun,COUNT(a.MIN)as GP,CAST(AVG(a.[PTS]) as decimal(10,2)) as PPG,CAST(AVG(a.[TR]) as decimal(10,2)) as RPG, CAST(AVG(a.[AS]) as decimal(10,2)) as APG,CAST(AVG(a.[FG])*100 as decimal(10,0)) as FG,CAST(AVG(a.[FT])*100 as decimal(10,0)) as FT       from       (        select CONVERT(varchar(4),c.Tahun_Awal)+'-'+CONVERT(varchar(4),c.Tahun_Akhir) as Tahun,b.Nama_Pemain,b.KD_Pos,a.ID_Team,[MIN],[TR],[AS],[PTS],[FG],[FT],d.ID_Musim    "
                    + "   from TrGameLogs a, MsPemain b, MsMusim c, (select top 1 ID_Musim from MsMusim where Jenis = 'Regular' order by Tahun_Awal desc)d      "
                    + "  where a.ID_Pemain='"+id+"' and a.ID_Pemain=b.ID_Pemain and a.ID_Musim = c.ID_Musim  and a.ID_Musim=d.ID_Musim       ) a group by a.Nama_Pemain,a.KD_Pos,a.ID_Team,Tahun    "
                   + "ORDER BY Tahun DESC"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){                
              tr.put(j++,new PlayerDetailSummary(j++,rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            if(!rs.next()){
                tr.put(j++,new PlayerDetailSummary(j++,rs.getString(1)));
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    public HashMap getSummaryRegularCar(String id){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select COUNT(a.MIN)as GP,CAST(AVG(a.[PTS]) as decimal(10,2)) as PPG,CAST(AVG(a.[TR]) as decimal(10,2)) as RPG, CAST(AVG(a.[AS]) as decimal(10,2)) as APG,CAST(AVG(a.[FG])*100 as decimal(10,0)) as FG,CAST(AVG(a.[FT])*100 as decimal(10,0)) as FT " +
"       from " +
"       ( " +
"        select CONVERT(varchar(4),c.Tahun_Awal)+'-'+CONVERT(varchar(4),c.Tahun_Akhir) as Tahun,b.Nama_Pemain,b.KD_Pos,a.		ID_Team,[MIN],[TR],[AS],[PTS],[FG],[FT]  " +
"        from TrGameLogs a, MsPemain b, MsMusim c " +
"        where a.ID_Pemain='"+id+"' and a.ID_Pemain=b.ID_Pemain and a.ID_Musim = c.ID_Musim and c.Jenis = 'REGULAR'  " +
"       ) a group by a.Nama_Pemain,a.KD_Pos "; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if(rs.next()){                
              tr.put(j++,new PlayerDetailSummary(j++,"Career",rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }else{
                tr.put(j++,new PlayerDetailSummary(j++,"","","","","","",""));
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    public HashMap getSummaryPlayoff(String id){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select a.Tahun,COUNT(a.MIN)as GP,CAST(AVG(a.[PTS]) as decimal(10,2)) as PPG,CAST(AVG(a.[TR]) as decimal(10,2)) as RPG, CAST(AVG(a.[AS]) as decimal(10,2)) as APG,CAST(AVG(a.[FG])*100 as decimal(10,0)) as FG,CAST(AVG(a.[FT])*100 as decimal(10,0)) as FT       from       (        select CONVERT(varchar(4),c.Tahun_Awal)+'-'+CONVERT(varchar(4),c.Tahun_Akhir) as Tahun,b.Nama_Pemain,b.KD_Pos,a.ID_Team,[MIN],[TR],[AS],[PTS],[FG],[FT],d.ID_Musim    "
                    + "   from TrGameLogs a, MsPemain b, MsMusim c, (select top 1 ID_Musim from MsMusim where Jenis = 'PLAYOFF' order by Tahun_Awal desc)d      "
                    + "  where a.ID_Pemain='"+id+"' and a.ID_Pemain=b.ID_Pemain and a.ID_Musim = c.ID_Musim  and a.ID_Musim=d.ID_Musim       ) a group by a.Nama_Pemain,a.KD_Pos,a.ID_Team,Tahun    "
                   + "ORDER BY Tahun DESC";  
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){                
                tr.put(j++,new PlayerDetailSummary(j++, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            if(!rs.next()){
                tr.put(j++,new PlayerDetailSummary(j++,rs.getString(1)));
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    public HashMap getSummaryPlayoffCar(String id){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select COUNT(a.MIN)as GP,CAST(AVG(a.[PTS]) as decimal(10,2)) as PPG,CAST(AVG(a.[TR]) as decimal(10,2)) as RPG, CAST(AVG(a.[AS]) as decimal(10,2)) as APG,CAST(AVG(a.[FG])*100 as decimal(10,0)) as FG,CAST(AVG(a.[FT])*100 as decimal(10,0)) as FT " +
"       from " +
"       ( " +
"        select CONVERT(varchar(4),c.Tahun_Awal)+'-'+CONVERT(varchar(4),c.Tahun_Akhir) as Tahun,b.Nama_Pemain,b.KD_Pos,a.		ID_Team,[MIN],[TR],[AS],[PTS],[FG],[FT]  " +
"        from TrGameLogs a, MsPemain b, MsMusim c " +
"        where a.ID_Pemain='"+id+"' and a.ID_Pemain=b.ID_Pemain and a.ID_Musim = c.ID_Musim and c.Jenis = 'PLAYOFF'  " +
"       ) a group by a.Nama_Pemain,a.KD_Pos"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if(rs.next()){                
              tr.put(j++,new PlayerDetailSummary(j++,"Career",rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }else{
                tr.put(j++,new PlayerDetailSummary(j++,"","","","","","",""));
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    public HashMap getHistoryTeam(String id){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = "select distinct a.Periode,a.Age,a.Logo,a.ID_Team,a.Nama_Team,a.Nama_Posisi,COUNT([MIN]) as GP " +
"                              from " +
"                               ( " +
"                                 select CONVERT(VARCHAR(10),c.Tahun_Awal)+'-'+CONVERT(VARCHAR(10),Tahun_Akhir) as Periode,b.Nama_Pemain,DATEDIFF(year, b.Tgl_Lahir, STR(c.Tahun_Awal))as Age,a.ID_Team,e.Nama_Team,[MIN], d.Nama_Posisi, e.Logo " +
"                                 from TrGameLogs a, MsPemain b, MsMusim c, MsPosisi d, MsTeam e " +
"                                 where a.ID_Pemain = '"+id+"' and c.Jenis = 'REGULAR' and a.ID_Pemain=b.ID_Pemain and a.ID_Musim=c.ID_Musim and b.KD_Pos = d.KD_Pos and a.ID_Team = e.ID_Team " +
"                               ) a group by a.Periode,a.Nama_Pemain,a.ID_Team,a.Age,a.Logo,a.Nama_Posisi,a.Nama_Team "+
                    "           ORDER BY a.Periode DESC";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++,new PlayerDetailHistory(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7)));
            }
        }catch (SQLException ex){
            
        }
        return tr;
    }
    public HashMap getKlasemenYuga(String id_musim, String divisi){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = " SELECT a.ID_Musim, a.Nama_Team,a.ID_Team, a.GP, b.Win, a.GP-b.Win as Lose,a.pts,a.Logo from " +
                            "( " +
                            "	select a.ID_Musim,a.ID_Team,b.Nama_Team,SUM(a.pts)as pts,COUNT(a.WL) as GP,b.Logo from " +
                            "	( " +
                            "	select ID_Musim,ID_Team,Match, SUM(PTS)as pts,WL,Tgl_Match from TrGameLogs where ID_Musim = '"+id_musim+"' group by Match, WL,Tgl_Match, " +
                            "	ID_Team,ID_Musim " +
                            "	)a, MsTeam b where a.ID_Team = b.ID_Team and b.Flag_active='Y' and b.Divisi = '"+divisi+"' group by a.ID_Team,a.ID_Musim,b.Logo,b.Nama_Team " +
                            ")a " +
                            "INNER JOIN " +
                            "( " +
                            "	select ID_Musim,ID_Team, " +
                            "		CASE " +
                            "		WHEN Win is not null then Win " +
                            "		else '0' " +
                            "		end as Win " +
                            "		from " +
                            "	( " +
                            "		select ID_Musim,ID_Team,COUNT(WL)as Win from " +
                            "		( " +
                            "		select ID_Musim,ID_Team,WL,Match from TrGameLogs where ID_Musim=5 and WL = 'W' group by ID_Team,ID_Musim,WL,Match, " +
                            "		Tgl_Match " +
                            "		)b group by ID_Musim,ID_Team " +
                            "	)b " +
                            ")b ON A.ID_Team = b.ID_Team order by a.pts desc ";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new ObjKlasemen(i, rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)));
            }
        }catch (SQLException ex){
            
        }
        return tr;
    }
    public String getCurrentRegularSeason(){
        String x ="";
        try{
            String query = "select TOP 1 ID_Musim from MsMusim where Jenis = 'Regular' order by ID_Musim desc";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if(rs.next()){
                x = rs.getString(1);
            }
        }catch (SQLException ex){
            
        }
        return x;
    }
}
