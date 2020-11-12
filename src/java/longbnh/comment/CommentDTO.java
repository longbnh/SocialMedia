/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.comment;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author DELL
 */
public class CommentDTO implements Serializable {

    private int commentID;
    private int postID;
    private String email;
    private Date dayPost;
    private String content;
    private int status;
    private String name;

    public CommentDTO(int commentID, int postID, String email, Date dayPost, String content, int status, String name) {
        this.commentID = commentID;
        this.postID = postID;
        this.email = email;
        this.dayPost = dayPost;
        this.content = content;
        this.status = status;
        this.name = name;
    }

    public CommentDTO() {
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDayPost() {
        return dayPost;
    }

    public void setDayPost(Date dayPost) {
        this.dayPost = dayPost;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }
}
