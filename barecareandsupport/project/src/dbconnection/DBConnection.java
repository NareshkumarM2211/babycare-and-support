package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

//Class used to get the Connection
//Returns java.sql.Connection object
public class DBConnection {

    private static Connection con;
    private static String username = new String("root");
    private static String password = new String("");
    private static String url = new String("jdbc:mysql://localhost:3306/");
    private static String dbname = new String("myproject");
    
    public static Connection getCon() {
          try
          {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection(url+dbname,username,password);
          }
          catch(Exception e)
          {
               System.out.println("     "+e);
          }
        return con;
    }
}