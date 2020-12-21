package metier.gestionnaire;

import metier.beans.*;
import persistence.DAOPersonnel;
import persistence.entities.PersonnelEntity;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class GestionnaireUser {
    private DAOPersonnel personnel;
    private GestionnaireDemande gestionnaireDemande;
    private GestionnaireEtape gestionnaireEtape;
    private GestionnaireCatEtap gestionnaireCatEtap;

    public GestionnaireUser() {
        this.personnel = new DAOPersonnel();
        this.gestionnaireDemande = new GestionnaireDemande();
        this.gestionnaireEtape = new GestionnaireEtape();
        this.gestionnaireCatEtap = new GestionnaireCatEtap();
    }

    public int saveUser(User user) {
        return personnel.save(user.getUser());
    }

    public User getById(Integer id) {
        return mapUser(this.personnel.getById(id));
    }

    public User getByCin(String cin) {
        return mapUser(personnel.getByCin(cin));
    }

    public List<User> getAll() {
        return personnel.getAll().stream().map(Entityuser -> mapUser(Entityuser)).collect(Collectors.toList());
    }

    public List<PersonnelEntity> getAllEmployeeEntities() {
        return personnel.getAllEmployee();
    }

    public Boolean update(User user) {
        return personnel.update(user.getUser());
    }

    public Boolean delete(User user) {
        return personnel.delete(user.getUser());
    }

    private User mapUser(PersonnelEntity entity) {
        switch (entity.getGrade()) {
            case "CHEF":
                return getChef(entity);
            case "ADMIN":
                return getAdmin(entity);
            case "EMP":
                return getEmployee(entity);
            default:
                throw new IllegalStateException("Unexpected value: " + entity.getGrade());
        }
    }

    private Admin getAdmin(PersonnelEntity entity) {
        return new Admin(entity);
    }

    private ChefDivision getChef(PersonnelEntity entity) {
        ChefDivision chefDivision = new ChefDivision(entity);
        chefDivision.setDemandes(gestionnaireDemande.getDemandeChef(entity.getId()));
        return chefDivision;
    }

    private Employee getEmployee(PersonnelEntity entity) {
        Employee employee = new Employee(entity);
        employee.setEtapes(gestionnaireEtape.getEtapesEmploye(entity.getId()));
        return employee;
    }

    public Boolean loginUser(String cin, String pin) {
        return personnel.verifyLogin(cin, pin);
    }

    public List<ChefDivision> getAllChef() {
        List<ChefDivision> chefDivisions = new ArrayList<>();
        personnel.getAllChef().stream().map(this::mapUser).forEach(chef -> chefDivisions.add((ChefDivision) chef));
        return chefDivisions;
    }

    public List<Employee> getAllEmployee() {
        List<Employee> employees = new ArrayList<>();
        personnel.getAllChef().stream().map(this::mapUser).forEach(emp -> employees.add((Employee) emp));
        return employees;
    }

    public List<CatalogueEtape> getAll(Employee employee) {
        return gestionnaireCatEtap.getCatEtapeByEMP(employee);
    }

}
