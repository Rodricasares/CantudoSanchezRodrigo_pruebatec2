<%-- 
    Document   : searchFilter
    Created on : 22 ene 2024, 10:43:16
    Author     : rodri
--%>

<%@page import="com.mycompany.pruebatec2.logica.Turno"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filtrado Personal de Turnos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <style>
            #filtrarTurnos {
                width: 90%;
                margin: 0 auto; /* Esto centrará la tabla en el medio */
                border-collapse: collapse; /* Para evitar espacios entre las celdas */
                border: 1px solid black; /* Borde de la tabla */
            }
        </style>
    </head>         
    <body class=" bg-black ">
         <nav class="navbar navbar-light bg-light mb-5">
        <a class="navbar-brand" href="index.jsp">
            <img src="https://img.freepik.com/vector-gratis/plantilla-logotipo-baloncesto-degradado_23-2149373179.jpg" width="30" height="30" class="d-inline-block align-top m-1 rounded" alt="">
            Orden filtrado Personal
        </a>
    </nav>
        <table id="filtrarTurnos" cellspacing="0" border="1" class="text-center" >
            <thead  >
                <tr>
                    <th class="text-light border border-ligh ">
                        Turno
                    </th>
                    <th class="text-light border border-ligh ">
                        Fecha
                    </th>
                    <th class="text-light border border-ligh ">
                        Descripción
                    </th>  
                    <th class="text-light border border-ligh ">
                        Estado
                    </th>
                    <th class="text-light border border-ligh ">
                        Ciudadano Solicitante
                    </th>
                    <th class="text-light border border-ligh ">
                      Editar / Eliminar 
                         Turno
                    </th>

                    
                    
            </thead>
<%
    List<Turno> estadoList = (List<Turno>) session.getAttribute("estadoList");
    String estadoSeleccionado = (String) session.getAttribute("estadoSeleccionado");
%>

<h2>Usuarios con estado: <%= estadoSeleccionado %></h2>

<table>
    <thead>
        <tr>
            <th>Estado</th>
            <!-- Agrega más columnas según la información que quieras mostrar -->
        </tr>
    </thead>
    <tbody>
        <% for (Turno turno :estadoList) {%>
        
            <tr>
                <td><%= turno.getFecha()%></td>
                <!-- Agrega más celdas según la información que quieras mostrar -->
            </tr>
        <%}%>
    </tbody>
</table>

        </table>
    </body>
</html>
