# Diseño Automotriz | Proyecto mySQL | Juan Diego Contreras Melendez

### DDL.sql Comandos de creacion de tablas Y DML Comandos de Insercion de datos



## Modelo Conceptual





## Modelo Logico

![automotriz_diseño_bd](/home/camper/Imágenes/automotriz_diseño_logico_bd.png)



## Modelo Fisico



## Modelo Relacional

![Diagrama_ER_automotriz](/home/camper/Imágenes/automotriz_diseño_ER.png)



## Consultas requeridas

1. Obtener el historial de reparaciones de un vehículo específico

   ```mysql
   SELECT
    r.fecha,
    v.placa AS Placa_vehiculo,
    CONCAT(e.nombre,' ',e.apellido) AS Empleado_Asignado,
    r.costo_total AS Costo_Reparacion,
    r.descripcion AS Detalles
   FROM reparacion AS r
   JOIN vehiculo AS v ON v.id = r.vehiculo_id
   JOIN marca AS m ON m.id = v.marca_id
   JOIN empleado AS e ON e.id = r.empleado_id
   WHERE v.placa = 'MNO345';
   +------------+----------------+--------------------+------------------+------------------------------------------+
   | fecha      | Placa_vehiculo | Empleado_Asignado  | Costo_Reparacion | Detalles                                 |
   +------------+----------------+--------------------+------------------+------------------------------------------+
   | 2024-05-25 | MNO345         | David Gutiérrez    |            49.99 | Encerado del vehículo                    |
   | 2022-09-24 | MNO345         | Carolina González  |            19.99 | Detalle de tapetes y ventanas EXTERIORES |
   +------------+----------------+--------------------+------------------+------------------------------------------+
   -- En esta consulta selecciono el vehiculo con placa MNO345 y me muestra el historial de reparaciones del respectivo vehiculo
   ```

   

2. Calcular el costo total de todas las reparaciones realizadas por un empleado
    específico en un período de tiempo

  ```mysql
  SELECT 
    CONCAT(e.nombre, ' ', e.apellido) AS Empleado,
    SUM(r.costo_total)
  FROM empleado AS e
  JOIN reparacion AS r ON r.empleado_id = e.id
  WHERE e.id=5
  GROUP BY e.id;
  +------------------+--------------------+
  | Empleado         | SUM(r.costo_total) |
  +------------------+--------------------+
  | David Gutiérrez  |              89.98 |
  +------------------+--------------------+
  -- En esta consulta seleciono el empleado con id = 5 y consulto la suma total del dinero recaudado en las reparaciones hechas por este empleado
  ```

  

3. Listar todos los clientes y los vehículos que poseen
    Diseño Automotriz

  ```mysql
  SELECT
    CONCAT(c.nombre, ' ', c.apellido) AS cliente, 
    v.placa
  FROM vehiculo AS v
  JOIN cliente AS c ON c.id = v.cliente_id
  ORDER BY c.nombre ASC;
  +------------------+--------+
  | cliente          | placa  |
  +------------------+--------+
  | Ana Martínez     | JKL012 |
  | Andrés Guerrero  | CDE567 |
  | Carlos García    | GHI789 |
  | David Sánchez    | YZA567 |
  | Elena Rojas      | TUV678 |
  | Isabel Castro    | NOP012 |
  | Jorge Díaz       | EFG123 |
  | José Rodríguez   | STU901 |
  | Juan Pérez       | ABC123 |
  | Julia Iglesias   | FGH890 |
  | Laura González   | PQR678 |
  | Lucía Ramírez    | BCD890 |
  | Luis Hernández   | MNO345 |
  | Manuel Mendoza   | WXY901 |
  | María López      | DEF456 |
  | Marta Fernández  | VWX234 |
  | Miguel Vásquez   | KLM789 |
  | Pedro Moreno     | QRS345 |
  | Rosa Ortiz       | ZAB234 |
  | Sofía Torres     | HIJ456 |
  +------------------+--------+
  -- En esta consulta simplemente listo los clientes y sus respectivos vehiculos guiandome en la placa
  ```



