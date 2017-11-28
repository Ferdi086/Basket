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
public class doUpdatePlayer extends HttpServlet {
        private boolean isMultipart;
          private String filePath;
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
      filePath = getServletContext().getInitParameter("file-upload-foto"); 
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
           
        String idpemain = "";
        String nama = "";
        String nama_pemain = "";
        String NamaFoto = "";
        String tgl = "";
        String foto ="";
        String tinggi = "";
        String berat = "";
        String pos ="";
        String idTeam = "";
        String noPunggung = "";
        String Exten = "";
        String ext ="";
        int u = 1;
         while ( i.hasNext () ) {
            out.println(u);
            u++;
            FileItem fi = (FileItem)i.next();
            //out.println("why 2 = "+ar);
            if ( !fi.isFormField () ) {
               // Get the uploaded file parameters
              FileItem idpemainitem = (FileItem) fileItems.get(0);
               idpemain = idpemainitem.getString();
               FileItem nama_pemain_item = (FileItem) fileItems.get(1);
               nama = nama_pemain_item.getString().trim();
               if (nama.contains("'")){
                    NamaFoto = nama.replace("'", "`");
               }else{
                   NamaFoto = nama;
               }
               FileItem idTeamitem = (FileItem) fileItems.get(2);
               idTeam = idTeamitem.getString().trim();
               FileItem positem = (FileItem) fileItems.get(3);
               pos = positem.getString().trim();
               FileItem noPunggungitem = (FileItem) fileItems.get(4);
               noPunggung = noPunggungitem.getString().trim();
               FileItem tinggiitem = (FileItem) fileItems.get(5);
               tinggi = tinggiitem.getString().trim();
               FileItem beratitem = (FileItem) fileItems.get(6);
               berat = beratitem.getString().trim();
               FileItem tglitem = (FileItem) fileItems.get(7);
               tgl = tglitem.getString().trim();
               String FieldName = fi.getFieldName();
               String fileName = fi.getName()==""?"kosong":fi.getName();
               ext = fileName.split("\\.")[0]=="kosong"?"ini ext kosong":fileName.split("\\.")[1];
               out.println(ext);
               //out.println(idpemain + nama_pemain + tgl + tinggi + berat + pos + idTeam + noPunggung);
               Exten="."+ ext;
               if(Arrays.asList(extList).contains(ext.toLowerCase())) {
                     if(FieldName.equals("fileupdate")){
                         out.println("<br/>iniFoto" + nama_pemain + Exten);
                           if( fileName.lastIndexOf("\\") >= 1 ) {
                       file = new File( filePath + idTeam +"-"+ nama_pemain+"-"+pos+"-"+noPunggung+"."+ ext);
                    } else {
                       file = new File( filePath + idTeam +"-"+ nama_pemain+"-"+pos+"-"+noPunggung+"."+ ext);
                    }
                    
                    
                     }
                    Exten="."+ ext;
                    foto = idTeam +"-"+ nama_pemain+"-"+pos+"-"+noPunggung+Exten;
                    out.println("ini foto "+foto);
                    fi.write( file ) ;
                    String query = "update MsPemain set Nama_Pemain='"+nama_pemain+"', Tgl_Lahir='"+tgl+"', Tinggi="+tinggi+", Berat="+berat+", KD_Pos='"+pos+"', Id_Team='"+idTeam+"', No_Punggung="+noPunggung+", Foto='"+foto+"' where Id_Pemain='"+ idpemain +"'";
                    boolean a=dh.setUpdatePemain(nama_pemain,tgl,tinggi,berat,pos,idTeam,noPunggung,foto,idpemain);
                    out.println("query 2 ="+query+"<br/>");
                    out.println(a);
                    
                   
            }
               else {
                       
                    }
             }
            else {
               FileItem idpemainitem = (FileItem) fileItems.get(0);
               idpemain = idpemainitem.getString();
               FileItem nama_pemain_item = (FileItem) fileItems.get(1);
               nama = nama_pemain_item.getString().trim();
               if (nama.contains("'")){
                    nama_pemain = nama.replace("'", "`");
               }else{
                   nama_pemain = nama;
               }
               FileItem idTeamitem = (FileItem) fileItems.get(2);
               idTeam = idTeamitem.getString().trim();
               FileItem positem = (FileItem) fileItems.get(3);
               pos = positem.getString().trim();
               FileItem noPunggungitem = (FileItem) fileItems.get(4);
               noPunggung = noPunggungitem.getString().trim();
               FileItem tinggiitem = (FileItem) fileItems.get(5);
               tinggi = tinggiitem.getString().trim();
               FileItem beratitem = (FileItem) fileItems.get(6);
               berat = beratitem.getString().trim();
               FileItem tglitem = (FileItem) fileItems.get(7);
               tgl = tglitem.getString().trim();
               
              out.println("tgl= "+tinggi);
               
               String query = "update MsPemain set Nama_Pemain='"+nama_pemain+"', Tgl_Lahir='"+tgl+"', Tinggi="+tinggi+", Berat="+berat+", KD_Pos='"+pos+"', Id_Team='"+idTeam+"', No_Punggung="+noPunggung+", where Id_Pemain='"+ idpemain +"'";
                   boolean a=dh.setUpdatePemain(nama_pemain,tgl,tinggi,berat,pos,idTeam,noPunggung,foto,idpemain);
               out.println("query 1 ="+query+"<br/>");
                out.println(a);
            }
          }
         try {
                Thread.sleep(1500);
            } catch (InterruptedException ex) {
                Logger.getLogger(Player.class.getName()).log(Level.SEVERE, null, ex);
            }
            session.setAttribute("ErrMess","Your data successfully recorded");
                    session.setAttribute("alert", "alert-success");
                response.sendRedirect("Player");
         } catch(Exception ex) {
             //out.println(ex);
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
