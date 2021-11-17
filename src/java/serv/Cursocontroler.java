/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serv;


import java.io.IOException;
import java.io.PrintWriter;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alfamidia
 */
public class Cursocontroler extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void gravarCurso(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
       String msg = "";
        try {
             if(request.getParameter("sub")!= null){
            
                Class.forName("com.mysql.jdbc.Driver");
                
                String url = "jdbc:mysql://localhost/alfajava";
                String user = "root";
                String pass = "";
                Connection con = DriverManager.getConnection(url,user,pass);
                
                String nome = request.getParameter("nom");
                String desc = request.getParameter("desc");
                String val = request.getParameter("val");
                
                String sql ="insert into cursos (nome,descricao,valor)"
                           + "values(?,?,?)";
               
                PreparedStatement stmt = (PreparedStatement) con.prepareStatement(sql);
                
                stmt.setString(1, nome);
                stmt.setString(2, desc);
                stmt.setFloat(3, Float.parseFloat(val));
                
                int res = stmt.executeUpdate();
                if(res >0){
                  msg = " OK";
                }else{
                      msg = " DEU PROBLEMA";
                }
                
                stmt.close();
                con.close();
            }
            
            
        }catch(Exception e){ msg = "Deu bug";}
        
        response.sendRedirect("listaCursos.jsp?msg="+msg);
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
        try {
            gravarCurso(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Cursocontroler.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Cursocontroler.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            gravarCurso(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Cursocontroler.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Cursocontroler.class.getName()).log(Level.SEVERE, null, ex);
        }
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