4. Obtener la cantidad de piezas en inventario para cada pieza

   ```mysql
   SELECT
    p.nombre AS Pieza,
    i.cantidad AS Cantidad
   FROM pieza_inventario AS pi
   JOIN pieza AS p ON p.id = pi.pieza_id
   JOIN inventario AS i on i.id = pi.inventario_id
   ORDER BY i.cantidad ASC;
   +-------------------------+----------+
   | Pastillas de Freno      |       50 |
   | Radiador                |       50 |
   | Correa de Distribución  |       75 |
   | Sensor de Oxígeno       |       75 |
   | Filtro de Aceite        |      100 |
   | Amortiguador            |      100 |
   | Bobina de Encendido     |      150 |
   | Junta de Culata         |      150 |
   | Bujía de Encendido      |      200 |
   | Bomba de Agua           |      200 |
   +-------------------------+----------+
   -- En esta consulta me centro en la tabla intermedia y de ahi mediante JOIN me dirijo a las otras dos tablas para sacar cantidad de piezas y el nombre de la pieza
   ```

5. Obtener las citas programadas para un día específico

   ```mysql
   SELECT 
    CONCAT(cli.nombre, ' ', cli.apellido) AS Cliente,
    v.placa AS placa_vehiculo,
    c.fecha_hora
   FROM cita AS c
   JOIN cliente AS cli ON cli.id = c.cliente_id
   JOIN vehiculo AS v ON v.id = c.vehiculo_id
   WHERE DATE_FORMAT(fecha_hora, '%d') = '18';
   +------------------+----------------+---------------------+
   | Cliente          | placa_vehiculo | fecha_hora          |
   +------------------+----------------+---------------------+
   | Luis Hernández   | MNO345         | 2024-06-18 13:00:00 |
   | Luis Hernández   | HIJ456         | 2024-04-18 08:00:00 |
   | José Rodríguez   | DEF456         | 2024-03-18 08:00:00 |
   +------------------+----------------+---------------------+
   -- En esta consulta se listan las citas programadas para para el dia = 18 de cualquier mes
   ```

   

6. Generar una factura para un cliente específico en una fecha determinada

   ```mysql
   SELECT 
    f.id AS factura_id,
    CONCAT(c.nombre, ' ', c.apellido) AS Cliente,
    f.fecha AS fecha_factura,
    f.total AS total_a_pagar
   FROM factura AS f
   JOIN cliente AS c ON c.id = f.cliente_id
   WHERE f.fecha = '2024-06-15' AND f.cliente_id = 1;
   +------------+-------------+---------------+---------------+
   | factura_id | Cliente     | fecha_factura | total_a_pagar |
   +------------+-------------+---------------+---------------+
   |          1 | Juan Pérez  | 2024-06-15    |        300.00 |
   +------------+-------------+---------------+---------------+
   -- Esta consulta muestra la factura de una fecha especifica que en este caso es fecha = '2024-06-15' y cliente_id = 1
   ```

   

7. Listar todas las órdenes de compra y sus detalles

   ```mysql
   SELECT 
    od.orden_id AS orden_id,
    p.nombre AS Pieza,
    od.cantidad,
    od.precio
   FROM orden_detalle AS od
   JOIN pieza AS p ON p.id = od.pieza_id;
   | orden_id | Pieza                   | cantidad | precio |
   +----------+-------------------------+----------+--------+
   |        1 | Filtro de Aceite        |       10 |  15.00 |
   |        1 | Pastillas de Freno      |        5 |  25.00 |
   |        2 | Correa de Distribución  |       20 |  10.00 |
   |        2 | Bujía de Encendido      |       15 |  30.00 |
   |        3 | Bobina de Encendido     |        8 |  20.00 |
   +----------+-------------------------+----------+--------+
   -- En esta consulta listo la orden de compra con sus detalles, cantidad,precio y pieza
   ```

   

