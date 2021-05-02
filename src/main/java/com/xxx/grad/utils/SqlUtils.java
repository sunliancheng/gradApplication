package com.xxx.grad.utils;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@Component
public class SqlUtils {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    public ResultSet executeQuery(String sql) {
        ResultSet rs = null;
        Connection connection = null;
        Statement statement = null;

        try {
            connection = sqlSessionFactory.openSession().getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
//            if (statement != null) {
//                try {
//                    statement.close();
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
//            }
//            if (connection != null) {
//                try {
//                    connection.close();
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
//            }
        }

        return rs;
    }
}
