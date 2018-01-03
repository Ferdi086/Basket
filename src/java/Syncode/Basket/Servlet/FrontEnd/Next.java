/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Servlet.FrontEnd;

import Syncode.Basket.Object.DatabaseHandler;
import Syncode.Basket.Object.Musim;
import Syncode.Basket.Object.ObjTeamSeason;
import Syncode.Basket.Object.Team;
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
public class Next extends HttpServlet {

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
        String ID_M = request.getParameter("id_musim");         
        HashMap aw = dh.getNext(ID_M);
        Musim tm = (Musim)aw.get(0);
        String ID = request.getParameter("id_t");
        String id_musim=tm.getId_musim();
        HashMap Team = dh.getTeam(id_musim);
        Team team = (Team)Team.get(0);
        out.print("");
        String thn_awal = team.getThn_awal();
        String thn_akhir = team.getThn_akhir();
        HashMap tr = dh.getTeamDetail(ID); 
        HashMap tr1 = dh.getPlayers(ID);
        HashMap tr2 = dh.getTopPoint(ID,thn_awal);
        HashMap tr3 = dh.getTopAssist(ID,thn_awal);
        HashMap tr4 = dh.getTopRebound(ID,thn_awal);
        HashMap Season = dh.getTeamSeason(ID, thn_awal);
        HashMap playerlist = dh.getPlayerlistTeam(ID, id_musim);
        //out.print(playerlist);
        ObjTeamSeason msm = (ObjTeamSeason) Season.get(0);
        HashMap gs = dh.getGeneralStat(ID, msm.getId_musim());
        HashMap awk = dh.getPrevious(id_musim);
        Musim tm1 = (Musim)awk.get(0);
        String id_musimprev = tm1.getId_musim();
        HashMap next = dh.getNext(id_musim);
        Musim tm2 = (Musim)next.get(0);
        String id_musimnext = tm2.getId_musim();  
        request.setAttribute("id_team",ID);
        request.setAttribute("team",tr);
        request.setAttribute("player",tr1);
        request.setAttribute("tp",tr2);
        request.setAttribute("ta",tr3);
        request.setAttribute("tr",tr4);
        request.setAttribute("ss",Season);
        request.setAttribute("gs",gs);
        request.setAttribute("playerlist",playerlist);
        request.setAttribute("thn_awal",thn_awal);
        request.setAttribute("thn_akhir",thn_akhir);
        request.setAttribute("idmusim", id_musim);
        request.setAttribute("idmusimprev", id_musimprev);
        request.setAttribute("idmusimnext", id_musimnext);
        request.getRequestDispatcher("team_detail.jsp").forward(request, response);
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
