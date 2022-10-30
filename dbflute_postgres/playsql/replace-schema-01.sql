DROP database IF EXISTS management_books;

CREATE DATABASE management_books;

USE management_books;

CREATE TABLE mst_books (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  title varchar(100) NOT NULL,
  summary varchar(200) NOT NULL,
  image_path varchar(50) DEFAULT NULL,
  registered_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_by varchar(20) NOT NULL,
  delete_flag int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

CREATE TABLE txn_category (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  book_id int(10) unsigned NOT NULL,
  category varchar(50) NOT NULL,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_by varchar(20) NOT NULL,
  delete_flag int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  FOREIGN KEY (book_id) REFERENCES mst_books (id) ON UPDATE CASCADE
);

CREATE TABLE txn_detail (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  book_id int(10) unsigned NOT NULL,
  detail varchar(50) NOT NULL,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_by varchar(20) NOT NULL,
  delete_flag int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  FOREIGN KEY (book_id) REFERENCES mst_books (id) ON UPDATE CASCADE
);

CREATE TABLE company (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_by varchar(20) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE department (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_by varchar(20) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE abilities (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  get_bln tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  edit_bln tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  create_bln tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  delete_bln tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

CREATE TABLE roles (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE role_ability (
  role_id int(10) unsigned NOT NULL,
  ability_id int(10) unsigned NOT NULL,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_by varchar(20) NOT NULL,
  delete_flag int(1) NOT NULL DEFAULT 0,
  FOREIGN KEY (role_id) REFERENCES roles (id) ON UPDATE CASCADE,
  FOREIGN KEY (ability_id) REFERENCES abilities (id) ON UPDATE CASCADE
);


CREATE TABLE mst_users (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(20) NOT NULL,
  email varchar(200) NOT NULL,
  password varchar(20) NOT NULL DEFAULT 'vrst',
  company_id int(10) unsigned NOT NULL,
  department_id int(10) unsigned NOT NULL,
  role_id int(10) unsigned NOT NULL,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_by varchar(20) NOT NULL,
  delete_flag int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  FOREIGN KEY (company_id) REFERENCES company (id) ON UPDATE CASCADE,
  FOREIGN KEY (department_id) REFERENCES department (id) ON UPDATE CASCADE,
  FOREIGN KEY (role_id) REFERENCES roles (id) ON UPDATE CASCADE
);

CREATE TABLE process_type (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  type varchar(20) NOT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE mst_stocks (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  book_id int(10) unsigned NOT NULL,
  quantity int(10) unsigned NOT NULL DEFAULT 1,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_by varchar(20) NOT NULL,
  delete_flag int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  FOREIGN KEY (book_id) REFERENCES mst_books (id) ON UPDATE CASCADE
);

CREATE TABLE txn_stock (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  stock_id int(10) unsigned NOT NULL,
  process_id int(10) unsigned NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (stock_id) REFERENCES mst_stocks (id) ON UPDATE CASCADE,
  FOREIGN KEY (process_id) REFERENCES process_type (id) ON UPDATE CASCADE
);

CREATE TABLE mst_rent (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  user_id int(10) unsigned NOT NULL,
  txn_stock_id int(10) unsigned NOT NULL,
  rent_at date NOT NULL,
  return_at date NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES mst_users (id) ON UPDATE CASCADE,
  FOREIGN KEY (txn_stock_id) REFERENCES txn_stock (id) ON UPDATE CASCADE
);

CREATE TABLE txn_rent(
  rent_id int(10) unsigned NOT NULL,
  process_id int(10) unsigned NOT NULL,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_by varchar(20) NOT NULL,
  FOREIGN KEY (rent_id) REFERENCES mst_rent (id) ON UPDATE CASCADE,
  FOREIGN KEY (process_id) REFERENCES process_type (id) ON UPDATE CASCADE
);