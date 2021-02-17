package manager;

import constants.Constants;

/**
 *
 * @author Seruji
 */
public class TranslationManager {
    private static TranslationManager instance;
    
    private String[] currentLanguage;
    
    public static TranslationManager getInstance() {
        if(TranslationManager.instance == null) {
            TranslationManager.instance = new TranslationManager();
        }
        return TranslationManager.instance;
    }
    
    private TranslationManager() {
        changeLanguage(Constants.ENGLISH_LANGUAGE);
    }
    
    public void changeLanguage(int language) {
        this.currentLanguage = Constants.LANGUAGES[language];
    }
    
    public String[] getLanguage() {
        return this.currentLanguage;
    }
}
