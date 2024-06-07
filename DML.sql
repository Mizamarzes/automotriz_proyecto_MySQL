-- #########################################################################
-- #### COMANDOS DML INSERCION DE DATOS | Juan Diego Contreras ##################
-- ######################################################################
-- Este archivo realiza la insercion de los datos necesarios 
-- para las consultas requeridas

-- Selección de la base de datos
USE automotriz_db;

-- ############### INSERCIONES INICIALES ####################################

-- Inserciones para la tabla pais
INSERT INTO pais (nombre) VALUES 
('Estados Unidos'), ('México'), ('Canadá'), ('Colombia'), ('Argentina'),
('Brasil'), ('España'), ('Francia'), ('Alemania'), ('Italia'),
('Japón'), ('China'), ('India'), ('Rusia'), ('Australia'),
('Reino Unido'), ('Sudáfrica'), ('Egipto'), ('Nigeria'), ('Arabia Saudita');

-- Inserciones para la tabla region
INSERT INTO region (nombre) VALUES 
('California'), ('Nuevo León'), ('Ontario'), ('Bogotá'), ('Buenos Aires'),
('São Paulo'), ('Cataluña'), ('Île-de-France'), ('Baviera'), ('Lombardía'),
('Tokio'), ('Guangdong'), ('Maharashtra'), ('Moscú'), ('Nueva Gales del Sur'),
('Inglaterra'), ('Gauteng'), ('Cairo'), ('Lagos'), ('Riad');

-- Inserciones para la tabla ciudad
INSERT INTO ciudad (nombre) VALUES 
('Los Ángeles'), ('Monterrey'), ('Toronto'), ('Bogotá'), ('Buenos Aires'),
('São Paulo'), ('Barcelona'), ('París'), ('Múnich'), ('Milán'),
('Tokio'), ('Cantón'), ('Mumbai'), ('Moscú'), ('Sídney'),
('Londres'), ('Johannesburgo'), ('Cairo'), ('Lagos'), ('Riad');

-- Inserciones para la tabla cliente
INSERT INTO cliente (nombre, apellido, email) VALUES 
('Juan', 'Pérez', 'juan.perez@example.com'), ('María', 'López', 'maria.lopez@example.com'), 
('Carlos', 'García', 'carlos.garcia@example.com'), ('Ana', 'Martínez', 'ana.martinez@example.com'), 
('Luis', 'Hernández', 'luis.hernandez@example.com'), ('Laura', 'González', 'laura.gonzalez@example.com'), 
('José', 'Rodríguez', 'jose.rodriguez@example.com'), ('Marta', 'Fernández', 'marta.fernandez@example.com'), 
('David', 'Sánchez', 'david.sanchez@example.com'), ('Lucía', 'Ramírez', 'lucia.ramirez@example.com'), 
('Jorge', 'Díaz', 'jorge.diaz@example.com'), ('Sofía', 'Torres', 'sofia.torres@example.com'), 
('Miguel', 'Vásquez', 'miguel.vasquez@example.com'), ('Isabel', 'Castro', 'isabel.castro@example.com'), 
('Pedro', 'Moreno', 'pedro.moreno@example.com'), ('Elena', 'Rojas', 'elena.rojas@example.com'), 
('Manuel', 'Mendoza', 'manuel.mendoza@example.com'), ('Rosa', 'Ortiz', 'rosa.ortiz@example.com'), 
('Andrés', 'Guerrero', 'andres.guerrero@example.com'), ('Julia', 'Iglesias', 'julia.iglesias@example.com');

