USE ecommerce;


CREATE TABLE Customers (
     id INT PRIMARY KEY AUTO_INCREMENT,
     name varchar(100) NOT NULL,
     email varchar(100) UNIQUE,
     phone varchar(20) UNIQUE,
     address varchar(100),
    username varchar(50) UNIQUE ,
    password varchar(50)
);


CREATE TABLE product_category (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    category_name VARCHAR(100) NOT NULL 
);

CREATE TABLE product_catalog (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    category_id INT NOT NULL, 

    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

create table product_images (
	id int primary key auto_increment,
	url varchar(500) ,
	product_id int not null,
	image_order smallint ,
	
	foreign key(product_id) references product_catalog(id)
);


create table orders (
	id int primary key auto_increment,
	customer_id int not null,
	date datetime not null,
	total_amount decimal(10,4) not null,
	status smallint not null, 
	
	foreign key (customer_id) references Customers(id)
);

create table order_items (
	order_id int not null,
	product_id int not null,
	
	primary key(order_id,product_id),
	
	foreign key(order_id) references orders(id),
	foreign key(product_id) references product_catalog(id)
);

create table reviews (
	id int primary key auto_increment,
	product_id int not null, 
	customer_id int not null, 
	review varchar(500) not null,
	rating decimal(5,1) not null,
	date datetime not null,
	
	foreign key(customer_id) references Customers(id),
	foreign key(product_id) references product_catalog(id)
);


create table payments(
	id int primary key auto_increment,
	order_id int not null,
	amount decimal(10,4) not null,
	method varchar(50),
	date datetime not null,
	
	foreign key(order_id) references orders(id)
);

create table shipping (
	id int primary key auto_increment,
	order_id int not null,
	carrier_name varchar(100) not null,
	tracking_no varchar(50) not  null,
	status smallint not null, 
	estimated_delivery_date datetime,
	actual_delivery_date datetime,
	
	foreign key(order_id) references orders(id)
);

