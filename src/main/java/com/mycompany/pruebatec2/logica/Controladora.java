/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.pruebatec2.logica;

import com.mycompany.pruebatec2.persistencia.ControladoraPersistencia;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class Controladora {

    ControladoraPersistencia ciudadanoControl = new ControladoraPersistencia();
    ControladoraPersistencia turnoControl = new ControladoraPersistencia();

    public void createCiudadano(String nombre, String apellido, String dni) {
        ciudadanoControl.addCiudadano(new Ciudadano(nombre, apellido, dni));
    }

    public List<Ciudadano> listCiudadanos() {
        return ciudadanoControl.listCiudadanos();
    }

    //Obtenemos ciudadano por el id para seleccionar ciudadano por id al crear ciudadano en el servlet -> SvCiudadano
    public Ciudadano selectCiudadano(int id) {
        //casteo Id         
        return ciudadanoControl.idCiudadano(id);
    }

    public void createTurno(int numero, LocalDate fecha, String descripcion, String estado, Ciudadano ciudadano) {

        turnoControl.addTurno(new Turno(numero, fecha, descripcion, estado, ciudadano));
    }

    public List<Turno> listTurnos() {
        return turnoControl.listTurnos();

    }

    public boolean turnoExistente(int numero, LocalDate fecha) {
        List<Turno> listaTurnos = turnoControl.listTurnos();

        // Verificar si hay algún valor igual al número o a la fecha en nuestra lista turnos
        boolean existeTurno = listaTurnos.stream()
                .anyMatch(turno -> turno.getNumero() == numero && turno.getFecha().equals(fecha));
        System.out.println(existeTurno);
        return existeTurno;
    }


    public boolean turnoFilterEstado(String estado) {
        List<Turno> listaTurnos = turnoControl.listTurnos();

        // Verificar si hay algún valor igual al número o a la fecha en nuestra lista turnos
        boolean filtrarEstado = listaTurnos.stream()
                .anyMatch(turno -> turno.getEstado() == estado);
        System.out.println(filtrarEstado);
        return filtrarEstado;
    }

    public void borrarTurno(int idEliminar) {
        turnoControl.deleteTurno(idEliminar);
    }

  

    public void editEquipo(String estado, Turno turno) {
 
        turno.setEstado(estado);
        turnoControl.modificarEstado(turno);
        System.out.println("Modo Edit");
    
    }

    public Turno obtenerTurno(int id) {
        return turnoControl.turnoId(id);
    }
    

}
