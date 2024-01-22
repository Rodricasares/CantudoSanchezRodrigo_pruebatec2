<%-- 
    Document   : editTurno
    Created on : 22 ene 2024, 22:38:50
    Author     : rodri
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.pruebatec2.logica.Controladora"%>
<%@page import="com.mycompany.pruebatec2.logica.Turno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
             <%
                Turno idEquipo = (Turno)request.getSession().getAttribute("idTurno"); 
            %>
            <form  class="m-3 border border-ligh rounded p-3 " action="SvEdit"  method="POST">


                <div class="form-group">
                    <h1 class=" text-light mt-3">Editar Equipo</h1><br><br>
                    <label class="form-label text-light" for="estado">Nombre del Equipo: </label>
                    <input class="text-dark" type="text" id="estado"  name="estado" placeholder="Editar nombre Equipo" value="<%=idEquipo.getEstado()%>"> 

                </div>  
                <button  class="btn btn-primary  mt-3" type="submit">Enviar Edición de Equipo</button>
            </form>    </body>
</html>
