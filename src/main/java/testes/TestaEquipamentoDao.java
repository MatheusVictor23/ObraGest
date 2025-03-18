package testes;

import dao.EquipamentosDao;
import model.Equipamento;

import java.sql.SQLException;
import java.util.List;

public class TestaEquipamentoDao {
    public static void main(String[] args) {
        EquipamentosDao equipamentosDao = new EquipamentosDao();
        try {

            List<Equipamento> equipamentos = equipamentosDao.listar();
            for (Equipamento equipamento : equipamentos) {
                System.out.println("Id: " + equipamento.getId());
                System.out.println("Tombo: " + equipamento.getN_tombo());
                System.out.println("Equipamento: " + equipamento.getEquipamento());
                System.out.println("Marca: " + equipamento.getMarca());
                System.out.println("Modelo: " + equipamento.getModelo());
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
