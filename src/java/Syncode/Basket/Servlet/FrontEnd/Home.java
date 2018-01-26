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
public class Home extends HttpServlet {

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
        String asal1 = "Lokal";
        String asal2 = "Asing";
        String div1 = "M";
        String div2 = "P";
        String curr = dh.getCurrentRegularSeason();
        HashMap tr = dh.getPlayerRandom(asal1); 
        HashMap tra = dh.getPlayerRandom(asal2);      
        HashMap tm = dh.getTeam(curr);
        //HashMap trd = dh.getNewsList();
        HashMap tre = dh.getTrendingPlayer();
        /*HashMap trf = dh.getKlasemen();
        HashMap trg = dh.getKlasemen2();
        HashMap trf = dh.getKlasemenYuga(musim, div1);
        HashMap trg = dh.getKlasemenYuga(musim, div2);
        request.setAttribute("klas", trf);
        request.setAttribute("klas2", trg);*/
        HashMap current = dh.getCurrentSeasonHome();
        HashMap klasmen_m = dh.getKlasemenNew(curr, div1);
        HashMap klasmen_p = dh.getKlasemenNew(curr, div2);
        request.setAttribute("p1",tr);
        request.setAttribute("p1a",tra);
        request.setAttribute("team",tm);
        //request.setAttribute("news", trd);
        request.setAttribute("tren", tre);
        request.setAttribute("current", current);
        request.setAttribute("klasmen_m",klasmen_m);
        request.setAttribute("klasmen_p",klasmen_p);
        //out.print(trf.size());
        request.getRequestDispatcher("Home.jsp").forward(request, response);
        
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
