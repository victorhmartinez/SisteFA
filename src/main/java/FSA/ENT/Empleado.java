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
public class Empleado {
    private int idEmpleado;
    String nombre_E;
    String apellido_E;
    String identificacion_E;
    int idDireccion;
    int idFarmacia;
    int idUsuario;

    public Empleado(int idEmpleado, String nombre_E, String apellido_E, String identificacion_E, int idDireccion, int idFarmacia, int idUsuario) {
        this.idEmpleado = idEmpleado;
        this.nombre_E = nombre_E;
        this.apellido_E = apellido_E;
        this.identificacion_E = identificacion_E;
        this.idDireccion = idDireccion;
        this.idFarmacia = idFarmacia;
        this.idUsuario = idUsuario;
    }
    

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public String getNombre_E() {
        return nombre_E;
    }

    public void setNombre_E(String nombre_E) {
        this.nombre_E = nombre_E;
    }

    public String getApellido_E() {
        return apellido_E;
    }

    public void setApellido_E(String apellido_E) {
        this.apellido_E = apellido_E;
    }

    public String getIdentificacion_E() {
        return identificacion_E;
    }

    public void setIdentificacion_E(String identificacion_E) {
        this.identificacion_E = identificacion_E;
    }

    public int getIdDireccion() {
        return idDireccion;
    }

    public void setIdDireccion(int idDireccion) {
        this.idDireccion = idDireccion;
    }

    public int getIdFarmacia() {
        return idFarmacia;
    }

    public void setIdFarmacia(int idFarmacia) {
        this.idFarmacia = idFarmacia;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    @Override
    public String toString() {
        return "Empleado{" + "idEmpleado=" + idEmpleado + ", nombre_E=" + nombre_E + ", apellido_E=" + apellido_E + ", identificacion_E=" + identificacion_E + ", idDireccion=" + idDireccion + ", idFarmacia=" + idFarmacia + ", idUsuario=" + idUsuario + '}';
    }
    
    
}
