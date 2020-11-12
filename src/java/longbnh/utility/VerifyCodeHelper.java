/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.utility;

import java.io.Serializable;
import java.security.SecureRandom;

/**
 *
 * @author DELL
 */
public class VerifyCodeHelper implements Serializable {

    static final String REGEX = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    static SecureRandom RND = new SecureRandom();

    public String generateCode() {
        StringBuilder sb = new StringBuilder(8);
        for (int i = 0; i < 8; i++) {
            sb.append(REGEX.charAt(RND.nextInt(REGEX.length())));
        }
        return sb.toString();
    }
}
