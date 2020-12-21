package persistence.entities;

import metier.enumeration.EtatDemande;

import java.sql.Timestamp;

public class DemandeEntity {
    private Integer id;
    private Timestamp dateOuverture;
    private EtatDemande etat;
    private String jeton;
    private boolean archived;
    private Integer idCatProc;
    private Integer idChef;
    private Integer idClient;

    public DemandeEntity() {
    }

    public DemandeEntity(Integer id, Timestamp dateOuverture, EtatDemande etat, String jeton, Boolean archived, Integer idCatProc, Integer idChef, Integer idClient) {
        this.id = id;
        this.dateOuverture = dateOuverture;
        this.etat = etat;
        this.jeton = jeton;
        this.archived = archived;
        this.idCatProc = idCatProc;
        this.idChef = idChef;
        this.idClient = idClient;
    }

    public DemandeEntity(Integer idCatProc, Integer idChef, Integer idClient, String jeton) {
        this.dateOuverture = new Timestamp(System.currentTimeMillis());
        this.etat = EtatDemande.ATTENTE;
        this.jeton = jeton;
        this.archived = false;
        this.idCatProc = idCatProc;
        this.idChef = idChef;
        this.idClient = idClient;
    }

    @Override
    public String toString() {
        return "DemandeEntity{" +
                "id=" + id +
                ", dateOuverture=" + dateOuverture +
                ", etat=" + etat +
                ", jeton='" + jeton + '\'' +
                ", archived=" + archived +
                ", idCatProc=" + idCatProc +
                ", idChef=" + idChef +
                ", idClient=" + idClient +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Timestamp getDateOuverture() {
        return dateOuverture;
    }

    public void setDateOuverture(Timestamp dateOuverture) {
        this.dateOuverture = dateOuverture;
    }

    public EtatDemande getEtat() {
        return etat;
    }

    public void setEtat(EtatDemande etat) {
        this.etat = etat;
    }

    public String getJeton() {
        return jeton;
    }

    public void setJeton(String jeton) {
        this.jeton = jeton;
    }

    public boolean isArchived() {
        return archived;
    }

    public void setArchived(boolean archived) {
        this.archived = archived;
    }

    public Integer getIdCatProc() {
        return idCatProc;
    }

    public void setIdCatProc(Integer idCatProc) {
        this.idCatProc = idCatProc;
    }

    public Integer getIdChef() {
        return idChef;
    }

    public void setIdChef(Integer idChef) {
        this.idChef = idChef;
    }

    public Integer getIdClient() {
        return idClient;
    }

    public void setIdClient(Integer idClient) {
        this.idClient = idClient;
    }
}
