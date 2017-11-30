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
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yuga
 */
public class doLogin extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        String user = request.getParameter("UserName");
        String pass = request.getParameter("Password");
        //out.print(user+pass);
        ObjUser tes = dh.getUsr(user, pass);
        if(user.equals("")||pass.equals("")){
            request.setAttribute("Stat", "Mohon isi form dengan lengkap");
            request.setAttribute("alert","alert-danger");
            request.getRequestDispatcher("/BackEnd/index.jsp").forward(request,response);
        }
        if((tes.getPassword()).equals("")){
            request.setAttribute("Stat", "Id atau Password anda Salah");
            request.setAttribute("alert","alert-danger");
            out.print("salah woi");
            request.getRequestDispatcher("/BackEnd/index.jsp").forward(request,response);
        }
        if(user.equals(tes.getID())&&pass.equals(tes.getPassword())){
            session.setAttribute("obj_usr", tes);
            session.setMaxInactiveInterval(48*60*60);
            response.sendRedirect("Dashboard");
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
