--HOMEWORK TUESDAY 28-10-2025
--ALMIRON, PEDRO AUGUSTO DNI:42.791.957


--SALES TABLE
CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    product VARCHAR(50),
    category VARCHAR(30),
    price NUMERIC,
    quantity INT,
    sale_date DATE
);

--DATA
INSERT INTO sales (product, category, price, quantity, sale_date) VALUES
('Mouse', 'Electronics', 15, 4, '2023-07-10'),
('Keyboard', 'Electronics', 30, 2, '2023-07-11'),
('Notebook', 'Stationery', 8, 10, '2023-07-12'),
('Pen', 'Stationery', 2, 25, '2023-07-13'),
('Headphones', 'Electronics', 40, 3, '2023-07-14'),
('Monitor', 'Electronics', 120, 1, '2023-07-15'),
('Desk Chair', 'Furniture', 85, 2, '2023-07-16'),
('Notebook Case', 'Accessories', 25, 3, '2023-07-17'),
('Printer Paper', 'Stationery', 6, 15, '2023-07-18'),
('USB Drive', 'Electronics', 12, 5, '2023-07-19'),
('Desk Lamp', 'Furniture', 35, 4, '2023-07-20'),
('Stapler', 'Stationery', 7, 6, '2023-07-21'),
('Calculator', 'Electronics', 20, 3, '2023-07-22'),
('Water Bottle', 'Accessories', 10, 8, '2023-07-23'),
('Laptop Stand', 'Accessories', 45, 2, '2023-07-24'),
('Office Desk', 'Furniture', 150, 1, '2023-07-25'),
('Whiteboard', 'Furniture', 60, 1, '2023-07-26'),
('Marker Set', 'Stationery', 5, 12, '2023-07-27'),
('Mouse Pad', 'Accessories', 8, 7, '2023-07-28'),
('Webcam', 'Electronics', 50, 2, '2023-07-29'),
('Smartphone', 'Electronics', 300, 1, '2023-07-30'),
('Notebook Pro', 'Electronics', 900, 1, '2023-07-31'),
('File Cabinet', 'Furniture', 120, 1, '2023-08-01'),
('Backpack', 'Accessories', 40, 3, '2023-08-02'),
('Binder', 'Stationery', 4, 20, '2023-08-03'),
('Headset Stand', 'Accessories', 15, 5, '2023-08-04'),
('Desk Organizer', 'Accessories', 12, 6, '2023-08-05'),
('Laptop Sleeve', 'Accessories', 30, 2, '2023-08-06'),
('Paper Clips', 'Stationery', 1, 50, '2023-08-07'),
('Surge Protector', 'Electronics', 25, 3, '2023-08-08'),
('Pen Holder', 'Accessories', 5, 10, '2023-08-09');


--QUERYS 
--1) Mostrar todas las ventas de la categoría "Electronics"
SELECT * 
FROM sales 
WHERE category = 'Electronics';


--2)Calcular el total de ingresos por categoría (price * quantity)
SELECT category, SUM(price * quantity) AS total_ingresos
FROM sales
GROUP BY category;

--3️) Obtener la categoría con mayor ingreso total
SELECT category, SUM(price * quantity) AS total_ingresos
FROM sales
GROUP BY category
ORDER BY total_ingresos DESC
LIMIT 1;


--4) Mostrar todas las ventas donde el precio del producto sea mayor a 20
SELECT *
FROM sales
WHERE price > 20;


--5) Calcular el total de unidades vendidas (SUM(quantity)) por cada producto
SELECT product, SUM(quantity) AS total_unidades_vendidas
FROM sales
GROUP BY product;

--6) Calcular el ingreso promedio por venta (AVG(price * quantity)) para cada producto
SELECT product, AVG(price * quantity) AS ingreso_promedio
FROM sales
GROUP BY product;

--7) Mostrar los 3 productos con mayor cantidad total vendida (SUM(quantity))
SELECT product, SUM(quantity) AS total_vendido
FROM sales
GROUP BY product
ORDER BY total_vendido DESC
LIMIT 3;

--8) Mostrar los 3 productos con mayor cantidad total vendida (SUM(quantity))
SELECT product, SUM(quantity) AS total_vendido
FROM sales
GROUP BY product
ORDER BY total_vendido DESC
LIMIT 3;


