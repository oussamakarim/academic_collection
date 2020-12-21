package metier.gestionnaire;

import metier.beans.Document;
import persistence.DAODocument;
import persistence.entities.DocumentEntity;

import java.util.List;
import java.util.stream.Collectors;

public class GestionnaireDocument {
    private DAODocument daoDocument;

    public GestionnaireDocument() {
        this.daoDocument = new DAODocument();
    }

    public Integer save(Document obj) {
        return daoDocument.save(obj.getDocumentEntity());
    }

    public Document getById(Integer id) {
        return new Document(daoDocument.getById(id));
    }

    public List<Document> getAll() {
        return daoDocument.getAll().stream().map(Document::new).collect(Collectors.toList());
    }

    public Boolean update(Document obj) {
        return daoDocument.update(obj.getDocumentEntity());
    }

    public Boolean delete(Document obj) {
        return daoDocument.delete(obj.getDocumentEntity());
    }

    public List<Document> getAllDocumentInDemande(Integer id) {
        return daoDocument.getAllDocumentInDemande(id).stream()
                .map(Document::new)
                .collect(Collectors.toList());
    }

    public Document newInstance(String fileNmae, Integer idDemande) {
        DocumentEntity demandeEntity = new DocumentEntity(fileNmae, idDemande);
        Document document = new Document(demandeEntity);
        return document;
    }
}
