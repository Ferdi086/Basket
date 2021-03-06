/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Servlet.BackEnd;

import Syncode.Basket.Object.DatabaseHandler;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author meiiko
 */
public class doInsertPlayer extends HttpServlet {
          private boolean isMultipart;
          private String filePath;
          private File file ;
          private String[] extList = {"JPG","JPEG","PNG"};
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
      filePath = getServletContext().getInitParameter("file-upload-foto"); 
   }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter(); 
        DatabaseHandler dh = new DatabaseHandler();
        HttpSession session = request.getSession(false);
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
                   
      //awal upload    
      isMultipart = ServletFileUpload.isMultipartContent(request);
      response.setContentType("text/html");
       
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
        
      try { 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);
	
         // Process the uploaded file items
         Iterator i = fileItems.iterator();
        String Name = "";
        String NamaNew = "";
        String ext = "";
        String keterangan = "";
        String Exten = "";
        String foto = "";
       // int u = 1;
         while ( i.hasNext () ) {
                  
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () ) {
               // Get the uploaded file parameters
               FileItem namaitem = (FileItem) fileItems.get(0);
               String nama = namaitem.getString().trim();
               if (nama.contains("'")){
                    NamaNew = nama.replace("'", "''");
               }else{
                   NamaNew = nama;
               }
               FileItem id_teamitem = (FileItem) fileItems.get(1);
               String id_team = id_teamitem.getString().trim();
               FileItem positem = (FileItem) fileItems.get(2);
               String pos = positem.getString().trim();
               FileItem noitem = (FileItem) fileItems.get(3);
               String no = noitem.getString().trim();
               FileItem tinggiitem = (FileItem) fileItems.get(4);
               String tinggi = tinggiitem.getString().trim();
               FileItem beratitem = (FileItem) fileItems.get(5);
               String berat = beratitem.getString().trim();
               FileItem tglitem = (FileItem) fileItems.get(6);
               String tgl = tglitem.getString().trim();
               FileItem tanganitem = (FileItem) fileItems.get(7);
               String tangan = tanganitem.getString().trim();
               FileItem regionitem = (FileItem) fileItems.get(8);
               String region = regionitem.getString().trim();
               FileItem iduseritem = (FileItem) fileItems.get(9);
               String iduser = iduseritem.getString().trim();
               String fileName="";
               fileName = fi.getName();
               if(fileName.equals("")){
                   out.println("kosong");
                   boolean a=dh.setMsPemain(NamaNew,region,id_team,pos,no,tinggi,berat,tgl,tangan,foto,iduser); 
                    out.println(a);
                    session.setAttribute("ErrMess","Your data successfully recorded");
                    session.setAttribute("alert", "alert-success");
                    response.sendRedirect("Player");
               }else{
                   out.println("ada");
                   ext = fileName.split("\\.")[1];
               Exten="."+ ext;
               if(Arrays.asList(extList).contains(ext.toUpperCase())){
                    // Write the file
                    if( fileName.lastIndexOf("\\") >= 1 ) {
                       file = new File( filePath +id_team +"-"+NamaNew+"-"+pos+"-"+no+Exten) ;
                    } else {
                       file = new File( filePath +id_team +"-"+NamaNew+"-"+pos+"-"+no+Exten) ;
                    }
                   
                    foto = id_team +"-"+NamaNew+"-"+pos+"-"+no+Exten;
                    fi.write( file ); 
                    out.println("nama baru="+NamaNew);
                    boolean a=dh.setMsPemain(NamaNew,region,id_team,pos,no,tinggi,berat,tgl,tangan,foto,iduser); 
                    session.setAttribute("ErrMess","Your data successfully recorded");
                    session.setAttribute("alert", "alert-success");
                    response.sendRedirect("Player");
               }
               else {
                        session.setAttribute("ErrMess","Your data failed to be recorded");
                        session.setAttribute("alert", "alert-danger");
                        response.sendRedirect("Player");
                    }
                }
            }
            
        }
            try {
                Thread.sleep(5000);
            }   catch (InterruptedException ex) {
                Logger.getLogger(Player.class.getName()).log(Level.SEVERE, null, ex);
            }
                session.setAttribute("ErrMess","Your data successfully recorded");
                session.setAttribute("alert", "alert-success");
                response.sendRedirect("Player");
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
