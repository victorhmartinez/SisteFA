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
public class Direccion {
   private int idDireccion;
   private String calle_P;
   private String calle_S;
   private String num_casa;
   private String referencia;
   private String ciudad;
   private String barrio;

    public Direccion(int idDireccion, String calle_P, String calle_S, String num_casa, String referencia, String ciudad, String barrio) {
        this.idDireccion = idDireccion;
        this.calle_P = calle_P;
        this.calle_S = calle_S;
        this.num_casa = num_casa;
        this.referencia = referencia;
        this.ciudad = ciudad;
        this.barrio = barrio;
    }

    public int getIdDireccion() {
        return idDireccion;
    }

    public void setIdDireccion(int idDireccion) {
        this.idDireccion = idDireccion;
    }

    public String getCalle_P() {
        return calle_P;
    }

    public void setCalle_P(String calle_P) {
        this.calle_P = calle_P;
    }

    public String getCalle_S() {
        return calle_S;
    }

    public void setCalle_S(String calle_S) {
        this.calle_S = calle_S;
    }

    public String getNum_casa() {
        return num_casa;
    }

    public void setNum_casa(String num_casa) {
        this.num_casa = num_casa;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getBarrio() {
        return barrio;
    }

    public void setBarrio(String barrio) {
        this.barrio = barrio;
    }
   
   
}
