package metier.beans;


import persistence.entities.RapportEntity;

public class Rapport {
    private RapportEntity rapportEntity;

    public Rapport(RapportEntity rapportEntity) {
        this.rapportEntity = rapportEntity;
    }

    public RapportEntity getRapportEntity() {
        return rapportEntity;
    }

    public void setRapportEntity(RapportEntity rapportEntity) {
        this.rapportEntity = rapportEntity;
    }
}
