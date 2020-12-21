package metier.beans;

import metier.enumeration.EtatDemande;
import persistence.entities.DemandeEntity;

import java.util.List;

public class Demande {
    private DemandeEntity demandeEntity;
    private String libelle;
    private Processus processus;
    private List<Document> docs;

    public Demande() {
    }

    public Demande(DemandeEntity demandeEntity) {
        this.demandeEntity = demandeEntity;
    }

    public DemandeEntity getDemandeEntity() {
        return demandeEntity;
    }

    public void setDemandeEntity(DemandeEntity demandeEntity) {
        this.demandeEntity = demandeEntity;
    }

    public List<Document> getDocs() {
        return docs;
    }

    public void setDocs(List<Document> docs) {
        this.docs = docs;
    }

    public Processus getProcessus() {
        return processus;
    }

    public void setProcessus(Processus processus) {
        this.processus = processus;
    }

    public EtatDemande getEtat(){
        return demandeEntity.getEtat();
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String nomPro) {
        this.libelle = nomPro;
    }

    public String getDateOuverture(){
        return demandeEntity.getDateOuverture().toString();
    }

    public String getJeton(){
        return demandeEntity.getJeton();
    }

    public void setJeton(String jeton){
        demandeEntity.setJeton(jeton);
    }

    @Override
    public String toString() {
        return String.format("(etat: %s, libelle: %s, docs: %d)",
                getEtat(),
                getLibelle(),
                docs != null ? docs.size() : 0);
    }

    public void setEtat(EtatDemande etat) {
        demandeEntity.setEtat(etat);
    }

    public Integer getId() {
        return demandeEntity.getId();
    }
}
