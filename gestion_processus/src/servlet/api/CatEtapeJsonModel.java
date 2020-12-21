package servlet.api;

import persistence.entities.CatalogueEtapeEntity;

import java.util.List;

public class CatEtapeJsonModel {

    private List<CatalogueEtapeEntity> entities;
    private Integer idChef;

    public CatEtapeJsonModel(Integer idChef, List<CatalogueEtapeEntity> entities) {
        this.entities = entities;
        this.idChef = idChef;
    }

    public List<CatalogueEtapeEntity> getEntities() {
        return entities;
    }

    public void setEntities(List<CatalogueEtapeEntity> entities) {
        this.entities = entities;
    }

    public Integer getIdChef() {
        return idChef;
    }

    public void setIdChef(Integer idChef) {
        this.idChef = idChef;
    }
}