-- Inserciones para la tabla direccion_cliente
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES 
(1, 1, 1, 1, '123 Calle Principal'), (2, 2, 2, 2, '456 Avenida Secundaria'), 
(3, 3, 3, 3, '789 Calle Tercera'), (4, 4, 4, 4, '101 Calle Cuarta'), 
(5, 5, 5, 5, '202 Calle Quinta'), (6, 6, 6, 6, '303 Calle Sexta'), 
(7, 7, 7, 7, '404 Calle Séptima'), (8, 8, 8, 8, '505 Calle Octava'), 
(9, 9, 9, 9, '606 Calle Novena'), (10, 10, 10, 10, '707 Calle Décima'), 
(11, 11, 11, 11, '808 Calle Once'), (12, 12, 12, 12, '909 Calle Doce'), 
(13, 13, 13, 13, '1010 Calle Trece'), (14, 14, 14, 14, '1111 Calle Catorce'), 
(15, 15, 15, 15, '1212 Calle Quince'), (16, 16, 16, 16, '1313 Calle Dieciséis'), 
(17, 17, 17, 17, '1414 Calle Diecisiete'), (18, 18, 18, 18, '1515 Calle Dieciocho'), 
(19, 19, 19, 19, '1616 Calle Diecinueve'), (20, 20, 20, 20, '1717 Calle Veinte');

-- Inserciones para la tabla tipo_telefono
INSERT INTO tipo_telefono (tipo) VALUES 
('Móvil'), ('Casa'), ('Trabajo'), ('Fax'), ('Otro');

-- Inserciones para la tabla telefono_cliente
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES 
(1, 1, '5551234567'), (2, 2, '5552345678'), (3, 3, '5553456789'), 
(4, 4, '5554567890'), (5, 5, '5555678901'), (6, 1, '5556789012'), 
(7, 2, '5557890123'), (8, 3, '5558901234'), (9, 4, '5559012345'), 
(10, 5, '5550123456'), (11, 1, '5551234567'), (12, 2, '5552345678'), 
(13, 3, '5553456789'), (14, 4, '5554567890'), (15, 5, '5555678901'), 
(16, 1, '5556789012'), (17, 2, '5557890123'), (18, 3, '5558901234'), 
(19, 4, '5559012345'), (20, 5, '5550123456');

-- Inserciones para la tabla marca
INSERT INTO marca (nombre) VALUES 
('Toyota'), ('Ford'), ('Chevrolet'), ('Honda'), ('Nissan'),
('BMW'), ('Mercedes-Benz'), ('Audi'), ('Volkswagen'), ('Hyundai'),
('Kia'), ('Mazda'), ('Subaru'), ('Lexus'), ('Dodge'),
('Jeep'), ('Ram'), ('Chrysler'), ('Buick'), ('GMC');

-- Inserciones para la tabla vehiculo
INSERT INTO vehiculo (placa, marca_id, modelo, año_fabricacion, cliente_id) VALUES 
('ABC123', 1, 'Corolla', 2020, 1), ('DEF456', 2, 'Mustang', 2018, 2), 
('GHI789', 3, 'Silverado', 2019, 3), ('JKL012', 4, 'Civic', 2021, 4), 
('MNO345', 5, 'Altima', 2022, 5), ('PQR678', 6, 'X5', 2020, 6), 
('STU901', 7, 'C-Class', 2017, 7), ('VWX234', 8, 'A4', 2018, 8), 
('YZA567', 9, 'Passat', 2019, 9), ('BCD890', 10, 'Elantra', 2021, 10), 
('EFG123', 11, 'Seltos', 2022, 11), ('HIJ456', 12, 'CX-5', 2020, 12), 
('KLM789', 13, 'Outback', 2019, 13), ('NOP012', 14, 'RX', 2021, 14), 
('QRS345', 15, 'Challenger', 2017, 15), ('TUV678', 16, 'Wrangler', 2018, 16), 
('WXY901', 17, '1500', 2019, 17), ('ZAB234', 18, 'Pacifica', 2020, 18), 
('CDE567', 19, 'Enclave', 2021, 19), ('FGH890', 20, 'Sierra', 2022, 20);

