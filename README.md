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

   ```
   
   ```

   

9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad
    menor que un umbral)

  ```
  
  ```

  

10. Obtener la lista de servicios más solicitados en un período específico

    ```
    
    ```

    

11. Obtener el costo total de reparaciones para cada cliente en un período
    específico

    ```
    
    ```

    

12. Listar los empleados con mayor cantidad de reparaciones realizadas en un
    período específico

    ```
    
    ```

    

13. Obtener las piezas más utilizadas en reparaciones durante un período
    específico

    ```
    
    ```

    

14. Calcular el promedio de costo de reparaciones por vehículo

    ```
    
    ```

    

15. Obtener el inventario de piezas por proveedor

    ```
    
    ```

    

16. Listar los clientes que no han realizado reparaciones en el último año

    ```
    
    ```

    

17. Obtener las ganancias totales del taller en un período específico

    ```
    
    ```

    

18. Listar los empleados y el total de horas trabajadas en reparaciones en un
    período específico (asumiendo que se registra la duración de cada reparación)

    ```
    
    ```

    

19. Obtener el listado de servicios prestados por cada empleado en un período
    específico

    ```
    
    ```

    

    ## Subconsultas

20. Obtener el cliente que ha gastado más en reparaciones durante el último año.

    ```
    
    ```

    

21. Obtener la pieza más utilizada en reparaciones durante el último mes

    ```
    
    ```

    

22. Obtener los proveedores que suministran las piezas más caras
      Diseño Automotriz

   ```
   
   ```

   

23. Listar las reparaciones que no utilizaron piezas específicas durante el último
    año

    ```
    
    ```

    

24. Obtener las piezas que están en inventario por debajo del 10% del stock inicial

   ```
   
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

    
