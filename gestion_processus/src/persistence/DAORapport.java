package persistence;

import metier.beans.Rapport;
import metier.enumeration.EtatEtape;
import persistence.entities.RapportEntity;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class DAORapport implements IDAO<RapportEntity> {
    @Override
    public Integer save(RapportEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("INSERT INTO RAPPORT (FILENAME, DECISION, DATE_DEPOSITION, " +
                    "ID_ETA) VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, obj.getFilename());
            ps.setString(2, obj.getDecision().toString());
            ps.setTimestamp(3, obj.getDateDeposition());
            ps.setInt(4, obj.getIdEtape());
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
    public RapportEntity getById(Integer id) {
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM RAPPORT WHERE ID = ?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            if (result.next())
                return new RapportEntity(
                        result.getInt("ID"),
                        result.getString("FILENAME"),
                        EtatEtape.valueOf(result.getString("DECISION")),
                        result.getTimestamp("DATE_DEPOSITION"),
                        result.getInt("ID_ETA")
                );
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<RapportEntity> getAll() {
        try {
            List<RapportEntity> docs = new ArrayList<>(20);
            Statement stmt = cnx.createStatement();
            ResultSet result = stmt.executeQuery("SELECT * FROM RAPPORT");
            while (result.next())
                docs.add(new RapportEntity(
                        result.getInt("ID"),
                        result.getString("FILENAME"),
                        EtatEtape.valueOf(result.getString("DECISION")),
                        result.getTimestamp("DATE_DEPOSITION"),
                        result.getInt("ID_ETA")
                ));
            return docs;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Boolean update(RapportEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("UPDATE RAPPORT SET FILENAME = ?, DECISION = ?, " +
                    "DATE_DEPOSITION = ?, ID_ETA = ? WHERE ID = ?");
            ps.setString(1, obj.getFilename());
            ps.setString(2, obj.getDecision().toString());
            ps.setTimestamp(3, obj.getDateDeposition());
            ps.setInt(4, obj.getIdEtape());
            ps.setInt(5, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean delete(RapportEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("DELETE FROM RAPPORT WHERE ID = ?");
            ps.setInt(1, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public HashMap<EtatEtape, RapportEntity> getRapportsEtape(Integer id) {
            try {
                HashMap<EtatEtape, RapportEntity> rapports = new HashMap<>(4);
                PreparedStatement ps = cnx.prepareStatement("SELECT * FROM RAPPORT WHERE ID_ETA = ?");
                ps.setInt(1, id);
                ResultSet result = ps.executeQuery();
                while ( result.next() )
                    rapports.put(EtatEtape.valueOf(result.getString("DECISION")),
                                new RapportEntity(
                            result.getInt("ID"),
                            result.getString("FILENAME"),
                            EtatEtape.valueOf(result.getString("DECISION")),
                            result.getTimestamp("DATE_DEPOSITION"),
                            result.getInt("ID_ETA")
                    ));
                return rapports;
            } catch (SQLException e){
                e.printStackTrace();
            }
        return null;
    }
}
