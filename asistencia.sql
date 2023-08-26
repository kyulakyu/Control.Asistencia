CREATE DATABASE IF NOT EXISTS control_asistencia;
USE control_asistencia;

-- Tabla "Usuarios"
CREATE TABLE Usuarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  tipo ENUM('Cliente', 'Administrativo', 'Voluntario') NOT NULL,
  correo VARCHAR(100),
  password VARCHAR(255),
  run INT,
  runVoluntario INT,
  rut INT,
  nombre VARCHAR(100),
  nombres VARCHAR(100),
  apellidos VARCHAR(100),
  nombresV VARCHAR(100),
  apellidosV VARCHAR(100),
  telefono INT,
  direccion VARCHAR(200),
  comuna VARCHAR(100),
  fechaNacimiento VARCHAR(20),
  fechaDeIngreso VARCHAR(20),
  clienteAdministrativo VARCHAR(100),
  cargo VARCHAR(100)
);

-- Tabla "Clientes"

CREATE TABLE Clientes (
  id INT PRIMARY KEY,
  tipo ENUM('Cliente', 'Administrativo', 'Voluntario') NOT NULL,
  rut INT,
  nombre VARCHAR(100) NOT NULL,
  telefono INT,
  direccion VARCHAR(200),
  comuna VARCHAR(100),
  fechaNacimiento VARCHAR(20),
  FOREIGN KEY (id) REFERENCES Usuarios(id)
);

-- Tabla "Administrativos"
CREATE TABLE Administrativos (
  id INT PRIMARY KEY,
  tipo ENUM('Cliente', 'Administrativo', 'Voluntario') NOT NULL,
  run INT,
  nombres VARCHAR(100),
  apellidos VARCHAR(100),
  telefono INT,
  direccion VARCHAR(200),
  comuna VARCHAR(100),
  fechaNacimiento VARCHAR(20),
  clienteAdministrativo VARCHAR(100),
  FOREIGN KEY (id) REFERENCES Usuarios(id)
);

-- Tabla "Voluntarios"
CREATE TABLE Voluntarios (
  id INT PRIMARY KEY,
  tipo ENUM('Cliente', 'Administrativo', 'Voluntario') NOT NULL,
  runVoluntario INT,
  nombresV VARCHAR(100),
  apellidosV VARCHAR(100),
  telefono INT,
  direccion VARCHAR(200),
  comuna VARCHAR(100),
  fechaNacimiento VARCHAR(20),
  fechaDeIngreso VARCHAR(20),
  cargo VARCHAR(100),
  FOREIGN KEY (id) REFERENCES Usuarios(id)
);

-- Tabla "Boletin"
CREATE TABLE Boletin (
  id INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(100) NOT NULL,
  fechaBoletin VARCHAR(20),
  detalle TEXT
);

-- Tabla "Reporte"
CREATE TABLE Reporte (
  id INT PRIMARY KEY AUTO_INCREMENT,
  voluntarioId INT,
  fechaReporte VARCHAR(20),
  detalle TEXT,
  FOREIGN KEY (voluntarioId) REFERENCES Voluntarios(id)
);

-- Tabla "Asistencia"
CREATE TABLE Asistencia (
  id INT PRIMARY KEY AUTO_INCREMENT,
  voluntarioId INT,
  fechaAsistencia VARCHAR(20),
  detalle TEXT,
  FOREIGN KEY (voluntarioId) REFERENCES Voluntarios(id)
);

CREATE TABLE control_asistencia.login (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    correo_usuario VARCHAR(100) NOT NULL,
    password_usuario VARCHAR(100) NOT NULL,
    tipo_usuario VARCHAR(100),
  FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Tabla "Contacto"
CREATE TABLE Contacto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    comentario VARCHAR (50) NOT NULL
);

-- script para rellenar la informacion
DELIMITER //

