package manager;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import model.Project;
import model.Task;
import model.User;
import org.hibernate.Query;
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
    
    private Session currentSession;
    
    public static DatabaseManager getInstance() {
        if(DatabaseManager.instance == null) {
            DatabaseManager.instance = new DatabaseManager();
        }
        return DatabaseManager.instance;
    }
    
    private DatabaseManager() {
        createSession();
    }
    
    public void storeUser(User user) {
        storeObject(user);
    }
    
    public void storeProject(Project project) {
        storeObject(project);
    }
    
    public void storeTask(Task task) {
        storeObject(task);
    }
    
    public void deleteUser(User user) {
        deleteObject(user);
    }
    
    public void deleteProject(Project project) {
        deleteObject(project);
    }
    
    public void deleteTask(Task task) {
        deleteObject(task);
    }
    
    public List<Object> getObjects(String query) {
        return this.currentSession.createQuery(query).list();
    }
    
    public List<Object> getObjects(String query, Map<String, Object> params) {
        Query q = this.currentSession.createQuery(query);
        params.keySet().forEach((key) -> {
            q.setParameter(key, params.get(key));
        });
        return q.list();
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
    
    private void createSession() {
        this.currentSession = initFactory().openSession();
    }
    
    private SessionFactory initFactory() {
        Configuration cfg = new Configuration();
        cfg.configure();
        Properties props = cfg.getProperties();
        ServiceRegistry sr = new ServiceRegistryBuilder()
                .applySettings(props)
                .buildServiceRegistry();
        return cfg.buildSessionFactory(sr);
    }
}
