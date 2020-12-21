package persistence;

import metier.enumeration.EtatEtape;
import persistence.entities.EtapeEntity;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAOEtape implements IDAO<EtapeEntity> {
    @Override
    public Integer save(EtapeEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("INSERT INTO ETAPE (ETAT, DATE_DEBUT, DATE_FIN, ID_EMP, " +
                    "ID_CAT_ETAPE, ID_PROC", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, obj.getEtat().toString());
            ps.setTimestamp(2, obj.getDateDebut());
            ps.setTimestamp(3, obj.getDateFin());
            ps.setInt(4, obj.getIdEmp());
            ps.setInt(5, obj.getIdCatEtape());
            ps.setInt(6, obj.getIdProc());
            if (ps.executeUpdate() == 0)
                return 0;
            ResultSet result = ps.getGeneratedKeys();
            if (result.next())
                return result.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public EtapeEntity getById(Integer id) {
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM ETAPE WHERE ID = ?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            if (result.next())
                return new EtapeEntity(
                        result.getInt("ID"),
                        EtatEtape.valueOf(result.getString("ETAT")),
                        result.getTimestamp("DATE_DEBUT"),
                        result.getTimestamp("DATE_FIN"),
                        result.getInt("ID_EMP"),
                        result.getInt("ID_CAT_ETAPE"),
                        result.getInt("ID_PROC")
                );
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<EtapeEntity> getAll() {
        try {
            List<EtapeEntity> etapes = new ArrayList<>(10);
            Statement stmt = cnx.createStatement();
            ResultSet result = stmt.executeQuery("SELECT * FROM ETAPE");
            while (result.next())
                etapes.add(new EtapeEntity(
                        result.getInt("ID"),
                        EtatEtape.valueOf(result.getString("ETAT")),
                        result.getTimestamp("DATE_DEBUT"),
                        result.getTimestamp("DATE_FIN"),
                        result.getInt("ID_EMP"),
                        result.getInt("ID_CAT_ETAPE"),
                        result.getInt("ID_PROC")
                ));
            return etapes;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Boolean update(EtapeEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("UPDATE ETAPE SET ETAT = ?, DATE_DEBUT = ?, DATE_FIN = ?, " +
                    "ID_EMP = ?, ID_CAT_ETAPE = ?, ID_PROC = ? WHERE ID = ?");
            ps.setString(1, obj.getEtat().toString());
            ps.setTimestamp(2, obj.getDateDebut());
            ps.setTimestamp(3, obj.getDateFin());
            ps.setInt(4, obj.getIdEmp());
            ps.setInt(5, obj.getIdCatEtape());
            ps.setInt(6, obj.getIdProc());
            ps.setInt(7, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean delete(EtapeEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("DELETE FROM ETAPE WHERE ID = ?");
            ps.setInt(1, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<EtapeEntity> getEtapesByProcessus(Integer idProc) {
        try {
            List<EtapeEntity> etapes = new ArrayList<>(10);
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM ETAPE WHERE ID_PROC = ?");
            ps.setInt(1, idProc);
            ResultSet result = ps.executeQuery();
            while ( result.next() )
                etapes.add(new EtapeEntity(
                        result.getInt("ID"),
                        EtatEtape.valueOf(result.getString("ETAT")),
                        result.getTimestamp("DATE_DEBUT"),
                        result.getTimestamp("DATE_FIN"),
                        result.getInt("ID_EMP"),
                        result.getInt("ID_CAT_ETAPE"),
                        result.getInt("ID_PROC")
                ));
            return etapes;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public List<EtapeEntity> getEtapesByEmploye(Integer idEmp) {
        try {
            List<EtapeEntity> etapes = new ArrayList<>(10);
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM ETAPE WHERE ID_EMP = ?");
            ps.setInt(1, idEmp);
            ResultSet result = ps.executeQuery();
            while ( result.next() )
                etapes.add(new EtapeEntity(
                        result.getInt("ID"),
                        EtatEtape.valueOf(result.getString("ETAT")),
                        result.getTimestamp("DATE_DEBUT"),
                        result.getTimestamp("DATE_FIN"),
                        result.getInt("ID_EMP"),
                        result.getInt("ID_CAT_ETAPE"),
                        result.getInt("ID_PROC")
                ));
            return etapes;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }
}
