-- Estructura inicial para DekoFacil
CREATE DATABASE IF NOT EXISTS dekofacil_db;
USE dekofacil_db;

-- 1. Categorías (Ej: Sillones, Lámparas, Cuadros)
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- 2. Productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sku VARCHAR(50) UNIQUE,           -- Código único de producto
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio_costo DECIMAL(10, 2),      -- Lo que te costó a vos
    precio_venta DECIMAL(10, 2),      -- Lo que ve el cliente
    stock_actual INT DEFAULT 0,
    categoria_id INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- 3. Historial de movimientos (Para no perder el rastro)
CREATE TABLE movimientos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT,
    cantidad INT,                     -- +5 si compraste, -2 si vendiste
    tipo_movimiento ENUM('entrada', 'salida', 'ajuste'),
    nota TEXT,                        -- Ej: "Venta local", "Rotura"
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);