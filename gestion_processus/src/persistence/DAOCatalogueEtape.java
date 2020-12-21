package persistence;

import com.sun.source.tree.CompoundAssignmentTree;
import metier.beans.CatalogueEtape;
import persistence.entities.CatalogueEtapeEntity;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAOCatalogueEtape implements IDAO<CatalogueEtapeEntity> {

    @Override
    public Integer save(CatalogueEtapeEntity obj) {
        PreparedStatement ps;
        try {
            ps = cnx.prepareStatement("INSERT INTO CATALOGUE_ETAPE (LIBELLE, NUM_ORDRE, EMP_DEFAUT, ID_PROC) VALUES " +
                    "(?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, obj.getLibelle());
            ps.setInt(2, obj.getNumOrdre());
            ps.setInt(3, obj.getEmpDefaut());
            ps.setInt(4, obj.getIdProc());
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
    public CatalogueEtapeEntity getById(Integer id) {
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT ID, LIBELLE, NUM_ORDRE, EMP_DEFAUT, ID_PROC FROM " +
                    "CATALOGUE_ETAPE WHERE ID = ?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            if (result.next())
                return new CatalogueEtapeEntity(
                        result.getInt("ID"),
                        result.getString("LIBELLE"),
                        result.getInt("NUM_ORDRE"),
                        result.getInt("EMP_DEFAUT"),
                        result.getInt("ID_PROC")
                );
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<CatalogueEtapeEntity> getAll() {
        try {
            List<CatalogueEtapeEntity> cats = new ArrayList<>(20);
            Statement stmt = cnx.createStatement();
            ResultSet result = stmt.executeQuery("SELECT ID, LIBELLE, NUM_ORDRE, EMP_DEFAUT, ID_PROC FROM " +
                    "CATALOGUE_ETAPE");
            while (result.next())
                cats.add(new CatalogueEtapeEntity(
                        result.getInt("ID"),
                        result.getString("LIBELLE"),
                        result.getInt("NUM_ORDRE"),
                        result.getInt("EMP_DEFAUT"),
                        result.getInt("ID_PROC")
                ));
            return cats;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Boolean update(CatalogueEtapeEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("UPDATE CATALOGUE_ETAPE SET LIBELLE = ?, NUM_ORDRE = ?, " +
                    "EMP_DEFAUT = ?, ID_PROC = ? WHERE ID = ?");
            ps.setString(1, obj.getLibelle());
            ps.setInt(2, obj.getNumOrdre());
            ps.setInt(3, obj.getEmpDefaut());
            ps.setInt(4, obj.getIdProc());
            ps.setInt(5, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean delete(CatalogueEtapeEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("DELETE FROM CATALOGUE_ETAPE WHERE ID = ?");
            ps.setInt(1, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /*get all catetape references to cat processus**/
    public List<CatalogueEtapeEntity> getByIDCatProc(Integer idCatProc) {
        List<CatalogueEtapeEntity> catalogueEtapeEntities = new ArrayList<>(10);
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM CATALOGUE_ETAPE WHERE ID_PROC = ?");
            ps.setInt(1, idCatProc);
            ResultSet result = ps.executeQuery();
            while ( result.next() )
                catalogueEtapeEntities.add(new CatalogueEtapeEntity(
                        result.getInt("ID"),
                        result.getString("LIBELLE"),
                        result.getInt("NUM_ORDRE"),
                        result.getInt("EMP_DEFAUT"),
                        result.getInt("ID_PROC")
                ));
            return catalogueEtapeEntities;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public List<CatalogueEtapeEntity> getByEMP(Integer idEmploye) {
        List<CatalogueEtapeEntity> catalogueEtapeEntities = new ArrayList<>(10);
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM CATALOGUE_ETAPE WHERE EMP_DEFAUT = ?");
            ps.setInt(1, idEmploye);
            ResultSet result = ps.executeQuery();
            while ( result.next() )
                catalogueEtapeEntities.add(new CatalogueEtapeEntity(
                        result.getInt("ID"),
                        result.getString("LIBELLE"),
                        result.getInt("NUM_ORDRE"),
                        result.getInt("EMP_DEFAUT"),
                        result.getInt("ID_PROC")
                ));
            return catalogueEtapeEntities;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public List<CatalogueEtapeEntity> getByChef(Integer id) {
        List<CatalogueEtapeEntity> catEtape = new ArrayList<>();
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT CATALOGUE_ETAPE.* FROM CATALOGUE_PROCESSUS JOIN CATALOGUE_ETAPE ON CATALOGUE_PROCESSUS.ID = CATALOGUE_ETAPE.ID_PROC WHERE CATALOGUE_PROCESSUS.CHEF_DEFAUT = ?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            while ( result.next() )
                catEtape.add(new CatalogueEtapeEntity(
                        result.getInt("ID"),
                        result.getString("LIBELLE"),
                        result.getInt("NUM_ORDRE"),
                        result.getInt("EMP_DEFAUT"),
                        result.getInt("ID_PROC")
                ));
        } catch (SQLException e){
            e.printStackTrace();
        }
        return catEtape;
    }
}