-- Inserciones para la tabla servicio (continuación)
INSERT INTO servicio (nombre, descripcion, costo) VALUES 
('Rotación de Neumáticos', 'Rotación de los neumáticos del vehículo', 29.99), 
('Cambio de Batería', 'Cambio de la batería del vehículo', 129.99), 
('Reparación de Motor', 'Reparación del motor del vehículo', 299.99), 
('Reparación de Transmisión', 'Reparación de la transmisión del vehículo', 399.99), 
('Lavado Exterior', 'Lavado exterior del vehículo', 19.99), 
('Lavado Interior', 'Lavado interior del vehículo', 24.99), 
('Lavado Completo', 'Lavado completo del vehículo (interior y exterior)', 39.99), 
('Encerado', 'Encerado del vehículo', 49.99), 
('Detalle de Interiores', 'Limpieza detallada de los interiores del vehículo', 89.99), 
('Detalle de Exteriores', 'Limpieza detallada de los exteriores del vehículo', 99.99),
('Cambio de aceite y filtro', 'Servicio de cambio de aceite de motor y reemplazo del filtro de aceite.', 50.00),
('Alineación de dirección', 'Ajuste y corrección de la alineación del sistema de dirección del vehículo.', 80.00),
('Cambio de amortiguadores', 'Reemplazo de los amortiguadores delanteros y traseros del vehículo.', 120.00),
('Reparación de sistema de frenos', 'Diagnóstico y reparación de problemas en el sistema de frenos.', 100.00),
('Sustitución de batería', 'Instalación de una nueva batería para el vehículo.', 70.00),
('Diagnóstico electrónico avanzado', 'Análisis detallado del sistema eléctrico y electrónico del vehículo utilizando equipos de diagnóstico avanzado.', 90.00),
('Cambio de correa de distribución', 'Sustitución de la correa de distribución y ajuste de la sincronización del motor.', 200.00),
('Limpieza de inyectores', 'Limpieza y calibración de los inyectores de combustible del motor.', 60.00),
('Instalación de sistema de audio personalizado', 'Instalación de un sistema de audio personalizado con altavoces de alta calidad.', 150.00),
('Reemplazo de neumáticos y balanceo', 'Cambio de neumáticos y balanceo de ruedas para un rendimiento óptimo.', 180.00);

-- Inserciones para la tabla cargo
INSERT INTO cargo (puesto) VALUES 
('Gerente'), ('Mecánico'), ('Asistente de Ventas'), ('Recepcionista'), ('Lavador de Autos');

-- Inserciones para la tabla empleado
INSERT INTO empleado (nombre, apellido, cargo_id, email) VALUES 
('Roberto', 'Gómez', 1, 'roberto.gomez@example.com'), 
('Ana', 'Jiménez', 2, 'ana.jimenez@example.com'), 
('Javier', 'López', 2, 'javier.lopez@example.com'), 
('María', 'Sánchez', 3, 'maria.sanchez@example.com'), 
('David', 'Gutiérrez', 3, 'david.gutierrez@example.com'), 
('Laura', 'Martínez', 4, 'laura.martinez@example.com'), 
('Pedro', 'Hernández', 4, 'pedro.hernandez@example.com'), 
('Carmen', 'Pérez', 5, 'carmen.perez@example.com'), 
('Diego', 'Rodríguez', 5, 'diego.rodriguez@example.com'), 
('Sara', 'García', 2, 'sara.garcia@example.com'), 
('Luis', 'Fernández', 2, 'luis.fernandez@example.com'), 
('Elena', 'Díaz', 3, 'elena.diaz@example.com'), 
('Mario', 'Alvarez', 3, 'mario.alvarez@example.com'), 
('Carolina', 'González', 4, 'carolina.gonzalez@example.com'), 
('Ricardo', 'Ruiz', 4, 'ricardo.ruiz@example.com'), 
('Andrea', 'Gómez', 5, 'andrea.gomez@example.com'), 
('Fernando', 'Torres', 5, 'fernando.torres@example.com'), 
('Patricia', 'Ramírez', 2, 'patricia.ramirez@example.com'), 
('Gabriel', 'Moreno', 2, 'gabriel.moreno@example.com'), 
('Adriana', 'Vega', 3, 'adriana.vega@example.com');

