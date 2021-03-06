/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Servlet.FrontEnd;

import Syncode.Basket.Object.DatabaseHandler;
import Syncode.Basket.Object.ObjMatchStatistic;
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
public class SeasonTabel extends HttpServlet {

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
        HashMap st = dh.getMatchStatistic(id);
        response.setContentType("text/html;charset=UTF-8");
        try{
           
            for(int i=0;i<st.size();i++){
                    out.println("   <tr>");
                    ObjMatchStatistic obs = (ObjMatchStatistic) st.get(i);
                    out.println("       <td style=\"vertical-align: middle;text-align: center\"><a href='#' data-toggle='tooltip' title='"+obs.getMatch()+"'>"+obs.getTgl()+"</a></td>");
                    out.println("       <td style=\"vertical-align: middle;text-align: center\"><a href='#'><img src='../img/Team/Logo/"+obs.getLogo1()+"' class='logo_kcl'>"+obs.getTeam1()+"</a></td>");
                    out.println("       <td style=\"vertical-align: middle;text-align: center\">"+obs.getPts1()+"</td>");
                    out.println("       <td style=\"vertical-align: middle;text-align: center\"><a href='#'><img src='../img/Team/Logo/"+obs.getLogo2()+"' class='logo_kcl'>"+obs.getTeam2()+"</a></td>");
                    out.println("       <td style=\"vertical-align: middle;text-align: center\">"+obs.getPts2()+"</td>");
                    out.println("   </tr>");
            }
           
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
