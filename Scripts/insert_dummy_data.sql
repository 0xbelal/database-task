USE ecommerce;

SET FOREIGN_KEY_CHECKS = 0;


INSERT INTO Customers (name, email, phone, address, username, password) VALUES
('Ahmed Hassan',  'ahmed.hassan@gmail.com',   '01012345678', '12 Tahrir St, Cairo',      'ahmed_h',   'pass1234'),
('Sara Mohamed',  'sara.mohamed@gmail.com',   '01112345678', '5 Nile Corniche, Giza',    'sara_m',    'sara5678'),
('Omar Khaled',   'omar.khaled@yahoo.com',    '01212345678', '88 Ramses Ave, Cairo',     'omar_k',    'omar9999'),
('Nour Ibrahim',  'nour.ibrahim@hotmail.com', '01512345678', '3 El-Nasr Rd, Alexandria', 'nour_i',    'nour2024'),
('Youssef Ali',   'youssef.ali@gmail.com',    '01612345678', '20 October Bridge, Cairo', 'youssef_a', 'youss321');


INSERT INTO product_category (category_name) VALUES
('Electronics'),
('Books'),
('Home & Kitchen'),
('Clothing'),
('Sports & Outdoors');


INSERT INTO product_catalog (name, description, price, quantity, category_id) VALUES
('Apple AirPods Pro 2nd Gen',   'Active Noise Cancellation, Adaptive Transparency, MagSafe Charging Case', 249.99,  150, 1),
('Samsung 65 QLED 4K Smart TV', 'Quantum HDR, Neo Quantum Processor 4K, Object Tracking Sound, Gaming Hub', 1299.99,  40, 1),
('Logitech MX Master 3S Mouse', 'Silent clicks, 8K DPI, Ergonomic design, USB-C charging',                   99.99, 200, 1),
('Atomic Habits - James Clear', 'An Easy and Proven Way to Build Good Habits and Break Bad Ones. Hardcover.', 16.99, 500, 2),
('The Pragmatic Programmer',    'Your Journey to Mastery, 20th Anniversary Edition.',                         49.99, 300, 2),
('Instant Pot Duo 7-in-1',      'Pressure Cooker, Slow Cooker, Rice Cooker, Steamer, 6 Quart',               89.99, 120, 3),
('Dyson V15 Detect Vacuum',     'Cordless, laser dust detection, HEPA filtration, 60min run time',          699.99,  55, 3),
('Nike Air Max 270',            'Mens running shoes, Air cushioning, Mesh upper',                           129.99, 250, 4),
('Adidas Ultraboost 23',        'BOOST midsole, Primeknit+ upper, Continental rubber outsole',              179.99, 180, 4),
('Yoga Mat Liforme Original',   'Eco-friendly, non-slip, 4.2mm thick, alignment markers',                   149.99,  90, 5);



INSERT INTO product_images (url, product_id, image_order) VALUES
('https://images.amazon.com/airpods-pro-main.jpg',  1, 1),
('https://images.amazon.com/airpods-pro-case.jpg',  1, 2),
('https://images.amazon.com/samsung-tv-front.jpg',  2, 1),
('https://images.amazon.com/samsung-tv-side.jpg',   2, 2),
('https://images.amazon.com/mx-master-main.jpg',    3, 1),
('https://images.amazon.com/atomic-habits.jpg',     4, 1),
('https://images.amazon.com/pragmatic-prog.jpg',    5, 1),
('https://images.amazon.com/instant-pot-main.jpg',  6, 1),
('https://images.amazon.com/dyson-v15-main.jpg',    7, 1),
('https://images.amazon.com/nike-air-max-main.jpg', 8, 1),
('https://images.amazon.com/adidas-ultra-main.jpg', 9, 1),
('https://images.amazon.com/liforme-mat-main.jpg', 10, 1);



INSERT INTO orders (customer_id, date, total_amount, status) VALUES
(1, '2025-01-10 10:30:00',  349.98, 4),
(2, '2025-01-15 14:00:00', 1299.99, 4),
(3, '2025-02-01 09:15:00',   66.98, 4),
(4, '2025-02-20 16:45:00',  269.98, 3),
(5, '2025-03-05 11:00:00',   89.99, 2),
(1, '2025-03-18 13:30:00',  699.99, 1),
(2, '2025-04-02 08:00:00',  179.99, 3);




INSERT INTO order_items (order_id, product_id) VALUES
(1, 1), (1, 3),
(2, 2),
(3, 4), (3, 5),
(4, 8), (4, 10),
(5, 6),
(6, 7),
(7, 9);




INSERT INTO reviews (product_id, customer_id, review, rating, date) VALUES
(1, 1, 'Amazing sound quality! Noise cancellation is top-notch. Worth every penny.', 5.0, '2025-01-25 12:00:00'),
(2, 2, 'Picture quality is stunning. Setup was easy and smart features work great.', 4.5, '2025-02-01 15:30:00'),
(4, 3, 'Life-changing book! Changed the way I think about habits and productivity.',  5.0, '2025-02-15 10:00:00'),
(5, 3, 'Must-read for every developer. Timeless advice that still applies today.',    5.0, '2025-02-16 11:00:00'),
(8, 4, 'Very comfortable shoes, great for long runs. True to size.',                 4.0, '2025-03-10 09:00:00'),
(3, 1, 'Best mouse I ever used. The scroll wheel is incredibly smooth.',             4.5, '2025-02-05 14:00:00');





INSERT INTO payments (order_id, amount, method, date) VALUES
(1,  349.98, 'Credit Card',      '2025-01-10 10:31:00'),
(2, 1299.99, 'PayPal',           '2025-01-15 14:01:00'),
(3,   66.98, 'Debit Card',       '2025-02-01 09:16:00'),
(4,  269.98, 'Credit Card',      '2025-02-20 16:46:00'),
(5,   89.99, 'Cash on Delivery', '2025-03-05 11:01:00'),
(6,  699.99, 'Credit Card',      '2025-03-18 13:31:00'),
(7,  179.99, 'PayPal',           '2025-04-02 08:01:00');





INSERT INTO shipping (order_id, carrier_name, tracking_no, status, estimated_delivery_date, actual_delivery_date) VALUES
(1, 'Amazon Logistics', 'AMZ-2025-001-EG', 4, '2025-01-15', '2025-01-14 18:00:00'),
(2, 'DHL Express',      'DHL-2025-002-EG', 4, '2025-01-22', '2025-01-21 14:00:00'),
(3, 'FedEx',            'FDX-2025-003-EG', 4, '2025-02-07', '2025-02-06 11:00:00'),
(4, 'Amazon Logistics', 'AMZ-2025-004-EG', 2, '2025-02-27', NULL),
(5, 'DHL Express',      'DHL-2025-005-EG', 1, '2025-03-12', NULL),
(6, 'FedEx',            'FDX-2025-006-EG', 1, '2025-03-25', NULL),
(7, 'Amazon Logistics', 'AMZ-2025-007-EG', 2, '2025-04-09', NULL);

SET FOREIGN_KEY_CHECKS = 1;



