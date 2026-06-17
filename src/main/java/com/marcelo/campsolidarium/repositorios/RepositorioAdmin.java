package com.marcelo.campsolidarium.repositorios;

import com.marcelo.campsolidarium.entidades.Admin;
import java.util.ArrayList;
import java.util.List;

public class RepositorioAdmin {
    
    private static final List<Admin> admins = new ArrayList();
    
    private RepositorioAdmin(){}
    
    public static void create(Admin ad){
        admins.add(ad);
    }
    
    public static Admin read(String login){
        for(Admin ad:admins){
            if(ad.getLogin().equals(login)){
                return ad;
            }
        }
        return null;
    }
    
    public static void update(Admin adminAtualizado){
        for(Admin ad:admins){
            if(ad.getLogin().equals(adminAtualizado.getLogin())){
                ad.setSenha(adminAtualizado.getSenha());
                return;
            }
        }
    }
    
    public static void delete(Admin ad){
        admins.remove(ad);
    }
    
    public static List<Admin> readAll(){
        return admins;
    }    
  
}
