/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Servlet.FrontEnd;

import Syncode.Basket.Object.DatabaseHandler;
import Syncode.Basket.Object.ObjTopPoint;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yuga
 */
public class SeasonLeader extends HttpServlet {

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
        String id = request.getParameter("id_m");
        PrintWriter out = response.getWriter();
        HashMap trc = dh.getRPGbySeason(id);
        HashMap tra = dh.getPPGbySeason(id);
        HashMap trb = dh.getAPGbySeason(id);
        response.setContentType("text/html;charset=UTF-8");
        try{
            
            out.println("<div class='leader'>");
                out.println("<b>PPG Leader : </b> ");
                for(int i=0;i<tra.size();i++){
                    ObjTopPoint ppg = (ObjTopPoint) tra.get(i);
                    out.println("  <a href='#' onclick=\"playdetail('"+ppg.getFoto()+"')\">"+ppg.getNamaPemain()+"</a>");
                    }
                out.println("<br>");
                out.println("<b>APG Leader : </b> ");
                for(int j=0;j<trb.size();j++){
                    ObjTopPoint apg = (ObjTopPoint) trb.get(j);
                    out.println("  <a href='#' onclick=\"playdetail('"+apg.getFoto()+"')\">"+apg.getNamaPemain()+"</a>");
                    }
                out.println("<br>");
                out.println("<b>RPG Leader : </b> ");
                for(int j=0;j<trc.size();j++){
                    ObjTopPoint rpg = (ObjTopPoint) trc.get(j);
                    out.println("  <a href='#' onclick=\"playdetail('"+rpg.getFoto()+"')\">"+rpg.getNamaPemain()+"</a>");
                    }
            out.println("</div>");
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
