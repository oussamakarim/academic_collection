package persistence;

import persistence.entities.PersonnelEntity;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAOPersonnel implements IDAOUser {
    @Override
    public Integer save(PersonnelEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("INSERT INTO PERSONNEL (CIN, NOM, PRENOM, PIN, GRADE) VALUES " +
                            "(?, ?, ?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, obj.getCin());
            ps.setString(2, obj.getNom());
            ps.setString(3, obj.getPrenom());
            ps.setString(4, obj.getPin());
            ps.setString(5, obj.getGrade());
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
    public PersonnelEntity getById(Integer id) {
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM PERSONNEL WHERE ID = ?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            if ( result.next() )
                return new PersonnelEntity(
                        result.getInt("ID"),
                        result.getString("CIN"),
                        result.getString("NOM"),
                        result.getString("PRENOM"),
                        result.getString("PIN"),
                        result.getString("GRADE")
                );
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public PersonnelEntity getByCin(String cin) {
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM PERSONNEL WHERE CIN = ?");
            ps.setString(1, cin);
            ResultSet result = ps.executeQuery();
            if ( result.next() )
                return new PersonnelEntity(
                        result.getInt("ID"),
                        result.getString("CIN"),
                        result.getString("NOM"),
                        result.getString("PRENOM"),
                        result.getString("PIN"),
                        result.getString("GRADE")
                );
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<PersonnelEntity> getAll() {
        try {
            List<PersonnelEntity> personnel = new ArrayList<>(100);
            Statement stmt = cnx.createStatement();
            ResultSet result = stmt.executeQuery("SELECT * FROM PERSONNEL");
            while ( result.next() )
                personnel.add(new PersonnelEntity(
                        result.getInt("ID"),
                        result.getString("CIN"),
                        result.getString("NOM"),
                        result.getString("PRENOM"),
                        result.getString("PIN"),
                        result.getString("GRADE")
                ));
            return personnel;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Boolean update(PersonnelEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("UPDATE PERSONNEL SET CIN = ?, NOM = ?, PRENOM = ?, PIN = ?, " +
                    "GRADE = ?, WHERE ID = ?");
            ps.setString(1, obj.getCin());
            ps.setString(2, obj.getNom());
            ps.setString(3, obj.getPrenom());
            ps.setString(4, obj.getPin());
            ps.setString(5, obj.getGrade());
            ps.setInt(6, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean delete(PersonnelEntity obj) {
        try {
            PreparedStatement ps = cnx.prepareStatement("DELETE FROM PERSONNEL WHERE ID = ?");
            ps.setInt(1, obj.getId());
            return ps.executeUpdate() != 0;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean verifyLogin(String cin, String pin) {
        try {
            PreparedStatement ps = cnx.prepareStatement("SELECT CIN, PIN FROM PERSONNEL WHERE CIN = ? AND PIN = ?");
            ps.setString(1, cin);
            ps.setString(2, pin);
            ResultSet result = ps.executeQuery();
            return result.next();
        } catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<PersonnelEntity> getAllEmployee() {
        try {
            List<PersonnelEntity> emps = new ArrayList<>();
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM PERSONNEL WHERE GRADE = ?");
            ps.setString(1, "EMP");
            ResultSet result = ps.executeQuery();
            while ( result.next() )
                emps.add(new PersonnelEntity(
                        result.getInt("ID"),
                        result.getString("CIN"),
                        result.getString("NOM"),
                        result.getString("PRENOM"),
                        result.getString("PIN"),
                        result.getString("GRADE")
                ));
            return emps;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<PersonnelEntity> getAllChef() {
        try {
            List<PersonnelEntity> emps = new ArrayList<>();
            PreparedStatement ps = cnx.prepareStatement("SELECT * FROM PERSONNEL WHERE GRADE = ?");
            ps.setString(1, "CHEF");
            ResultSet result = ps.executeQuery();
            while ( result.next() )
                emps.add(new PersonnelEntity(
                        result.getInt("ID"),
                        result.getString("CIN"),
                        result.getString("NOM"),
                        result.getString("PRENOM"),
                        result.getString("PIN"),
                        result.getString("GRADE")
                ));
            return emps;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }
}
