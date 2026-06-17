package com.marcelo.campsolidarium.repositorios;

import com.marcelo.campsolidarium.entidades.Campanha;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class RepositorioCampanha {
    
    private static final List<Campanha> campanhas = new ArrayList();
    
    private RepositorioCampanha(){}
    
        static{
        Campanha camp = new Campanha();
        camp.setDataInicio("01/01/2026");
        camp.setDataFinal("15/06/2026");
        camp.setObjetivo("Arrecadar água potável");
        camp.setDescricao("Campanha para ajudar as vitimas das enchentes de Caruaru");
        camp.setOng(RepositorioONGs.readAll().get(0));
        camp.setEmergencia(RepositorioEmergencia.readAll().get(0));
        camp.setCategorias(Arrays.asList("Alimentos", "Limpeza"));
        camp.setCodigo(campanhas.size()+1);
        campanhas.add(camp);
    }
    
    public static void create(Campanha camp){
        camp.setCodigo(campanhas.size()+1);
        campanhas.add(camp);
    }
    
    public static Campanha read(int codigo){
        for(Campanha camp:campanhas){
            if(camp.getCodigo() == codigo){
                return camp;
            }
        }        
        return null;
    }
    
    public static void update(Campanha campAtualizado){
        for(Campanha camp:campanhas){
            if(camp.getCodigo() == campAtualizado.getCodigo()){
                camp.setDataInicio(campAtualizado.getDataInicio());
                camp.setDataFinal(campAtualizado.getDataFinal());
                camp.setDescricao(campAtualizado.getDescricao());
                camp.setObjetivo(campAtualizado.getObjetivo());
                return;
            }
        }      
    }

    public static void delete(Campanha camp){
        campanhas.remove(camp);
    }
    
    public static List<Campanha> readAll(){
        return campanhas;
    }
    
}
