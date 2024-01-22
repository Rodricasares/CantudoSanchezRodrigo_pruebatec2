package com.mycompany.pruebatec2.logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Ciudadano implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String nombre;
    private String apellido;
    private String dni;

    @OneToMany(mappedBy = "ciudadano")
    private List<Turno> turnos;

    // Constructor, getters y setters, otros métodos

    public Ciudadano() {
    }

    public Ciudadano(String nombre, String apellido, String dni) {
        //this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.turnos = turnos;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public List<Turno> getTurnos() {
        return turnos;
    }

    public void setTurnos(List<Turno> turnos) {
        this.turnos = turnos;
    }

  
    
    
    @Override
    public String toString() {
        return "Ciudadano: " +
                " Nombre: " + nombre + '\'' +
                " Apellido: " + apellido + '\'' +
                " Dni: " + dni + '\''  ;
    }
}
