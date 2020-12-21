package persistence.entities;

public class CatalogueProcessusEntity {
    private Integer id;
    private String libelle;
    private Integer chefDefaut;

    public CatalogueProcessusEntity(){}

    public CatalogueProcessusEntity(Integer id, String libelle, Integer chefDefaut) {
        this.id = id;
        this.libelle = libelle;
        this.chefDefaut = chefDefaut;
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

    public Integer getChefDefaut() {
        return chefDefaut;
    }

    public void setChefDefaut(Integer chefDefaut) {
        this.chefDefaut = chefDefaut;
    }

    @Override
    public String toString() {
        return String.format("id: %d, libelle: %s, chef: %d",
                id, libelle, chefDefaut);
    }
}
