-- Created the DB "wizard_schools_db" (only works on local connections)
CREATE DATABASE bamazon;
USE bamazon;

-- Created the table "PRODUCTS" 
CREATE TABLE PRODUCTS (
  item_id int AUTO_INCREMENT,
  product_name varchar(30) NOT NULL,
  department_name varchar(30) NOT NULL,
  price DECIMAL(8, 2) NOT NULL,
  stock_quantity INT NOT NULL,
  product_sales DECIMAL(15, 2) NOT NULL,
  PRIMARY KEY(item_id)
);

-- Inserted a set of records into the table
INSERT INTO PRODUCTS (product_name, department_name, price, stock_quantity, product_sales) VALUES ("Ibanez guitar", "MUSIC", 999.98, 3, 956);
INSERT INTO PRODUCTS (product_name, department_name, price, stock_quantity, product_sales) VALUES ("yamaha SV130", "MUSIC", 899.98, 1, 950);
INSERT INTO PRODUCTS (product_name, department_name, price, stock_quantity, product_sales) VALUES ("beans", "FOOD", 2.34, 312, 231);
INSERT INTO PRODUCTS (product_name, department_name, price, stock_quantity, product_sales) VALUES ("BANANAS", "FOOD", 1.24, 300, 904);
INSERT INTO PRODUCTS (product_name, department_name, price, stock_quantity, product_sales) VALUES ("Frisbee", "SPORTS", 9.98, 3, 9605);
INSERT INTO PRODUCTS (product_name, department_name, price, stock_quantity, product_sales) VALUES ("harry potter", "BOOKS", 99.98, 3, 596);
INSERT INTO PRODUCTS (product_name, department_name, price, stock_quantity, product_sales) VALUES ("Bird Food", "PETS", 7.98, 378, 1234);


-- Created the table "DEPARTMENTS" 
CREATE TABLE DEPARTMENTS (
  department_id int AUTO_INCREMENT,
  department_name varchar(30) NOT NULL,
  over_head_costs DECIMAL(8, 2) NOT NULL,
  PRIMARY KEY(department_id)
);

-- insert the departments
INSERT INTO DEPARTMENTS (department_name, over_head_costs) VALUES ("MUSIC", 6999.98);
INSERT INTO DEPARTMENTS (department_name, over_head_costs) VALUES ("FOOD", 6329.98);
INSERT INTO DEPARTMENTS (department_name, over_head_costs) VALUES ("SPORTS", 1234.98);
INSERT INTO DEPARTMENTS (department_name, over_head_costs) VALUES ("BOOKS", 90.98);
INSERT INTO DEPARTMENTS (department_name, over_head_costs) VALUES ("PETS", 540.98);