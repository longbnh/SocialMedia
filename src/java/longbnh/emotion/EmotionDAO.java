/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.emotion;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import longbnh.utility.DBHelper;

/**
 *
 * @author DELL
 */
public class EmotionDAO implements Serializable {

    private int isLike;
    private int isDislike;
    private int emotionID;

    public void countNumberLikeDislike(int postID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String countTotalLike = "Select count(emotionID) as totalReact from Emotion where reaction = ? and postID = ?";
                stm = con.prepareStatement(countTotalLike);
                stm.setInt(1, 1);
                stm.setInt(2, postID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    this.isLike = rs.getInt("totalReact");
                }

                stm = con.prepareStatement(countTotalLike);
                stm.setInt(1, 2);
                stm.setInt(2, postID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    this.isDislike = rs.getInt("totalReact");
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
    }

    public int checkUserExistEmotion(int postID, String email) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select reaction from Emotion where postID = ? and email = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, postID);
                stm.setString(2, email);

                rs = stm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("reaction");
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
        return -1;
    }

    public void updateEmotion(int postID, String email, Date currentDate, int reaction) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Update Emotion set reaction = ?, dayPost = ? where postID = ? and email = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, reaction);
                stm.setDate(2, currentDate);
                stm.setInt(3, postID);
                stm.setString(4, email);

                stm.executeUpdate();
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
    }

    public void addNewEmotion(int postID, String email, Date currentDate, int reaction) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert into Emotion(postID, email, reaction, dayPost) values(?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setInt(1, postID);
                stm.setString(2, email);
                stm.setInt(3, reaction);
                stm.setDate(4, currentDate);
                stm.executeUpdate();
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
    }

    public boolean getLastEmotion(int postID, String emailInteract, Date currentDate, int reaction)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "select max(emotionID) as emotionID from Emotion "
                        + "where postID = ? and email like ? and reaction = ? and dayPost = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, postID);
                stm.setString(2, emailInteract);
                stm.setInt(3, reaction);
                stm.setDate(4, currentDate);

                rs = stm.executeQuery();
                if (rs.next()) {
                    this.emotionID = rs.getInt("emotionID");
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

    public int getIsLike() {
        return isLike;
    }

    public int getIsDislike() {
        return isDislike;
    }

    public int getEmotionID() {
        return emotionID;
    }
}
