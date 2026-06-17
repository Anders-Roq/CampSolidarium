package com.marcelo.campsolidarium.repositorios;

import com.marcelo.campsolidarium.entidades.ONGs;
import java.util.ArrayList;
import java.util.List;

public class RepositorioONGs {
    
    private static final List<ONGs> ongs = new ArrayList();
    
    private RepositorioONGs() {}
    
    static{
        ONGs ong = new ONGs();
        ong.setCodigo(ongs.size() + 1);
        ong.setNome("Recife vs Enchentes");
        ong.setLogin("Ench3nt3s");
        ong.setSenha("111");
        ongs.add(ong);
    }
    
    public static void create(ONGs ong){
        ong.setCodigo(ongs.size() + 1);
        ongs.add(ong);
    }
    
     public static ONGs read(String login) {
        for (ONGs ong : ongs) {
            if (ong.getLogin().equals(login)) {
                return ong;
            }
        }
        return null;
    }

    public static void update(ONGs ongNew) {
        for (ONGs ong : ongs) {
            if (ong.getCodigo() == ongNew.getCodigo()) {
                ong.setNome(ongNew.getNome());
                ong.setLogin(ongNew.getLogin());
                ong.setSenha(ongNew.getSenha());
                return;
            }
        }
    }
    
        
    public static void delete(ONGs ong){
        ongs.remove(ong);
    }
 
    public static List<ONGs> readAll(){
        return ongs;
    }
    
}
