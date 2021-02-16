package constants;

/**
 *
 * @author Seruji
 */
public class Constants {

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

    public static final int TASK_CREATED_STATE = 0;
    public static final int TASK_STARTED_STATE = 1;
    public static final int TASK_COMPLETED_STATE = 2;
}
