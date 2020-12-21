package metier.gestionnaire;

import metier.beans.Client;
import metier.beans.Demande;
import persistence.DAOClient;
import persistence.entities.ClientEntity;

import java.util.List;

public class GestionnaireClient {
    private DAOClient daoClient;
    private GestionnaireDemande gestionnaireDemande;

    public GestionnaireClient() {
        this.daoClient = new DAOClient();
        this.gestionnaireDemande = new GestionnaireDemande();
    }

    public Integer save(Client obj) {
        return daoClient.save(obj.getClientEntity());
    }

    public Client getById(Integer id) {
        ClientEntity clientEntity = daoClient.getById(id);
        return construct(clientEntity);
    }

    public Client getByCin(String cin) {
        ClientEntity clientEntity = daoClient.getByCin(cin);
        return construct(clientEntity);
    }

    /**
     * construct client object from client entity by implementing composition
     *
     * @param clientEntity
     * @return
     */
    private Client construct(ClientEntity clientEntity) {
        if (clientEntity == null)
            return null;
        Client client = new Client(clientEntity);
        List<Demande> clientDemandes = gestionnaireDemande.getAllByClientID(clientEntity.getId());
        client.setDemandes(clientDemandes);
        return client;
    }

    public Client newInstance(String cin, String nom, String prenom) {
        ClientEntity clientEntity = new ClientEntity(cin, nom, prenom);
        Client client = new Client();
        client.setClientEntity(clientEntity);
        return client;
    }
}
