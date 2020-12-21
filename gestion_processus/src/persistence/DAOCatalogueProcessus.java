package persistence;

import persistence.entities.CatalogueProcessusEntity;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAOCatalogueProcessus implements IDAO<CatalogueProcessusEntity> {
    PreparedStatement ps;

    @Override
    public Integer save(CatalogueProcessusEntity obj) {
        try {
            ps = cnx.prepareStatement("INSERT INTO CATALOGUE_PROCESSUS (LIBELLE, CHEF_DEFAUT) VALUES (?, ?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, obj.getLibelle());
            ps.setInt(2, obj.getChefDefaut());
            int affectedRow = ps.executeUpdate();
            ResultSet result = ps.getGeneratedKeys();
            if ( result.next() )
                return result.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public CatalogueProcessusEntity getById(Integer id) {
        try {
            ps = cnx.prepareStatement("SELECT * FROM CATALOGUE_PROCESSUS WHERE ID = ?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            if ( result.next() )
                return new CatalogueProcessusEntity(
                        result.getInt("ID"),
                        result.getString("LIBELLE"),
                        result.getInt("CHEF_DEFAUT")
                );
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<CatalogueProcessusEntity> getAll() {
        try {
            List<CatalogueProcessusEntity> catProcs = new ArrayList<>(20);
            Statement stmt = cnx.createStatement();
            ResultSet result = stmt.executeQuery("SELECT * FROM CATALOGUE_PROCESSUS");
            while ( result.next() )
                catProcs.add(new CatalogueProcessusEntity(
                        result.getInt("ID"),
                        result.getString("LIBELLE"),
                        result.getInt("CHEF_DEFAUT")
                ));
            return catProcs;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Boolean update(CatalogueProcessusEntity obj) {
        try {
            ps = cnx.prepareStatement("UPDATE CATALOGUE_PROCESSUS SET LIBELLE = ?, CHEF_DEFAUT = ? WHERE ID = ?");
            ps.setString(1, obj.getLibelle());
            ps.setInt(2, obj.getChefDefaut());
            ps.setInt(3, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean delete(CatalogueProcessusEntity obj) {
        try {
            ps = cnx.prepareStatement("DELETE FROM CATALOGUE_PROCESSUS WHERE ID = ?");
            ps.setInt(1, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        DAOCatalogueProcessus dao = new DAOCatalogueProcessus();
        Integer id = dao.save(new CatalogueProcessusEntity(1, "test", 1));
        System.out.println(id);
        System.out.println(dao.getById(id));
    }
}
