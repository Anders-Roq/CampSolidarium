package com.marcelo.campsolidarium.repositorios;

import com.marcelo.campsolidarium.entidades.Insumos;
import java.util.ArrayList;
import java.util.List;

public class RepositorioInsumos {
    
    private static final List<Insumos> insumos = new ArrayList();
    
    private RepositorioInsumos(){}
    
    static{
        Insumos insu = new Insumos();
        insu.setCodigo(insumos.size() + 1);
        insu.setNome("Agua Sanitária");
        insu.setCategoria("Produto de Limpeza");
        insu.setMarca("Limpol");
        insumos.add(insu);
    }
    
    public static void create(Insumos insu){
        insu.setCodigo(insumos.size() + 1);
        insumos.add(insu);
    }
    
    public static Insumos read(int codigo){
        for(Insumos insu:insumos){
            if(insu.getCodigo() == codigo){
                return insu;
            }
        }
        return null;
    }
    
    public static void update(Insumos insuAtualizado){
        for(Insumos insu:insumos){
            if(insu.getCodigo() == insuAtualizado.getCodigo()){
                insu.setNome(insuAtualizado.getNome());
                insu.setMarca(insuAtualizado.getMarca());
                insu.setCategoria(insuAtualizado.getCategoria());
                return;
            }
        }
    }
    
    public static void delete(Insumos insu){
        insumos.remove(insu);
    }
 
    public static List<Insumos> readAll(){
        return insumos;
    }    
    
}
