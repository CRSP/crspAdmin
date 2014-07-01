package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconn {
	
	private String url;
    
	private String serverName;
    
	private String portNumber;
    
	private String databaseName;
    
	private String userName; 
    
	private String password; 
	
	public DBconn(){
		
		url = "jdbc:mysql://";
		
		serverName = "localhost";
		
        portNumber = "3306";
        
        databaseName = "crsp";
        
        userName = "root";
        
        password = "123456";
		
	}
	
	private String getConnectionUrl() {
        
		return url + serverName + ":" + portNumber + "/"+databaseName;
		
    }
	
	public Connection getConnection(){
		Connection con=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con=DriverManager.getConnection(getConnectionUrl(),userName,password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
