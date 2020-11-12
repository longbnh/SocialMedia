/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.notify;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import longbnh.utility.DBHelper;

/**
 *
 * @author DELL
 */
public class NotifyDAO implements Serializable {

    private List<NotifyDTO> list;
    private int totalPage;

    public boolean addNotifyComment(int postID, String emailInteract, Date dayAction, int typeID, int commentID)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into Notify(postID, emailLogin, emailInteract, dayAction, typeID) "
                        + "select ?, A.email, ?, ?, ? from Article A, Comment C where A.postID = C.postID and C.commentID = ? "
                        + "and A.status = 2";
                stm = con.prepareStatement(sql);

                stm.setInt(1, postID);
                stm.setString(2, emailInteract);
                stm.setDate(3, dayAction);
                stm.setInt(4, typeID);
                stm.setInt(5, commentID);

                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }

            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public void showAllNotify(String emailLogin, int currentPage) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select notifyID, postID, emailLogin, name, dayAction, typeName from Notify N, Type T, Users U "
                        + "where N.typeID = T.typeID and U.email = N.emailInteract and N.emailLogin like ? order by dayAction desc "
                        + ",N.notifyID desc offset ? rows fetch next 20 rows only";
                stm = con.prepareStatement(sql);

                stm.setString(1, emailLogin);
                stm.setInt(2, currentPage * 20);

                rs = stm.executeQuery();
                while (rs.next()) {
                    int notifyID = rs.getInt("notifyID");
                    int postID = rs.getInt("postID");
                    String name = rs.getString("name");
                    Date dayAction = rs.getDate("dayAction");
                    String typeName = rs.getString("typeName");
                    if (this.list == null) {
                        this.list = new ArrayList<>();
                    }
                    NotifyDTO dto = new NotifyDTO(notifyID, postID, emailLogin, name, dayAction, typeName);
                    list.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.next();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public boolean caculateNotifyPage(String emailLogin) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select count(notifyID) as total from Notify where emailLogin like ?";

                stm = con.prepareStatement(sql);

                stm.setString(1, emailLogin);

                rs = stm.executeQuery();
                if (rs.next()) {
                    double totalNotify = rs.getInt("total");

                    this.totalPage = (int) Math.ceil(totalNotify / 20);
                    return true;
                }

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean addNotifyEmotion(int postID, String emailInteract, Date dayAction, int typeID, int emotionID)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert Notify(postID, emailLogin, emailInteract, dayAction, typeID) "
                        + "select ?, A.email, ?, ?, ? from Article A, Emotion E "
                        + "where A.postID = E.postID and E.emotionID = ? and A.status = 2";
                stm = con.prepareStatement(sql);
                
                stm.setInt(1, postID);
                stm.setString(2, emailInteract);
                stm.setDate(3, dayAction);
                stm.setInt(4, typeID);
                stm.setInt(5, emotionID);
                
                int row = stm.executeUpdate();
                if(row > 0){
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public List<NotifyDTO> getList() {
        return list;
    }

    public int getTotalPage() {
        return totalPage;
    }
}
