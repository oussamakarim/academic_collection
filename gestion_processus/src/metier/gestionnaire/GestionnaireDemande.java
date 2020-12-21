package metier.gestionnaire;

import metier.beans.CatalogueProcessus;
import metier.beans.Demande;
import metier.beans.Document;
import metier.beans.Processus;
import persistence.DAODemande;
import persistence.entities.DemandeEntity;

import java.util.List;
import java.util.stream.Collectors;

public class GestionnaireDemande {
    private DAODemande daoDemande;
    private GestionnaireCatProc gestionnaireCatProc;
    private GestionnaireProcessus gestionnaireProcessus;
    private GestionnaireDocument gestionnaireDocument;

    public GestionnaireDemande() {
        this.daoDemande = new DAODemande();
        gestionnaireCatProc = new GestionnaireCatProc();
        gestionnaireDocument = new GestionnaireDocument();
        gestionnaireProcessus = new GestionnaireProcessus();
    }

    public Integer save(Demande obj) {
        return daoDemande.save(obj.getDemandeEntity());
    }

    public Demande getById(Integer id) {
        DemandeEntity demandeEntity = daoDemande.getById(id);
        return construct(demandeEntity);
    }

    public List<Demande> getAll() {
        List<DemandeEntity> demandeEntities = daoDemande.getAll();
        System.out.println("getting all proc");
        return demandeEntities.stream()
                                .map(this::construct)
                                .collect(Collectors.toList());
    }

    public Boolean update(Demande obj) {
        return daoDemande.update(obj.getDemandeEntity());
    }

    public Boolean delete(Demande obj) {
        return daoDemande.delete(obj.getDemandeEntity());
    }

    public List<Demande> getAllByClientID(Integer idClient) {
        List<DemandeEntity> demandeEntities = daoDemande.getDemandeClient(idClient);
        if ( demandeEntities == null )
            return null;
        return demandeEntities.stream().map(this::construct).collect(Collectors.toList());
    }


    public List<Demande> getDemandeChef(Integer idChef) {
        return daoDemande.getDemandeByChef(idChef).stream().
                map(this::construct).
                collect(Collectors.toList());
    }

    public Demande getByEtape(Integer id) {
        DemandeEntity demandeEntity = daoDemande.getByEtape(id);
        return construct(demandeEntity);
    }
    /**
     * Construct Demande Object by adding composition relation
     * @param demandeEntity
     * @return Demande Object
     */
    private Demande construct(DemandeEntity demandeEntity){
        if ( demandeEntity == null )
            return null;
        Integer demandeId = demandeEntity.getId();
        Integer catId = demandeEntity.getIdCatProc();
        Demande demande = new Demande(demandeEntity);

        CatalogueProcessus catProc = gestionnaireCatProc.getById(catId);
        List<Document> docs = gestionnaireDocument.getAllDocumentInDemande(demandeId);
        Processus proc = gestionnaireProcessus.getProByDemandeID(demandeId);
        if ( proc != null )
            proc.setLibelle(catProc.getLibelle());

        demande.setDocs(docs);
        demande.setProcessus(proc);
        demande.setLibelle(catProc.getLibelle());
        System.out.println("Setting nom proc: " + catProc.getLibelle());
        return demande;
    }

    public Demande newInstance(Integer idClient,Integer idChef,Integer idCatalogue,String jeton){
        DemandeEntity demandeEntity = new DemandeEntity(idCatalogue,idChef,idClient,jeton);
        Demande demande = new Demande();
        demande.setDemandeEntity(demandeEntity);
        return demande;
    }

    public Demande getByJeton(String jeton) {
        return construct(daoDemande.getByJeton(jeton));
    }
}
