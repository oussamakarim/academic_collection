package persistence;


import persistence.entities.PersonnelEntity;

import java.util.List;

public interface IDAOUser extends IDAO<PersonnelEntity> {

    Boolean verifyLogin(String cin, String pin);
    List<PersonnelEntity> getAllEmployee();
    List<PersonnelEntity> getAllChef();
}
