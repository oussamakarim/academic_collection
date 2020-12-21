package persistence;

import metier.beans.Document;
import persistence.entities.DocumentEntity;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAODocument implements IDAO<DocumentEntity> {
    @Override
    public Integer save(DocumentEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("INSERT INTO DOCUMENT (FILENAME, DATE_DEPOSITION, ID_DEMANDE)" +
                    " VALUES ( ?, ?, ? )", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, obj.getFilename());
            ps.setTimestamp(2, obj.getDateDeposition());
            ps.setInt(3, obj.getIdDemande());
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
    public DocumentEntity getById(Integer id) {
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM DOCUMENT WHERE ID = ?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            if (result.next())
                return new DocumentEntity(
                        result.getInt("ID"),
                        result.getString("FILENAME"),
                        result.getTimestamp("DATE_DEPOSITION"),
                        result.getInt("ID_DEMANDE")
                );
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<DocumentEntity> getAll() {
        try {
            List<DocumentEntity> docs = new ArrayList<>(20);
            Statement stmt = cnx.createStatement();
            ResultSet result = stmt.executeQuery("SELECT * FROM DOCUMENT");
            while (result.next())
                docs.add(new DocumentEntity(
                        result.getInt("ID"),
                        result.getString("FILENAME"),
                        result.getTimestamp("DATE_DEPOSITION"),
                        result.getInt("ID_DEMANDE")
                ));
            return docs;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Boolean update(DocumentEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("UPDATE DOCUMENT SET FILENAME = ?, DATE_DEPOSITION = ?, " +
                    "ID_DEMANDE = ? WHERE ID = ?");
            ps.setString(1, obj.getFilename());
            ps.setTimestamp(2, obj.getDateDeposition());
            ps.setInt(3, obj.getIdDemande());
            ps.setInt(4, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean delete(DocumentEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("DELETE FROM DOCUMENT WHERE ID = ?");
            ps.setInt(1, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<DocumentEntity> getAllDocumentInDemande(Integer idDemande) {
        try {
            List<DocumentEntity> docs = new ArrayList<>(10);
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM DOCUMENT WHERE ID_DEMANDE = ?");
            ps.setInt(1, idDemande);
            ResultSet result = ps.executeQuery();
            while ( result.next() )
                docs.add(new DocumentEntity(
                        result.getInt("ID"),
                        result.getString("FILENAME"),
                        result.getTimestamp("DATE_DEPOSITION"),
                        result.getInt("ID_DEMANDE")
                ));
            return docs;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }
}
