package persistence;

import metier.enumeration.EtatProcessus;
import persistence.entities.ProcessusEntity;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAOProcessus implements IDAO<ProcessusEntity> {
    @Override
    public Integer save(ProcessusEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("INSERT INTO PROCESSUS (ETAT, ARCHIVE, ID_DEMANDE) VALUES (?," +
                    " ?, ?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, obj.getEtat().toString());
            ps.setBoolean(2, obj.isArchived());
            ps.setInt(3, obj.getId());
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
    public ProcessusEntity getById(Integer id) {
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM PROCESSUS WHERE ID = ?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            if (result.next())
                return new ProcessusEntity(
                        result.getInt("ID"),
                        EtatProcessus.valueOf(result.getString("ETAT")),
                        result.getBoolean("ARCHIVE"),
                        result.getInt("ID_DEMANDE")
                );
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<ProcessusEntity> getAll() {
        try {
            List<ProcessusEntity> procs = new ArrayList<>(10);
            Statement stmt = cnx.createStatement();
            ResultSet result = stmt.executeQuery("SELECT * FROM PROCESSUS");
            while (result.next())
                procs.add(new ProcessusEntity(
                        result.getInt("ID"),
                        EtatProcessus.valueOf(result.getString("ETAT")),
                        result.getBoolean("ARCHIVE"),
                        result.getInt("ID_DEMANDE")
                ));
            return procs;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Boolean update(ProcessusEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("UPDATE PROCESSUS SET ETAT = ?, ARCHIVE = ?, ID_DEMANDE = ? " +
                    "WHERE ID = ?");
            ps.setString(1, obj.getEtat().toString());
            ps.setBoolean(2, obj.isArchived());
            ps.setInt(3, obj.getId());
            ps.setInt(4, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean delete(ProcessusEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("DELETE FROM PROCESSUS WHERE ID = ?");
            ps.setInt(1, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /*Get demande refernce to processus*/
    public ProcessusEntity getByDemandeID(Integer idDemande) {
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM PROCESSUS WHERE ID_DEMANDE = ?");
            ps.setInt(1, idDemande);
            ResultSet result = ps.executeQuery();
            if ( result.next() )
                return new ProcessusEntity(
                        result.getInt("ID"),
                        EtatProcessus.valueOf(result.getString("ETAT")),
                        result.getBoolean("ARCHIVE"),
                        result.getInt("ID_DEMANDE")
                );
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }
}
