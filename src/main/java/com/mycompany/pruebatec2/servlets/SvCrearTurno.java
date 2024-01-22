/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.pruebatec2.servlets;

import com.mycompany.pruebatec2.logica.Ciudadano;
import com.mycompany.pruebatec2.logica.Controladora;
import com.mycompany.pruebatec2.logica.Turno;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
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
@WebServlet(name = "SvCrearTurno", urlPatterns = {"/SvCrearTurno"})
public class SvCrearTurno extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        List<Turno> listTurnos = control.listTurnos();

        HttpSession misesion = request.getSession();
        misesion.setAttribute("listTurnos", listTurnos);

        //Redireccionar 
        System.out.println(listTurnos);
        System.out.println("doGet lista Turnos");
        response.sendRedirect("listTurnos.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        int numero = Integer.parseInt(request.getParameter("numero"));
        LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));
        String descripcion = request.getParameter("descripcion");
        String estado = "En espera";
        int ciudadanoId = Integer.parseInt(request.getParameter("ciudadano"));

        if (numero <= 0) {
            response.sendRedirect("error.jsp");
            return;
        }
        // Verificar que la combinación de número y fecha no exista
        if (control.turnoExistente(numero, fecha)) {
            response.sendRedirect("error.jsp");
            return;
        }
        //Renombro variable ciudadano para obtener un string    
        Ciudadano ciudadano = control.selectCiudadano(ciudadanoId);

        System.out.println("Ciudadano registrado: " + numero + fecha + descripcion + estado + ciudadano);
        //Creamos turno
        control.createTurno(numero, fecha, descripcion, estado, ciudadano);

        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
