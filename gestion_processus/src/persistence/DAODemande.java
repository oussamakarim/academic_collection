package persistence;

import metier.beans.Demande;
import metier.enumeration.EtatDemande;
import persistence.entities.DemandeEntity;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAODemande implements IDAO<DemandeEntity> {
    @Override
    public Integer save(DemandeEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("INSERT INTO DEMANDE (DATE_OUVERTURE, ETAT, JETON, ARCHIVE, " +
                    "ID_CAT_PROC, ID_CHEF, ID_CLIENT) VALUES (?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            ps.setTimestamp(1, obj.getDateOuverture());
            ps.setString(2, obj.getEtat().toString());
            ps.setString(3, obj.getJeton());
            ps.setBoolean(4, obj.isArchived());
            ps.setInt(5, obj.getIdCatProc());
            ps.setInt(6, obj.getIdChef());
            ps.setInt(7, obj.getIdClient());
            if (ps.executeUpdate() == 0)
                return 0;
            ResultSet result = ps.getGeneratedKeys();
            if (result.next())
                return result.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public DemandeEntity getById(Integer id) {
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM DEMANDE WHERE ID = ?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            if (result.next())
                return new DemandeEntity(
                        result.getInt("ID"),
                        result.getTimestamp("DATE_OUVERTURE"),
                        EtatDemande.valueOf(result.getString("ETAT")),
                        result.getString("JETON"),
                        result.getBoolean("ARCHIVE"),
                        result.getInt("ID_CAT_PROC"),
                        result.getInt("ID_CHEF"),
                        result.getInt("ID_CLIENT")
                );
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<DemandeEntity> getAll() {
        try {
            List<DemandeEntity> demandes = new ArrayList<>(100);
            Statement ps = cnx.createStatement();
            ResultSet result = ps.executeQuery("SELECT * FROM DEMANDE");
            while (result.next())
                demandes.add(new DemandeEntity(
                        result.getInt("ID"),
                        result.getTimestamp("DATE_OUVERTURE"),
                        EtatDemande.valueOf(result.getString("ETAT")),
                        result.getString("JETON"),
                        result.getBoolean("ARCHIVE"),
                        result.getInt("ID_CAT_PROC"),
                        result.getInt("ID_CHEF"),
                        result.getInt("ID_CLIENT")
                ));
            return demandes;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Boolean update(DemandeEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("UPDATE DEMANDE SET DATE_OUVERTURE = ?, ETAT = ?, JETON = ?, " +
                    "ARCHIVE = ?, ID_CAT_PROC = ?, ID_CHEF = ?, ID_CLIENT = ? WHERE ID = ?");
            ps.setTimestamp(1, obj.getDateOuverture());
            ps.setString(2, obj.getEtat().toString());
            ps.setString(3, obj.getJeton());
            ps.setBoolean(4, obj.isArchived());
            ps.setInt(5, obj.getIdCatProc());
            ps.setInt(6, obj.getIdChef());
            ps.setInt(7, obj.getIdClient());
            ps.setInt(8, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Boolean delete(DemandeEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("DELETE FROM DEMANDE WHERE ID = ?");
            ps.setInt(1, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /*demande aprtient a un cleint*/
    public List<DemandeEntity> getDemandeClient(Integer idClient) {
        try {
            List<DemandeEntity> demandes = new ArrayList<>(10);
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM DEMANDE WHERE ID_CLIENT = ?");
            ps.setInt(1, idClient);
            ResultSet result = ps.executeQuery();
            while (result.next())
                demandes.add(new DemandeEntity(
                        result.getInt("ID"),
                        result.getTimestamp("DATE_OUVERTURE"),
                        EtatDemande.valueOf(result.getString("ETAT")),
                        result.getString("JETON"),
                        result.getBoolean("ARCHIVE"),
                        result.getInt("ID_CAT_PROC"),
                        result.getInt("ID_CHEF"),
                        result.getInt("ID_CLIENT")
                ));
            return demandes;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<DemandeEntity> getDemandeByChef(Integer idChef) {
        try {
            List<DemandeEntity> demandes = new ArrayList<>(10);
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM DEMANDE WHERE ID_CHEF = ?");
            ps.setInt(1, idChef);
            ResultSet result = ps.executeQuery();
            while (result.next())
                demandes.add(new DemandeEntity(
                        result.getInt("ID"),
                        result.getTimestamp("DATE_OUVERTURE"),
                        EtatDemande.valueOf(result.getString("ETAT")),
                        result.getString("JETON"),
                        result.getBoolean("ARCHIVE"),
                        result.getInt("ID_CAT_PROC"),
                        result.getInt("ID_CHEF"),
                        result.getInt("ID_CLIENT")
                ));
            return demandes;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public DemandeEntity getByEtape(Integer idEtape) {
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT DEMANDE.* FROM DEMANDE JOIN PROCESSUS ON DEMANDE.ID = PROCESSUS.ID_DEMANDE JOIN ETAPE ON ETAPE.ID_PROC = PROCESSUS.ID WHERE ETAPE.ID = ?;");
            ps.setInt(1, idEtape);
            ResultSet result = ps.executeQuery();
            if (result.next()) {
                return new DemandeEntity(
                        result.getInt("ID"),
                        result.getTimestamp("DATE_OUVERTURE"),
                        EtatDemande.valueOf(result.getString("ETAT")),
                        result.getString("JETON"),
                        result.getBoolean("ARCHIVE"),
                        result.getInt("ID_CAT_PROC"),
                        result.getInt("ID_CHEF"),
                        result.getInt("ID_CLIENT")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public DemandeEntity getByJeton(String jeton) {
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM DEMANDE WHERE JETON = ?");
            ps.setString(1, jeton);
            ResultSet result = ps.executeQuery();
            if (result.next())
                return new DemandeEntity(
                        result.getInt("ID"),
                        result.getTimestamp("DATE_OUVERTURE"),
                        EtatDemande.valueOf(result.getString("ETAT")),
                        result.getString("JETON"),
                        result.getBoolean("ARCHIVE"),
                        result.getInt("ID_CAT_PROC"),
                        result.getInt("ID_CHEF"),
                        result.getInt("ID_CLIENT")
                );
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
