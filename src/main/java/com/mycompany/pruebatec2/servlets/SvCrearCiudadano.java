/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.pruebatec2.servlets;

import com.mycompany.pruebatec2.logica.Ciudadano;
import com.mycompany.pruebatec2.logica.Controladora;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "SvCrearCiudadano", urlPatterns = {"/SvCrearCiudadano"})
public class SvCrearCiudadano extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        List<Ciudadano> listCiudadanos = control.listCiudadanos();

        HttpSession misesion = request.getSession();
        misesion.setAttribute("listCiudadanos", listCiudadanos);

        //Redireccionar 
        System.out.println(listCiudadanos);
        System.out.println("doGet lista Ciudadanos");
        response.sendRedirect("listCiudadanos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");

        //Creamos ciudadano
        System.out.println("Ciudadano registrado:" + nombre + apellido + dni);
        control.createCiudadano(nombre, apellido, dni);

        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
