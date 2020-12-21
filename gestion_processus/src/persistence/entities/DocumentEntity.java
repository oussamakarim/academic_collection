package persistence.entities;

import java.sql.Timestamp;

public class DocumentEntity {
    private Integer id;
    private String filename;
    private Timestamp dateDeposition;
    private Integer idDemande;

    public DocumentEntity() {
    }

    public DocumentEntity(Integer id, String filename, Timestamp dateDeposition, Integer idDemande) {
        this.id = id;
        this.filename = filename;
        this.dateDeposition = dateDeposition;
        this.idDemande = idDemande;
    }

    public DocumentEntity(String filename, Integer idDemande) {
        this.filename = filename;
        this.dateDeposition = new Timestamp(System.currentTimeMillis());
        this.idDemande = idDemande;
    }

    @Override
    public String toString() {
        return "DocumentEntity{" +
                "id=" + id +
                ", filename='" + filename + '\'' +
                ", dateDeposition=" + dateDeposition +
                ", idDemande=" + idDemande +
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

    public Timestamp getDateDeposition() {
        return dateDeposition;
    }

    public void setDateDeposition(Timestamp dateDeposition) {
        this.dateDeposition = dateDeposition;
    }

    public Integer getIdDemande() {
        return idDemande;
    }

    public void setIdDemande(Integer idDemande) {
        this.idDemande = idDemande;
    }
}