8. Obtener el costo total de piezas utilizadas en una reparación específica

   ```mysql
   SELECT 
   	rp.reparacion_id,
   	p.nombre AS Pieza,
   	rp.cantidad AS Cantidad_Piezas,
   	SUM(rp.cantidad * pre.precio_proveedor) AS costo_total_piezas
   FROM reparacion_piezas AS rp
   JOIN pieza AS p ON p.id = rp.pieza_id
   JOIN precio AS pre ON pre.pieza_id = rp.pieza_id
   WHERE rp.reparacion_id = 4
   GROUP BY rp.reparacion_id, p.nombre, rp.cantidad;
   +---------------+--------------------+-----------------+--------------------+
   | reparacion_id | Pieza              | Cantidad_Piezas | costo_total_piezas |
   +---------------+--------------------+-----------------+--------------------+
   |             4 | Bujía de Encendido |               4 |              23.00 |
   +---------------+--------------------+-----------------+--------------------+
   -- En esta consulta listo la reparacion con id = 4 en la cual se utiliza 4 bujias de encendido para dar un total de 23.00 esto basado en el costo_proveedor de la tabla precio
   ```

   

9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad
    menor que un umbral)

  ```mysql
  SELECT 
  	p.nombre AS Pieza, 		
  	i.cantidad AS Cantidad,
  	i.id AS inventario_id,
  	u.nombre AS Ubicacion_inventario
  FROM pieza AS p
  JOIN pieza_inventario AS pi ON pi.pieza_id = p.id
  JOIN inventario AS i ON i.id = pi.inventario_id
  JOIN ubicacion AS u ON u.id = i.ubicacion_id
  WHERE i.cantidad < 100;
  +------------------------+----------+---------------+----------------------+
  | Pieza                  | Cantidad | inventario_id | Ubicacion_inventario |
  +------------------------+----------+---------------+----------------------+
  | Pastillas de Freno     |       50 |             2 | Depósito de Piezas   |
  | Radiador               |       50 |             2 | Depósito de Piezas   |
  | Correa de Distribución |       75 |             3 | Almacén de Repuestos |
  | Sensor de Oxígeno      |       75 |             3 | Almacén de Repuestos |
  +------------------------+----------+---------------+----------------------+
  -- En esta consulta selecciono que todos los inventarios con una cantidad de piezas menor que 100 debe ser restablecida y listo las piezas 
  ```

10. Obtener la lista de servicios más solicitados en un período específico

    ```mysql
    SELECT 
    	s.nombre AS Servicio,
    	COUNT(rs.servicio_id) AS Cantidad_Solicitada
    FROM reparacion_servicio AS rs
    JOIN servicio AS s ON s.id = rs.servicio_id
    JOIN reparacion AS r ON r.id = rs.reparacion_id
    WHERE  r.fecha BETWEEN '2024-05-14' AND '2024-05-30'
    GROUP BY s.nombre
    ORDER BY Cantidad_Solicitada DESC
    LIMIT 3;
    +------------------------+---------------------+
    | Servicio               | Cantidad_Solicitada |
    +------------------------+---------------------+
    | Detalle de Exteriores  |                   4 |
    | Rotación de Neumáticos |                   1 |
    | Cambio de Batería      |                   1 |
    +------------------------+---------------------+
    -- Esta consulta lista los servicios mas solicitados entre el periodo de 2024-05-14 hasta 2024-05-30
    ```

    