-- Inserciones para la tabla telefono_empleado
INSERT INTO telefono_empleado (empleado_id, tipo_id, numero) VALUES 
(1, 1, '5551234567'), (2, 2, '5552345678'), (3, 3, '5553456789'), 
(4, 4, '5554567890'), (5, 5, '5555678901'), (6, 1, '5556789012'), 
(7, 2, '5557890123'), (8, 3, '5558901234'), (9, 4, '5559012345'), 
(10, 5, '5550123456'), (11, 1, '5551234567'), (12, 2, '5552345678'), 
(13, 3, '5553456789'), (14, 4, '5554567890'), (15, 5, '5555678901'), 
(16, 1, '5556789012'), (17, 2, '5557890123'), (18, 3, '5558901234'), 
(19, 4, '5559012345'), (20, 5, '5550123456');

-- Inserciones para la tabla reparacion
INSERT INTO reparacion (fecha, empleado_id, vehiculo_id, costo_total, descripcion) VALUES 
('2024-05-14', 14, 14, 99.99, 'Cambio de aceite y filtro'), 
('2024-05-15', 15, 15, 79.99, 'Alineación de las ruedas'), 
('2024-05-16', 16, 16, 149.99, 'Revisión completa del vehículo'), 
('2024-05-17', 17, 17, 199.99, 'Cambio de pastillas de freno'), 
('2024-05-18', 18, 18, 29.99, 'Rotación de los neumáticos'), 
('2024-05-19', 19, 19, 129.99, 'Cambio de la batería del vehículo'), 
('2024-05-20', 20, 20, 299.99, 'Reparación del motor del vehículo'), 
('2024-05-21', 1, 1, 399.99, 'Reparación de la transmisión del vehículo'), 
('2024-05-22', 2, 2, 19.99, 'Lavado exterior del vehículo'), 
('2024-05-23', 3, 3, 24.99, 'Lavado interior del vehículo'), 
('2024-05-24', 4, 4, 39.99, 'Lavado completo del vehículo'), 
('2024-05-25', 5, 5, 49.99, 'Encerado del vehículo'), 
('2024-05-26', 6, 6, 89.99, 'Detalle de los interiores del vehículo'), 
('2024-05-27', 7, 7, 99.99, 'Detalle de los exteriores del vehículo'), 
('2024-05-28', 8, 8, 79.99, 'Cambio de aceite y filtro'), 
('2024-05-29', 9, 9, 89.99, 'Detalle de los interiores del vehículo'), 
('2024-05-30', 10, 10, 49.99, 'Encerado del vehículo'), 
('2024-06-01', 11, 11, 399.99, 'Reparación de la transmisión del vehículo'), 
('2024-06-02', 12, 12, 29.99, 'Rotación de los neumáticos'), 
('2024-06-03', 13, 13, 99.99, 'Cambio de pastillas de freno');

-- Inserciones para la tabla reparacion_servicio
INSERT INTO reparacion_servicio (reparacion_id, servicio_id) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), 
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10), 
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15), 
(16, 16), (17, 17), (18, 18), (19, 19), (20, 20);

-- Inserciones para la tabla contacto
INSERT INTO contacto (nombre, apellido, email) VALUES 
('Roberto', 'Gómez', 'roberto.gomez@example.com'), 
('Ana', 'Jiménez', 'ana.jimenez@example.com'), 
('Javier', 'López', 'javier.lopez@example.com'), 
('María', 'Sánchez', 'maria.sanchez@example.com'), 
('David', 'Gutiérrez', 'david.gutierrez@example.com'), 
('Laura', 'Martínez', 'laura.martinez@example.com'), 
('Pedro', 'Hernández', 'pedro.hernandez@example.com'), 
('Carmen', 'Pérez', 'carmen.perez@example.com'), 
('Diego', 'Rodríguez', 'diego.rodriguez@example.com'), 
('Sara', 'García', 'sara.garcia@example.com'), 
('Luis', 'Fernández', 'luis.fernandez@example.com'), 
('Elena', 'Díaz', 'elena.diaz@example.com'), 
('Mario', 'Alvarez', 'mario.alvarez@example.com'), 
('Carolina', 'González', 'carolina.gonzalez@example.com'), 
('Ricardo', 'Ruiz', 'ricardo.ruiz@example.com'), 
('Andrea', 'Gómez', 'andrea.gomez@example.com'), 
('Fernando', 'Torres', 'fernando.torres@example.com'), 
('Patricia', 'Ramírez', 'patricia.ramirez@example.com'), 
('Gabriel', 'Moreno', 'gabriel.moreno@example.com'), 
('Adriana', 'Vega', 'adriana.vega@example.com');

