<%-- 
    Document   : listTurnos
    Created on : 19 ene 2024, 13:34:25
    Author     : rodri
--%>

<%@page import="com.mycompany.pruebatec2.logica.Turno"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liga de baloncesto</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <style>
            #listarTurnos {
                width: 90%;
                margin:  auto; /* Esto centrará la tabla en el medio */
                border-collapse: collapse; /* Para evitar espacios entre las celdas */
                border: 1px solid black; /* Borde de la tabla */
            }
        </style>
    </head>           


    <body class=" bg-black "> 
        <nav class="navbar navbar-light bg-light mb-5">
            <a class="navbar-brand" href="index.jsp">
                <img src="https://img.freepik.com/vector-gratis/plantilla-logotipo-baloncesto-degradado_23-2149373179.jpg" width="30" height="30" class="d-inline-block align-top m-1 rounded" alt="">
                Lista de turnos Solicitados por orden de registro
            </a>
        </nav>
        <table id="listarTurnos" cellspacing="0" border="1" class="text-center" >
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
                List<Turno> listTurnos = (List) request.getSession().getAttribute("listTurnos");
            %>

            <tbody>
                <%for (Turno turno : listTurnos) {%>
                <tr>

                    <td class="text-light border border-ligh"><%=turno.getNumero()%></td>
                    <td class="text-light border border-ligh"><%=turno.getFecha()%></td>
                    <td class="text-light border border-ligh"><%=turno.getDescripcion()%></td>
                    <td class="text-light border border-ligh"><%=turno.getEstado()%></td>
                    <td class="text-light border border-ligh"><%=turno.getCiudadano()%></td>

                    <td class="text-light border border-ligh text-center"> 
                        <form action="borrarTurno" method="POST">
                            <input type="hidden" name="idEliminarTurno" value="<%=turno.getId()%>">
                            <button type="submit" class="btn btn-danger m-2"><i class="bi bi-trash3"></i></button>
                        </form>

                        <form action="SvEdit" method="POST">
                            <input type="hidden" name="idTurno" value="<%=turno.getId()%>">
                            <button type="submit" class="btn btn-success m-2"><i class="bi bi-pencil"></i></button>
                        </form>
                    </td>
                </tr>
                <%}%> 
            </tbody>
            <%--
                        
                       <tfoot>
                <tr>
                    <th  class="text-light">
                        Equipo
                    </th>
               
                    <th style="width: 210px"></th>
                </tr>
            </tfoot>--%>
        </table>
    </body>
</html>
