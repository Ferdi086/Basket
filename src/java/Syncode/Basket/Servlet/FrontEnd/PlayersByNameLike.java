/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Servlet.FrontEnd;

import Syncode.Basket.Object.DatabaseHandler;
import Syncode.Basket.Object.ObjPlayerFront;
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
public class PlayersByNameLike extends HttpServlet {

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
        String Nama_pem = request.getParameter("Nama_pem")==null?"0":request.getParameter("Nama_pem");
        String Team = request.getParameter("Team")==null?"0":request.getParameter("Team");
        String Pos = request.getParameter("Pos")==null?"0":request.getParameter("Pos");
        DatabaseHandler db=new DatabaseHandler();
        String idd = "re";
        HashMap tr = db.getPlayersFront3(Nama_pem);
        ObjPlayerFront pal = (ObjPlayerFront) tr.get(0);
        try{
            if(pal.getIdPemain()==null){
                out.print("gada");
                }else{
                if(Team.equals("null")||Pos.equals("null")){
                    //out.print(Nama_pem);
                    response.setContentType("text/html;charset=UTF-8");
                        out.print("<div class='wthree_team_grids'>");
                        for(int i=0; i<tr.size();i++){
                            ObjPlayerFront pl = (ObjPlayerFront) tr.get(i);
                        out.println("   <div class=\"col-md-3 wthree_team_grid\">");
                        out.println("   <div class=\"hovereffect\" onclick=\"playdetail("+pl.getIdPemain()+")\">");
                        out.println("       <img src=\"../img/Players/"+pl.getFoto()+"\"; onerror=\"this.onerror=null;this.src='../img/Players/nopic.png';\" alt=\""+pl.getNamaPemain()+"\" width=\"400px\" height=\"400px\" class=\"img-responsive\" />");
                        out.println("       <div class=\"overlay\">");
                        out.println("           <h6>"+pl.getNamaPemain()+"</h6>");
                        out.println("       </div>");
                        out.println("   </div>");
                        out.println("   <h4>"+pl.getNamaPos()+"</h4>");
                        out.println("   <p>"+pl.getTinggi()+" cm</p>");
                        out.println("   </div>");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        }
                        out.println("</div>");
                }
                else{
                        HashMap tra = db.getPlayersFront4(Nama_pem, Team, Pos);response.setContentType("text/html;charset=UTF-8");
                        out.print("<div class='wthree_team_grids'>");
                        for(int i=0; i<tra.size();i++){
                            ObjPlayerFront pl = (ObjPlayerFront) tra.get(i);
                        out.println("   <div class=\"col-md-3 wthree_team_grid\">");
                        out.println("   <div class=\"hovereffect\" onclick=\"playdetail("+pl.getIdPemain()+")\">");
                        out.println("       <img src='../img/Players/"+pl.getFoto()+"'; onerror=\"this.onerror=null;this.src='../img/Players/nopic.png';\" alt='"+pl.getNamaPemain()+"' width=\"400px\" height=\"400px\" class=\"img-responsive\" />");
                        out.println("       <div class=\"overlay\">");
                        out.println("           <h6>"+pl.getNamaPemain()+"</h6>");
                        out.println("       </div>");
                        out.println("   </div>");
                        out.println("   <h4>"+pl.getNamaPos()+"</h4>");
                        out.println("   <p>"+pl.getTinggi()+" cm</p>");
                        out.println("   </div>");
                        out.println("");
                        out.println("");
                        out.println("");
                        out.println("");
                        }
                        out.println("</div>");
                }
            }
        }catch (NullPointerException ee){
            response.setContentType("text/html;charset=UTF-8");
            out.print("<div class='wthree_team_grids'>");
            out.print("<div class=\"alert alert-danger\">");
            out.print(  "<h1>Sorry the player you are looking for doesn't exist</h1>");
            out.print("</div>");
            out.print("</div>");
        }
        /*try{
            if(pal.getIdPemain()==null){
                out.print("gada");
            }else{
                response.setContentType("text/html;charset=UTF-8");
                out.print("<div class='wthree_team_grids'>");
                for(int i=0; i<tr.size();i++){
                    ObjPlayerFront pl = (ObjPlayerFront) tr.get(i);
                out.println("   <div class=\"col-md-3 wthree_team_grid\">");
                out.println("   <div class=\"hovereffect\" onclick=\"playdetail("+pl.getIdPemain()+")\">");
                out.println("       <img src='../img/Players/"+pl.getFoto()+"'; onerror=\"this.onerror=null;this.src='../img/Players/nopic.png';\" alt='"+pl.getNamaPemain()+"' width=\"400px\" height=\"400px\" class=\"img-responsive\" />");
                out.println("       <div class=\"overlay\">");
                out.println("           <h6>"+pl.getNamaPemain()+"</h6>");
                out.println("       </div>");
                out.println("   </div>");
                out.println("   <h4>"+pl.getNamaPos()+"</h4>");
                out.println("   <p>"+pl.getTinggi()+" cm</p>");
                out.println("   </div>");
                out.println("");
                out.println("");
                out.println("");
                out.println("");
                }
                out.println("</div>");
            }
        }catch (NullPointerException ee){
            response.setContentType("text/html;charset=UTF-8");
            out.print("<div class='wthree_team_grids'>");
            out.print("<div class=\"alert alert-danger\">");
            out.print(  "<h1>Sorry the player you are looking for doesn't exist</h1>");
            out.print("</div>");
            out.print("</div>");
        }
        
        */
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
