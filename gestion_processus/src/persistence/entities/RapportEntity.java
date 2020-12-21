package persistence.entities;

import metier.enumeration.EtatEtape;

import java.sql.Timestamp;

public class RapportEntity {
    private Integer id;
    private String filename;
    private EtatEtape decision;
    private Timestamp dateDeposition;
    private Integer idEtape;

    public RapportEntity() {
    }

    public RapportEntity(Integer id, String filename, EtatEtape decision, Timestamp dateDeposition, Integer idEtape) {
        this.id = id;
        this.filename = filename;
        this.decision = decision;
        this.dateDeposition = dateDeposition;
        this.idEtape = idEtape;
    }

    public RapportEntity(String filename, EtatEtape decision, Integer idEtape) {
        this.filename = filename;
        this.decision = decision;
        this.dateDeposition = new Timestamp(System.currentTimeMillis());
        this.idEtape = idEtape;
    }

    @Override
    public String toString() {
        return "RapportEntity{" +
                "id=" + id +
                ", filename='" + filename + '\'' +
                ", decision=" + decision +
                ", dateDeposition=" + dateDeposition +
                ", idEtape=" + idEtape +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public EtatEtape getDecision() {
        return decision;
    }

    public void setDecision(EtatEtape decision) {
        this.decision = decision;
    }

    public Timestamp getDateDeposition() {
        return dateDeposition;
    }

    public void setDateDeposition(Timestamp dateDeposition) {
        this.dateDeposition = dateDeposition;
    }

    public Integer getIdEtape() {
        return idEtape;
    }

    public void setIdEtape(Integer idEtape) {
        this.idEtape = idEtape;
    }
}
