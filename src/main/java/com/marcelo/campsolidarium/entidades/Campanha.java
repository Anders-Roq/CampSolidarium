package com.marcelo.campsolidarium.entidades;

import java.util.List;

public class Campanha {
    
   private int codigo;
    
   private String dataInicio;
    
   private String dataFinal;
    
   private String descricao;
        
   private String objetivo;
    
    private ONGs ong;
        
    private Emergencia emergencia;
    
    private List<Insumos> insumos;

    public Campanha() {}

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(String dataInicio) {
        this.dataInicio = dataInicio;
    }

    public String getDataFinal() {
        return dataFinal;
    }

    public void setDataFinal(String dataFinal) {
        this.dataFinal = dataFinal;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    } 

    public ONGs getOng() {
        return ong;
    }

    public void setOng(ONGs ong) {
        this.ong = ong;
    }

    public Emergencia getEmergencia() {
        return emergencia;
    }

    public void setEmergencia(Emergencia emergencia) {
        this.emergencia = emergencia;
    }

    public List<Insumos> getInsumos() {
        return insumos;
    }

    public void setInsumos(List<Insumos> insumos) {
        this.insumos = insumos;
    }
    
    
}
