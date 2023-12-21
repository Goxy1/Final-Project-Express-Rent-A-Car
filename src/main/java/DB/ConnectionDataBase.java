package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDataBase {

    public static Connection connection;

    public static Connection connectToDataBase()
    {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/expressrentacar", "root", "");
        }
        catch(SQLException e)
        {
            return null;
        }catch(ClassNotFoundException e)
        {
            throw new RuntimeException(e);
        }
        return connection;
    }
}
