package metier.beans;

import persistence.entities.ClientEntity;

import java.util.List;

public class Client {
    private ClientEntity clientEntity;
    private List<Demande> demandes;

    public Client() {
    }

    public Client(ClientEntity clientEntity) {
        this.clientEntity = clientEntity;
    }

    public String getNom(){
        return clientEntity.getNom();
    }

    public String getPrenom(){
        return clientEntity.getPrenom();
    }
    public String getCin(){
        return clientEntity.getCin();
    }

    public List<Demande> getDemandes() {
        return demandes;
    }

    public void setDemandes(List<Demande> demandes) {
        this.demandes = demandes;
    }

    public ClientEntity getClientEntity() {
        return clientEntity;
    }

    public void setClientEntity(ClientEntity clientEntity) {
        this.clientEntity = clientEntity;
    }

    public Demande getDemandeByJeton(String jeton) {
        for (Demande demande: demandes){
            if ( demande.getDemandeEntity().getJeton().equals(jeton))
                return demande;
        }
        return null;
    }

    public Integer getNombreDemande(){
        return demandes.size();
    }

    @Override
    public String toString() {
        return String.format("(%s, %s, %s, Nombre Demande: %d)",
                getCin(),
                getNom(),
                getPrenom(),
                getNombreDemande());
    }

    public Integer getId() {
        return clientEntity.getId();
    }
}
