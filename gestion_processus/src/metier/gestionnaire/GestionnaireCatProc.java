package metier.gestionnaire;

import metier.beans.CatalogueProcessus;
import persistence.DAOCatalogueProcessus;

import java.util.ArrayList;
import java.util.List;

public class GestionnaireCatProc {
    private DAOCatalogueProcessus daoCatalogueProcessus;
    private GestionnaireCatEtap gestionnaireCatEtap;

    public GestionnaireCatProc() {
        this.daoCatalogueProcessus = new DAOCatalogueProcessus();
        gestionnaireCatEtap = new GestionnaireCatEtap();
    }

    public Integer save(CatalogueProcessus obj) {
        return daoCatalogueProcessus.save(obj.getCatalogueProcessusEntity());
    }

    public CatalogueProcessus getById(Integer id) {
        CatalogueProcessus catalogueProcessus = new CatalogueProcessus();
        catalogueProcessus.setCatalogueProcessusEntity(daoCatalogueProcessus.getById(id));
        catalogueProcessus.setCatEtapes(gestionnaireCatEtap.getSortedCatEtapeByIDCatProc(id));
        return catalogueProcessus;
    }

    public List<CatalogueProcessus> getAll() {
        List<CatalogueProcessus> catalogueProc = new ArrayList<>();
        daoCatalogueProcessus.getAll().stream()
                .map(CatalogueProcessus::new)
                .forEach(catalogueProcessus -> {
                    catalogueProcessus.setCatEtapes(gestionnaireCatEtap.getSortedCatEtapeByIDCatProc(catalogueProcessus.getCatalogueProcessusEntity().getId()));
                    catalogueProc.add(catalogueProcessus);
                });

        return catalogueProc;
    }

    public Boolean update(CatalogueProcessus obj) {
        return daoCatalogueProcessus.update(obj.getCatalogueProcessusEntity());
    }

    public Boolean delete(CatalogueProcessus obj) {
        return daoCatalogueProcessus.delete(obj.getCatalogueProcessusEntity());
    }

    public CatalogueProcessus getByLibelle(String libelle) {
        CatalogueProcessus catalogueProcessus = new CatalogueProcessus();

        return null;
    }
}
