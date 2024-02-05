package DB;

import java.sql.*;

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

    public String getCarTextFromDatabase(int carID) {
        String carText = "";
        PreparedStatement statement = null;

        try {
            // Doing a query for getting a hotel text from database
            String query = "SELECT CarText FROM automobili WHERE ID = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, carID);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                carText = resultSet.getString("CarText");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Closing resources
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return carText;
    }
}
