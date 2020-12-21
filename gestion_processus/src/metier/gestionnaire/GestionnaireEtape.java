package metier.gestionnaire;


import metier.beans.Etape;
import metier.beans.Rapport;
import metier.enumeration.EtatEtape;
import persistence.DAOCatalogueEtape;
import persistence.DAOEtape;
import persistence.entities.CatalogueEtapeEntity;
import persistence.entities.EtapeEntity;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

public class GestionnaireEtape {
    private final DAOEtape daoEtape;
    private final DAOCatalogueEtape daoCatEtape;
    private final GestionnaireRapport gestionnaireRapport;

    public GestionnaireEtape() {
        this.daoEtape = new DAOEtape();
        this.gestionnaireRapport = new GestionnaireRapport();
        this.daoCatEtape = new DAOCatalogueEtape();
    }

    public Integer save(Etape obj) {
        return daoEtape.save(obj.getEtapeEntity());
    }

    public Etape getById(Integer id) {
        EtapeEntity etapeEntity = daoEtape.getById(id);
        return construct(etapeEntity);
    }

    public List<Etape> getAll() {
        List<EtapeEntity> etapeEntities = daoEtape.getAll();
        return etapeEntities.stream()
                .map(this::construct)
                .collect(Collectors.toList());
    }

    public Boolean update(Etape obj) {
        return daoEtape.update(obj.getEtapeEntity());
    }

    public Boolean delete(Etape obj) {
        return daoEtape.delete(obj.getEtapeEntity());
    }

    public List<Etape> getEtapeByProcId(Integer id) {
        return daoEtape.getEtapesByProcessus(id).stream().map(this::construct).collect(Collectors.toList());
    }

    public List<Etape> getEtapesEmploye(Integer id) {
        return daoEtape.getEtapesByEmploye(id).stream().map(this::construct).collect(Collectors.toList());
    }

    private Etape construct(EtapeEntity etapeEntity){
        Etape etape = new Etape(etapeEntity);

        CatalogueEtapeEntity catEtapeEntity = daoCatEtape.getById(etape.getIdCatEtape());
        etape.setLibelle(catEtapeEntity.getLibelle());

        HashMap<EtatEtape, Rapport> rapports =  gestionnaireRapport.getRapportsEtape(etape.getId());
        etape.setRapports(rapports);

        return etape;
    }
}
