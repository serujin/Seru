package model;

import constants.Constants;
import java.io.Serializable;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Seruji
 */
@Entity
@Table(name=Constants.USERS_TABLE_NAME)
public class User implements Serializable {
    @Id
    @Column(name=Constants.USERS_ID_ATTRIBUTE)
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    @Column(name=Constants.USERS_NAME_ATTRIBUTE)
    private String name;
    @Column(name=Constants.USERS_PASSWORD_ATTRIBUTE)
    private String password;
    @OneToMany(mappedBy=Constants.USERS_MAPPED_BY, cascade=CascadeType.ALL)
    private Set<Project> projects;
    // <editor-fold defaultstate="collapsed" desc="Constuctors, Getters and Setters">
    public User() {
    }

    public User(String name, String password) {
        this.name = name;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<Project> getProjects() {
        return projects;
    }

    public void setProjects(Set<Project> projects) {
        this.projects = projects;
    }
    // </editor-fold>      
}
