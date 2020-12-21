package metier.beans;

import persistence.entities.PersonnelEntity;

public class Admin extends User {
    public Admin(PersonnelEntity user) {
        super(user);
    }
}
