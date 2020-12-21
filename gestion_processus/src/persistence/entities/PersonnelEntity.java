package persistence.entities;

public class PersonnelEntity  {
    private Integer id;
    private String cin;
    private String nom;
    private String prenom;
    private String pin;
    private String grade;

    public PersonnelEntity(){}

    public PersonnelEntity(Integer id, String cin, String nom, String prenom, String pin, String grade) {
        this.id = id;
        this.cin = cin;
        this.nom = nom;
        this.prenom = prenom;
        this.pin = pin;
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "PersonnelEntity{" +
                "id=" + id +
                ", cin='" + cin + '\'' +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", pin='" + pin + '\'' +
                ", grade='" + grade + '\'' +
                '}';
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

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }
}