--9) Mostrar la categoría y el ingreso total, pero solo para categorías con ingreso > 50
SELECT category, SUM(price * quantity) AS total_ingreso
FROM sales
GROUP BY category
HAVING SUM(price * quantity) > 50;

--10) Mostrar todas las ventas donde el nombre del producto comience con "H"
SELECT *
FROM sales
WHERE product LIKE 'H%';




--TABLA DEPARTMENTS

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100),
    city VARCHAR(50),
    postal_code VARCHAR(10),
    bedrooms INT,
    area_m2 NUMERIC(6,2),
    price NUMERIC(10,2),
    available BOOLEAN,
    published_date DATE
);

--DATA
INSERT INTO departments (name, address, city, postal_code, bedrooms, area_m2, price, available, published_date)
VALUES
('Depto Centro 1', 'Av. Corrientes 1234', 'Buenos Aires', '1001', 2, 65.50, 85000.00, TRUE, '2025-10-10'),
('Depto Palermo', 'Calle Honduras 2345', 'Buenos Aires', '1425', 3, 95.00, 145000.00, TRUE, '2025-09-28'),
('Depto Recoleta', 'Av. Santa Fe 4567', 'Buenos Aires', '1058', 1, 45.30, 78000.00, FALSE, '2025-08-15'),
('Depto Corrientes', 'San Martín 987', 'Corrientes', '3400', 2, 70.00, 90000.00, TRUE, '2025-09-05'),
('Depto Saladas', 'Belgrano 455', 'Saladas', '3420', 3, 120.00, 130000.00, TRUE, '2025-07-12'),
('Depto Goya', '25 de Mayo 890', 'Goya', '3450', 1, 50.00, 70000.00, FALSE, '2025-06-30'),
('Depto Córdoba', 'Colón 230', 'Córdoba', '5000', 2, 80.00, 110000.00, TRUE, '2025-10-01'),
('Depto Mendoza', 'San Juan 760', 'Mendoza', '5500', 4, 150.00, 200000.00, TRUE, '2025-08-20'),
('Depto Rosario', 'Mitre 150', 'Rosario', '2000', 2, 72.50, 97000.00, FALSE, '2025-09-12'),
('Depto Posadas', 'Bolívar 99', 'Posadas', '3300', 1, 40.00, 65000.00, TRUE, '2025-10-18');


--QUERYS 

--1) MOSTRAR TODOS LOS DEPARTAMENTOS DISPOBIBLES 
SELECT * 
FROM departments
WHERE available = TRUE;

--2) MOSTRAR DEPARTAMENTOS EN BUENOS AIRES  
SELECT * 
FROM departments
WHERE city = 'Buenos Aires';

--3)MOSTRAR DEPARTAMENTOS CON MAS DE 2 HABITACIONES 
SELECT * 
FROM departments
WHERE bedrooms > 2;

--4) MOSTRAR LOS 3 DEPARTAMENTOS MAS CAROS 
SELECT * 
FROM departments
ORDER BY price DESC
LIMIT 3;


--5) CALCULAR EL PRECIO PROMEDIO POR CIUDAD 
SELECT city, AVG(price) AS promedio_precio
FROM departments
GROUP BY city;


--6) CALCULAR TOTAL DE METROS CUADRADOS POR CIUDAD
SELECT city, SUM(area_m2) AS total_m2
FROM departments
GROUP BY city;


--7) MOSTRAR LOS DEPARTAMENTOS CON PRECION ENTRE 100000 Y 200000
SELECT * 
FROM departments
WHERE price BETWEEN 100000 AND 200000;


--8) MOSTRAR LOS DEPARTAMENTOS QUE EMPIECEN CON "DEPTO A"
SELECT * 
FROM departments
WHERE name LIKE 'Depto A%';


--9) MOSTRAR DEPARTAMENTOS DISPONIBLES ORDENADOS POR FECHA MAS RECIENTE 
SELECT * 
FROM departments
WHERE available = TRUE
ORDER BY published_date DESC;

--10) MOSTRAR LA CANTIDAD DE DEPARTAMENTOS DISPONIBLES POR CIUDAD
SELECT city, COUNT(*) AS cantidad_disponibles
FROM departments
WHERE available = TRUE
GROUP BY city;














