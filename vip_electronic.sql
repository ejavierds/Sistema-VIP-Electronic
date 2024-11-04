CREATE DATABASE vip_electronic;
USE vip_electronic;

-- Tabla Usuario
CREATE TABLE Usuario (
    tipo_documento VARCHAR(50) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    PRIMARY KEY (tipo_documento)
);

-- Tabla Administrador
CREATE TABLE Administrador (
    tipo_documento VARCHAR(50) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    PRIMARY KEY (tipo_documento),
    FOREIGN KEY (tipo_documento) REFERENCES Usuario(tipo_documento)
);

-- Tabla Empleado
CREATE TABLE Empleado (
    tipo_documento VARCHAR(50) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    PRIMARY KEY (tipo_documento),
    FOREIGN KEY (tipo_documento) REFERENCES Usuario(tipo_documento)
);

-- Tabla Cliente
CREATE TABLE Cliente (
    tipo_documento VARCHAR(50) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    correo VARCHAR(100) NOT NULL,
    PRIMARY KEY (tipo_documento),
    FOREIGN KEY (tipo_documento) REFERENCES Usuario(tipo_documento)
);

-- Tabla Contrato
CREATE TABLE Contrato (
    num_contrato INT NOT NULL AUTO_INCREMENT,
    servicio VARCHAR(100) NOT NULL,
    estado VARCHAR(50),
    fecha_inicio DATE,
    fecha_fin DATE,
    PRIMARY KEY (num_contrato),
    FOREIGN KEY (servicio) REFERENCES Servicio(num_asignacion),
    FOREIGN KEY (tipo_documento_cliente) REFERENCES Cliente(tipo_documento),
    FOREIGN KEY (tipo_documento_empleado) REFERENCES Empleado(tipo_documento)
);

-- Tabla Servicio
CREATE TABLE Servicio (
    num_asignacion INT NOT NULL AUTO_INCREMENT,
    tipo_servicio VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_servicio DATE,
    estado VARCHAR(50),
    PRIMARY KEY (num_asignacion)
);

-- Tabla Reporte
CREATE TABLE Reporte (
    numreporte INT NOT NULL AUTO_INCREMENT,
    descripcion TEXT,
    fecha DATE,
    num_incidencias INT,
    cliente VARCHAR(50),
    empleado VARCHAR(50),
    servicio INT,
    PRIMARY KEY (numreporte),
    FOREIGN KEY (cliente) REFERENCES Cliente(tipo_documento),
    FOREIGN KEY (empleado) REFERENCES Empleado(tipo_documento),
    FOREIGN KEY (servicio) REFERENCES Servicio(num_asignacion)
);

-- Tabla Factura
CREATE TABLE Factura (
    num_factura INT NOT NULL AUTO_INCREMENT,
    monto FLOAT,
    fechaemision DATE,
    PRIMARY KEY (num_factura)
);

-- Tabla Pago
CREATE TABLE Pago (
    tipo VARCHAR(50),
    fecha DATE,
    monto FLOAT,
    num_factura INT,
    tipo_documento_cliente VARCHAR(50),
    PRIMARY KEY (num_factura),
    FOREIGN KEY (num_factura) REFERENCES Factura(num_factura),
    FOREIGN KEY (tipo_documento_cliente) REFERENCES Cliente(tipo_documento)
);

-- Tabla Incidencia
CREATE TABLE Incidencia (
    numerofallas INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100),
    PRIMARY KEY (numerofallas),
    FOREIGN KEY (numreporte) REFERENCES Reporte(numreporte)
);
