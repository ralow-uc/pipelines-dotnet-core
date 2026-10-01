-- Esquema inicial de la tienda. Solo corre cuando el volumen de datos esta vacio.

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    categoria VARCHAR(40) NOT NULL,
    precio INT NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    CONSTRAINT chk_precio CHECK (precio > 0),
    CONSTRAINT chk_stock CHECK (stock >= 0)
);

CREAT TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    email VARCHAR(80) NOT NULL UNIQUE,
    comuna VARCHAR(40),
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    CONSTRAINT chk_cantidad CHECK (cantidad > 0)
);

-- Cada despliegue del pipeline deja una fila aca, asi se ve en la base que version corre en cada entorno
CREATE TABLE registro_despliegues (
    id INT AUTO_INCREMENT PRIMARY KEY,
    version VARCHAR(30) NOT NULL,
    entorno VARCHAR(20) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO productos (nombre, categoria, precio, stock) VALUES
    ('Teclado mecanico 60%', 'Perifericos', 39990, 25),
    ('Mouse inalambrico', 'Perifericos', 14990, 60),
    ('Monitor 24 pulgadas', 'Pantallas', 119990, 12),
    ('Audifonos con microfono', 'Audio', 24990, 40),
    ('Webcam HD 1080p', 'Video', 29990, 18),
    ('Hub USB-C 7 en 1', 'Accesorios', 34990, 30),
    ('Disco SSD 500 GB', 'Almacenamiento', 44990, 22),
    ('Parlante bluetooth', 'Audio', 19990, 35);

INSERT INTO clientes (nombre, email, comuna) VALUES
    ('Camila Rojas', 'camila.rojas@example.com', 'Providencia'),
    ('Diego Fuentes', 'diego.fuentes@example.com', 'Maipu'),
    ('Valentina Soto', 'valentina.soto@example.com', 'Nunoa');

INSERT INTO pedidos (cliente_id, producto_id, cantidad) VALUES
    (1, 1, 1),
    (1, 4, 2),
    (2, 3, 1),
    (3, 7, 1);
