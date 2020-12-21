package metier.beans;

import metier.enumeration.EtatDemande;
import persistence.entities.PersonnelEntity;

import java.util.List;
import java.util.stream.Collectors;

public class ChefDivision extends Employee {
    private List<Demande> demandes;


    public ChefDivision(PersonnelEntity entity) {
        super(entity);
    }

    public List<Demande> getDemandes() {
        return demandes;
    }

    public List<Demande> getDemandeEnAttente() {
        return demandes.stream()
                .filter(demande -> demande.getEtat().equals(EtatDemande.ATTENTE))
                .collect(Collectors.toList());
    }

    public void setDemandes(List<Demande> demandes) {
        this.demandes = demandes;
    }
}
