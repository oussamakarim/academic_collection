package persistence.entities;

public class ClientEntity {
    protected Integer id;
    protected String cin;
    protected String nom;
    protected String prenom;

    public ClientEntity() {
    }

    public ClientEntity(Integer id, String cin, String nom, String prenom) {
        this.id = id;
        this.cin = cin;
        this.nom = nom;
        this.prenom = prenom;
    }

    public ClientEntity(String cin, String nom, String prenom) {
        this.cin = cin;
        this.nom = nom;
        this.prenom = prenom;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCin() {
        return cin;
    }

    public void setCin(String cin) {
        this.cin = cin;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    @Override
    public String toString() {
        return "ClientEntity{" +
                "id=" + id +
                ", cin='" + cin + '\'' +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                '}';
    }
}
