/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FSA.ENT;

/**
 *
 * @author Usuario
 */
public class FarmaciaJ {
    private int id;
    private String nombre;
    private int idDireccion;
    private int idContacto;

    public FarmaciaJ(int id, String nombre, int idDireccion, int idContacto) {
        this.id = id;
        this.nombre = nombre;
        this.idDireccion = idDireccion;
        this.idContacto = idContacto;
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

    public int getIdDireccion() {
        return idDireccion;
    }

    public void setIdDireccion(int idDireccion) {
        this.idDireccion = idDireccion;
    }

    public int getIdContacto() {
        return idContacto;
    }

    public void setIdContacto(int idContacto) {
        this.idContacto = idContacto;
    }

    @Override
    public String toString() {
        return "FarmaciaJ{" + "id=" + id + ", nombre=" + nombre + '}';
    }

}
