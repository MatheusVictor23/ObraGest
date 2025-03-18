package model;

public class Equipamento {
    private int id;
    private String equipamento;
    private int n_tombo;
    private String marca;
    private String modelo;

    public Equipamento(){
    }

    public Equipamento(
            int id,
            String equipamento,
            int n_tombo,
            String marca,
            String modelo
                       ){
        this.id = id;
        this.n_tombo = n_tombo;
        this.equipamento = equipamento;
        this.marca = marca;
        this.modelo = modelo;
    }

    public Equipamento(
            String equipamento,
            int n_tombo,
            String marca,
            String modelo
    ){
        this.equipamento = equipamento;
        this.n_tombo = n_tombo;
        this.marca = marca;
        this.modelo = modelo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getN_tombo() {
        return n_tombo;
    }

    public void setN_tombo(int n_tombo) {
        this.n_tombo = n_tombo;
    }

    public String getEquipamento() {
        return equipamento;
    }

    public void setEquipamento(String equipamento) {
        this.equipamento = equipamento;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
}

