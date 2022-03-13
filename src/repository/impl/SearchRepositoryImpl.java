package repository.impl;

import entity.Book;
import repository.SearchRepository;
import utils.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SearchRepositoryImpl implements SearchRepository {

    public Book findByBookname(String bookname) {
        Connection connection = JDBCTools.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Book book = null;
        String sql = "select * from book where b_name = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, bookname);
            resultSet = statement.executeQuery();
            int i = 0;
            while (resultSet.next()){
                book = new Book(i++, resultSet.getString(2), resultSet.getString(3), resultSet.getDouble(4), resultSet.getString(5), resultSet.getInt(6), resultSet.getString(7));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection, statement, resultSet);
        }
        return book;
    }
}
