package servlet.api;

import com.google.gson.Gson;
import metier.beans.Demande;
import metier.enumeration.EtatDemande;
import metier.gestionnaire.GestionnaireCatEtap;
import metier.gestionnaire.GestionnaireDemande;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ApiDemandeValidation extends HttpServlet {

    private GestionnaireDemande gestionnaireDemande;

    @Override
    public void init() throws ServletException {
        super.init();
        gestionnaireDemande = new GestionnaireDemande();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String json;
        String jeton = req.getParameter("jeton");
        String decision = req.getParameter("decision");

        Demande demande = gestionnaireDemande.getByJeton(jeton);
        if ( demande != null ) {
            try {
                demande.setEtat(EtatDemande.valueOf(decision.toUpperCase()));
                if ( gestionnaireDemande.update(demande) )
                    json = constructJsonResponse(true, "Operation Effectue");
                else
                    json = constructJsonResponse(false, "Erreur Inconnu");
            } catch (IllegalArgumentException e) {
                json = constructJsonResponse(false, "Decision Invalide");
            }
        } else {
            json = constructJsonResponse(false, "Demande introuvable");
        }
        resp.getWriter().write(json);
    }

    private String constructJsonResponse(Boolean response, String msg) {
        Gson jsonBuilder = new Gson();
        JsonErrorModel jsonModel = new JsonErrorModel(response, msg);
        String json = jsonBuilder.toJson(jsonModel);
        return json;
    }
}
