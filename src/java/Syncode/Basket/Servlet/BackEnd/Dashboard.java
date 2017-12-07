/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Servlet.BackEnd;

import Syncode.Basket.Object.DatabaseHandler;
import Syncode.Basket.Object.ObjUser;
import java.io.IOException;
import java.io.PrintWriter;
import Syncode.Basket.Object.Musim;
import Syncode.Basket.Object.ObjJam;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ferdinand
 */
public class Dashboard extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        PrintWriter out = response.getWriter();
        DatabaseHandler dh = new DatabaseHandler();
        HashMap tr = dh.getMusim();
        Musim cs = (Musim) tr.get(0);
        HashMap st = dh.getMatchStatistic(cs.getId_musim());
        ObjUser usr = (ObjUser) session.getAttribute("obj_usr");
        request.setAttribute("nama_usr", usr.getNama());
        request.setAttribute("statistik", st);
        //Jam
        HashMap cl = dh.getClock();
        ObjJam jm = (ObjJam) cl.get(0);
        String h = jm.getJam();
        String m = jm.getMenit();
        String s  = jm.getDetik();
        request.setAttribute("hour", h);
        request.setAttribute("minute", m);
        request.setAttribute("second", s);
        
        
        request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
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
