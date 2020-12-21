package persistence;

import persistence.entities.ClientEntity;

import javax.print.attribute.standard.PresentationDirection;
import javax.swing.plaf.nimbus.State;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAOClient implements IDAO<ClientEntity> {
    @Override
    public Integer save(ClientEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("INSERT INTO CLIENT (CIN, NOM, PRENOM) VALUES (?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, obj.getCin());
            ps.setString(2, obj.getNom());
            ps.setString(3, obj.getPrenom());
            if ( ps.executeUpdate() == 0 )
                return 0;
            ResultSet result = ps.getGeneratedKeys();
            if ( result.next())
                return result.getInt(1);
        } catch (SQLException e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public ClientEntity getById(Integer id) {
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM CLIENT WHERE ID = ?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            if ( result.next() )
                return new ClientEntity(
                        result.getInt("ID"),
                        result.getString("CIN"),
                        result.getString("NOM"),
                        result.getString("PRENOM")
                );
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public ClientEntity getByCin(String cin) {
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM CLIENT WHERE CIN = ?");
            ps.setString(1, cin);
            ResultSet result = ps.executeQuery();
            if ( result.next() )
                return new ClientEntity(
                        result.getInt("ID"),
                        result.getString("CIN"),
                        result.getString("NOM"),
                        result.getString("PRENOM")
                );
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<ClientEntity> getAll() {
        try {
            List<ClientEntity> clients = new ArrayList<>(100);
            Statement stmt = cnx.createStatement();
            ResultSet result = stmt.executeQuery("SELECT * FROM CLIENT");
            while ( result.next() )
                clients.add(new ClientEntity(
                        result.getInt("ID"),
                        result.getString("CIN"),
                        result.getString("NOM"),
                        result.getString("PRENOM")
                ));
            return clients;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Boolean update(ClientEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("UPDATE CLIENT SET CIN = ?, NOM = ?, PRENOM = ? WHERE ID = ?");
            ps.setString(1, obj.getCin());
            ps.setString(2, obj.getNom());
            ps.setString(3, obj.getPrenom());
            ps.setInt(4, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean delete(ClientEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("DELETE FROM CLIENT WHERE ID = ?");
            ps.setInt(1, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }
}
