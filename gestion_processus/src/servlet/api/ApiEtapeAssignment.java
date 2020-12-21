package servlet.api;

import com.google.gson.Gson;
import metier.beans.CatalogueEtape;
import metier.gestionnaire.GestionnaireCatEtap;
import persistence.entities.CatalogueEtapeEntity;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

public class ApiEtapeAssignment extends HttpServlet {
    GestionnaireCatEtap gestionnaireCatEtap;

    @Override
    public void init() throws ServletException {
        super.init();
        gestionnaireCatEtap = new GestionnaireCatEtap();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String json;
        StringBuffer url = req.getRequestURL();
        Integer catEtapeId= Integer.parseInt(req.getParameter("etape"));
        Integer empId = Integer.parseInt(req.getParameter("emp"));

        CatalogueEtape catalogueEtape = gestionnaireCatEtap.getById(catEtapeId);
        if ( catalogueEtape == null )
            json = constructJsonResponse(false, "Le Catalogue Etape n'existe pas");
        else {
            catalogueEtape.setDefaultEmp(empId);
            if ( gestionnaireCatEtap.update(catalogueEtape) )
                json = constructJsonResponse(true, "Assignement Effectue");
            else
                json = constructJsonResponse(false, "Un Erreur sest  produit");
        }
        resp.getWriter().write(json);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    private String constructJsonResponse(Boolean response, String msg) {
        Gson jsonBuilder = new Gson();
        JsonErrorModel jsonModel = new JsonErrorModel(response, msg);
        String json = jsonBuilder.toJson(jsonModel);
        return json;
    }
}