11. Obtener el costo total de reparaciones para cada cliente en un período
    específico

    ```mysql
    SELECT 
    	CONCAT(cli.nombre, ' ', cli.apellido) AS Cliente,
    	v.placa AS Placa_Vehiculo,
    	r.id AS Reparacion_id,
    	r.fecha AS Fecha_Reparacion,
    	SUM(r.costo_total) AS Costo_total_cliente
    FROM reparacion AS r
    JOIN vehiculo AS v ON v.id = r.vehiculo_id
    JOIN cliente AS cli ON cli.id = v.cliente_id
    WHERE  r.fecha BETWEEN '2024-05-14' AND '2024-05-30'
    GROUP BY r.id;
    +-----------------+----------------+---------------+------------------+---------------------+
    | Cliente         | Placa_Vehiculo | Reparacion_id | Fecha_Reparacion | Costo_total_cliente |
    +-----------------+----------------+---------------+------------------+---------------------+
    | Isabel Castro   | NOP012         |             1 | 2024-05-14       |               99.99 |
    | Pedro Moreno    | QRS345         |             2 | 2024-05-15       |               79.99 |
    | Elena Rojas     | TUV678         |             3 | 2024-05-16       |              149.99 |
    | Manuel Mendoza  | WXY901         |             4 | 2024-05-17       |              199.99 |
    | Rosa Ortiz      | ZAB234         |             5 | 2024-05-18       |               29.99 |
    | Andrés Guerrero | CDE567         |             6 | 2024-05-19       |              129.99 |
    | Julia Iglesias  | FGH890         |             7 | 2024-05-20       |              299.99 |
    | Juan Pérez      | ABC123         |             8 | 2024-05-21       |              399.99 |
    | María López     | DEF456         |             9 | 2024-05-22       |               19.99 |
    | Carlos García   | GHI789         |            10 | 2024-05-23       |               24.99 |
    | Ana Martínez    | JKL012         |            11 | 2024-05-24       |               39.99 |
    | Luis Hernández  | MNO345         |            12 | 2024-05-25       |               49.99 |
    | Laura González  | PQR678         |            13 | 2024-05-26       |               89.99 |
    | José Rodríguez  | STU901         |            14 | 2024-05-27       |               99.99 |
    | Marta Fernández | VWX234         |            15 | 2024-05-28       |               79.99 |
    | David Sánchez   | YZA567         |            16 | 2024-05-29       |               89.99 |
    | Lucía Ramírez   | BCD890         |            17 | 2024-05-30       |               49.99 |
    | Juan Pérez      | ABC123         |            26 | 2024-05-17       |               19.99 |
    | Luis Hernández  | MNO345         |            27 | 2024-05-18       |               19.99 |
    | Marta Fernández | VWX234         |            28 | 2024-05-19       |               19.99 |
    +-----------------+----------------+---------------+------------------+---------------------+
    -- Esta consulta lista los clientes y sus respectivas reparaciones y costos totales en el periodo de '2024-05-14' hasta '20'
    ```
    
    
    
12. Listar los empleados con mayor cantidad de reparaciones realizadas en un
    período específico

    ```mysql
    SELECT
    	CONCAT(e.nombre, ' ', e.apellido) AS Empleado, 
    	COUNT(r.id) AS Cantidad_Reparaciones	
    FROM reparacion AS r
    JOIN empleado AS e ON e.id = r.empleado_id
    WHERE r.fecha BETWEEN '2024-05-14' AND '2024-05-30'
    GROUP BY e.id
    ORDER BY Cantidad_Reparaciones DESC
    LIMIT 3;
    +-----------------+-----------------------+
    | Empleado        | Cantidad_Reparaciones |
    +-----------------+-----------------------+
    | Pedro Hernández |                     2 |
    | David Gutiérrez |                     2 |
    | Elena Díaz      |                     1 |
    +-----------------+-----------------------+
    -- En esta consulta se listan los 3 primeros empleados con mas reparaciones en el periodo '2024-05-14' AND '2024-05-30'
    ```
    
    
    
13. Obtener las piezas más utilizadas en reparaciones durante un período
    específico

    ```mysql
    SELECT
    	p.nombre AS Pieza,
    	COUNT(rp.pieza_id) AS Usos_en_Reparaciones
    FROM reparacion_piezas AS rp
    JOIN pieza AS p ON p.id = rp.pieza_id
    JOIN reparacion AS r ON r.id = rp.reparacion_id
    WHERE r.fecha BETWEEN '2024-05-14' AND '2024-05-30'
    GROUP BY Pieza
    ORDER BY Usos_en_Reparaciones DESC
    LIMIT 3;
    +------------------------+----------------------+
    | Pieza                  | Usos_en_Reparaciones |
    +------------------------+----------------------+
    | Filtro de Aceite       |                    1 |
    | Pastillas de Freno     |                    1 |
    | Correa de Distribución |                    1 |
    +------------------------+----------------------+
    -- En esta consulta se listan las 3 primeras piezas con mas usos en reparaicones entre el periodo '2024-05-14' hasta '2024-05-30'
    ```
    
    
    
