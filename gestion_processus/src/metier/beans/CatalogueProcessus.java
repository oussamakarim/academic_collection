package metier.beans;

import persistence.entities.CatalogueProcessusEntity;

import java.util.List;

public class CatalogueProcessus {
    private CatalogueProcessusEntity catalogueProcessusEntity;
    private List<CatalogueEtape> catEtapes;

    public CatalogueProcessus(CatalogueProcessusEntity catalogueProcessusEntity) {
        this.catalogueProcessusEntity = catalogueProcessusEntity;
    }

    public CatalogueProcessus() {
    }

    public CatalogueProcessusEntity getCatalogueProcessusEntity() {
        return catalogueProcessusEntity;
    }

    public void setCatalogueProcessusEntity(CatalogueProcessusEntity catalogueProcessusEntity) {
        this.catalogueProcessusEntity = catalogueProcessusEntity;
    }

    public List<CatalogueEtape> getCatEtapes() {
        return catEtapes;
    }

    public void setCatEtapes(List<CatalogueEtape> catEtapes) {
        this.catEtapes = catEtapes;
    }

    public String getLibelle(){
        return catalogueProcessusEntity.getLibelle();
    }
}
