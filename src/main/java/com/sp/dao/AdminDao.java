package com.sp.dao;

import com.sp.bean.AdminBean;
import com.sp.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class AdminDao {

    
    public boolean Login_verify(String username, String password) {
        Connection conn = DBUtil.getConnectDb();
        String sql = "select * from admin where username='" + username + "' and password='" + password + "'";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            DBUtil.CloseDB(rs, stm, conn);
        }
        return false;
    }

    
    public void Register(String username, String password, String name, String email, String phone, int lend_num, int max_num) {

        Connection conn = DBUtil.getConnectDb();
        String sql = "insert  into admin(status,username,password,name,email,phone,lend_num,max_num) values(?,?,?,?,?,?,?,?)";
        int rs = 0;
        PreparedStatement stm = null;
        try {
            stm = conn.prepareStatement(sql);
            stm.setInt(1, 1);
            stm.setString(2, username);
            stm.setString(3, password);
            stm.setString(4, name);
            stm.setString(5, email);
            stm.setString(6, phone);
            stm.setInt(7, lend_num);
            stm.setInt(8, max_num);
            rs = stm.executeUpdate();
        } catch (SQLException e) {

            e.printStackTrace();
        }
    }

    
    public AdminBean getAdminInfo(String username, String password) {

        AdminBean adminbean = new AdminBean();
        Connection conn = DBUtil.getConnectDb();
        String sql = "select * from admin where username='" + username + "' AND password='" + password + "'";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement(sql);

            rs = stm.executeQuery();
            if (rs.next()) {
                adminbean.setAid(rs.getInt("aid"));
                adminbean.setUsername(rs.getString("username"));
                adminbean.setName(rs.getString("name"));
                adminbean.setPassword(rs.getString("password"));
                adminbean.setEmail(rs.getString("email"));
                adminbean.setPhone(rs.getString("phone"));
                adminbean.setStatus(rs.getInt("status"));
                adminbean.setLend_num(rs.getInt("lend_num"));
                adminbean.setMax_num(rs.getInt("max_num"));
            }
        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            DBUtil.CloseDB(rs, stm, conn);
        }
        return adminbean;
    }

    
    public ArrayList<AdminBean> get_ListInfo() {
        ArrayList<AdminBean> tag_Array = new ArrayList<AdminBean>();
        Connection conn = DBUtil.getConnectDb();
        String sql = "select * from admin where status=1";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                AdminBean adminbean = new AdminBean();
                adminbean.setAid(rs.getInt("aid"));
                adminbean.setUsername(rs.getString("username"));
                adminbean.setName(rs.getString("name"));
                adminbean.setPassword(rs.getString("password"));
                adminbean.setEmail(rs.getString("email"));
                adminbean.setPhone(rs.getString("phone"));
                adminbean.setStatus(rs.getInt("status"));
                adminbean.setLend_num(rs.getInt("lend_num"));
                adminbean.setMax_num(rs.getInt("max_num"));
                tag_Array.add(adminbean);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            DBUtil.CloseDB(rs, stm, conn);
        }
        return tag_Array;
    }

    
    public AdminBean get_AidInfo(int aid) {
        AdminBean adminbean = new AdminBean();
        Connection conn = DBUtil.getConnectDb();
        String sql = "select * from admin where aid=" + aid;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                adminbean.setAid(rs.getInt("aid"));
                adminbean.setUsername(rs.getString("username"));
                adminbean.setName(rs.getString("name"));
                adminbean.setPassword(rs.getString("password"));
                adminbean.setEmail(rs.getString("email"));
                adminbean.setPhone(rs.getString("phone"));
                adminbean.setStatus(rs.getInt("status"));
                adminbean.setLend_num(rs.getInt("lend_num"));
                adminbean.setMax_num(rs.getInt("max_num"));
            }
        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            DBUtil.CloseDB(rs, stm, conn);
        }
        return adminbean;
    }

    
    public AdminBean get_AidInfo2(String aid) {
        AdminBean adminbean = new AdminBean();
        Connection conn = DBUtil.getConnectDb();
        String sql = "select * from admin where aid=" + aid;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                adminbean.setAid(rs.getInt("aid"));
                adminbean.setUsername(rs.getString("username"));
                adminbean.setName(rs.getString("name"));
                adminbean.setPassword(rs.getString("password"));
                adminbean.setEmail(rs.getString("email"));
                adminbean.setPhone(rs.getString("phone"));
                adminbean.setStatus(rs.getInt("status"));
                adminbean.setLend_num(rs.getInt("lend_num"));
                adminbean.setMax_num(rs.getInt("max_num"));
            }
        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            DBUtil.CloseDB(rs, stm, conn);
        }
        return adminbean;
    }

    
    public void updateUser(int aid, String username, String password, String name, String email, String phone,
                           int lend_num, int max_num) {

        Connection conn = DBUtil.getConnectDb();
        String sql = "update admin set username=?,name=?,email=?,phone=?,password=?,lend_num=?,max_num=? where aid=?";
        PreparedStatement stm = null;
        try {
            stm = conn.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, name);
            stm.setString(3, email);
            stm.setString(4, phone);
            stm.setString(5, password);
            stm.setInt(6, lend_num);
            stm.setInt(7, max_num);
            stm.setInt(8, aid);
            stm.executeUpdate();
        } catch (SQLException e) {

            e.printStackTrace();
        }
    }

    
    public void deleteUser(int aid) {

        Connection conn = DBUtil.getConnectDb();
        String sql = "delete from admin where aid=?";
        PreparedStatement stm = null;
        try {
            stm = conn.prepareStatement(sql);
            stm.setInt(1, aid);
            stm.executeUpdate();
        } catch (SQLException e) {

            e.printStackTrace();
        }
    }
}

