package persistence.entities;

import metier.enumeration.EtatProcessus;

public class ProcessusEntity {
    private Integer id;
    private EtatProcessus etat;
    private boolean archived;
    private Integer idDemande;

    public ProcessusEntity() {}

    public ProcessusEntity(Integer id, EtatProcessus etat, Boolean archived, Integer idDemande) {
        this.id = id;
        this.etat = etat;
        this.archived = archived;
        this.idDemande = idDemande;
    }

    @Override
    public String toString() {
        return "ProcessusEntity{" +
                "id=" + id +
                ", etat=" + etat +
                ", archived=" + archived +
                ", idDemande=" + idDemande +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public EtatProcessus getEtat() {
        return etat;
    }

    public void setEtat(EtatProcessus etat) {
        this.etat = etat;
    }

    public boolean isArchived() {
        return archived;
    }

    public void setArchived(boolean archived) {
        this.archived = archived;
    }

    public Integer getIdDemande() {
        return idDemande;
    }

    public void setIdDemande(Integer idDemande) {
        this.idDemande = idDemande;
    }
}
