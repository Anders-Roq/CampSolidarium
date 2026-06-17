package com.marcelo.campsolidarium.tags;

import com.marcelo.campsolidarium.entidades.ONGs;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import static jakarta.servlet.jsp.tagext.Tag.SKIP_BODY;
import jakarta.servlet.jsp.tagext.TagSupport;

public class NavBarTag extends TagSupport{
    
    @Override
    public int doStartTag() throws JspException {
        try {
            JspWriter out = pageContext.getOut();
            HttpSession session = pageContext.getSession();
            ONGs ongLogada = (ONGs) session.getAttribute("ongLogada");

            out.print("<nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">");
            out.print("<div class=\"container\">");
            out.print("<a class=\"navbar-brand\" href=\"PublicoServlet\">CampSolidarium</a>");
            out.print("<div class=\"d-flex gap-2\">");

            if (ongLogada != null) {
                out.print("<span class=\"navbar-text text-light me-2\">Olá, " + ongLogada.getNome() + "</span>");
                out.print("<a href=\"OngAreaServlet\" class=\"btn btn-outline-light btn-sm\">Minhas Campanhas</a>");
                out.print("<a href=\"OngAreaServlet?operacao=logout\" class=\"btn btn-outline-danger btn-sm\">Sair</a>");
            } else {
                out.print("<a href=\"loginOng.jsp\" class=\"btn btn-outline-light btn-sm\">Entrar</a>");
            }

            out.print("</div></div></nav>");

        } catch (Exception e) {
            throw new JspException(e);
        }
        return SKIP_BODY;
    }
    
    
}