14. Calcular el promedio de costo de reparaciones por vehículo

    ```mysql
    SELECT
    	m.nombre AS Marca_vehiculo,
    	v.modelo AS Modelo_vehiculo,
    	AVG(r.costo_total) AS Costo_Promedio
    FROM reparacion AS r
    JOIN vehiculo AS v ON v.id = r.vehiculo_id
    JOIN marca AS m ON m.id = v.marca_id
    GROUP BY Marca_vehiculo, Modelo_vehiculo
    ORDER BY Costo_Promedio DESC;
    ```

    

15. Obtener el inventario de piezas por proveedor

    ```mysql
    SELECT 
    	p.nombre AS Pieza,
    	pro.nombre AS Proveedor,
    	pi.inventario_id AS Inventario_id,
    	i.cantidad AS Cantidad,
    	u.nombre AS Ubicacion_Inventario
    FROM precio AS pre
    JOIN pieza AS p ON p.id = pre.pieza_id
    JOIN proveedor AS pro ON pro.id = pre.proveedor_id
    JOIN pieza_inventario AS pi ON pi.pieza_id = pre.pieza_id
    JOIN inventario AS i ON i.id = pi.inventario_id
    JOIN ubicacion AS u ON u.id = i.ubicacion_id
    ORDER BY Cantidad DESC;
    +------------------------+-----------------------------------------+------------+----------+
    | Pieza                  | Proveedor                               | Inventario | Cantidad |
    +------------------------+-----------------------------------------+------------+----------+
    | Bujía de Encendido     | Distribuidora de Repuestos Automotrices |          4 |      200 |
    | Bomba de Agua          | Autopartes Express                      |          4 |      200 |
    | Bobina de Encendido    | Herramientas de Calidad                 |          5 |      150 |
    | Junta de Culata        | Distribuidora Automotriz                |          5 |      150 |
    | Filtro de Aceite       | AutoPartes Directo                      |          1 |      100 |
    | Amortiguador           | Motores y Refacciones                   |          1 |      100 |
    | Correa de Distribución | Suministros Vehiculares                 |          3 |       75 |
    | Sensor de Oxígeno      | Distribuidora de Herramientas Mecánicas |          3 |       75 |
    | Pastillas de Freno     | Mecánica Avanzada                       |          2 |       50 |
    | Radiador               | Repuestos Automex                       |          2 |       50 |
    +------------------------+-----------------------------------------+------------+----------+
    -- En esta consulta se muestra el inventario de piezas por proveedor de forma de mayor a menor
    ```

    

16. Listar los clientes que no han realizado reparaciones en el último año

    ```mysql
    SELECT
    	CONCAT(cli.nombre, ' ', cli.apellido) AS Cliente
    FROM cliente AS cli
    WHERE cli.id NOT IN(
    	SELECT
    		v.cliente_id
    	FROM reparacion AS r
    	JOIN vehiculo as v ON v.id = r.vehiculo_id
    	WHERE DATE_FORMAT(r.fecha, '%Y') = '2024'	
    );
    +--------------------+
    | Cliente            |
    +--------------------+
    | JuanDiego Conteras |
    +--------------------+
    -- En esta consulta lista los clientes que no han hecho reparaciones en el año 2024 
    ```

    

17. Obtener las ganancias totales del taller en un período específico

    ```mysql
    SELECT 
    	SUM(r.costo_total) AS Ganancias_Totales
    FROM reparacion AS r
    WHERE r.fecha BETWEEN '2024-05-14' AND '2024-05-30';
    +-------------------+
    | Ganancias_Totales |
    +-------------------+
    |           2545.01 |
    +-------------------+
    -- En esta consulta simplemente suma el costo de las reparaciones entre el periodo 2024-05-14 hasta 2024-05-30
    ```

    

