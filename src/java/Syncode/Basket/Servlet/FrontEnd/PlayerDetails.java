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
public class PlayerDetails extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String ID = request.getParameter("ID_P");
        if(ID.contains("-")){
            String part[] = ID.split("\\-");
            ID = part[0];
        }
        HashMap tr = dh.getPlayersDetails(ID);
        //ObjPlayer x = (ObjPlayer) tr.get(0);
        //out.print(x.getFoto());
        HashMap tra = dh.getPlayerDetailStat(ID);
        HashMap tras = dh.getSumPlayerDetailStat(ID);
        HashMap trb = dh.getPlayerDetailStat2(ID);
        HashMap trbs = dh.getSumPlayerDetailStat2(ID);
        HashMap trc = dh.getPlayerDetailGL(ID);
        HashMap sum = dh.getSummaryRegular(ID);
        HashMap sumcar = dh.getSummaryRegularCar(ID);
        HashMap sumpo = dh.getSummaryPlayoff(ID);
        HashMap sumpocar = dh.getSummaryPlayoffCar(ID);
        HashMap his = dh.getHistoryTeam(ID);
        
        request.setAttribute("player",tr);
        request.setAttribute("player_stat",tra);
        request.setAttribute("player_stat_sum",tras);
        request.setAttribute("player_stat2",trb);
        request.setAttribute("player_stat2_sum",trbs);
        request.setAttribute("player_gl",trc);
        request.setAttribute("id_pem",ID);
        request.setAttribute("sum",sum);
        request.setAttribute("sumcar",sumcar);
        request.setAttribute("sumpo",sumpo);
        request.setAttribute("sumpocar",sumpocar);
        request.setAttribute("his", his);
        //out.print(tra.size());
        request.getRequestDispatcher("player_detail.jsp").forward(request, response);
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
