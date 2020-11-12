/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.notify;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author DELL
 */
public class NotifyDTO implements Serializable {

    private int notifyID;
    private int postID;
    private String emailLogin;
    private String name;
    private Date dayAction;
    private String typeName;

    public NotifyDTO() {
    }

    public NotifyDTO(int notifyID, int postID, String emailLogin, String name, Date dayAction, String typeName) {
        this.notifyID = notifyID;
        this.postID = postID;
        this.emailLogin = emailLogin;
        this.name = name;
        this.dayAction = dayAction;
        this.typeName = typeName;
    }



    public int getNotifyID() {
        return notifyID;
    }

    public int getPostID() {
        return postID;
    }

    public Date getDayAction() {
        return dayAction;
    }

    public String getTypeName() {
        return typeName;
    }

    public String getEmailLogin() {
        return emailLogin;
    }

    public String getName() {
        return name;
    }



}
