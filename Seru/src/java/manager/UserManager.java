package manager;

import constants.Constants;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
        params.put(Constants.GET_USER_BY_USERNAME_PARAM, SecurityManager.getHashedString(username));
        this.currentUser = (User) DatabaseManager.getInstance().getObjects(Constants.GET_USER_BY_USERNAME, params).get(0);
        return SecurityManager.isACorrectPassword(password);
    }
    
    public boolean register(String username, String password) throws NoSuchAlgorithmException {
        Map<String, Object> params = new HashMap<>();
        params.put(Constants.GET_USER_BY_USERNAME_PARAM, SecurityManager.getHashedString(username));
        if(isAnAvailableRegister(username, password, params)) {
            this.currentUser = new User(username, password);
            DatabaseManager.getInstance().storeUser(this.currentUser);
            return true;
        } 
        return false;
    }
    
    private boolean isAnAvailableRegister(String username, String password, Map<String, Object> params) throws NoSuchAlgorithmException {
        User registering = new User(SecurityManager.getHashedString(username), SecurityManager.getHashedString(password));
        List<User> existingUsers = new ArrayList<>();
        List<Object> objects = DatabaseManager.getInstance().getObjects(Constants.GET_USER_BY_USERNAME, params);
        for(Object u : objects) {
            existingUsers.add((User) u);
        }
        boolean valid = true;
        for(User u : existingUsers) {
            if(u.getName().equalsIgnoreCase(registering.getName())) {
                valid = false;
            }
        }
        return valid;
    }
    
    public void logout() {
        this.currentUser = null;
    }
    
    public User getLoggedUser() {
        return this.currentUser;
    }
}
