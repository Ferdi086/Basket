/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Servlet.BackEnd;

import Syncode.Basket.Object.DatabaseHandler;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author meiiko
 */
public class doInsertStatikPlayer1uji extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */ 
    private String filePath;
 private boolean isMultipart;
 private File file ;
 private String[] extList = {"xlsx"};
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
      filePath = getServletContext().getInitParameter("file-upload-excel"); 
   }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
         isMultipart = ServletFileUpload.isMultipartContent(request);
      response.setContentType("text/html");
      java.io.PrintWriter out = response.getWriter( );
     
      if( !isMultipart ) {
         out.println("<html>");
         out.println("<head>");
         out.println("<title>Servlet upload</title>");  
         out.println("</head>");
         out.println("<body>");
         out.println("<p>No file uploaded</p>"); 
         out.println("</body>");
         out.println("</html>");
         return;
      }
    HttpSession session = request.getSession(true);
      DiskFileItemFactory factory = new DiskFileItemFactory();
       ServletFileUpload upload = new ServletFileUpload(factory);
   DatabaseHandler dh = new DatabaseHandler();
   //out.println("lala");

        try { 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);
	 // Process the uploaded file items
         Iterator i = fileItems.iterator();

        String Name = "";
        String ext = "";
        String keterangan = "";
        String Exten = "";
        String namafile = "";
        int u = 1;
         while ( i.hasNext () ) {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () ) {
                //out.println("lala");
        
               // Get the uploaded file parameters
               //FileItem id_teamitem = (FileItem) fileItems.get(0);
               //String id_team = id_teamitem.getString().trim();
               //FileItem namaitem = (FileItem) fileItems.get(1);
               //String nama = namaitem.getString().trim();
               //String namasplit = nama.split("\\-")[1];
               //String id_pemain = nama.split("\\-")[0];
               //FileItem musimitem = (FileItem) fileItems.get(3);
               //String musim = musimitem.getString();
              // out.println("musim adalah"+musim+"<br/>");
               //String nama_musim =musim.split("\\_")[1];
              // String id_musim =musim.split("\\_")[0];
               //String fieldName = fi.getFieldName();
              // String fileName = fi.getName();
              // ext = fileName.split("\\.")[1];
               //out.println("id musim ="+id_musim);
              //String contentType = fi.getContentType();
              // boolean isInMemory = fi.isInMemory();
              // long sizeInBytes = fi.getSize();
              // out.println(ext);
            //out.println("nama = "+id_musim+"<br/><br/>");
            //out.println("namasplit = "+namasplit);
            //out.println("team = "+id_team);
            //out.println("musim = "+musim);
            //out.println("id pemain = "+id_pemain);
             //out.println(fi);
               //if(Arrays.asList(extList).contains(ext.toLowerCase())){
                    // Write the file
                   // if( fileName.lastIndexOf("\\") >= 0 ) {
                   //    file = new File( filePath + id_team +"-"+ nama_musim +"-"+namasplit +"."+ ext) ;
                  // } else {
                  //     file = new File( filePath + id_team +"-"+ nama_musim +"-"+namasplit +"."+ ext) ;
                 //   }
                    
                 //   Exten="."+ ext;
                  //  namafile = id_team +"-"+ nama_musim +"-"+namasplit + Exten;
                    
                 //   fi.write( file ) ;
                    //dh.setFile(Name,Exten);
                    //akhir upload
                    
                    //awal import
              //   String filename = request.getParameter("file");
                //out.println("nama upload= "+fileName);
                //out.println("ke upload filenya = "+namafile);
                File file1=new File(filePath +namafile);
                FileInputStream fin = new FileInputStream(file1);
                //out.println(fin);
                //Get the workbook instance for XLS file
                XSSFWorkbook workbook = new XSSFWorkbook(fin);
                //Get first sheet from the workbook
                XSSFSheet sheet = workbook.getSheetAt(0);
                    //Iterate through each rows from first sheet
                 Row row,row1;
                 //String contoh="qwer";
                 int trow = sheet.getLastRowNum();
                
                  //String date="",match="",wl="",mins="",fgm="",fga="",fgp="",twopm="",twopa="",twopp="",tripm="",tripa="",tripp="",ftm="",fta="",ftp="",ors="",dr="",tr="",ass="",tos="",st="",bl="",pf="",ef="",pts="";
                     //row1 = (Row) sheet.getRow(5);
                  
                    
                        for(int t=2; t<=trow; t++){  //points to the starting of excel i.e excel first row
                            row = (Row) sheet.getRow(t);//sheet number
                            if(row != null){
           			if( row.getCell(0)!=null) {
                                    date = row.getCell(0).toString();
                                }else {
                                    date="";
                                } 
				if( row.getCell(1)!=null) { 
                                    match = row.getCell(1).toString(); 
                                }else {
                                    match="";
                                }  
				if( row.getCell(2)!=null) { 
                                    wl= row.getCell(2).toString();
                                }else {
                                    wl="";
                                } 
				if( row.getCell(3)!=null) { 
                                    mins= row.getCell(3).toString();
                                }else {
                                    mins="";
                                } 
                                if( row.getCell(4)!=null) { 
                                    fgm = row.getCell(4).toString();
                                }else {
                                    fgm="";
                                }  
                                if( row.getCell(5)!=null) { 
                                    fga = row.getCell(5).toString(); 
                                }else {
                                    fga="";
                                }  
				if( row.getCell(6)!=null) { 
                                    fgp = row.getCell(6).toString(); 
                                }else {
                                    fgp="";
                                }  
				if( row.getCell(7)!=null) { 
                                    twopm= row.getCell(7).toString();
                                }else {
                                    twopm="";
                                } 
				if( row.getCell(8)!=null) { 
                                    twopa= row.getCell(8).toString();
                                }else {
                                    twopa="";
                                } 
                                if( row.getCell(9)!=null) { 
                                    twopp = row.getCell(9).toString();
                                }else {
                                    twopp="";
                                }  
				if( row.getCell(10)!=null) { 
                                    tripm = row.getCell(10).toString(); 
                                }else {
                                    tripm="";
                                }  
				if( row.getCell(11)!=null) { 
                                    tripa= row.getCell(11).toString();
                                }else {
                                    tripa="";
                                } 
				if( row.getCell(12)!=null) { 
                                    tripp= row.getCell(12).toString();
                                }else {
                                    tripp="";
                                } 
                                if( row.getCell(13)!=null) { 
                                    ftm= row.getCell(13).toString();
                                }else {
                                    ftm="";
                                } 
				if( row.getCell(14)!=null) { 
                                    fta= row.getCell(14).toString();
                                }else {
                                    fta="";
                                } 
                                if( row.getCell(15)!=null) { 
                                    ftp = row.getCell(15).toString();
                                }else {
                                    ftp="";
                                }  
				if( row.getCell(16)!=null) { 
                                    ors = row.getCell(16).toString(); 
                                }else {
                                    ors="";
                                }  
				if( row.getCell(17)!=null) { 
                                    dr= row.getCell(17).toString();
                                }else {
                                    dr="";
                                } 
				if( row.getCell(18)!=null) { 
                                    tr= row.getCell(18).toString();
                                }else {
                                    tr="";
                                } 
                                if( row.getCell(19)!=null) { 
                                    ass= row.getCell(19).toString();
                                }else {
                                    ass="";
                                } 
                                if( row.getCell(20)!=null) { 
                                    tos = row.getCell(20).toString();
                                }else {
                                    tos="";
                                }  
				if( row.getCell(21)!=null) { 
                                    st = row.getCell(21).toString(); 
                                }else {
                                    st="";
                                }  
				if( row.getCell(22)!=null) { 
                                    bl= row.getCell(22).toString();
                                }else {
                                    bl="";
                                } 
				if( row.getCell(23)!=null) { 
                                    pf= row.getCell(23).toString();
                                }else {
                                    pf="";
                                } 
                                if( row.getCell(24)!=null) { 
                                    ef = row.getCell(24).toString(); 
                                }else {
                                    ef="";
                                }  
				if( row.getCell(25)!=null) { 
                                    pts= row.getCell(25).toString();
                                }else {
                                    pts="";
                                }
                            
                                //out.println("date saat ini = "+date);
                     if (date!="" && match!="" && wl!="" && mins!="" && fgm!="" && fga!="" && fgp!="" && twopm!="" && twopa!="" && twopp!="" && tripm!="" && tripa!="" && 
                         tripp!="" && ftm!="" && fta!="" && ftp!="" && ors!="" && dr!="" && tr!="" && ass!="" && tos!="" && st!="" && bl!="" && pf!="" && ef!="" && pts!=""){        
                            
                         String query = "INSERT INTO TrGameLogs(ID_musim,ID_Pemain,ID_Team,Match,Tgl_Match,WL,[MIN],[FGM],[FGA],[FG],[2PM],[2PA],[2P],[3PM],[3PA],[3P],[FTM],[FTA],[FT],[OR],[DR],[TR],[AS],[TO],[ST],[BL],[PF],[EF],[PTS]) "
                               + "values('"+ id_musim +"','"+ id_pemain +"','"+ id_team +"','"+ match +"','"+ date +"' ,'"+ wl +"','"+ mins +"','"+ fgm +"' ,'"+ fga +"','"+ fgp +"' ,'"+ twopm +"','"+ twopa +"' ,'"+ twopp +"','"+ tripm +"' ,'"+ tripa +"','"+ tripp +"' ,'"+ ftm +"','"+ fta +"' ,'"+ ftp +"','"+ ors +"' ,'"+ dr +"','"+ tr +"','"+ ass +"','"+ tos +"','"+ st +"','"+ bl +"','"+ pf +"','"+ ef +"','"+ pts +"')";
                               
                                //out.println(query);
                                // boolean a =dh.setStatikPemain(id_musim,id_pemain,id_team,match,date,wl,mins,fgm,fga,fgp,twopm,twopa,twopp,tripm,tripa,tripp,ftm,fta,ftp,ors,dr,tr,ass,tos,st,bl,pf,ef,pts);
                                  // if(a == true ){
                                   //    out.println("berhasil");
                                   //}
                                  // else{
                                  //     out.println("gagal");
                                  // }   
                        }
                     else{
                         out.println("data kosong");
                     }
                     }else{
                            session.setAttribute("ErrMess","Your data successfully recorded");
                            session.setAttribute("alert", "alert-success");
                            //response.sendRedirect("StatistikPlayer");  
                            out.println("data selanjutnya kosong<br/>");
                      }
           //  out.println("sheet = "+sheet.getLastRowNum());
          //  out.println(sno+" "+snama+" "+sumur);
	     }
        
        // keterangan="Uploaded Filename: " + Name +"."+ ext + "<br>";
                    //ln(file);
                    session.setAttribute("ErrMess","Your data successfully recorded");
                    session.setAttribute("alert", "alert-success");
                    response.sendRedirect("StatistikPlayer");
                    out.println("kondisi normal<br/>");
               }         
               else{
                   session.setAttribute("ErrMess","Your data failed to be recorded");
                   session.setAttribute("alert", "alert-danger");
                   out.println("kondisi format data salaah");
                   response.sendRedirect("StatistikPlayer");
               }
            }
            
         }
          //response.sendRedirect("excel");
         } catch(Exception ex) {
             
            out.println(ex);
         }
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
