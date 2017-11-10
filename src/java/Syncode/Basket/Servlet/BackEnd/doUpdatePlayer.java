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
public class doUpdatePlayer extends HttpServlet {
        private boolean isMultipart;
          private String filePath;
          private File file ;
          private String[] extList = {"JPG","PNG"};
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
        DatabaseHandler dh = new DatabaseHandler();
       HttpSession session = request.getSession(true);
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        PrintWriter out = response.getWriter();
        String nama = request.getParameter("upemain");
        out.println(nama);
             //nama,tgl,tinggi,berat,pos,id_team,no,foto, String id_pemain
         
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
               //String nama = namaitem.getString().trim();
               FileItem id_teamitem = (FileItem) fileItems.get(1);
               String id_team = id_teamitem.getString().trim();
               String fileName = fi.getName();
               ext = fileName.split("\\.")[1];
               //String contentType = fi.getContentType();
               //boolean isInMemory = fi.isInMemory();
               //long sizeInBytes = fi.getSize();
               out.println("nama = "+id_team);
               
            if(Arrays.asList(extList).contains(ext.toUpperCase())){
                    // Write the file
                    if( fileName.lastIndexOf("\\") >= 1 ) {
                       file = new File( filePath + id_team +"-"+ nama+"."+ ext) ;
                    } else {
                       file = new File( filePath + id_team +"-"+ nama+"."+ ext) ;
                    }
                    
                    Exten="."+ ext;
                    foto = id_team +"-"+ nama+Exten;
                    fi.write( file ) ;
                    //dh.setFile(Name,Exten);
                     //akhir upload
                    //out.println("Uploaded Filename: " + Name +"."+ ext + "<br>");
                    out.println(file);
             
      // boolean a=dh.setUpdatePemain(nama,tgl,tinggi,berat,pos,id_team,no,file,id_pemain);
        session.setAttribute("ErrMess","Perubahan Data Berhasil Disimpan");
        session.setAttribute("alert", "alert-success");
        //response.sendRedirect("Player");
        //out.println(a);
        out.println("berhasil");
        //out.println(query);
      }
      else{
        session.setAttribute("ErrMess","Perubahan Data Gagal Disimpan");
        session.setAttribute("alert", "alert-danger");
       // response.sendRedirect("Player");
       //out.println(a);
       out.println("gagal");
      }
     }
          }
            } catch(Exception ex) {
            System.out.println(ex);
            out.println("nama =sss");
            //out.println(nama);
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
