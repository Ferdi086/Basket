/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Object;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author meiiko
 */
public class Connect {
   //Insert Porperty
    private final String prefixUrl="jdbc:jtds:sqlserver://";
    private final String ID="IT";
    private final String PASSWORD="Kalbis1234";
    private final String Classname="net.sourceforge.jtds.jdbc.Driver";
    private final String Database="BasketApps";
    private String fixUrl="";
    protected Connection conn;
    
    //Init Adapter
    public Statement st;
   //Init Adapter
    public PreparedStatement ps;
    public PreparedStatement ps1;
    public PreparedStatement ps2;
    public PreparedStatement ps3;
    public ResultSet rs;
    public ResultSet rs1;
    public ResultSet rs2;
    public ResultSet rs3;

    //Init Connection
    public Connect(){
        fixUrl = prefixUrl + "172.16.16.18/" + Database +";instance=Development";
        connector(fixUrl, ID, PASSWORD);
    }
    
    private boolean connector(String URL, String Id, String Password){
        try{
            Class.forName(Classname);
            conn = DriverManager.getConnection(URL,Id,Password);
            return true;
        }catch(Exception e){
            return false;
        }
    }
    void open(){
     connector(fixUrl, ID, PASSWORD);
    }
    void close(){
        if (rs!=null){
            try{
                rs.close();
            }
          catch(Exception e){
            System.out.print(e);
            }
        }
        if (ps!=null){
            try{
                ps.close();
            }
          catch(Exception e){
            System.out.print(e);
            }
        }
        if (conn!=null){
            try{
                conn.close();
            }
          catch(Exception e){
            System.out.print(e);
            }
        }
    }
}
