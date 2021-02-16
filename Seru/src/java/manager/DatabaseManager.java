package manager;

import constants.Constants;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.Properties;
import model.Project;
import model.Task;
import model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

/**
 *
 * @author Seruji
 */
public class DatabaseManager {
    private static DatabaseManager instance;
    
    private SessionFactory sessionFactory;
    private Session currentSession;
    private LocalTime currentSessionTime;
    
    public static DatabaseManager getInstance() {
        if(DatabaseManager.instance == null) {
            DatabaseManager.instance = new DatabaseManager();
        }
        return DatabaseManager.instance;
    }
    
    private DatabaseManager() {
        this.currentSessionTime = LocalTime.now();
        this.sessionFactory = initFactory();
    }
    
    public void storeUser(User user) {
        checkSessionTime();
        storeObject(user);
    }
    
    public void storeProject(Project project) {
        checkSessionTime();
        storeObject(project);
    }
    
    public void storeTask(Task task) {
        checkSessionTime();
        storeObject(task);
    }
    
    public void deleteUser(User user) {
        checkSessionTime();
        deleteObject(user);
    }
    
    public void deleteProject(Project project) {
        checkSessionTime();
        deleteObject(project);
    }
    
    public void deleteTask(Task task) {
        checkSessionTime();
        deleteObject(task);
    }
    
    private void storeObject(Object obj) {
        Transaction transaction = this.currentSession.beginTransaction();
        this.currentSession.save(obj);
        transaction.commit();
    }
    
    private void deleteObject(Object obj) {
        Transaction transaction = this.currentSession.beginTransaction();
        this.currentSession.delete(obj);
        transaction.commit();
    }
    
    private void checkSessionTime() {
        if(hasToCreateSession()) {
            this.currentSession.close();
            createSession();
        }
    }
    
    private boolean hasToCreateSession() {
        return ChronoUnit.MINUTES.between(LocalTime.now(), this.currentSessionTime) > Constants.MINUTES_TO_REFRESH_SESSION; 
    }
    
    private void createSession() {
        this.currentSession = this.sessionFactory.openSession();
    }
    
    private SessionFactory initFactory() {
        Configuration cfg = new Configuration();
        cfg.configure(Constants.HIBERNATE_CONFIG_PATH);
        Properties props = cfg.getProperties();
        ServiceRegistry sr = new ServiceRegistryBuilder()
                .applySettings(props)
                .buildServiceRegistry();
        return cfg.buildSessionFactory(sr);
    }
}
