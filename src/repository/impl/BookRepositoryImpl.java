package repository.impl;

import entity.Book;
import repository.BookRepository;
import utils.JDBCTools;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookRepositoryImpl implements BookRepository {

    Connection connection = JDBCTools.getConnection();
    String sql = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    @Override
    public List<Book> findAll(int index, int limit) {
        sql = "select * from book limit ?, ?";
        List<Book> list = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, index);
            preparedStatement.setInt(2, limit);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                Book book = new Book(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getDouble(4), resultSet.getString(5), resultSet.getInt(6), resultSet.getString(7));
                list.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public int count() {
        sql = "select count(*) from book";
        int count = 0;
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                count = resultSet.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
