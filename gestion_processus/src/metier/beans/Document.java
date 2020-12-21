package metier.beans;

import persistence.entities.DocumentEntity;


public class Document {
    private DocumentEntity documentEntity;

    public Document() {
    }

    public Document(DocumentEntity documentEntity) {
        this.documentEntity = documentEntity;
    }

    public String getFileName() {
        return documentEntity.getFilename();
    }

    public DocumentEntity getDocumentEntity() {
        return documentEntity;
    }

    public void setDocumentEntity(DocumentEntity documentEntity) {
        this.documentEntity = documentEntity;
    }
}
