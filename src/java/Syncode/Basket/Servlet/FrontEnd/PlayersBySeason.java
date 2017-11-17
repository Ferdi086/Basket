/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Servlet.FrontEnd;

import Syncode.Basket.Object.DatabaseHandler;
import Syncode.Basket.Object.PlayerDetailGLogs;
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
public class PlayersBySeason extends HttpServlet {

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
        String id2 = request.getParameter("id_m");
        HashMap tr = dh.getPlayerDetailGLogs(id,id2);
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        try{
            
            out.println("<table class=\"table table-bordered table-striped tb_season\">");
            out.println("   <tr class=\"tr_general\">");
            out.println("                                               <th>MATCH</th>" +
"									<th>W/L</th>" +
"                                                                       <th>MIN</th>" +        
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
"									<th>BL</th>" +
"									<th>PF</th>" +
"									<th>EF</th>" +
"									<th>PTS</th>");
out.println(" </tr>");
            
            
            for(int i=0;i<tr.size();i++){
                PlayerDetailGLogs pl = (PlayerDetailGLogs) tr.get(i);
                out.println("   <tr>");
                out.println("       <td>"+pl.getMatch()+"</td>");
                out.println("       <td>"+pl.getWl()+"</td>");
                out.println("       <td>"+pl.getMIN()+"</td>");
                out.println("       <td>"+pl.getFGM()+"</td>");
                out.println("       <td>"+pl.getFGA()+"</td>");
                out.println("       <td>"+pl.getFG()+"%</td>");
                out.println("       <td>"+pl.getPM2()+"</td>");
                out.println("       <td>"+pl.getPA2()+"</td>");
                out.println("       <td>"+pl.getP2()+"%</td>");
                out.println("       <td>"+pl.getPM3()+"</td>");
                out.println("       <td>"+pl.getPA3()+"</td>");
                out.println("       <td>"+pl.getP3()+"%</td>");
                out.println("       <td>"+pl.getFTM()+"</td>");
                out.println("       <td>"+pl.getFTA()+"</td>");
                out.println("       <td>"+pl.getFT()+"%</td>");
                out.println("       <td>"+pl.getO_R()+"</td>");
                out.println("       <td>"+pl.getDR()+"</td>");
                out.println("       <td>"+pl.getTR()+"</td>");
                out.println("       <td>"+pl.getA_S()+"</td>");
                out.println("       <td>"+pl.getT_O()+"</td>");
                out.println("       <td>"+pl.getST()+"</td>");
                out.println("       <td>"+pl.getBL()+"</td>");
                out.println("       <td>"+pl.getPF()+"</td>");
                out.println("       <td>"+pl.getEF()+"</td>");
                out.println("       <td>"+pl.getPTS()+"</td>");
                out.println("   </tr>");
                }
            out.println("</table>");
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
