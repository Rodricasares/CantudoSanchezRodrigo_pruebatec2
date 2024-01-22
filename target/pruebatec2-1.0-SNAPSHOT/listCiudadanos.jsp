<%-- 
    Document   : listCiudadanos
    Created on : 18 ene 2024, 20:06:01
    Author     : rodri
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.pruebatec2.logica.Ciudadano"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liga de baloncesto</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <style>
            #listarECiudadanos {
                width: 90%;
                margin: 0 auto; /* Esto centrará la tabla en el medio */
                border-collapse: collapse; /* Para evitar espacios entre las celdas */
                border: 1px solid black; /* Borde de la tabla */
            }
        </style>
    </head>         
    <body class=" bg-black ">
      <h1 class="text-light m-3">Listar Ciudadano</h1>

        <table id="listarECiudadanos" cellspacing="0" border="1" class="text-center" >
            <thead  >
                <tr>
                    <th class="text-light border border-ligh ">
                        Nombre
                    </th>
                     <th class="text-light border border-ligh ">
                        Apellido
                    </th>
                     <th class="text-light border border-ligh ">
                        D.N.I.
                    </th>  
                    <th class="text-light border border-ligh ">
                        Eliminar/Editar
                    </th>

                   
            </thead>

            <%
                List<Ciudadano> listCiudadanos = (List) request.getSession().getAttribute("listCiudadanos");
            %>

            <tbody>
                <%for (Ciudadano citizen : listCiudadanos) {%>
                <tr>

                    <td class="text-light border border-ligh"><%=citizen.getNombre()%></td>
                    <td class="text-light border border-ligh"><%=citizen.getApellido()%></td>
                    <td class="text-light border border-ligh"><%=citizen.getDni()%></td>
                    <td class="text-light border border-ligh text-center"> 
                        <form action="SvCrearCiudadano" method="POST">
                            <input type="hidden" name="idEliminarEquipo" value="<%=citizen.getId()%>">
                            <button type="submit" class="btn btn-danger m-2"><i class="bi bi-trash3"></i></button>
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
