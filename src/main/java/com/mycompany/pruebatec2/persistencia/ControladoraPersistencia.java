/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.pruebatec2.persistencia;

import com.mycompany.pruebatec2.logica.Ciudadano;
import com.mycompany.pruebatec2.logica.Turno;
import com.mycompany.pruebatec2.persistencia.exceptions.NonexistentEntityException;
import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author rodri
 */
public class ControladoraPersistencia {

    CiudadanoJpaController ciudadanoJpa = new CiudadanoJpaController();
    TurnoJpaController turnoJpa = new TurnoJpaController();

    public void addCiudadano(Ciudadano ciudadano) {
        ciudadanoJpa.create(ciudadano);
    }

    public List<Ciudadano> listCiudadanos() {
        return ciudadanoJpa.findCiudadanoEntities();
    }
    
       public List<Turno> listTurnos() {
        return turnoJpa.findTurnoEntities();
    }

    public void addTurno(Turno turno) {
       turnoJpa.create(turno);
    }

    public Ciudadano idCiudadano(int id) {
return ciudadanoJpa.findCiudadano(id);
    }



    public void deleteTurno(int idEliminar) {
        try {
            turnoJpa.destroy(idEliminar);
            System.out.println("Turno eliminado"+idEliminar);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void modificarEstado(Turno turno) {
        try {
            turnoJpa.edit(turno);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Turno turnoId(int id) {
    return turnoJpa.findTurno(id);
    }

}
