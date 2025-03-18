package testes;

import util.ConexaoDb;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestaConexaoDb {
    public static void main(String[] args) {

        ConexaoDb conexaoDb = new ConexaoDb();

        try {

            Connection conexao = conexaoDb.getConexao();

            String sql = "select id, nomeEquipamento from equipamento";

            System.out.println("SQL:"+sql);

            Statement instrucao = conexao.createStatement();

            boolean temResultado = instrucao.execute(sql);

            if(temResultado){
                ResultSet resultados = instrucao.getResultSet();
                while(resultados.next()){
                    System.out.println("ID:"+resultados.getInt("id"));
                    System.out.println("EQUIPAMENTO:"+resultados.getString("nomeEquipamento"));
                }

            }

        } catch (SQLException e) {
            System.out.println("Erro:"+e.getMessage());
        }


    }
}
