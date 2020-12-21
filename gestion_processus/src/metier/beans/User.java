package metier.beans;


import persistence.entities.PersonnelEntity;

abstract public class User {
    protected PersonnelEntity user;

    public User() {
    }

    public User(PersonnelEntity user) {
        this.user = user;
    }

    public PersonnelEntity getUser() {
        return user;
    }

    public void setUser(PersonnelEntity user) {
        this.user = user;
    }

    public String getFullName() {
        String fulName = String.format("%s %s", user.getNom(), user.getPrenom());
        return fulName;
    }

    public String getNom() {
        return this.user.getNom();
    }

    public String getPrenom() {
        return this.user.getPrenom();
    }
    public String getCin(){
        return this.user.getCin();
    }


    public Integer getId () {
        return user.getId();
    }
}
