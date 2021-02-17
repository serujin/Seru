package manager;

import constants.Constants;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
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

    public boolean login(String username, String password) throws NoSuchAlgorithmException { 
        Map<String, Object> params = new HashMap<>();
        params.put(Constants.GET_USER_BY_USERNAME_PARAM, username);
        this.currentUser = (User) DatabaseManager.getInstance().getObjects(Constants.GET_USER_BY_USERNAME, params).get(0);
        return SecurityManager.isACorrectPassword(password);
    }
    
    public void register(String username, String password) throws NoSuchAlgorithmException {
        this.currentUser = new User(username, SecurityManager.getHashedPassword(password));
        DatabaseManager.getInstance().storeUser(this.currentUser);
    }
    
    public void logout() {
        this.currentUser = null;
    }
    
    public User getLoggedUser() {
        return this.currentUser;
    }
}
