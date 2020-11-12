/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.comment;

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
public class CommentDAO implements Serializable {

    private List<CommentDTO> listComment;
    private int commentID;

    public boolean commentToPost(int postID, String email, Date dayPost, String content, int status)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert Comment(postID,email,dayPost,content,status) values(?,?,?,?,?)";
                stm = con.prepareStatement(sql);

                stm.setInt(1, postID);
                stm.setString(2, email);
                stm.setDate(3, dayPost);
                stm.setString(4, content);
                stm.setInt(5, status);

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

    public void showAllCommentInPost(int postID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select C.commentID, C.email, C.dayPost, C.content, C.status, U.name from Comment C, Users U "
                        + "where C.postID = ? and C.status = 2 and C.email = U.email order by C.dayPost desc" ;
                stm = con.prepareStatement(sql);
                stm.setInt(1, postID);

                rs = stm.executeQuery();
                while (rs.next()) {
                    int commentID = rs.getInt("commentID");
                    String email = rs.getString("email");
                    Date dayPost = rs.getDate("dayPost");
                    String content = rs.getString("content");
                    int status = rs.getInt("status");
                    String name = rs.getString("name");
                    CommentDTO dto = new CommentDTO(commentID, postID, email, dayPost, content, status, name);
                    if (this.listComment == null) {
                        this.listComment = new ArrayList<>();
                    }
                    listComment.add(dto);
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

    public boolean takeLastCommentID(int postID, String email, String content, int status)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select max(commentID) as commentID from Comment where postID = ? and email like ? and"
                        + " content like ? and status = ?";
                stm = con.prepareStatement(sql);

                stm.setInt(1, postID);
                stm.setString(2, email);
                stm.setString(3, content);
                stm.setInt(4, status);

                rs = stm.executeQuery();
                if (rs.next()) {
                    this.commentID = rs.getInt("commentID");
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

    public boolean deleteComment(int commentID, String email) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Update Comment set status = ? where email like ? and commentID = ?";
                stm = con.prepareStatement(sql);

                stm.setInt(1, 3);
                stm.setString(2, email);
                stm.setInt(3, commentID);

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

    public List<CommentDTO> getListComment() {
        return listComment;
    }

    public int getCommentID() {
        return commentID;
    }
}
