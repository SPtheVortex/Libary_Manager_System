package com.sp.dao;

import com.sp.bean.TypeBean;
import com.sp.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class TypeDao {
    
    public ArrayList<TypeBean> get_ListInfo() {
        ArrayList<TypeBean> tag_Array = new ArrayList<TypeBean>();
        Connection conn = DBUtil.getConnectDb();
        String sql = "select * from booktype";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                TypeBean tag = new TypeBean();
                tag.setTid(rs.getInt("tid"));
                tag.setName(rs.getString("name"));
                tag_Array.add(tag);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            DBUtil.CloseDB(rs, stm, conn);
        }
        return tag_Array;
    }

    
    public void updateTypeBook(int tid, String name) {

        Connection conn = DBUtil.getConnectDb();
        String sql = "update booktype set name=? where tid=?";
        PreparedStatement stm = null;
        try {
            stm = conn.prepareStatement(sql);
            stm.setString(1, name);
            stm.setInt(2, tid);
            stm.executeUpdate();
        } catch (SQLException e) {

            e.printStackTrace();
        }
    }

    
    public void addBookType(String name) {

        Connection conn = DBUtil.getConnectDb();
        String sql = "insert  into booktype(name) values(?)";
        int rs = 0;
        PreparedStatement stm = null;
        try {
            stm = conn.prepareStatement(sql);
            stm.setString(1, name);
            ;
            rs = stm.executeUpdate();
        } catch (SQLException e) {

            e.printStackTrace();
        }
    }

    
    public void deleteBookType(int tid) {

        Connection conn = DBUtil.getConnectDb();
        String sql = "delete from booktype where tid=?";
        PreparedStatement stm = null;
        try {
            stm = conn.prepareStatement(sql);
            stm.setInt(1, tid);
            stm.executeUpdate();
        } catch (SQLException e) {

            e.printStackTrace();
        }


    }
}
