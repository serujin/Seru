package manager;

import model.Project;
import model.Task;

/**
 *
 * @author Seruji
 */
public class TaskManager {
    
    private static TaskManager instance;
     
    private Task currentTask;
    
    public static TaskManager getInstance() {
        if(TaskManager.instance == null) {
            TaskManager.instance = new TaskManager();
        }
        return TaskManager.instance;
    }
    
    private TaskManager() {
        
    }
    
    public void setCurrentTask(int id) {
        for(Task t : ProjectManager.getInstance().getCurrentProject().getTasks()) {
            if(t.getId() == id) {
                this.currentTask = t;
            }
        }
    }
    
    public void createTask(String name, String desc) {
        Project currentProject = ProjectManager.getInstance().getCurrentProject();
        this.currentTask = new Task(currentProject, name, desc);
        currentProject.getTasks().add(this.currentTask);
        DatabaseManager.getInstance().storeTask(this.currentTask);
    }
    
    public void deleteTask() {
        Project currentProject = ProjectManager.getInstance().getCurrentProject();
        currentProject.getTasks().remove(this.currentTask);
        DatabaseManager.getInstance().deleteTask(this.currentTask);
    }
    
    public void changeTaskState(int state) {
        this.currentTask.setState(state + 1);
        DatabaseManager.getInstance().storeTask(this.currentTask);
    }

    public Task getCurrentTask() {
        return this.currentTask;
    }
}
