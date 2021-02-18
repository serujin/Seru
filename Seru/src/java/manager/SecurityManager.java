package manager;

import constants.Constants;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import model.User;

/**
 *
 * @author Seruji
 */
public class SecurityManager {
    public static boolean isACorrectPassword(String password) throws NoSuchAlgorithmException {
        User user = UserManager.getInstance().getLoggedUser();
        String userPassword = user.getPassword();
        String passwordHash = SecurityManager.getHashedString(password);
        return userPassword.equals(passwordHash);
    }
    
    public static String getHashedString(String password) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance(Constants.ENCRYPTION_ALGORITHM);
        byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(hash);
    }
}
