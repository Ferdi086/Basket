/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tes_excel;

import Syncode.Basket.Object.DatabaseHandler;
import Syncode.Basket.Object.ObjPlayerListTemplate;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Yuga
 */
public class addsheet {
    
    
    public static void main(String[] args) throws Exception  {       
         
    DatabaseHandler dh = new DatabaseHandler();
    HashMap tr = dh.getPlayerList();
    System.out.println(tr.size());
    
        try{
            XSSFWorkbook workbook = new XSSFWorkbook();
            FileOutputStream out = new FileOutputStream(new File("D:\\Associate Member\\BasketApps\\ExcelTemplateTeam\\Xceldemo2.xlsx"));
           
    for(int i=0; i<tr.size(); i++){
    ObjPlayerListTemplate x = (ObjPlayerListTemplate) tr.get(i);
    XSSFSheet Spreadsheet = workbook.createSheet(x.getNama());
    }
           
            workbook.write(out);
            out.close();
        }
        catch(Exception e){
            System.out.println(e);
        }
        System.out.println("Excel file created");
   }
}
