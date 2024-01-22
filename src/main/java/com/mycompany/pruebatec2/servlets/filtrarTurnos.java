/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.pruebatec2.servlets;

import com.mycompany.pruebatec2.logica.Controladora;
import com.mycompany.pruebatec2.logica.Turno;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
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
@WebServlet(name = "filtrarTurnos", urlPatterns = {"/filtrarTurnos"})
public class filtrarTurnos extends HttpServlet {
    
    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        processRequest(request, response);
        
        List<Turno> estadoList = control.listTurnos();
        String fecha = request.getParameter("fecha");
        String estado = request.getParameter("estado");
        
        List<Turno> listTurn = control.listTurnos().stream().filter(turn -> turn.getFecha().toString().equals(fecha)).toList();
        List<Turno> secondFilter = listTurn.stream().filter(turn -> turn.getEstado().equals(estado)).toList();
        estadoList.sort(Comparator.comparing(Turno::getFecha)
                .thenComparing(Turno::getEstado)
                .thenComparing(Turno::getNumero));
        for (Turno turno : estadoList) {
            System.out.println(turno.toString());
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("estadoList", secondFilter);
        System.out.println("Listado turnos filtrado fecha/estado/numero: \n" + estadoList);
        //System.out.println(estadoList);
        // Redirigir a la página de resultados
        request.getRequestDispatcher("filterTurnos.jsp").forward(request, response);
        //response.sendRedirect("filterTurnos.jsp"); // Asegúrate de tener una página JSP adecuada

    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
