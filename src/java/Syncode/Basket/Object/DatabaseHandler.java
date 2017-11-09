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
            String query = "select ID_Team,Nama_Team,Logo,Gambar from MsTeam"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){                
              tr.put(j++,new Team(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
              
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    public HashMap getPlayerDetail(String id_team){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select ID_Pemain,Nama_Pemain from MsPemain where ID_Team='"+id_team+"'"; 
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
            String query = "select ID_Musim,Nama_Musim from MsMusim"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){                
              tr.put(j++,new Musim(rs.getString(1), rs.getString(2)));
              
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
    
    public HashMap getTeamDetail(String id){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query = "select ID_Team,Nama_Team,Logo,Gambar from MsTeam where ID_Team='"+id+"'"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){                
              tr.put(j++,new Team(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
              
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
    public boolean setUpdatePemain(String nama, String tgl, String tinggi, String berat, String pos, String id_team, String no, String foto, String id_pemain){
        try {
                if(foto==null){ 
                    String query = "update MsPemain set Nama_Pemain='"+nama+"', Tgl_Lahir='"+tgl+"', Tinggi="+tinggi+", Berat="+berat+", KD_Pos='"+pos+"', Id_Team='"+id_team+"', No_Punggung="+no+", where Id_Pemain='"+ id_pemain +"'";
                    ps = conn.prepareStatement(query);
                }
                else{
                    String query = "update MsPemain set Nama_Pemain='"+nama+"', Tgl_Lahir='"+tgl+"', Tinggi="+tinggi+", Berat="+berat+", KD_Pos='"+pos+"', Id_Team='"+id_team+"', No_Punggung="+no+", Foto='"+foto+"' where Id_Pemain='"+ id_pemain +"'";
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
            String query = "select a.ID_Pemain, a.Nama_Pemain, Convert(varchar(50), a.Tgl_Lahir,106), a.Tinggi, a.Berat, a.KD_Pos, b.Nama_Posisi, a.Id_Team, c.Nama_Team, a.No_Punggung, a.Foto, c.Logo from MsPemain a,MsPosisi b,MsTeam c where a.ID_Team='"+ID+"' AND a.KD_Pos = b.KD_Pos AND a.ID_Team=c.ID_Team"; 
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
    public HashMap getPlayersDetails(String ID){
        HashMap tr = new HashMap();
        try{
            int i = 1;
            String query = "select a.ID_Pemain,a.Nama_Pemain,CAST(DAY(a.Tgl_Lahir) AS VARCHAR(2)) + ' ' + DATENAME(MM, a.Tgl_Lahir) + ' ' + CAST(YEAR(a.Tgl_Lahir) AS VARCHAR(4)) AS [DD Month YYYY],a.Tinggi,a.Berat,a.KD_Pos,b.Nama_Posisi,a.Id_Team,c.Nama_Team,a.No_Punggung,a.Foto,c.Logo from MsPemain a,MsPosisi b,MsTeam c where a.ID_Pemain='"+ID+"' AND a.KD_Pos = b.KD_Pos AND a.ID_Team=c.ID_Team"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++,new ObjPlayer(i++, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),rs.getString(11),rs.getString(12)));
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public JSONArray getPlayer(){
        JSONArray hm = new JSONArray();
        try{
            int i = 1;
            String query = "select distinct a.ID_Pemain,a.Nama_Pemain,Convert(varchar(50), a.Tgl_Lahir,106),a.Tinggi,a.Berat,a.KD_Pos,b.Nama_Posisi,a.Id_Team,c.Nama_Team,a.No_Punggung,a.Foto,c.Logo from MsPemain a,MsPosisi b,MsTeam c where a.KD_Pos = b.KD_Pos AND a.ID_Team=c.ID_Team"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                ObjPlayer obj = new ObjPlayer(i++, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),rs.getString(11),rs.getString(12));
                hm.put(obj.toJson());
            }
        }catch (SQLException ex) {
                
        }
        return hm;
    }
    public HashMap getPlayersByName(String Abc){
        HashMap tr = new HashMap();
        try{
            int i = 1;
            String query = "select a.ID_Pemain,a.Nama_Pemain,Convert(varchar(50), a.Tgl_Lahir,106),a.Tinggi,a.Berat,a.KD_Pos,b.Nama_Posisi,a.Id_Team,c.Nama_Team,a.No_Punggung,a.Foto,c.Logo from MsPemain a,MsPosisi b,MsTeam c where a.Nama_Pemain like '"+Abc+"%' AND a.KD_Pos = b.KD_Pos AND a.ID_Team=c.ID_Team"; 
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
            String query = "select a.ID_Pemain, a.Nama_Pemain, a.Tinggi, b.Nama_Posisi, a.Foto from MsPemain a, MsPosisi b where a.ID_Team = '"+ID+"' AND a.KD_Pos = b.KD_Pos";
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
            String query = "select a.ID_Pemain, a.Nama_Pemain, a.Tinggi, b.Nama_Posisi, a.Foto from MsPemain a, MsPosisi b where a.KD_Pos = '"+KD_pos+"' AND a.KD_Pos = b.KD_Pos";
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
            String query = "select a.ID_Pemain, a.Nama_Pemain, a.Tinggi, b.Nama_Posisi, a.Foto from MsPemain a, MsPosisi b where a.Nama_Pemain Like '%"+Nama_pem+"%' AND a.KD_Pos = b.KD_Pos";
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
            String query = "select a.Periode,a.ID_Team,COUNT([MIN]) as GP, CAST(AVG(a.[MIN]) as decimal(10,2)) as MIN, CAST(AVG(a.[FGM]) as decimal(10,2)) as FGM, CAST(AVG(a.[FGA]) as decimal(10,2)) as FGA, CAST(AVG(a.[FG]) as decimal(10,2)) as FG, " +
                        "	CAST(AVG(a.[2PM]) as decimal(10,2)) as PM2, CAST(AVG(a.[2PA]) as decimal(10,2)) as PA2, CAST(AVG(a.[2P]) as decimal(10,2)) as P2, CAST(AVG(a.[3PM]) as decimal(10,2)) as PM3, CAST(AVG(a.[3PA]) as decimal(10,2)) as PA3, " +
                        "	CAST(AVG(a.[3P]) as decimal(10,2)) as P3, CAST(AVG(a.[FTM]) as decimal(10,2)) as FTM, CAST(AVG(a.[FTA]) as decimal(10,2)) as FTA, CAST(AVG(a.[FT]) as decimal(10,2)) as FT, CAST(AVG(a.[OR]) as decimal(10,2)) as O_R, " +
                        "	CAST(AVG(a.[DR]) as decimal(10,2)) as DR, CAST(AVG(a.[TR]) as decimal(10,2)) as TR, CAST(AVG(a.[AS]) as decimal(10,2)) as A_S, CAST(AVG(a.[TO]) as decimal(10,2)) as T_O, CAST(AVG(a.[ST]) as decimal(10,2)) as ST, " +
                        "	CAST(AVG(a.[BL]) as decimal(10,2)) as BL, CAST(AVG(a.[PF]) as decimal(10,2)) as PF, CAST(AVG(a.[EF]) as decimal(10,2)) as EF, CAST(AVG(a.[PTS]) as decimal(10,2)) as PTS " +
                        "	from " +
                        "	(" +
                        "		select Jenis,CONVERT(VARCHAR(10),c.Tahun_Awal)+'-'+CONVERT(VARCHAR(10),Tahun_Akhir) as Periode,b.Nama_Pemain,a.ID_Team,[MIN],[FGM],[FGA],[FG], " +
                        "			[2PM],[2PA],[2P],[3PM],[3PA],[3P],[FTM],[FTA],[FT],[OR],[DR],[TR],[AS],[TO],[ST],[BL],[PF],[EF],[PTS] " +
                        "		from TrGameLogs a, MsPemain b, MsMusim c " +
                        "		where a.ID_Pemain = '"+id_p+"' and c.Jenis = 'REGULAR' and a.ID_Pemain=b.ID_Pemain and a.ID_Musim=c.ID_Musim " +
                        "	) a group by Jenis,a.Periode,a.Nama_Pemain,a.ID_Team " +
                        "order by Jenis";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new PlayerDetailStats(i++, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25), rs.getString(26)));
                
            }
        }catch (SQLException ex) {
                
        }
        return tr;
    }
    public HashMap getPlayerDetailStat2(String id_p){
        HashMap tr = new HashMap();
        try{
            int i = 0;
            String query = "select a.Periode,a.ID_Team,COUNT([MIN]) as GP, CAST(AVG(a.[MIN]) as decimal(10,2)) as MIN, CAST(AVG(a.[FGM]) as decimal(10,2)) as FGM, CAST(AVG(a.[FGA]) as decimal(10,2)) as FGA, CAST(AVG(a.[FG]) as decimal(10,2)) as FG, " +
                        "	CAST(AVG(a.[2PM]) as decimal(10,2)) as PM2, CAST(AVG(a.[2PA]) as decimal(10,2)) as PA2, CAST(AVG(a.[2P]) as decimal(10,2)) as P2, CAST(AVG(a.[3PM]) as decimal(10,2)) as PM3, CAST(AVG(a.[3PA]) as decimal(10,2)) as PA3, " +
                        "	CAST(AVG(a.[3P]) as decimal(10,2)) as P3, CAST(AVG(a.[FTM]) as decimal(10,2)) as FTM, CAST(AVG(a.[FTA]) as decimal(10,2)) as FTA, CAST(AVG(a.[FT]) as decimal(10,2)) as FT, CAST(AVG(a.[OR]) as decimal(10,2)) as O_R, " +
                        "	CAST(AVG(a.[DR]) as decimal(10,2)) as DR, CAST(AVG(a.[TR]) as decimal(10,2)) as TR, CAST(AVG(a.[AS]) as decimal(10,2)) as A_S, CAST(AVG(a.[TO]) as decimal(10,2)) as T_O, CAST(AVG(a.[ST]) as decimal(10,2)) as ST, " +
                        "	CAST(AVG(a.[BL]) as decimal(10,2)) as BL, CAST(AVG(a.[PF]) as decimal(10,2)) as PF, CAST(AVG(a.[EF]) as decimal(10,2)) as EF, CAST(AVG(a.[PTS]) as decimal(10,2)) as PTS " +
                        "	from " +
                        "	(" +
                        "		select Jenis,CONVERT(VARCHAR(10),c.Tahun_Awal)+'-'+CONVERT(VARCHAR(10),Tahun_Akhir) as Periode,b.Nama_Pemain,a.ID_Team,[MIN],[FGM],[FGA],[FG], " +
                        "			[2PM],[2PA],[2P],[3PM],[3PA],[3P],[FTM],[FTA],[FT],[OR],[DR],[TR],[AS],[TO],[ST],[BL],[PF],[EF],[PTS] " +
                        "		from TrGameLogs a, MsPemain b, MsMusim c " +
                        "		where a.ID_Pemain = '"+id_p+"' and c.Jenis = 'PLAYOFF' and a.ID_Pemain=b.ID_Pemain and a.ID_Musim=c.ID_Musim " +
                        "	) a group by Jenis,a.Periode,a.Nama_Pemain,a.ID_Team " +
                        "order by Jenis";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new PlayerDetailStats(i++, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25), rs.getString(26)));
                
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
            String query = "select Match,WL,[MIN],FGM,FGA,FG,2PM,2PA,2P,3PM,3PA,3P,FTM,FTA,FT,[OR],DR,TR,[AS],[TO],ST,BL,PF,EF,PTS from TrGameLogs where ID_Musim = "+id_m+" and ID_Pemain = "+id_p+"";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                tr.put(i++, new PlayerDetailGLogs(i++, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25)));
            }
        }catch (SQLException ex) {
                
        }
        return tr;
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
    public HashMap getTopPoint(String id_team){
        HashMap tr = new HashMap();
        try {      
            int j=0;
            String query =  "select TOP 3 a.Foto,a.Nama_Pemain,a.KD_Pos as POS, CAST(AVG(a.[PTS]) as decimal(10,2)) as PTS" +
                                "from" +
                                "(" +
                                    "select Nama_Musim,b.Foto,b.Nama_Pemain,b.KD_Pos,a.ID_Team,[MIN],[TR],[AS],[PTS]" +
                                    "from TrGameLogs a, MsPemain b, MsMusim c" +
                                    "where a.ID_Team = '"+id_team+"' and a.ID_Musim = 6 and a.ID_Pemain=b.ID_Pemain and a.ID_Musim=c.ID_Musim" +
                                ") a group by a.Nama_Pemain,a.Foto,a.KD_Pos,a.ID_Team" +
                            "order by PTS DESC"; 
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){                
              tr.put(j++,new ObjPlayer(rs.getString(1), rs.getString(2)));
              
            }
        } catch (SQLException ex) {
            
        }
        return tr;
    }
}
