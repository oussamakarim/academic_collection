package metier.gestionnaire;

import metier.beans.Document;
import metier.beans.Rapport;
import metier.enumeration.EtatEtape;
import persistence.DAORapport;
import persistence.entities.DocumentEntity;
import persistence.entities.RapportEntity;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

public class GestionnaireRapport {
    private DAORapport daoRapport = new DAORapport();

    public HashMap<EtatEtape, Rapport> getRapportsEtape(Integer id) {
        HashMap<EtatEtape, Rapport> rapportHashMap = new HashMap<>();
        daoRapport.getRapportsEtape(id).forEach((etatEtape, entity) -> rapportHashMap.put(etatEtape, new Rapport(entity)));
        return rapportHashMap;
    }

    public Integer save(Rapport rapport) {
        return daoRapport.save(rapport.getRapportEntity());
    }

    public Rapport getById(Integer id) {
        return new Rapport(daoRapport.getById(id));
    }

    public List<Rapport> getAll() {
        return daoRapport.getAll().stream().map(Rapport::new).collect(Collectors.toList());
    }

    public Boolean update(Rapport rapport) {
        return daoRapport.update(rapport.getRapportEntity());
    }

    public Boolean delete(Rapport rapport) {
        return daoRapport.delete(rapport.getRapportEntity());
    }

    public Rapport newInstance(String fileNmae,EtatEtape decision, Integer idEtape) {
        RapportEntity rapportEntity = new RapportEntity(fileNmae,decision, idEtape);
        Rapport rapport = new Rapport(rapportEntity);
        return rapport;
    }

}
