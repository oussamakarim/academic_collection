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

public class ApiCatEtape extends HttpServlet {

    GestionnaireCatEtap gestionnaireCatEtap;

    @Override
    public void init() throws ServletException {
        gestionnaireCatEtap = new GestionnaireCatEtap();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StringBuffer url = req.getRequestURL();
        Integer id = getId(url);

        List<CatalogueEtape> etapes = gestionnaireCatEtap.getByChef(id);
        String json = constructJson(id, etapes);
        resp.getWriter().write(json);
    }

    private Integer getId(StringBuffer url) {
        String URL = String.valueOf(url);
        String[] splitted = URL.split("/");
        return Integer.parseInt(splitted[splitted.length-1]);
    }

    private String constructJson (Integer idChef, List<CatalogueEtape> catalogueEtapes) {
        Gson jsonBuilder = new Gson();
        String json;

        if ( catalogueEtapes != null ) {
            List<CatalogueEtapeEntity> entities = catalogueEtapes.stream()
                    .map(CatalogueEtape::getCatalogueEtapeEntity)
                    .collect(Collectors.toList());
            CatEtapeJsonModel jsonModel = new CatEtapeJsonModel(idChef, entities);
            json = jsonBuilder.toJson(jsonModel);
        } else {
            JsonErrorModel jsonModle = new JsonErrorModel(false, "No data is found");
            json = jsonBuilder.toJson(jsonModle);
        }
        return json;
    }
}
