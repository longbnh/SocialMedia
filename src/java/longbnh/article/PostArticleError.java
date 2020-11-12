/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.article;

import java.io.Serializable;

/**
 *
 * @author DELL
 */
public class PostArticleError implements Serializable {

    private String emptyTitle;
    private String emptyDescription;
    private String emptyContent;

    public String getEmptyTitle() {
        return emptyTitle;
    }

    public void setEmptyTitle(String emptyTitle) {
        this.emptyTitle = emptyTitle;
    }

    public String getEmptyDescription() {
        return emptyDescription;
    }

    public void setEmptyDescription(String emptyDescription) {
        this.emptyDescription = emptyDescription;
    }

    public String getEmptyContent() {
        return emptyContent;
    }

    public void setEmptyContent(String emptyContent) {
        this.emptyContent = emptyContent;
    }

}
