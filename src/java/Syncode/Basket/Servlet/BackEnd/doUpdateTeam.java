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
public class doUpdateTeam extends HttpServlet {
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
        HttpSession session = request.getSession(true);
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
         //Iterator ia = fileItems.listIterator(3);
         //FileItem fia = (FileItem) ia.next();
         //out.println(fia);
	
         // Process the uploaded file items
         Iterator i = fileItems.iterator();
           
        String nick = "";
        String nama = "";
        String logo = "";
        String foto ="";
        String Exten = "";
        String ext ="";
        String NamaNew="";
        int u = 1;
         while ( i.hasNext () ) {
            out.println(u);
            u++;
            FileItem fi = (FileItem)i.next();
            //out.println("why 2 = "+ar);
            if ( !fi.isFormField () ) {
               // Get the uploaded file parameters
               FileItem namaitem = (FileItem) fileItems.get(1);
               nama = namaitem.getString().trim();
                if (nama.contains("'")){
                    NamaNew = nama.replace("'", "''");
               }else{
                   NamaNew = nama;
               }
               FileItem nickitem = (FileItem) fileItems.get(0);
               nick = nickitem.getString();
               FileItem divisiitem = (FileItem) fileItems.get(2);
               String divisi = divisiitem.getString().trim();
               String FieldName = fi.getFieldName();
               String fileName = fi.getName()==""?"kosong":fi.getName();
               ext = fileName.split("\\.")[0]=="kosong"?"ini ext kosong":fileName.split("\\.")[1];
               out.println(ext);
               Exten="."+ ext;
               if(Arrays.asList(extList).contains(ext.toLowerCase())) {
                     if(FieldName.equals("logo")){
                            if( fileName.lastIndexOf("\\") >= 0 ) {
                                file = new File( filePath2 + nick+Exten) ;
                              } else {
                                file = new File( filePath2 + nick+Exten) ;
                              }
                     }
                    logo = nick+Exten;
                    fi.write( file );
                    String query = "update MsTeam set ID_Team='"+nick+"',Nama_Team='"+NamaNew+"',Logo='"+logo+"' where ID_Team='"+nick+"'";
                    out.println("query 2 ="+query+"<br/>");
                    boolean a=dh.setUpdateMsTeam(nick,NamaNew,divisi,logo);
                    //out.println(a);
                    session.setAttribute("ErrMess","Your data successfully recorded");
                    session.setAttribute("alert", "alert-success");
                    //response.sendRedirect("Team");
                   
            }
               
             }
            else {
               FileItem nickitem = (FileItem) fileItems.get(0);
               nick = nickitem.getString().trim();
               FileItem namaitem = (FileItem) fileItems.get(1);
               nama = namaitem.getString().trim();
               if (nama.contains("'")){
                    NamaNew = nama.replace("'", "''");
               }else{
                   NamaNew = nama;
               }
               FileItem divisiitem = (FileItem) fileItems.get(2);
               String divisi = divisiitem.getString().trim();
               String query = "update MsTeam set ID_Team='"+nick+"',Nama_Team='"+NamaNew+"',Logo='"+logo+"' where ID_Team='"+nick+"'";
               boolean a=dh.setUpdateMsTeam(nick,NamaNew,divisi,logo);
               //out.println(a);
               out.println("query 1 ="+query+"<br/>");
                 
            }
          }
            session.setAttribute("ErrMess","Your data successfully recorded");
                    session.setAttribute("alert", "alert-success");
                response.sendRedirect("Team");
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
