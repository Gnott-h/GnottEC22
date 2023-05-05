/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author phu
 */
public class ReloadData extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReloadData</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReloadData at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void doGet(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse)
    throws ServletException, IOException
  {
    try
    {
      paramHttpServletResponse.setContentType("text/html");
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
      Connection localConnection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=GnottDTB", "sa", "123123");
      String str1 = "SELECT * FROM (SELECT TOP 50 username, message, time FROM chatting_data ORDER BY [time] DESC) AS subquery ORDER BY [time] ASC";
      PreparedStatement localPreparedStatement = localConnection.prepareStatement(str1);
      
      ResultSet localResultSet = localPreparedStatement.executeQuery();
      
      while (localResultSet.next()) {
        String str2 = localResultSet.getString(1);
        String str3 = localResultSet.getString(2);
        String time = localResultSet.getString(3);
        PrintWriter localPrintWriter = paramHttpServletResponse.getWriter();
        localPrintWriter.print("User:"+str2+"-says:"+str3+"-"+time+"<br>\n");
      }
      localConnection.close();

    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      System.out.println("Something went wrong");
    }
  }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse)
    throws ServletException, IOException {
         doGet(paramHttpServletRequest, paramHttpServletResponse);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
