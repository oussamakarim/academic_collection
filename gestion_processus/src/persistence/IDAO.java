package persistence;

import java.sql.Connection;
import java.util.List;


public interface IDAO<T> {
    Connection cnx = DBConnection.getConnection();

    Integer save(T obj);

    T getById(Integer id);

    List<T> getAll();

    Boolean update(T obj);

    Boolean delete(T obj);

}
