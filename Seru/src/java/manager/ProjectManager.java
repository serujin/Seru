package manager;

import java.util.Set;
import model.Project;
import model.User;

/**
 *
 * @author Seruji
 */
public class ProjectManager {
    private static ProjectManager instance;
     
    private Project currentProject;
    
    public static ProjectManager getInstance() {
        if(ProjectManager.instance == null) {
            ProjectManager.instance = new ProjectManager();
        }
        return ProjectManager.instance;
    }
    
    private ProjectManager() {
        
    }
    
    public void loadProject(int id) {
        Set<Project> projects = UserManager.getInstance().
                getLoggedUser().getProjects();
        for(Project p : projects) {
           if(p.getId() == id) {
               this.currentProject = p;
           }
        }
    }
    
    public void createProject(String name, String desc) {
        User loggedUser = UserManager.getInstance().getLoggedUser();
        this.currentProject = new Project(loggedUser, name, desc);
        loggedUser.getProjects().add(this.currentProject);
        DatabaseManager.getInstance().storeProject(this.currentProject);
    }
    
    public void deleteProject() {
        UserManager.getInstance().getLoggedUser().getProjects().remove(this.currentProject);
        DatabaseManager.getInstance().deleteProject(this.currentProject);
    }
    
    public Project getCurrentProject() {
        return this.currentProject;
    }
}
