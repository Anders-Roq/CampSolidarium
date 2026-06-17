package com.marcelo.campsolidarium.repositorios;

import com.marcelo.campsolidarium.entidades.Campanha;
import java.util.ArrayList;
import java.util.List;

public class RepositorioCampanha {
    
    private static final List<Campanha> campanhas = new ArrayList();
    
    private RepositorioCampanha(){}
    
    public static void create(Campanha camp){
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
