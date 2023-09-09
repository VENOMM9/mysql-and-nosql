
-- create db
CREATE DATABASE inventory;

USE inventory;


-- create tables

CREATE TABLE users (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(50) NOT NULL,
    role_id BIGINT DEFAULT 2 NOT NULL
    FOREIGN KEY (role_id) REFERENCES roles(id);


    
);

CREATE TABLE roles (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
    
);
CREATE TABLE category (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
    
);

CREATE TABLE product (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	size ENUM('small', 'medium', 'large') NOT NULL,
    name VARCHAR(50) NOT NULL,
    price BIGINT NOT NULL,
    category_id BIGINT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category(id)

    
);
CREATE TABLE orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_no BIGINT NOT NULL,
	user_id BIGINT NOT NULL,
	product_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE,  
    FOREIGN KEY (product_id) REFERENCES product(id) ON UPDATE CASCADE
    
);




--insert into tables

INSERT INTO roles (name)
    VALUES 
        ('admin'),
        ('user');
        
INSERT INTO users (name, email, password)
    VALUES 
        ("Ann", "ann@gmail.com", "ann");
INSERT INTO users (name, email, password, role_id)
    VALUES 
        ("realLemon", "vykman@gmail.com", "vykman", 1);
        
INSERT INTO users (name, email, password, role_id)
    VALUES 
        ("bryanMz", "bryanmaze@gmail.com", "bryan", 1);
             
        
INSERT INTO category (name)
    VALUES 
        ('Offensive'),
        ('Catastrophic'),
        ('defensive');

INSERT INTO orders ( order_no, user_id, product_id)
    VALUES 
        (2568, 2, 2),
        (1567,3, 1);
        
        
INSERT INTO product (id, name, price, size, category_id)
    VALUES 
        ("samat", 5000, "small", 1),
        ("satan_2", 100000, "large", 2),
        ("patriot", 120000, "medium", 3);



-- select or get from db

DESCRIBE orders;
DESCRIBE product;
SELECT * FROM product;
SELECT * FROM users WHERE role_id = "1";
SELECT * FROM product WHERE name = 'patriot'; 
USE inventory; SELECT * FROM users; 

--update db

SET SQL_SAFE_UPDATES=0;
UPDATE product SET name = 'howitzer' WHERE size = 'medium';
DESCRIBE product;
SELECT * FROM product;
SELECT * FROM users;
UPDATE users SET name = 'Pascal' WHERE role_id = '2';

--delete from db

DELETE FROM product WHERE size = 'medium';
DELETE FROM users WHERE name = 'pascal';

