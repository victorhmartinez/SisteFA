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
public class tipoUsuario {
    private int idTipoUsuario;
    private String tipo_Usuario;

    public tipoUsuario(int idTipoUsuario, String tipo_Usuario) {
        this.idTipoUsuario = idTipoUsuario;
        this.tipo_Usuario = tipo_Usuario;
    }

    public int getIdTipoUsuario() {
        return idTipoUsuario;
    }

    public void setIdTipoUsuario(int idTipoUsuario) {
        this.idTipoUsuario = idTipoUsuario;
    }

    public String getTipo_Usuario() {
        return tipo_Usuario;
    }

    public void setTipo_Usuario(String tipo_Usuario) {
        this.tipo_Usuario = tipo_Usuario;
    }
    
}
