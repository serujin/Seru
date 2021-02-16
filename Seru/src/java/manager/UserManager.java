package manager;

import model.User;

/**
 *
 * @author Seruji
 */
public class UserManager {
    private static UserManager instance;
     
    private User currentUser;
    
    public static UserManager getInstance() {
        if(UserManager.instance == null) {
            UserManager.instance = new UserManager();
        }
        return UserManager.instance;
    }
    
    private UserManager() {
        
    }

    public void login() {
        
    }
    
    public void register() {
        
    }
    
    public void logout() {
        
    }
}
