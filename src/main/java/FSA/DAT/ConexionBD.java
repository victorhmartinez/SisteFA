/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FSA.DAT;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Usuario
 */
public class ConexionBD {
    private String base = "farmacia";
    private String ususario = "farmacia";
    private String clave = "farmacia01";
        private String url = "jdbc:mysql://localhost:3306/"+base+"?serverTimezone=UTC";
    private Connection  con = null;
    //Metodo para conectar la conexion con la base de datos
    public Connection  getConnection(){
        try {
          Class.forName("com.mysql.jdbc.Driver");
          con = (Connection)DriverManager.getConnection(url,ususario,clave);
       
        } catch (Exception e) {
            System.out.println("ERROR");
        }
        return con;
    }
}
