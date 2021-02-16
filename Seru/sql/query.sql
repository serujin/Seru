create database seru;

create table users(
	user_id int auto_increment primary key,
    user_name varchar(200),
    user_password varchar(200)
);

create table projects(
	project_id int auto_increment primary key,
    project_name varchar(200),
    project_desc varchar(200),
    user_id int,
    foreign key (user_id) references users(user_id) on delete cascade
);

create table tasks(
	task_id int auto_increment primary key,
    task_name varchar(200),
    task_desc varchar(200),
    task_created datetime,    
    task_state int,
    project_id int,
    foreign key (project_id) references projects(project_id) on delete cascade
);