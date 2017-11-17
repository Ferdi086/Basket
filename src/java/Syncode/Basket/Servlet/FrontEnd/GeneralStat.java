/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Servlet.FrontEnd;

import Syncode.Basket.Object.DatabaseHandler;
import Syncode.Basket.Object.ObjGeneralStat;
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
        String id = request.getParameter("id_t");
        String id2 = request.getParameter("id_m");
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
            out.println(" </tr>");
            for(int i=0;i<gs.size();i++){
                ObjGeneralStat pl = (ObjGeneralStat) gs.get(i);
                out.println("   <tr>");
                out.println("       <td>"+(i+1)+"</td>");
                
                out.println("       <td>"+pl.getNamapemain()+"</td>");
                out.println("       <td>"+pl.getPos()+"</td>");
                out.println("       <td>"+pl.getGp()+"</td>");
                out.println("       <td>"+pl.getMin()+"</td>");
                out.println("       <td>"+pl.getFgm()+"</td>");
                
                out.println("       <td>"+pl.getFga()+"</td>");
                out.println("       <td>"+pl.getFg()+"%</td>");
                out.println("       <td>"+pl.getPm2()+"</td>");
                out.println("       <td>"+pl.getPa2()+"</td>");
                out.println("       <td>"+pl.getP2()+"%</td>");
                
                out.println("       <td>"+pl.getPm3()+"</td>");
                out.println("       <td>"+pl.getPa3()+"</td>");
                out.println("       <td>"+pl.getP3()+"%</td>");
                out.println("       <td>"+pl.getFtm()+"</td>");
                out.println("       <td>"+pl.getFta()+"</td>");
                
                out.println("       <td>"+pl.getFt()+"%</td>");
                out.println("       <td>"+pl.getOr1()+"</td>");
                out.println("       <td>"+pl.getDr()+"</td>");
                out.println("       <td>"+pl.getTr()+"</td>");
                out.println("       <td>"+pl.getAs()+"</td>");
                
                out.println("       <td>"+pl.getTo()+"</td>");
                out.println("       <td>"+pl.getSt()+"</td>");
                out.println("       <td>"+pl.getBl()+"</td>");
                out.println("       <td>"+pl.getEf()+"</td>");
                out.println("       <td>"+pl.getPts()+"</td>");
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
