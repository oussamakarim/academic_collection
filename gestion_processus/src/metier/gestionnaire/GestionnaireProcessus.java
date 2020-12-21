package metier.gestionnaire;

import metier.beans.Etape;
import metier.beans.Processus;
import persistence.DAOProcessus;
import persistence.entities.ProcessusEntity;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class GestionnaireProcessus {
    private final DAOProcessus daoProcessus;
    private final GestionnaireEtape gestionnaireEtape;

    public GestionnaireProcessus() {
        this.daoProcessus = new DAOProcessus();
        this.gestionnaireEtape = new GestionnaireEtape();
    }

    public Integer save(Processus obj) {
        return daoProcessus.save(obj.getProcessusEntity());
    }

    public Processus getById(Integer id) {
        ProcessusEntity procEntity = daoProcessus.getById(id);
        return construct(procEntity);
    }

    public List<Processus> getAll() {
        List<ProcessusEntity> procEntities = daoProcessus.getAll();
        return procEntities.stream()
                .map(this::construct)
                .collect(Collectors.toList());
    }

    public Boolean update(Processus obj) {
        return daoProcessus.update(obj.getProcessusEntity());
    }

    public Boolean delete(Processus obj) {
        return daoProcessus.delete(obj.getProcessusEntity());
    }

    public Processus getProByDemandeID(Integer id) {
        ProcessusEntity procEntity = daoProcessus.getByDemandeID(id);
        return construct(procEntity);
    }

    /**
     * construct Processus object from ProcessusEntity and implement composition
     * @param procEntity
     * @return
     */
    private Processus construct(ProcessusEntity procEntity){
        if ( procEntity == null )
            return null;
        Processus proc = new Processus(procEntity);
        List<Etape> etapes = gestionnaireEtape.getEtapeByProcId(procEntity.getId());
        proc.setEtapes(etapes);
        return proc;
    }
}
