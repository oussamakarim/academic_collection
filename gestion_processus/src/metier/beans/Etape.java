package metier.beans;


import metier.enumeration.EtatEtape;
import persistence.entities.EtapeEntity;

import java.sql.Timestamp;
import java.util.HashMap;

public class Etape {
    private EtapeEntity etapeEntity;
    private HashMap<EtatEtape, Rapport> rapports;
    private String libelle;

    public Etape(){}
    
    public Etape(EtapeEntity etapeEntity) {
        this.etapeEntity = etapeEntity;
    }

    public EtapeEntity getEtapeEntity() {
        return etapeEntity;
    }

    public void setEtapeEntity(EtapeEntity etapeEntity) {
        this.etapeEntity = etapeEntity;
    }

    public HashMap<EtatEtape, Rapport> getRapports() {
        return rapports;
    }

    public void setRapports(HashMap<EtatEtape, Rapport> rapports) {
        this.rapports = rapports;
    }

    public EtatEtape getEtat() {
        return etapeEntity.getEtat();
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public Integer getIdCatEtape(){
        return etapeEntity.getIdCatEtape();
    }

    public Integer getId() {
        return etapeEntity.getId();
    }

    public Timestamp getDateDebut(){
        return etapeEntity.getDateDebut();
    }

    public Timestamp getDateFin(){
        return etapeEntity.getDateFin();
    }

    @Override
    public String toString() {
        return String.format("Etape(Etat: %s, Debut: %s, Fin: %s, Libelle: %s",
                getEtat(),
                getDateDebut().toString(),
                getDateFin().toString(),
                getLibelle());
    }
    public String getEtatString() {
        return String.valueOf(etapeEntity.getEtat());
    }
}
