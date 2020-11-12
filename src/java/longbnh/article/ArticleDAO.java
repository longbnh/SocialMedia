/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.article;

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
public class ArticleDAO implements Serializable {

    private int pageCount;
    private List<ArticleDTO> listDTO;
    private ArticleDTO article;

    public boolean createArticle(String image, String title, String description, String content, Date dayPost, String email,
            int status) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Insert article(image,title,description,content,dayPost,email,status) values(?,?,?,?,?,?,?)";

                stm = con.prepareStatement(sql);
                stm.setString(1, image);
                stm.setString(2, title);
                stm.setString(3, description);
                stm.setString(4, content);
                stm.setDate(5, dayPost);
                stm.setString(6, email);
                stm.setInt(7, status);

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

    public void searchArticleByContent(String searchContent, int currentPage) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select postID, image, title, description, content, dayPost, email, status from Article "
                        + "where content like ? and status = 2"
                        + " order by dayPost desc offset ? rows fetch next 20 rows only";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchContent + "%");
                stm.setInt(2, currentPage * 20);

                rs = stm.executeQuery();
                while (rs.next()) {
                    int postID = rs.getInt("postID");
                    String image = rs.getString("image");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    String content = rs.getString("content");
                    Date dayPost = rs.getDate("dayPost");
                    String email = rs.getString("email");
                    int status = rs.getInt("status");
                    if (this.listDTO == null) {
                        this.listDTO = new ArrayList<>();
                    }
                    ArticleDTO dto = new ArticleDTO(postID, image, title, description, content, dayPost, email, status);
                    this.listDTO.add(dto);
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

    public void caculatePage(String searchContent) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select count(title) as totalPost from Article where content like ? and status = 2";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchContent + "%");

                rs = stm.executeQuery();
                double totalPost = 0;
                if (rs.next()) {
                    totalPost = rs.getInt("totalPost");
                }
                this.pageCount = (int) Math.ceil(totalPost / 20);
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

    public void searchPostByID(int postID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select image, title, description, content, dayPost, email, status "
                        + "from Article where postID = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, postID);

                rs = stm.executeQuery();
                if (rs.next()) {
                    String image = rs.getString("image");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    String content = rs.getString("content");
                    Date dayPost = rs.getDate("dayPost");
                    String email = rs.getString("email");
                    int status = rs.getInt("status");
                    this.article = new ArticleDTO(postID, image, title, description, content, dayPost, email, status);
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

    public boolean deletePost(int postID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Update Article set status = ? where postID = ?";
                stm = con.prepareStatement(sql);

                stm.setInt(1, 3);
                stm.setInt(2, postID);

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

    public boolean checkStatusPost(int postID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select status from Article where postID = ?";
                stm = con.prepareStatement(sql);

                stm.setInt(1, postID);

                rs = stm.executeQuery();
                if (rs.next()) {
                    int status = rs.getInt("status");
                    if (status == 2) {
                        return true;
                    }
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

    public List<ArticleDTO> getListDTO() {
        return listDTO;
    }

    public int getPageCount() {
        return pageCount;
    }

    public ArticleDTO getArticle() {
        return article;
    }

}
