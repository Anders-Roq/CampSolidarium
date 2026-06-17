package com.marcelo.campsolidarium.repositorios;

import com.marcelo.campsolidarium.entidades.Emergencia;
import java.util.ArrayList;
import java.util.List;

public class RepositorioEmergencia {
    
    private static final List<Emergencia> emergencias = new ArrayList();
    
    private RepositorioEmergencia(){}
    
    static {
        Emergencia emerg = new Emergencia();
        emerg.setLocal("Recife");
        emerg.setTipo("Deslizamento de Barreira");
        emerg.setDescricao("Deslizamento de Barreira no Barro");
        emerg.setCodigo(emergencias.size()+1);
        emergencias.add(emerg);
    }
    
    public static void create(Emergencia emerg){
        emerg.setCodigo(emergencias.size() + 1);
        emergencias.add(emerg);
    }
    
    public static Emergencia read(int codigo){
        for(Emergencia emerg:emergencias){
            if(emerg.getCodigo() == codigo){
                return emerg;
            }
        }
        return null;
    }
    
    public static void update(Emergencia emergAtualizado){
        for(Emergencia emerg:emergencias){
            if(emerg.getCodigo() == emergAtualizado.getCodigo()){
                emerg.setDescricao(emergAtualizado.getDescricao());
                emerg.setLocal(emergAtualizado.getLocal());
                emerg.setTipo(emergAtualizado.getTipo());
                return;
            }
        }
    }
    
    public static void delete(Emergencia emerg){
        emergencias.remove(emerg);
    }
    
    public static List<Emergencia> readAll(){
        return emergencias;
    }
    
}
