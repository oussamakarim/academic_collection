package persistence.entities;

public class CatalogueEtapeEntity {
    private Integer id;
    private String libelle;
    private Integer numOrdre;
    private Integer empDefaut;
    private Integer idProc;

    public CatalogueEtapeEntity(){}

    public CatalogueEtapeEntity(Integer id, String libelle, Integer numOrdre, Integer empDefaut, Integer idProc) {
        this.id = id;
        this.libelle = libelle;
        this.numOrdre = numOrdre;
        this.empDefaut = empDefaut;
        this.idProc = idProc;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public Integer getNumOrdre() {
        return numOrdre;
    }

    public void setNumOrdre(Integer numOrdre) {
        this.numOrdre = numOrdre;
    }

    public Integer getEmpDefaut() {
        return empDefaut;
    }

    public void setEmpDefaut(Integer empDefaut) {
        this.empDefaut = empDefaut;
    }

    public Integer getIdProc() {
        return idProc;
    }

    public void setIdProc(Integer idProc) {
        this.idProc = idProc;
    }

    @Override
    public String toString() {
        return "CatalogueEtapeEntity{" +
                "id=" + id +
                ", libelle='" + libelle + '\'' +
                ", numOrdre=" + numOrdre +
                ", empDefaut=" + empDefaut +
                ", idProc=" + idProc +
                '}';
    }
}
