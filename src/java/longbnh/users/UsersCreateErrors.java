/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.users;

import java.io.Serializable;

/**
 *
 * @author DELL
 */
public class UsersCreateErrors implements Serializable {

    private String emailInvalid;
    private String passwordInvalid;
    private String confirmNotMatch;
    private String invalidName;
    private String emailIsExisted;

    public String getEmailInvalid() {
        return emailInvalid;
    }

    public void setEmailInvalid(String emailInvalid) {
        this.emailInvalid = emailInvalid;
    }

    public String getPasswordInvalid() {
        return passwordInvalid;
    }

    public void setPasswordInvalid(String passwordInvalid) {
        this.passwordInvalid = passwordInvalid;
    }

    public String getConfirmNotMatch() {
        return confirmNotMatch;
    }

    public void setConfirmNotMatch(String confirmNotMatch) {
        this.confirmNotMatch = confirmNotMatch;
    }

    public String getEmailIsExisted() {
        return emailIsExisted;
    }

    public void setEmailIsExisted(String emailIsExisted) {
        this.emailIsExisted = emailIsExisted;
    }

    public String getInvalidName() {
        return invalidName;
    }

    public void setInvalidName(String invalidName) {
        this.invalidName = invalidName;
    }

}
