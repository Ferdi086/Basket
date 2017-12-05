/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Servlet.FrontEnd;

import Syncode.Basket.Object.DatabaseHandler;
import Syncode.Basket.Object.ObjPlayer;
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
public class doSelectPlayer2 extends HttpServlet {

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
        String bagian = request.getParameter("bagian")==null?"0":request.getParameter("bagian");
        String asal = request.getParameter("asal")==null?"0":request.getParameter("asal");
        DatabaseHandler db=new DatabaseHandler();
        PrintWriter out = response.getWriter();
        //out.println(bagian);
        if(bagian.equals("0")){
            //HashMap hm = db.getPlayerDetail();
            //request.setAttribute("pemain",hm);
            //out.println("gagal");
           request.getRequestDispatcher("StatistikPlayer.jsp").forward(request, response);
            
        }
        else if(bagian.equals("1")){
        
            response.setContentType("text/html;charset=UTF-8");
            
            String category = request.getParameter("category")==null?"0":request.getParameter("category");
            
            if(category.equals("")){
                out.print("<option value=''>--No --</option>");
            }
            else{
                HashMap dsn = db.getPlayerDetail2(category, asal);
                    out.print("<option value=''>-- Choose One --</option>");
                    for(int i=0; i<dsn.size(); i++){
                        ObjPlayer ds = (ObjPlayer) dsn.get(i);
                        
                        if(ds.getNamaPemain().contains(".")){
                            String nama= ds.getNamaPemain().replace(".","");
                         out.print("<option value=\""+ ds.getIdPemain()+"-"+ nama+"\">"+ nama+"</option>");
                   
                        }else{
                        out.print("<option value=\""+ ds.getIdPemain()+"-"+ ds.getNamaPemain()+"\">"+ ds.getNamaPemain()+"</option>");
                   
                        }
                    }
            }
            
            
           
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
