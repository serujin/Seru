package model;

import constants.Constants;
import java.io.Serializable;
import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Seruji
 */
@Entity
@Table(name=Constants.TASKS_TABLE_NAME)
public class Task implements Serializable {
    @Id
    @Column(name=Constants.TASKS_ID_ATTRIBUTE)
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    @Column(name=Constants.TASKS_NAME_ATTRIBUTE)
    private String name;
    @Column(name=Constants.TASKS_DESC_ATTRIBUTE)
    private String desc;
    @Column(name=Constants.TASKS_CREATED_ATTRIBUTE, nullable = false, updatable=false)
    private LocalDateTime creation;
    @Column(name=Constants.TASKS_STATE_ATTRIBUTE)
    private int state;
    @ManyToOne
    @JoinColumn(name=Constants.PROJECTS_ID_ATTRIBUTE)
    private Project project;
    // <editor-fold defaultstate="collapsed" desc="Constuctors, Getters and Setters">
    public Task() {
    }

    public Task(String name, String desc, Project project) {
        this.name = name;
        this.desc = desc;
        this.creation = LocalDateTime.now();
        this.state = Constants.TASK_CREATED_STATE;
        this.project = project;
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

    public LocalDateTime getCreation() {
        return creation;
    }

    public void setCreation(LocalDateTime creation) {
        this.creation = creation;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }
    // </editor-fold>
}
