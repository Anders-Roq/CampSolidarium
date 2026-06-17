package com.marcelo.campsolidarium.entidades;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Admin {
    
    @Id            
    String login;
    
    String senha;
    
    public Admin(){}

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
}
