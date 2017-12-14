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
public class doInsertTeam extends HttpServlet {
          private boolean isMultipart;
          private String filePath;
          private String filePath2;
          private File file ;
          private String[] extList = {"jpg","jpeg","png"};
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
    filePath = getServletContext().getInitParameter("file-upload-foto-team");
    filePath2 = getServletContext().getInitParameter("file-upload-foto-logo");
   }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
        String ext = "";
        String keterangan = "";
        String Exten = "";
        String NamaNew="";
         int ini ;
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
               FileItem nickitem = (FileItem) fileItems.get(1);
               String nick = nickitem.getString().trim();
               FileItem divisiitem = (FileItem) fileItems.get(2);
               String divisi = divisiitem.getString().trim();
               FileItem iduseritem = (FileItem) fileItems.get(3);
               String iduser = iduseritem.getString().trim();
               String FieldName = fi.getFieldName();
               String fileName = fi.getName();
               ext = fileName.split("\\.")[1];
               Exten="."+ ext;
               if(Arrays.asList(extList).contains(ext.toLowerCase())) {
                     if(FieldName.equals("logo")){
                            if( fileName.lastIndexOf("\\") >= 0 ) {
                                 file = new File( filePath + "team" +"-"+ nick+Exten) ;
                           } else {
                              file = new File( filePath + "team" +"-"+ nick+Exten) ;
                          }
                     }
                     else if(FieldName.equals("foto")){
                            if( fileName.lastIndexOf("\\") >= 0 ) {
                                file = new File( filePath2 + nick+Exten) ;
                              } else {
                                file = new File( filePath2 + nick+Exten) ;
                              }
                     }
                    String foto = "team" +"-"+nick+Exten;
                    String logo = nick+Exten;
                    fi.write( file );
                    String query = "INSERT INTO MsTeam (ID_Team,Nama_Team,Logo,Gambar)values('"+nick+"','"+NamaNew+"','"+logo+"','"+foto+"')";
                    out.println(query);
                    boolean a=dh.setMsTeam(nick,NamaNew,divisi,logo,foto,iduser);  
                    out.println(a);
                    session.setAttribute("ErrMess","Your data successfully recorded");
                    session.setAttribute("alert", "alert-success");
                    response.sendRedirect("Team");
            }
               
               else {
                        session.setAttribute("ErrMess","Your data failed to be recorded");
                        session.setAttribute("alert", "alert-danger");
                        response.sendRedirect("Team");
                    }
             }
          }
         } catch(Exception ex) {
            System.out.println(ex);
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