18. Listar los empleados y el total de horas trabajadas en reparaciones en un
    período específico (asumiendo que se registra la duración de cada reparación)

    ```mysql
    -- Asumi que la duracion estandar por reparacion era de 8 horas, ya que no cuento con duracion_horas en la tabla reparacion
    SELECT
    	CONCAT(e.nombre, ' ', e.apellido) AS Empleado,
    	COUNT(r.id) * 8 AS Total_horas_Trabajadas
    FROM reparacion AS r
    JOIN empleado AS e ON e.id = r.empleado_id
    WHERE r.fecha BETWEEN '2024-05-14' AND '2024-05-30'
    GROUP BY e.id
    ORDER BY Total_horas_Trabajadas DESC;
    +-------------------+------------------------+
    | Empleado          | Total_horas_Trabajadas |
    +-------------------+------------------------+
    | David Gutiérrez   |                     16 |
    | Pedro Hernández   |                     16 |
    | Diego Rodríguez   |                     16 |
    | Carolina González |                      8 |
    | Ricardo Ruiz      |                      8 |
    | Andrea Gómez      |                      8 |
    | Fernando Torres   |                      8 |
    | Patricia Ramírez  |                      8 |
    | Gabriel Moreno    |                      8 |
    | Adriana Vega      |                      8 |
    | Roberto Gómez     |                      8 |
    | Ana Jiménez       |                      8 |
    | Javier López      |                      8 |
    | María Sánchez     |                      8 |
    | Laura Martínez    |                      8 |
    | Carmen Pérez      |                      8 |
    | Sara García       |                      8 |
    | Elena Díaz        |                      8 |
    +-------------------+------------------------+
    -- En esta consulta se listan los empleados y sus horas trabajadas entre el periodo de 2024-05-14 hasta 2024-05-30
    ```
    
    
    
19. Obtener el listado de servicios prestados por cada empleado en un período
    específico

    ```mysql
    SELECT DISTINCT
    	CONCAT(e.nombre, ' ', e.apellido) AS Empleado,
    	s.nombre AS Servicio_Prestado
    FROM reparacion AS r
    JOIN empleado AS e ON e.id = r.empleado_id
    JOIN reparacion_servicio AS rp ON rp.reparacion_id = r.id
    JOIN servicio AS s ON s.id = rp.servicio_id
    WHERE r.fecha BETWEEN '2024-05-14' AND '2024-05-30'
    ORDER BY Empleado ASC;
    +-------------------+----------------------------------+
    | Empleado          | Servicio_Prestado                |
    +-------------------+----------------------------------+
    | Adriana Vega      | Lavado Completo                  |
    | Ana Jiménez       | Detalle de Interiores            |
    | Andrea Gómez      | Reparación de Motor              |
    | Carmen Pérez      | Sustitución de batería           |
    | Carolina González | Rotación de Neumáticos           |
    | David Gutiérrez   | Alineación de dirección          |
    | David Gutiérrez   | Detalle de Exteriores            |
    | Diego Rodríguez   | Diagnóstico electrónico avanzado |
    | Diego Rodríguez   | Lavado Interior                  |
    | Elena Díaz        | Detalle de Exteriores            |
    | Fernando Torres   | Reparación de Transmisión        |
    | Gabriel Moreno    | Lavado Interior                  |
    | Javier López      | Detalle de Exteriores            |
    | Laura Martínez    | Cambio de amortiguadores         |
    | María Sánchez     | Cambio de aceite y filtro        |
    | Patricia Ramírez  | Lavado Exterior                  |
    | Pedro Hernández   | Reparación de sistema de frenos  |
    | Pedro Hernández   | Detalle de Exteriores            |
    | Ricardo Ruiz      | Cambio de Batería                |
    | Roberto Gómez     | Encerado                         |
    | Sara García       | Cambio de correa de distribución |
    +-------------------+----------------------------------+
    -- En esta consulta muestra los servicios ofrecidos por los empleados en el periodo 2024-05-14 hasta 2024-05-30
    ```
    
    
    
    ## Subconsultas
    
20. Obtener el cliente que ha gastado más en reparaciones durante el último año.

    ```mysql
    SELECT 
    	CONCAT(c.nombre, ' ', c.apellido) AS cliente
    FROM cliente AS c
    WHERE c.id = (
    	SELECT
    		v.cliente_id
    	FROM reparacion AS r
    	JOIN vehiculo AS v ON v.id = r.vehiculo_id
    	WHERE YEAR(r.fecha) = '2024'
    	GROUP BY v.cliente_id
    	ORDER BY SUM(r.costo_total) DESC
    	LIMIT 1
    );
    +--------------------+
    | cliente            |
    +--------------------+
    | JuanDiego Conteras |
    +--------------------+
    -- En esta consulta se muestra el cliente que mas gasto en una reparacion en el año 2024
    ```

    

