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
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Yuga
 */
public class addsheet {
    
    

    public static void main(String[] args) throws Exception  {     
        
    XSSFWorkbook wb = new XSSFWorkbook();
    //Workbook wb;      
    DatabaseHandler dh = new DatabaseHandler();
    HashMap tr = dh.getPlayerList();
    Map<String, CellStyle> styles = createStyles(wb);
        try{
            FileOutputStream out = new FileOutputStream(new File("D:\\Netbeans\\Basket\\web\\Statistik\\Team\\Xceldemo3.xlsx"));
           
            for(int i=0; i<tr.size(); i++){
                ObjPlayerListTemplate x = (ObjPlayerListTemplate) tr.get(i);
                Sheet Spreadsheet = wb.createSheet(x.getNama());
                Spreadsheet.setColumnWidth(0, 256*20);
                Spreadsheet.setColumnWidth(1, 256*20);
                Spreadsheet.setColumnWidth(2, 256*20);
                for(int columnIndex = 3; columnIndex < 27; columnIndex++) {
                    Spreadsheet.setColumnWidth(columnIndex, 256*8);
               }
                Spreadsheet.setColumnWidth(0, 256*20);
                 Spreadsheet.autoSizeColumn(2);
                Spreadsheet.setZoom(85);
                Row rowID = Spreadsheet.createRow(0);
                Cell cellID = rowID.createCell(0);
                cellID.setCellStyle(styles.get("header"));
                cellID.setCellValue("ID_Pemain");
                Cell cellID2 = rowID.createCell(1);
                cellID2.setCellStyle(styles.get("header"));
                cellID2.setCellValue(x.getId());
                Cell cellID3 = rowID.createCell(2);
                cellID3.setCellStyle(styles.get("header"));
                cellID3.setCellValue("Dont Delete This!");
                //rowID.createCell(0).setCellValue("ID_Pemain");
                Row row = Spreadsheet.createRow(1);
                Cell cellGL = row.createCell(0);
                cellGL.setCellStyle(styles.get("GL"));
                cellGL.setCellValue("GAME LOGS");
               // row.createCell(0).setCellValue("GAME LOGS");
                Row row1 = Spreadsheet.createRow(2);
                row1.createCell(0).setCellValue("DATE");
                row1.createCell(1).setCellValue("MATCH");
                row1.createCell(2).setCellValue("W/L");
                row1.createCell(3).setCellValue("MIN");
                row1.createCell(4).setCellValue("FGM");
                row1.createCell(5).setCellValue("FGA");
                row1.createCell(6).setCellValue("FG%");
                row1.createCell(7).setCellValue("2PM");
                row1.createCell(8).setCellValue("2PA");
                row1.createCell(9).setCellValue("2P%");
                row1.createCell(10).setCellValue("3PM");
                row1.createCell(11).setCellValue("3PA");
                row1.createCell(12).setCellValue("3P%");
                row1.createCell(13).setCellValue("FTM");
                row1.createCell(14).setCellValue("FTA");
                row1.createCell(15).setCellValue("FT%");
                row1.createCell(16).setCellValue("OR");
                row1.createCell(17).setCellValue("DR");
                row1.createCell(18).setCellValue("TR");
                row1.createCell(19).setCellValue("AS");
                row1.createCell(20).setCellValue("TO");
                row1.createCell(21).setCellValue("ST");
                row1.createCell(22).setCellValue("BL");
                row1.createCell(23).setCellValue("PF");
                row1.createCell(24).setCellValue("EF");
                row1.createCell(25).setCellValue("PTS");
 
            }
           
            wb.write(out);
            out.close();
        }
        catch(Exception e){
            System.out.println(e);
        }
        System.out.println("Excel file created");
   }
    
    private static Map<String, CellStyle> createStyles(Workbook wb){
        Map<String, CellStyle> styles = new HashMap<>();
        DataFormat df = wb.createDataFormat();

        CellStyle style;
        Font headerFont = wb.createFont();
        headerFont.setBold(true);
        style = createBorderedStyle(wb);
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setFillForegroundColor(IndexedColors.YELLOW.getIndex());
        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        style.setFont(headerFont);
        styles.put("header", style);
        
        
        Font headerFont1 = wb.createFont();
        headerFont1.setBold(true);
        style = createBorderedStyle(wb);
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setFillForegroundColor(IndexedColors.GREEN.getIndex());
        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        style.setFont(headerFont1);
        styles.put("GL", style);
        

        return styles;
    }

    private static CellStyle createBorderedStyle(Workbook wb){
        BorderStyle thin = BorderStyle.THIN;
        short black = IndexedColors.BLACK.getIndex();
        
        CellStyle style = wb.createCellStyle();
        style.setBorderRight(thin);
        style.setRightBorderColor(black);
        style.setBorderBottom(thin);
        style.setBottomBorderColor(black);
        style.setBorderLeft(thin);
        style.setLeftBorderColor(black);
        style.setBorderTop(thin);
        style.setTopBorderColor(black);
        return style;
    }
}
