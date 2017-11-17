/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Servlet.FrontEnd;

import Syncode.Basket.Object.DatabaseHandler;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ferdinand
 */
public class GeneralStat extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DatabaseHandler dh = new DatabaseHandler();
        String id = request.getParameter("id_p");
        String id2 = request.getParameter("id_t");
        HashMap gs = dh.getGeneralStat(id, id2);
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        try{
            out.println("<table class=\"table table-bordered table-striped tb_pemain\">");
            out.println("   <tr class=\"tr_general\">");
            out.println("                                               <th>NO</th>" +
                    
"									<th>PLAYER</th>" +
"                                                                       <th>POS</th>" +        
"									<th>GP</th>" +
"									<th>MIN</th>" +
"									<th>FGM</th>" +
                    
"									<th>FGA</th>" +
"									<th>FG%</th>" +
"									<th>2PM</th>" +
"									<th>2PA</th>" +
"									<th>2P%</th>" +
                    
"									<th>3PM</th>" +
"									<th>3PA</th>" +
"									<th>3P%</th>" +
"									<th>FTM</th>" +
"									<th>FTA</th>" +
                    
"									<th>FT%</th>" +
"									<th>OR</th>" +
"									<th>DR</th>" +
"									<th>TR</th>" +
"									<th>AS</th>" +
                    
"									<th>TO</th>" +
"									<th>ST</th>" +
"                                                                       <th>BL</th>" +
"									<th>EF</th>" +
"									<th>PTS</th>");            
        }catch (Exception e){
            
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
