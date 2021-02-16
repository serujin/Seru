/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package delete;

import java.util.HashSet;
import java.util.Set;
import manager.DatabaseManager;
import model.Project;
import model.Task;
import model.User;

/**
 *
 * @author Seruji
 */
public class TestMain {
    public static void main(String[] args) {
        User user = new User("A", "A");
        Project p = new Project("PRJ NAME", "PRJ DESC", user);
        Task task = new Task("PRUEBA TASK", "PRUEBA TASK DESC", p);
        Set<Project> projects = new HashSet<>();
        Set<Task> tasks = new HashSet<>();
        tasks.add(task);
        p.setTasks(tasks);
        projects.add(p);
        user.setProjects(projects);
        DatabaseManager.getInstance().storeUser(user);
    }
}
