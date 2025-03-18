package dao;
import model.Equipamento;
import util.ConexaoDb;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EquipamentosDao {
    public void inserir (Equipamento equipamento) throws SQLException{

        ConexaoDb conexaoDb = new ConexaoDb();

        Connection conexao = conexaoDb.getConexao();

        Statement instrucao = conexao.createStatement();

        String sql = "insert into equipamento" +
                " (nomeEquipamento, tombo,marca, modelo)" +
                " values" +
                " ('" + equipamento.getEquipamento() + "','" + equipamento.getN_tombo() + "','" + equipamento.getMarca() + "','" + equipamento.getModelo() + "')";

        System.out.println("SQL:" + sql);

        instrucao.execute(sql);

    }

    public void alterar(Equipamento equipamento) throws SQLException{

        ConexaoDb conexaoDb = new ConexaoDb();

        Connection conexao = conexaoDb.getConexao();

        Statement instrucao = conexao.createStatement();

        String sql = "update equipamento " +
                " set nomeEquipamento = '"+equipamento.getEquipamento()+"',"+
                "tombo = '"+equipamento.getN_tombo() +"'," +
                "    marca = '"+equipamento.getMarca()+"',"+
                "    modelo = '"+equipamento.getModelo()+"'"+
                " where id = "+equipamento.getId();

        System.out.println("SQL:" + sql);

        instrucao.execute(sql);

    }

    public void excluir(Long id) throws SQLException{
        ConexaoDb conexaoDb = new ConexaoDb();

        Connection conexao = conexaoDb.getConexao();

        Statement instrucao = conexao.createStatement();

        String sql = "delete from equipamento " +
                " where id = "+id;

        System.out.println("SQL:" + sql);

        instrucao.execute(sql);
    }

    public List<Equipamento> listar() throws SQLException{

        ConexaoDb conexaoDb = new ConexaoDb();

        Connection conexao = conexaoDb.getConexao();

        Statement instrucao = conexao.createStatement();

        String sql = "select id, nomeEquipamento,tombo,marca,modelo from equipamento";

        System.out.println("SQL:"+sql);

        boolean resultado = instrucao.execute(sql);

        List<Equipamento> equipamentos = new ArrayList<>();
        Equipamento equipamento;

        if(resultado){
            ResultSet resultados = instrucao.getResultSet();
            while(resultados.next()){
                equipamento = new Equipamento();
                equipamento.setId(resultados.getInt(1));
                equipamento.setEquipamento(resultados.getString(2));
                equipamento.setN_tombo(resultados.getInt(3));
                equipamento.setMarca(resultados.getString(4));
                equipamento.setModelo(resultados.getString(5));
                equipamentos.add(equipamento);
            }
        }
        return equipamentos;
    }

    public Equipamento consultar(Long id) throws SQLException{

        ConexaoDb conexaoDb = new ConexaoDb();

        Connection conexao = conexaoDb.getConexao();

        Statement instrucao = conexao.createStatement();

        String sql = "select id,nomeEquipamento,tombo,marca,modelo from equipamento where id="+id;

        System.out.println("SQL:"+sql);

        boolean resultado = instrucao.execute(sql);

        Equipamento equipamento;

        if(resultado){
            ResultSet resultados = instrucao.getResultSet();
            while(resultados.next()){
                equipamento = new Equipamento();
                equipamento.setId(resultados.getInt(1));
                equipamento.setEquipamento(resultados.getString(2));
                equipamento.setN_tombo(resultados.getInt(3));
                equipamento.setMarca(resultados.getString(4));
                equipamento.setModelo(resultados.getString(5));
                return equipamento;
            }
        }
        return null;
    }

}
