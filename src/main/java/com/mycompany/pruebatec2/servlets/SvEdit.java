/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.pruebatec2.servlets;

import com.mycompany.pruebatec2.logica.Controladora;
import com.mycompany.pruebatec2.logica.Turno;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rodri
 */
@WebServlet(name = "SvEdit", urlPatterns = {"/SvEdit"})
public class SvEdit extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        int idEditar = Integer.parseInt(request.getParameter("idTurno"));
        Turno idEquipo = control.obtenerTurno(idEditar);
        System.out.println(idEditar);
        HttpSession misesion = request.getSession();
        misesion.setAttribute("idTurno", idEquipo);
        System.out.println(idEditar);

        response.sendRedirect("editTurno.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String estado = request.getParameter("estado");

        System.out.println("doPost Editar Equipo \n");
        System.out.println("--------------------------------------------------");
        System.out.println("atributo guardado: " + ((Turno) request.getSession().getAttribute("idTurno")).toString());

        control.editEquipo(estado, (Turno) request.getSession().getAttribute("idTurno"));

        response.sendRedirect("editTurno.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