CREATE TRIGGER after_insert_usuarios AFTER INSERT ON Usuarios
FOR EACH ROW
BEGIN
    -- Insertar en la tabla login
    INSERT INTO login (usuario_id, correo_usuario, password_usuario, tipo_usuario)
    VALUES (NEW.id, NEW.correo, NEW.password, NEW.tipo);

    -- Insertar en la tabla correspondiente según el tipo
    IF NEW.tipo = 'Administrativo' THEN
        INSERT INTO Administrativos (id, tipo, run, nombres, apellidos, telefono, direccion, comuna, fechaNacimiento, clienteAdministrativo)
        VALUES (NEW.id, NEW.tipo, NEW.run, NEW.nombres, NEW.apellidos, NEW.telefono, NEW.direccion, NEW.comuna, NEW.fechaNacimiento, NEW.clienteAdministrativo);
	ELSEIF NEW.tipo = 'Voluntario' THEN
        INSERT INTO Voluntarios (id, tipo, runVoluntario, nombresV, apellidosV, telefono, direccion, comuna, fechaNacimiento, fechaDeIngreso, cargo)
        VALUES (NEW.id, NEW.tipo, NEW.runVoluntario, NEW.nombresV, NEW.apellidosV, NEW.telefono, NEW.direccion, NEW.comuna, NEW.fechaNacimiento, NEW.fechaDeIngreso, NEW.cargo);
    ELSEIF NEW.tipo = 'Cliente' THEN
        INSERT INTO Clientes (id, tipo, rut, nombre, telefono, direccion, comuna, fechaNacimiento)
        VALUES (NEW.id, NEW.tipo, NEW.rut, NEW.nombre, NEW.telefono, NEW.direccion, NEW.comuna, NEW.fechaNacimiento);
    END IF;
END;
//

DELIMITER ;

-- Insertar un usuario de cada tipo en la tabla Usuarios
INSERT INTO Usuarios (tipo, correo, password, run, runVoluntario, rut, nombre, nombres, apellidos, nombresV, apellidosV, telefono, direccion, comuna, fechaNacimiento, fechaDeIngreso, clienteAdministrativo, cargo)
VALUES
  ('Administrativo', 'admin@example.com', '$2a$10$lIb.pfhjV2GFHrjBdjOE9.DGt4uk0ziSihwI.SGjTefHhwqAPDW5.', 12345678, NULL, NULL, NULL, 'Admin 1', 'Apellido Admin 1', NULL, NULL, 987654322, 'Calle Admin 1', 'Comuna Admin 1', '10/05/1985', NULL, 'Cliente 1', NULL),
  ('Voluntario', 'voluntario@example.com', '$2a$10$A8c02DE3QPN9jUEmjDZubOETZ4vR4eB4Uw.20Hj4zjJc4gO4mK8b2', NULL, 87654321, NULL, NULL, NULL, NULL, 'Voluntario 1', 'Apellido Voluntario 1', 987654323, 'Calle Voluntario 1', 'Comuna Voluntario 1', '15/12/1998', '06/05/2011', NULL, 'Capitan'),
  ('Cliente', 'cliente@example.com', '$2a$10$O8c02DE3QPN9jUEmjDZubOETZ4vR4eB4Uw.20Hj4zjJc4gO4mK8b2', NULL, NULL, 1234567890, 'Cliente 1', NULL, NULL, NULL, NULL, 987654321, 'Calle Cliente 1', 'Comuna Cliente 1', '01/01/1990', NULL, NULL, NULL);

-- Insertar información en las tablas Boletines, Reporte, Asistencia, Contacto (datos de ejemplo)
INSERT INTO Boletin (titulo, fechaBoletin, detalle)
VALUES ('Boletin 1', '15/08/2023', 'Detalles de la capacitación 1');

INSERT INTO Reporte (voluntarioId, fechaReporte, detalle)
VALUES (2, '10/08/2023', 'Reporte del voluntario 1');

INSERT INTO Asistencia (voluntarioId, fechaAsistencia, detalle)
VALUES (2, '10/08/2023', 'Asistencia del voluntario 1');

INSERT INTO Contacto (nombre, email, comentario)
VALUES ('Persona de Contacto', 'contacto@example.com', 'Comentario sobre el contacto');