-- Inserciones para la tabla proveedor
INSERT INTO proveedor (nombre, contacto_id, email) VALUES 
('AutoPartes Directo', 1, 'autopartes.directo@example.com'), 
('Mecánica Avanzada', 2, 'mecanica.avanzada@example.com'), 
('Suministros Vehiculares', 3, 'suministros.vehiculares@example.com'), 
('Distribuidora de Repuestos Automotrices', 4, 'distribuidora.repuestos@example.com'), 
('Herramientas de Calidad', 5, 'herramientas.calidad@example.com'), 
('Motores y Refacciones', 6, 'motores.refacciones@example.com'), 
('Repuestos Automex', 7, 'repuestos.automex@example.com'), 
('Distribuidora de Herramientas Mecánicas', 8, 'distribuidora.herramientas@example.com'), 
('Autopartes Express', 9, 'autopartes.express@example.com'), 
('Distribuidora Automotriz', 10, 'distribuidora.automotriz@example.com'), 
('Herramientas Profesionales', 11, 'herramientas.profesionales@example.com'), 
('Mecánica y Más', 12, 'mecanica.mas@example.com'), 
('Repuestos Rápidos', 13, 'repuestos.rapidos@example.com'), 
('Distribuidora de Motores y Transmisiones', 14, 'distribuidora.motores@example.com'), 
('Automotriz Herrera', 15, 'automotriz.herrera@example.com'), 
('Herramientas Esenciales', 16, 'herramientas.esenciales@example.com'), 
('Refacciones Automotrices Váldez', 17, 'refacciones.valdez@example.com'), 
('Distribuidora de Autopartes y Accesorios', 18, 'distribuidora.autopartes@example.com'), 
('Autorepuestos Velázquez', 19, 'autorepuestos.velazquez@example.com'), 
('Herramientas y Equipos Automotrices', 20, 'herramientas.equipos@example.com');

-- Inserciones para la tabla telefono_proveedor
INSERT INTO telefono_proveedor (proveedor_id, tipo_id, numero) VALUES 
(1, 1, '+1234567890'), -- AutoPartes Directo
(2, 2, '+9876543210'), -- Mecánica Avanzada
(3, 3, '+1122334455'), -- Suministros Vehiculares
(4, 1, '+9988776655'), -- Distribuidora de Repuestos Automotrices
(5, 2, '+3344556677'), -- Herramientas de Calidad
(6, 3, '+5566778899'), -- Motores y Refacciones
(7, 1, '+9988776655'), -- Repuestos Automex
(8, 2, '+3344556677'), -- Distribuidora de Herramientas Mecánicas
(9, 3, '+5566778899'), -- Autopartes Express
(10, 1, '+9988776655'), -- Distribuidora Automotriz
(11, 2, '+3344556677'), -- Herramientas Profesionales
(12, 3, '+5566778899'), -- Mecánica y Más
(13, 1, '+9988776655'), -- Repuestos Rápidos
(14, 2, '+3344556677'), -- Distribuidora de Motores y Transmisiones
(15, 3, '+5566778899'), -- Automotriz Herrera
(16, 1, '+9988776655'), -- Herramientas Esenciales
(17, 2, '+3344556677'), -- Refacciones Automotrices Váldez
(18, 3, '+5566778899'), -- Distribuidora de Autopartes y Accesorios
(19, 1, '+9988776655'), -- Autorepuestos Velázquez
(20, 2, '+3344556677'); -- Herramientas y Equipos Automotrices

