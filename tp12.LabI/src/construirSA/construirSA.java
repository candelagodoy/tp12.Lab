
package construirSA;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import java.sql.ResultSet;


public class construirSA {

    public static void main(String[] args) {
        
        
        try {
            //ESTABLECIENDO CONEXIÓN
            Class.forName("org.mariadb.jdbc.Driver");
            String url="jdbc:mariadb://localhost:3306/construirsa";
            String usuario="root";
            String password="";
            Connection conexion = DriverManager.getConnection(url, usuario, password);
            
            //HACIENDO 3 INSERT DE EMPLEADOS
            
            /*String sql="INSERT INTO empleado (dni, apellido, nombre,acceso, estado) "
                    + " VALUES (39990555,'Perez','Maria',1,true),"
                    + "(45123687,'Martinez','Juan',2,true),"
                    +"(30452158,'Gomez','Martin',3,false)";
            
            PreparedStatement ps = conexion.prepareStatement(sql);
            int filas=ps.executeUpdate();
            if(filas>0){
                JOptionPane.showMessageDialog(null, "Empleado agregado correctamente");
            }*/
            
            //HACIENDO 2 INSERT DE HERRAMIENTAS
            
            /*String sql="INSERT INTO herramienta (nombreHerramienta, descripcion, stock, estado) "
                    + "VALUES ('Pistola de calor','Generador de calor de dos velocidades',15,true),"
                    + "('Caladora', 'obejto para calar', 9, false)";
            
            PreparedStatement ps = conexion.prepareStatement(sql);
            int filas = ps.executeUpdate();
            if(filas>0){
                JOptionPane.showMessageDialog(null, "Herramienta agregada correctamente");
            }*/
            
            //Listar todas las herramientas con stock superior a 10.
            
            /*String sql = "SELECT * FROM herramienta WHERE stock > 10";
            PreparedStatement ps = conexion.prepareStatement(sql);
            ResultSet resultado = ps.executeQuery();
            
            while(resultado.next()){
                System.out.println("IdHerramienta: " + resultado.getInt("idHerramienta"));
                System.out.println("Nombre Herramienta: " + resultado.getString("nombreHerramienta"));
                System.out.println("Descripcion de la Herramienta: " + resultado.getString("descripcion"));
                System.out.println("Stock: " + resultado.getInt("stock"));
                System.out.println("Estado de la herramienta: " + resultado.getBoolean("estado"));
            
            }*/
            
            //Dar de baja al primer empleado ingresado a la base de datos.
            
            /*String sql = "UPDATE empleado SET estado = 0 WHERE idEmpleado=1";
            PreparedStatement ps = conexion.prepareStatement(sql);
            int filas = ps.executeUpdate();
            if(filas>0){
                System.out.println("Empleado dado de baja correctamente");
            }*/
            
        } catch (ClassNotFoundException ex) {
            JOptionPane.showMessageDialog(null, "Hubo un error al cargar el driver");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error SQL");
            
        }
        
    }
    
}
