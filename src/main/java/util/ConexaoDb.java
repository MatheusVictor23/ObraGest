package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoDb {

    private String url;
    private String usuario;
    private String senha;

    public ConexaoDb(){
        this.url = "jdbc:mysql://localhost:3306/obraGest";
        this.usuario = "root";
        this.senha = "root";

    }

    public Connection getConexao() throws SQLException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return DriverManager.getConnection(url, usuario, senha);

    }
}
