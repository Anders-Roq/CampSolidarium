# CampSolidárium

Sistema web para ONGs cadastrarem campanhas de arrecadação ligadas a emergências (enchentes, deslizamentos, incêndios etc.) e aos insumos necessários.

Projeto acadêmico feito com **Servlets e JSP** (Jakarta EE), sem banco de dados.

## Funcionalidades

- Login de administrador
- CRUD de **ONGs**
- CRUD de **Emergências**
- CRUD de **Insumos**
- CRUD de **Campanhas** (ONG + emergência + lista de insumos)
- Página inicial pública com todas as campanhas cadastradas

## Tecnologias

- Java 17
- Jakarta EE 11 (Servlets 6.1, JSP)
- Maven (empacotamento WAR)
- Dados em memória (listas estáticas)

## Estrutura

```
src/main/java/com/marcelo/campsolidarium/
├── entidades/      # Admin, ONGs, Emergencia, Insumos, Campanha
├── repositorios/   # armazenamento em memória (CRUD)
└── controladores/  # Servlets (Login, Logout, Admin, ONGs, ...)
src/main/webapp/    # JSPs, CSS e web.xml
Docs/               # diagrama de classes
```

## Como executar

**Requisitos:** JDK 17+, Maven e um servidor compatível com Jakarta EE 11 (por exemplo GlassFish 8).

```bash
mvn clean package
```

Faça o deploy de `target/CampSolidarium-1.0-SNAPSHOT.war` no servidor e acesse:

```
http://localhost:8080/CampSolidarium
```

## Acesso inicial

| Login | Senha    |
|-------|----------|
| admin | admin123 |

## Observações

- Os dados são perdidos ao reiniciar a aplicação.
- Projeto didático: senhas em texto puro e sem validações de segurança. Não use em produção.
