package persistence.entities;

import metier.enumeration.EtatEtape;

import java.sql.Timestamp;

public class EtapeEntity {
    private Integer id;
    private EtatEtape etat;
    private Timestamp dateDebut;
    private Timestamp dateFin;
    private Integer idEmp;
    private Integer idCatEtape;
    private Integer idProc;

    public EtapeEntity(){}

    public EtapeEntity(Integer id, EtatEtape etat, Timestamp dateDebut, Timestamp dateFin, Integer idEmp, Integer idCatEtape, Integer idProc) {
        this.id = id;
        this.etat = etat;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.idEmp = idEmp;
        this.idCatEtape = idCatEtape;
        this.idProc = idProc;
    }

    @Override
    public String toString() {
        return "EtapeEntity{" +
                "id=" + id +
                ", etat=" + etat +
                ", dateDebut=" + dateDebut +
                ", dateFin=" + dateFin +
                ", idEmp=" + idEmp +
                ", idCatEtape=" + idCatEtape +
                ", idProc=" + idProc +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public EtatEtape getEtat() {
        return etat;
    }

    public void setEtat(EtatEtape etat) {
        this.etat = etat;
    }

    public Timestamp getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Timestamp dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Timestamp getDateFin() {
        return dateFin;
    }

    public void setDateFin(Timestamp dateFin) {
        this.dateFin = dateFin;
    }

    public Integer getIdEmp() {
        return idEmp;
    }

    public void setIdEmp(Integer idEmp) {
        this.idEmp = idEmp;
    }

    public Integer getIdCatEtape() {
        return idCatEtape;
    }

    public void setIdCatEtape(Integer idCatEtape) {
        this.idCatEtape = idCatEtape;
    }

    public Integer getIdProc() {
        return idProc;
    }

    public void setIdProc(Integer idProc) {
        this.idProc = idProc;
    }
}
