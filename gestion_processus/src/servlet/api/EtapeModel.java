package servlet.api;

import metier.beans.Document;
import metier.beans.Rapport;

import java.util.List;

public class EtapeModel {
    Integer etapeId;
    String procedureNom;
    String etapeNom;
    String etapeEtat;
    String etapeOuverture;
    String etapeFermeture;
    List<Rapport> rapports;
    List<Document> documents;

    public EtapeModel(Integer etapeId, String procedureNom, String etapeNom, String etapeEtat, String etapeOuverture, String etapeFermeture, List<Rapport> rapports, List<Document> documents) {
        this.etapeId = etapeId;
        this.procedureNom = procedureNom;
        this.etapeNom = etapeNom;
        this.etapeEtat = etapeEtat;
        this.etapeOuverture = etapeOuverture;
        this.etapeFermeture = etapeFermeture;
        this.rapports = rapports;
        this.documents = documents;
    }

    public EtapeModel(String procedureNom, String etapeNom, String etapeEtat, String etapeOuverture, String etapeFermeture, List<Rapport> rapports, List<Document> documents) {
        this.procedureNom = procedureNom;
        this.etapeNom = etapeNom;
        this.etapeEtat = etapeEtat;
        this.etapeOuverture = etapeOuverture;
        this.etapeFermeture = etapeFermeture;
        this.rapports = rapports;
        this.documents = documents;
    }

    public EtapeModel() {
    }

    public Integer getEtapeId() {
        return etapeId;
    }

    public void setEtapeId(Integer etapeId) {
        this.etapeId = etapeId;
    }

    public String getProcedureNom() {
        return procedureNom;
    }

    public void setProcedureNom(String procedureNom) {
        this.procedureNom = procedureNom;
    }

    public String getEtapeNom() {
        return etapeNom;
    }

    public void setEtapeNom(String etapeNom) {
        this.etapeNom = etapeNom;
    }

    public String getEtapeEtat() {
        return etapeEtat;
    }

    public void setEtapeEtat(String etapeEtat) {
        this.etapeEtat = etapeEtat;
    }

    public String getEtapeOuverture() {
        return etapeOuverture;
    }

    public void setEtapeOuverture(String etapeOuverture) {
        this.etapeOuverture = etapeOuverture;
    }

    public String getEtapeFermeture() {
        return etapeFermeture;
    }

    public void setEtapeFermeture(String etapeFermeture) {
        this.etapeFermeture = etapeFermeture;
    }

    public List<Rapport> getRapports() {
        return rapports;
    }

    public void setRapports(List<Rapport> rapports) {
        this.rapports = rapports;
    }

    public List<Document> getDocuments() {
        return documents;
    }

    public void setDocuments(List<Document> documents) {
        this.documents = documents;
    }
}

