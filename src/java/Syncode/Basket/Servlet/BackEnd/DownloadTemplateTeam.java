/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Servlet.BackEnd;

import Syncode.Basket.Object.DatabaseHandler;
import Syncode.Basket.Object.ObjPlayerListTemplate;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author meiiko
 */
public class DownloadTemplateTeam extends HttpServlet {
    private String filePath;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void init( ){
      // Get the file location where it would be stored.
      filePath = getServletContext().getInitParameter("file-upload-excel-team"); 
   }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         //String Path = getServletContext().getInitParameter("file-upload");
         PrintWriter out1 = response.getWriter();
          XSSFWorkbook wb = new XSSFWorkbook();
                 DatabaseHandler dh = new DatabaseHandler();
                 String id = request.getParameter("ID_Team");
    HashMap tr = dh.getPlayerList(id);
    Map<String, CellStyle> styles = createStyles(wb);
        try{
            String namatemplate="Template Excel Team "+id+".xlsx";
            FileOutputStream out = new FileOutputStream(new File(filePath+namatemplate));
           
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
                Spreadsheet.addMergedRegion(new CellRangeAddress(1, 1, 0, 25));
                cellGL.setCellValue("GAME LOGS");
                cellGL.setCellStyle(styles.get("GL"));
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
                
                for(int j = 0; j<=25; j++){
                row1.getCell(j).setCellStyle(styles.get("TH"));
                }
            }
          
            wb.write(out);
            out.close();
            
             // TODO Auto-generated method stub
		response.setContentType("text/html");
		
		//String filename = namatemplate;
		String filepath = filePath;
		response.setContentType("APPLICATION/OCTET-STREAM");
		response.setHeader("Content-Disposition", "attachment; filename=\""
				+ namatemplate + "\"");
 
		// use inline if you want to view the content in browser, helpful for
		// pdf file
		// response.setHeader("Content-Disposition","inline; filename=\"" +
		// filename + "\"");
		FileInputStream fileInputStream = new FileInputStream(filepath
				+ namatemplate);
 
		int i;
		while ((i = fileInputStream.read()) != -1) {
			out1.write(i);
		}
		fileInputStream.close();
		out1.close();

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
        headerFont1.setColor(IndexedColors.WHITE.getIndex());
        style = createBorderedStyle(wb);
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setFillForegroundColor(IndexedColors.GREEN.getIndex());
        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        style.setFont(headerFont1);
        styles.put("GL", style);
        
        Font headerFont2 = wb.createFont();
        headerFont2.setBold(true);
        style = createBorderedStyle(wb);
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setFillForegroundColor(IndexedColors.LIGHT_GREEN.getIndex());
        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        style.setFont(headerFont2);
        styles.put("TH", style);
        

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
      			
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

     
}