21. Obtener la pieza más utilizada en reparaciones durante el último mes

    ```mysql
    SELECT
    	p.nombre AS pieza
    FROM pieza AS p
    WHERE p.id = (
    	SELECT
    		rp.pieza_id
    	FROM reparacion_piezas AS rp
    	JOIN reparacion AS r ON r.id = rp.reparacion_id
    	WHERE MONTH(r.fecha) = 5
    	GROUP BY rp.pieza_id
    	ORDER BY COUNT(rp.pieza_id) DESC
    	LIMIT 1
    );
    +---------------------+
    | pieza               |
    +---------------------+
    | Bobina de Encendido |
    +---------------------+
    -- Esta consulta busca el nombre la pieza mas utilizada en el mes numero 5
    ```

    

22. Obtener los proveedores que suministran las piezas más caras
      Diseño Automotriz

   ```mysql
   SELECT 
       p.nombre AS Proveedor
   FROM 
       proveedor AS p
   JOIN (
       SELECT 
           proveedor_id
       FROM 
           precio
       ORDER BY 
           precio_proveedor DESC
       LIMIT 3
   ) AS top_precios ON p.id = top_precios.proveedor_id;
   +-------------------------+
   | Proveedor               |
   +-------------------------+
   | Herramientas Esenciales |
   | Repuestos Automex       |
   | Motores y Refacciones   |
   +-------------------------+
   -- Esta consulta muestra los 3 proveedores que suministran las piezas mas caras
   ```

   

23. Listar las reparaciones que no utilizaron piezas específicas durante el último
    año

    ```mysql
    SELECT
    	p.nombre AS pieza
    FROM pieza AS p
    WHERE p.id NOT IN(
    	SELECT
    		rp.pieza_id
    	FROM reparacion_piezas AS rp
    	JOIN reparacion AS r ON r.id = rp.reparacion_id
    	WHERE YEAR(r.fecha) = 2024
    );
    +---------------------------------+
    | pieza                           |
    +---------------------------------+
    | Lámpara Frontal                 |
    | Pastilla de Embrague            |
    | Kit de Distribución             |
    | Alternador                      |
    | Sensor de Presión de Neumáticos |
    | Detector de tombos              |
    +---------------------------------+
    -- En esta consulta se muestran las piezas que no fueron utilizadas en 2024
    ```
    
    
    
24. Obtener las piezas que están en inventario por debajo del 10% del stock inicial

   ```mysql
   SELECT
       p.nombre AS pieza
   FROM
       pieza AS p
   WHERE
       p.id IN (
           SELECT
               pi.pieza_id
           FROM
               pieza_inventario AS pi
           JOIN
               inventario AS i ON i.id = pi.inventario_id
           GROUP BY
               pi.pieza_id
           HAVING
               SUM(i.cantidad) < (SUM(i.cantidad) * 0.1) -- Comparar la suma total del inventario con el 10% del stock inicial
       );
   
   ```

   

   ## Procedimientos Almacenados

25. Crear un procedimiento almacenado para insertar una nueva reparación.

    ```
    
    ```

    

26. Crear un procedimiento almacenado para actualizar el inventario de una pieza.

    ```
    
    ```

    

27. Crear un procedimiento almacenado para eliminar una cita

    ```
    
    ```

    

28. Crear un procedimiento almacenado para generar una factura

    ```
    
    ```

    

29. Crear un procedimiento almacenado para obtener el historial de reparaciones
      de un vehículo

   ```
   
   ```

   

30. Crear un procedimiento almacenado para calcular el costo total de
      reparaciones de un cliente en un período

   ```
   
   ```

   

31. Crear un procedimiento almacenado para obtener la lista de vehículos que
      requieren mantenimiento basado en el kilometraje.

   ```
   
   ```

   

32. Crear un procedimiento almacenado para insertar una nueva orden de compra

    ```
    
    ```

    

33. Crear un procedimiento almacenado para actualizar los datos de un cliente

    ```
    
    ```

    

34. Crear un procedimiento almacenado para obtener los servicios más solicitados
    en un período

    ```
    
    ```

    