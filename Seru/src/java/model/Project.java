package model;

import constants.Constants;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Seruji
 */
@Entity
@Table(name=Constants.PROJECTS_TABLE_NAME)
public class Project implements Serializable {
    @Id
    @Column(name=Constants.PROJECTS_ID_ATTRIBUTE)
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    @Column(name=Constants.PROJECTS_NAME_ATTRIBUTE)
    private String name;
    @Column(name=Constants.PROJECTS_DESC_ATTRIBUTE)
    private String desc;
    @ManyToOne
    @JoinColumn(name=Constants.USERS_ID_ATTRIBUTE)
    private User user;
    @OneToMany(mappedBy=Constants.PROJECTS_MAPPED_BY, cascade=CascadeType.ALL)
    private Set<Task> tasks;
    // <editor-fold defaultstate="collapsed" desc="Constuctors, Getters and Setters">
    public Project() {
    }

    public Project(User user, String name, String desc) {
        this.name = name;
        this.desc = desc;
        this.user = user;
        this.tasks = new HashSet<>();
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

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<Task> getTasks() {
        return tasks;
    }

    public void setTasks(Set<Task> tasks) {
        this.tasks = tasks;
    }
    // </editor-fold>
}
