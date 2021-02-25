package constants;

/**
 *
 * @author Seruji
 */
public class Constants {
    public static final String ENCRYPTION_ALGORITHM = "SHA-256";
    // <editor-fold defaultstate="collapsed" desc="Hibernate config and tables">
    public static final String HIBERNATE_CONFIG_PATH = "./config/hibernate.cfg.xml";

    public static final int MINUTES_TO_REFRESH_SESSION = 1;
    
    public static final String USERS_TABLE_NAME = "users";
    public static final String USERS_ID_ATTRIBUTE = "user_id";
    public static final String USERS_NAME_ATTRIBUTE = "user_name";
    public static final String USERS_PASSWORD_ATTRIBUTE = "user_password";
    public static final String USERS_MAPPED_BY = "user";

    public static final String PROJECTS_TABLE_NAME = "projects";
    public static final String PROJECTS_ID_ATTRIBUTE = "project_id";
    public static final String PROJECTS_NAME_ATTRIBUTE = "project_name";
    public static final String PROJECTS_DESC_ATTRIBUTE = "project_desc";
    public static final String PROJECTS_MAPPED_BY = "project";
    
    public static final String TASKS_TABLE_NAME = "tasks";
    public static final String TASKS_ID_ATTRIBUTE = "task_id";
    public static final String TASKS_NAME_ATTRIBUTE = "task_name";
    public static final String TASKS_DESC_ATTRIBUTE = "task_desc";
    public static final String TASKS_CREATED_ATTRIBUTE = "task_created";
    public static final String TASKS_STATE_ATTRIBUTE = "task_state";
    // </editor-fold>
    public static final int TASK_CREATED_STATE = 0;
    public static final int TASK_STARTED_STATE = 1;
    public static final int TASK_COMPLETED_STATE = 2;
    // <editor-fold defaultstate="collapsed" desc="DB Queries">
    public static final String GET_USER_BY_USERNAME_PARAM = "username";
    public static final String GET_USER_BY_USERNAME = "from User u where u.name = :" + GET_USER_BY_USERNAME_PARAM;
    // </editor-fold>
    public static final String FORM_USERNAME_NAME = "username";
    public static final String FORM_PASSWORD_NAME = "password";
    public static final String FORM_CONFIRM_PASSWORD_NAME = "confirm";
    public static final String FORM_PROJECT_NAME = "project_name";
    public static final String FORM_PROJECT_DESC = "project_desc";
    public static final String FORM_PROJECT_ID = "project_id";
    public static final String FORM_TASK_ID = "task_id";
    public static final String FORM_TASK_NAME = "task_name";
    public static final String FORM_TASK_DESC = "task_desc";
    public static final String FORM_TASK_STATE = "task_state";
    public static final String FORM_SUBMIT_DELETE = "submit_delete";
    public static final String FORM_SUBMIT_CHANGE = "submit_change";
    public static final String FORM_SUBMIT_LANGUAGE = "language_";
    public static final String FORM_CURRENT_PAGE_VALUE = "current_page";
    // <editor-fold defaultstate="collapsed" desc="Language translations">
    public static final String[] EN = {
        "Insert your username",
        "Insert your password",
        "Login",
        "Register",
        "Confirm your password",
        "Back to login",
        "Passwords must be equal",
        "Insert the project's name",
        "Insert the project's description",
        "Create new project",
        "Create",
        "Load project",
        "Create new task",
        "Insert the task's name",
        "Insert the task's desc",
        "Start",
        "Complete",
        "Delete",
        "English",
        "Invalid username, please try again with other username",
        "Successfully eliminated project ",
        "Successfully eliminated task ",
        "Log out",
        "Created tasks",
        "Started tasks",
        "Completed tasks",
        "Back to my projects",
        "%s's Projects",
        "%s's Tasks"
    };
    public static final String[] ES = {
        "Introduce tu nombre",
        "Introduce tu contraseña",
        "Login",
        "Registrarse",
        "Confirma tu contraseña",
        "Volver al login",
        "Las contraseñas deben coincidir",
        "Introduce el nombre del proyecto",
        "Introduce la descripción del proyecto",
        "Crear un nuevo proyecto",
        "Crear",
        "Cargar proyecto",
        "Crear una nueva tarea",
        "Introduce el nombre de la tarea",
        "Introduce la descripción de la tarea",
        "Empezar",
        "Completar",
        "Eliminar",
        "Español",
        "Usuario no válido, por favor inténtalo de nuevo cambiando el usuario",
        "Proyecto eliminado correctamente ",
        "Tarea eliminada correctamente ",
        "Salir",
        "Tareas creadas",
        "Tareas empezadas",
        "Tareas completadas",
        "Volver a mis proyectos",
        "Proyectos de %s",
        "Tareas de %s"
    };
    // </editor-fold>
    public static final String[][] LANGUAGES = {
        EN,
        ES
    };
    
    public static final int ENGLISH_LANGUAGE = 0;
    public static final int SPANISH_LANGUAGE = 1;
    
    public static final String LOGIN_JSP_PATH = "login.jsp";
    public static final String PROJECT_JSP_PATH = "project.jsp";
    public static final String REGISTER_JSP_PATH = "register.jsp";
    public static final String USER_PROJECTS_JSP_PATH = "user_projects.jsp";
    
    public static final int USERNAME_PH = 0;
    public static final int PASSWORD_PH = 1;
    public static final int LOGIN_BTN_VALUE = 2;
    public static final int REGISTER_BTN_VALUE = 3;
    public static final int CONFIRM_PASSWORD_PH = 4;
    public static final int BACK_TO_LOGIN_BTN_VALUE = 5;
    public static final int NOT_EQUAL_PASSWORD_ALERT = 6;
    public static final int PROJECT_NAME_PH = 7;
    public static final int PROJECT_DESC_PH = 8;
    public static final int CREATE_PROJECT_BTN = 9;
    public static final int CREATE_BTN_VALUE = 10;
    public static final int LOAD_PROJECT_BTN_VALUE = 11;
    public static final int CREATE_TASK_BTN_VALUE = 12;
    public static final int TASK_NAME_PH = 13;
    public static final int TASK_DESC_PH = 14;
    public static final int STARTED_TASK_BTN_VALUE = 15;
    public static final int COMPLETED_TASK_BTN_VALUE = 16;
    public static final int DELETE_BTN_VALUE = 17;
    public static final int LANGUAGE_VALUE = 18;
    public static final int INVALID_USERNAME_ALERT = 19;
    public static final int SUCCESSFULLY_DELETE_PROJECT = 20;
    public static final int SUCCESSFULLY_DELETE_TASK = 21;
    public static final int LOG_OUT_BTN_VALUE = 22;
    public static final int CREATED_TASK_TITLE = 23;
    public static final int STARTED_TASK_TITLE = 24;
    public static final int COMPLETED_TASK_TITLE = 25;
    public static final int BACK_TO_PROJECTS_BTN_VALUE = 26;
    public static final int PROJECTS_OF_USER_VALUE = 27;
    public static final int TASKS_OF_PROJECT_VALUE = 28;
}
