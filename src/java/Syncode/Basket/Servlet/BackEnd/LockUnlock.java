/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Syncode.Basket.Servlet.BackEnd;

import Syncode.Basket.Object.DatabaseHandler;
import Syncode.Basket.Object.Musim;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
public class LockUnlock extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();
        String ID = request.getParameter("ID_M");
        String St = request.getParameter("Flag");
        DatabaseHandler dh=new DatabaseHandler();
        boolean x=dh.setAktivasiMusim(ID, St);
        if(x==true){
            HashMap a = dh.getMusim(ID);
            Musim b = (Musim)a.get(0);
            String c = b.getFlagactive();
            if(c.equals("Y")){
                session.setAttribute("ErrMess","This Season Has Been Unlocked");
                session.setAttribute("alert", "alert-success");
            }else{
                session.setAttribute("ErrMess","This Season Has Been Locked");
                session.setAttribute("alert", "alert-danger");
            }
            
            response.sendRedirect("Musim");
        }
        else{
            session.setAttribute("ErrMess","Your data failed to be recorded");
            session.setAttribute("alert", "alert-danger");
            response.sendRedirect("Musim");
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
