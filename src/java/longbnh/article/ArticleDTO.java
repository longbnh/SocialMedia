/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.article;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author DELL
 */
public class ArticleDTO implements Serializable {

    private int postID;
    private String image;
    private String title;
    private String description;
    private String content;
    private Date dayPost;
    private String email;
    private int status;

    public ArticleDTO(int postID, String image, String title, String description, String content, Date dayPost, String email, int status) {
        this.postID = postID;
        this.image = image;
        this.title = title;
        this.description = description;
        this.content = content;
        this.dayPost = dayPost;
        this.email = email;
        this.status = status;
    }

    public ArticleDTO() {
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDayPost() {
        return dayPost;
    }

    public void setDayPost(Date dayPost) {
        this.dayPost = dayPost;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }
}
