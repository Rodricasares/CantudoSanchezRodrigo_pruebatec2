

<%@page import="com.mycompany.pruebatec2.logica.Turno"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.pruebatec2.logica.Ciudadano"%>
<%@page import="com.mycompany.pruebatec2.logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liga de baloncesto</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <style>
            .flex-container {

                border: 2px solid #fff;
                display: flex;
                flex-flow: row wrap ;
                justify-content: space-between;
                align-items: center;
                padding: 20 px;
                width:90%;
                margin: 0 auto;

            }

            .box-registro{

                order: 1;
                flex-grow: 5;
            }
            .box-turno{
                order: 2;
                flex-grow: 4;
            }
            .box-filter{
                order: 3;
                flex-grow: 3;
            }
            .box {
                order: 4;
                flex-grow: 4;
            }
        </style>
    </head>           


    <body  class=" bg-black "> 
        <nav class="navbar navbar-light bg-light mb-5">
            <a class="navbar-brand" href="index.jsp">
                <img src="https://img.freepik.com/vector-gratis/plantilla-logotipo-baloncesto-degradado_23-2149373179.jpg" width="30" height="30" class="d-inline-block align-top m-1 rounded" alt="">
                Gestor de turnos Hack a Boss
            </a>
        </nav>

        <div class="flex-container" >

            <div class="box-registro">

                <form  class="m-3 border border-ligh rounded p-3 " action="SvCrearCiudadano"  method="POST">


                    <div class="form-group">
                        <h1 class=" text-light mt-3">Registrar ciudadano</h1><br><br>
                        <label class="form-label text-light" for="nombre">Nombre del ciudadano: </label>
                        <input class="text-dark" type="text" name="nombre" placeholder="Nombre" id="nombre" required>
                        <label class="form-label text-light" for="apellido">Apellido del ciudadano: </label>
                        <input class="text-dark" type="text" name="apellido" placeholder="apellido" id="apellido" required> 
                        <label class="form-label text-light" for="dni">Dni ciudadano: </label>
                        <input class="text-dark" type="text" name="dni" placeholder="Dni" id="dni" required>

                    </div>  
                    <button  class="btn btn-primary  mt-3" type="submit">Registrar Ciudadano</button>
                </form>
            </div>


            <!-- Solicitar Turno -->
            <div class="box-turno">
                <form  class="m-3 border border-ligh rounded p-3 " action="SvCrearTurno"  method="POST">

                    <div class="form-group">
                        <h1 class=" text-light mt-3">Solicitar turno</h1><br><br>
                        <label class="form-label text-light" for="numero">numero: </label>
                        <input class="text-dark" type="number" name="numero" placeholder="Numero" id="numero"> 
                        <label class="form-label text-light" for="fecha">Fecha partido: </label>
                        <input class="text-dark" type="date" name="fecha" placeholder="Fecha partido" id="fecha"> 
                        <label class="form-label text-light" for="descripcion">Descripción de la solicitud: </label>
                        <input class="text-dark" type="text" name="descripcion" placeholder="Descripción" id="descripcion"> 
                        <label class="form-label text-light" for="ciudadano">Ciudadano:</label>

                        <select name="ciudadano" id="ciudadano">
                            <%
                                Controladora newCiudadano = new Controladora();
                                List<Ciudadano> listCiudadanos = newCiudadano.listCiudadanos();
                                for (Ciudadano persona : listCiudadanos) {
                            %>
                            <option value="<%=persona.getId()%>"><%=persona.getNombre()%></option>
                            <%
                                }
                            %>
                        </select>

                    </div>  
                    <button  class="btn btn-primary  mt-3" type="submit">Registrar Turno</button>
                </form>
            </div>

            <!-- Boton listar Ciudadanos -->
            <div class="box">
                <form action="SvCrearCiudadano" method="GET"  class="m-3 border border-ligh rounded p-3">
                    <h1 class=" text-light mt-3">Listar Ciudadanos Solicitantes</h1><br><br>
                    <button type="submit" class="btn btn-warning mt-3">Solicitantes Registrados</button>

                </form> 
            </div>
            <!-- Boton listar Turnos -->
            <div class="box">
                <form action="SvCrearTurno" method="GET"  class="m-3 border border-ligh rounded p-3">
                    <h1 class=" text-light mt-3">Lista Turnos Solicitados</h1><br><br>
                    <button type="submit" class="btn btn-warning mt-3">Turnos Registrados</button>

                </form> 

            </div>
            <!-- Filtrado personal -->

            <div class="box-filter">
                <form  class="m-3 border border-ligh rounded p-3 " action="filtrarTurnos"  method="GET">
                    <h1 class=" text-light mt-3">Orden de  Turnos</h1>
                    <input class="text-dark mt-5" type="date" name="fecha" placeholder="Fecha partido" id="fecha"> 
                         <br><br>
                    <select class="mb-2" name="estado" value="estado">
                       
                        <option  value="<%="Ya atendido"%>">Ya atendido</option>
                
                        <option  value="<%="En espera"%>">En espera</option>
                     
                    </select>
    
                    <button  class="btn btn-danger  float-end" type="submit">Filtrar Turno</button>
                </form>
            </div>  
        </div>


    </body>
</html>
