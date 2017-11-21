/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Servlet.FrontEnd;

import Syncode.Basket.Object.DatabaseHandler;
import Syncode.Basket.Object.Musim;
import Syncode.Basket.Object.ObjMatchStatistic;
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
public class Season extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        DatabaseHandler dh = new DatabaseHandler();
        String id = "5";
        HashMap tr = dh.getMusim();
        Musim cs = (Musim) tr.get(0);
        HashMap st = dh.getMatchStatistic(cs.getId_musim());
        HashMap tra = dh.getPPGbySeason(id);
        HashMap trb = dh.getAPGbySeason(id);
        HashMap trc = dh.getRPGbySeason(id);
        for(int i = 0;i<st.size();i++){
            ObjMatchStatistic ste = (ObjMatchStatistic) st.get(i);
            out.println(ste.getTgl()+" "+ste.getTeam1()+" "+ste.getPts1()+" "+ste.getTeam2()+" "+ste.getPts2());
        }
        
        request.setAttribute("ppg",tra);
        request.setAttribute("apg",tra);
        request.setAttribute("rpg",tra);
        request.setAttribute("musim", tr);
        request.setAttribute("statistik", st);
        request.getRequestDispatcher("season.jsp").forward(request, response);
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
