/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sv.udb.vista;

import com.sv.udb.controlador.AlumnosCtrl;
import com.sv.udb.modelo.Alumnos;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Laboratorio
 */
@WebServlet(name = "AlumnosServ", urlPatterns = {"/AlumnosServ"})
public class AlumnosServ extends HttpServlet {

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
        boolean esValido = request.getMethod().equals("POST");
        if (esValido) {
            String mens = "";
            try {
                String CRUD = request.getParameter("frmalumno");
                if (!CRUD.equals("")) {
                    if (CRUD.equals("Guardar")) {
                        Alumnos obje = new Alumnos();
                        obje.setCodiAlum(0);
                        obje.setNombAlum(request.getParameter("txtnombrealumno"));
                        obje.setApelAlum(request.getParameter("txtapellidoalumno"));
                        SimpleDateFormat fm = new SimpleDateFormat("dd-MM-yyyy");
                        obje.setFechNaciAlum(fm.parse("31-03-1997"));
                        obje.setMailAlum(request.getParameter("txtemailalumno"));
                        obje.setTeleAlum(request.getParameter("txttelefonooalumno"));
                        obje.setDireAlum(request.getParameter("txtdireccionoalumno"));
                        String genero = request.getParameter("txtgen");
                        obje.setGeneAlum(genero.charAt(0));
                        mens = new AlumnosCtrl().guard(obje) ? "Datos guardados" : "Datos NO guardados";
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.setAttribute("mensAler", mens);
            request.setAttribute("estado", "3");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
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