-- Inserciones para la tabla pieza
INSERT INTO pieza (nombre, descripcion) VALUES 
('Filtro de Aceite', 'Filtro de aceite de alta calidad para motores de gasolina y diésel.'),
('Pastillas de Freno', 'Pastillas de freno semimetálicas para vehículos livianos.'),
('Correa de Distribución', 'Correa de distribución de caucho reforzado para motores de gasolina.'),
('Bujía de Encendido', 'Bujía de encendido de platino para motores de alta eficiencia.'),
('Bobina de Encendido', 'Bobina de encendido para sistemas de encendido electrónico.'),
('Amortiguador', 'Amortiguador hidráulico para absorción de impactos en suspensión vehicular.'),
('Radiador', 'Radiador de aluminio de alto rendimiento para sistemas de enfriamiento.'),
('Sensor de Oxígeno', 'Sensor de oxígeno para monitoreo de mezcla de combustible y aire.'),
('Bomba de Agua', 'Bomba de agua de alta presión para sistemas de enfriamiento.'),
('Junta de Culata', 'Junta de culata de motor para sellado hermético de cámaras de combustión.'),
('Filtro de Aire', 'Filtro de aire de alta eficiencia para motores de combustión interna.'),
('Lámpara Frontal', 'Lámpara frontal de repuesto para sistemas de iluminación vehicular.'),
('Pastilla de Embrague', 'Pastilla de embrague para sistemas de transmisión manual.'),
('Termostato', 'Termostato para control de temperatura en sistemas de enfriamiento.'),
('Válvula EGR', 'Válvula de recirculación de gases de escape para reducción de emisiones.'),
('Kit de Distribución', 'Kit completo de distribución incluyendo correa, polea y tensor.'),
('Motor de Arranque', 'Motor de arranque de alto torque para motores de gasolina.'),
('Alternador', 'Alternador de alta capacidad para sistemas de carga eléctrica.'),
('Sensor de Presión de Neumáticos', 'Sensor de presión de neumáticos para monitoreo de inflado adecuado.'),
('Detector de tombos', 'localizador de tombos que alertan en un area de 100 metros si no tienes SOAT');

-- Inserciones para la tabla precio
INSERT INTO precio (proveedor_id, pieza_id, precio_venta, precio_proveedor) VALUES 
(1, 1, 12.99, 8.50), -- Filtro de Aceite por AutoPartes Directo
(2, 2, 25.50, 18.75), -- Pastillas de Freno por Mecánica Avanzada
(3, 3, 35.75, 28.00), -- Correa de Distribución por Suministros Vehiculares
(4, 4, 8.99, 5.75), -- Bujía de Encendido por Distribuidora de Repuestos Automotrices
(5, 5, 16.25, 12.50), -- Bobina de Encendido por Herramientas de Calidad
(6, 6, 45.00, 35.25), -- Amortiguador por Motores y Refacciones
(7, 7, 55.75, 42.00), -- Radiador por Repuestos Automex
(8, 8, 14.99, 9.75), -- Sensor de Oxígeno por Distribuidora de Herramientas Mecánicas
(9, 9, 22.50, 18.25), -- Bomba de Agua por Autopartes Express
(10, 10, 30.75, 24.00), -- Junta de Culata por Distribuidora Automotriz
(11, 11, 9.99, 6.75), -- Filtro de Aire por Herramientas Profesionales
(12, 12, 18.25, 14.50), -- Lámpara Frontal por Mecánica y Más
(13, 13, 14.50, 10.25), -- Pastilla de Embrague por Repuestos Rápidos
(14, 14, 24.99, 20.75), -- Termostato por Distribuidora de Motores y Transmisiones
(15, 15, 6.75, 3.99), -- Válvula EGR por Automotriz Herrera
(16, 16, 55.00, 42.75), -- Kit de Distribución por Herramientas Esenciales
(17, 17, 38.25, 30.50), -- Motor de Arranque por Refacciones Automotrices Váldez
(18, 18, 17.99, 13.25), -- Alternador por Distribuidora de Autopartes y Accesorios
(19, 19, 22.75, 18.50), -- Sensor de Presión de Neumáticos por Autorepuestos Velázquez
(20, 20, 29.50, 23.25); -- Herramientas y Equipos Automotrices

