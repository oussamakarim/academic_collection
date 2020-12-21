package servlet.api;

import com.google.gson.Gson;
import metier.beans.Demande;
import metier.beans.Etape;
import metier.beans.Rapport;
import metier.gestionnaire.GestionnaireDemande;
import metier.gestionnaire.GestionnaireEtape;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;


public class ApiEtape extends HttpServlet {

    private GestionnaireDemande gestionnaireDemande = new GestionnaireDemande();
    private GestionnaireEtape gestionnaireEtape = new GestionnaireEtape();
    private Integer idEtape;
    private Demande demande;
    private EtapeModel etapeModel;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        try {
            getIdParameter(req);
            demande = gestionnaireDemande.getByEtape(idEtape);
            Etape etape = gestionnaireEtape.getById(idEtape);
            List<Rapport> rapportList = etape.getRapports().values().stream().collect(Collectors.toList());
            etapeModel = new EtapeModel();
            etapeModel.setEtapeId(etape.getId());
            etapeModel.setEtapeNom(etape.getLibelle());
            etapeModel.setProcedureNom(demande.getLibelle());
            etapeModel.setEtapeEtat(etape.getEtat().toString());
            etapeModel.setEtapeOuverture(etape.getDateDebut().toString());
            etapeModel.setEtapeFermeture(etape.getDateFin().toString());
            etapeModel.setDocuments(demande.getDocs());
            etapeModel.setRapports(rapportList);
            String json = new Gson().toJson(etapeModel);
            resp.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private void getIdParameter(HttpServletRequest req) throws Exception {
        StringBuffer url = req.getRequestURL();
        String[] params = String.valueOf(url).split("/");
        idEtape = Integer.parseInt(params[params.length - 1]);
        if (idEtape == null) throw new Exception();
    }




}
