package metier.beans;

import persistence.entities.PersonnelEntity;

import java.util.List;

public class Employee extends User {
    protected List<Etape> etapes;

    public Employee(PersonnelEntity entity) {
        super(entity);
    }

    public List<Etape> getEtapes() {
        return etapes;
    }

    public void setEtapes(List<Etape> etapes) {
        this.etapes = etapes;
    }

}