-- Inserciones para la tabla reparacion_piezas
INSERT INTO reparacion_piezas (reparacion_id, pieza_id, cantidad) VALUES 
(1, 1, 1), -- Filtro de Aceite para Reparación 1
(2, 2, 2), -- Pastillas de Freno para Reparación 2
(3, 3, 1), -- Correa de Distribución para Reparación 3
(4, 4, 4), -- Bujía de Encendido para Reparación 4
(5, 5, 2), -- Bobina de Encendido para Reparación 5
(6, 6, 1), -- Amortiguador para Reparación 6
(7, 7, 1), -- Radiador para Reparación 7
(8, 8, 1), -- Sensor de Oxígeno para Reparación 8
(9, 9, 1), -- Bomba de Agua para Reparación 9
(10, 10, 1); -- Junta de Culata para Reparación 10

-- Inserciones para la tabla cita
INSERT INTO cita (fecha_hora, cliente_id, vehiculo_id) VALUES 
('2024-06-10 08:00:00', 1, 1), -- Cita para Cliente 1 con Vehículo 1
('2024-06-12 09:30:00', 2, 2), -- Cita para Cliente 2 con Vehículo 2
('2024-06-14 10:45:00', 3, 3), -- Cita para Cliente 3 con Vehículo 3
('2024-06-16 11:15:00', 4, 4), -- Cita para Cliente 4 con Vehículo 4
('2024-06-18 13:00:00', 5, 5), -- Cita para Cliente 5 con Vehículo 5
('2024-06-20 14:30:00', 6, 6), -- Cita para Cliente 6 con Vehículo 6
('2024-06-22 15:45:00', 7, 7), -- Cita para Cliente 7 con Vehículo 7
('2024-06-24 16:20:00', 8, 8), -- Cita para Cliente 8 con Vehículo 8
('2024-06-26 17:00:00', 9, 9), -- Cita para Cliente 9 con Vehículo 9
('2024-06-28 18:00:00', 10, 10); -- Cita para Cliente 10 con Vehículo 10

-- Inserciones para la tabla cita_servicio
INSERT INTO cita_servicio (cita_id, servicio_id) VALUES 
(1, 1), -- Cita 1 para Servicio 1
(2, 2), -- Cita 2 para Servicio 2
(3, 3), -- Cita 3 para Servicio 3
(4, 4), -- Cita 4 para Servicio 4
(5, 5), -- Cita 5 para Servicio 5
(6, 6), -- Cita 6 para Servicio 6
(7, 7), -- Cita 7 para Servicio 7
(8, 8), -- Cita 8 para Servicio 8
(9, 9), -- Cita 9 para Servicio 9
(10, 10); -- Cita 10 para Servicio 10

-- Inserciones para la tabla ubicacion
INSERT INTO ubicacion (nombre) VALUES 
('Almacén Principal'), -- Zona principal de almacenamiento
('Depósito de Piezas'), -- Almacén específico para piezas
('Zona de Herramientas'), -- Área reservada para herramientas
('Estantería A'), -- Estantería A en el almacén
('Estantería B'), -- Estantería B en el almacén
('Zona de Envíos'), -- Área dedicada al embalaje y envío
('Sala de Exhibición'), -- Espacio donde se muestran productos al cliente
('Área de Recepción'), -- Zona de recepción de materiales
('Almacén de Repuestos'), -- Almacén específico para repuestos
('Estación de Trabajo 1'); -- Estación de trabajo para reparaciones

-- Inserciones para la tabla inventario
INSERT INTO inventario (cantidad, ubicacion_id) VALUES 
(100, 1), -- 100 unidades en Almacén Principal
(50, 2), -- 50 unidades en Depósito de Piezas
(75, 9), -- 75 unidades en Almacén de Repuestos
(200, 4), -- 200 unidades en Estantería A
(150, 5); -- 150 unidades en Estantería B

