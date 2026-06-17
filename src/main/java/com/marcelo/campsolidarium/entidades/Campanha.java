package com.marcelo.campsolidarium.entidades;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Entity
public class Campanha {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int codigo;
    
    String dataInicio;
    
    String dataFinal;
    
    String descricao;
        
    String objetivo;
    
    private ONGs ong;
        
    private Emergencia emergencia;
    
    private List<String> categorias;

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

    public List<String> getCategorias() {
        return categorias;
    }

    public void setCategorias(List<String> categorias) {
        this.categorias = categorias;
    }
    
    
}
