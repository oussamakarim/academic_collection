package metier.beans;

import metier.enumeration.EtatEtape;
import metier.enumeration.EtatProcessus;
import persistence.entities.ProcessusEntity;

import java.util.List;
import java.util.stream.Collectors;

public class Processus {
    private ProcessusEntity processusEntity;
    private List<Etape> etapes;
    private Etape etapeCourant;
    private String libelle;

    public Processus(ProcessusEntity processusEntity) {
        this.processusEntity = processusEntity;
    }

    public Processus() {
    }

    public ProcessusEntity getProcessusEntity() {
        return processusEntity;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setProcessusEntity(ProcessusEntity processusEntity) {
        this.processusEntity = processusEntity;
    }

    public List<Etape> getEtapes() {
        return etapes;
    }

    public void setEtapes(List<Etape> etapes) {
        this.etapes = etapes;
    }

    public List<Etape> getFinishedEtape(){
        return etapes.stream()
                .filter(etape -> etape.getEtat().equals(EtatEtape.TERMINE))
                .collect(Collectors.toList());
    }

    public List<Etape> getInactiveEtape(){
        return etapes.stream()
                .filter(etape -> etape.getEtat().equals(EtatEtape.INACTIVE))
                .collect(Collectors.toList());
    }

    public Etape getEtapeCourante(){
        if ( etapeCourant == null ){
            List<Etape> tmp = etapes.stream()
                    .filter(etape -> etape.getEtat().equals(EtatEtape.COURS))
                    .collect(Collectors.toList());
            etapeCourant = tmp.get(0);
        }

        return etapeCourant;
    }

    public int getAvancementRatio(){
        List<Etape> etapeFinished = getFinishedEtape();
        float ratio = ((float) etapeFinished.size() / (float) etapes.size() ) * 100;
        return (int) ratio;
    }


    @Override
    public String toString() {
        return String.format("Proc(Etat: %s, Etapes: %d, Ratio: %d",
                getEtat().toString(),
                etapes.size(),
                getAvancementRatio());
    }

    public String getEtat() {
        return String.valueOf(processusEntity.getEtat());
    }
    public Integer getId() {
        return processusEntity.getId();
    }
}