-- Inserciones para la tabla pieza_inventario
INSERT INTO pieza_inventario (inventario_id, pieza_id) VALUES 
(1, 1), -- Pieza 1 en Almacén Principal
(2, 2), -- Pieza 2 en Depósito de Piezas
(3, 3), -- Pieza 3 en Almacén de Repuestos
(4, 4), -- Pieza 4 en Estantería A
(5, 5), -- Pieza 5 en Estantería B
(1, 6), -- Pieza 6 en Almacén Principal
(2, 7), -- Pieza 7 en Depósito de Piezas
(3, 8), -- Pieza 8 en Almacén de Repuestos
(4, 9), -- Pieza 9 en Estantería A
(5, 10); -- Pieza 10 en Estantería B

-- Inserciones para la tabla orden_compra
INSERT INTO orden_compra (fecha, proveedor_id, empleado_id, total) VALUES 
('2024-06-10', 1, 1, 1500.00), -- Orden de compra del Proveedor 1 por el Empleado 1
('2024-06-11', 2, 2, 2000.00), -- Orden de compra del Proveedor 2 por el Empleado 2
('2024-06-12', 3, 3, 1800.00), -- Orden de compra del Proveedor 3 por el Empleado 3
('2024-06-13', 4, 4, 2200.00), -- Orden de compra del Proveedor 4 por el Empleado 4
('2024-06-14', 5, 5, 2500.00); -- Orden de compra del Proveedor 5 por el Empleado 5

-- Inserciones para la tabla orden_detalle
INSERT INTO orden_detalle (orden_id, pieza_id, cantidad, precio) VALUES 
(1, 1, 10, 15.00), -- Orden 1: 10 unidades de Pieza 1 a $15.00 cada una
(1, 2, 5, 25.00), -- Orden 1: 5 unidades de Pieza 2 a $25.00 cada una
(2, 3, 20, 10.00), -- Orden 2: 20 unidades de Pieza 3 a $10.00 cada una
(2, 4, 15, 30.00), -- Orden 2: 15 unidades de Pieza 4 a $30.00 cada una
(3, 5, 8, 20.00); -- Orden 3: 8 unidades de Pieza 5 a $20.00 cada una

-- Inserciones para la tabla factura
INSERT INTO factura (fecha, cliente_id, total) VALUES 
('2024-06-15', 1, 300.00), -- Factura para Cliente 1 por $300.00
('2024-06-16', 2, 450.00), -- Factura para Cliente 2 por $450.00
('2024-06-17', 3, 600.00), -- Factura para Cliente 3 por $600.00
('2024-06-18', 4, 800.00), -- Factura para Cliente 4 por $800.00
('2024-06-19', 5, 900.00); -- Factura para Cliente 5 por $900.00

-- Inserciones para la tabla factura_detalle
INSERT INTO factura_detalle (factura_id, reparacion_id, cantidad, precio) VALUES 
(1, 1, 1, 100.00), -- Factura 1: Reparación 1, 1 vez, por $100.00
(1, 2, 2, 150.00), -- Factura 1: Reparación 2, 2 veces, por $150.00
(2, 3, 1, 200.00), -- Factura 2: Reparación 3, 1 vez, por $200.00
(2, 4, 3, 250.00), -- Factura 2: Reparación 4, 3 veces, por $250.00
(3, 5, 2, 300.00); -- Factura 3: Reparación 5, 2 veces, por $300.00


-- ############### INSERCIONES ADICIONALES ####################################

INSERT INTO reparacion (fecha, empleado_id, vehiculo_id, costo_total, descripcion) VALUES 
('2022-09-24', 14, 5, 19.99, 'Detalle de tapetes y ventanas EXTERIORES');

INSERT INTO reparacion_servicio (reparacion_id, servicio_id) VALUES 
(21, 10);

-- Juan Diego Contreras - C.C: 1.***.***.782


