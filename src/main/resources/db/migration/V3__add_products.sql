INSERT INTO products (id, price, title)
VALUES
(1, 5000.0, 'Adidas'),
(2, 6700.0, 'Nike'),
(3, 4900.0, 'Reebok'),
(4, 7400.0, 'Converse'),
(5, 6300.0, 'Puma');

ALTER SEQUENCE product_seq RESTART WITH 6;
