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
  ```

  

3. Listar todos los clientes y los vehículos que poseen
    Diseño Automotriz

  ```mysql
  
  ```

  

4. Obtener la cantidad de piezas en inventario para cada pieza

   ```mysql
   
   ```

   

5. Obtener las citas programadas para un día específico

   ```mysql
   
   ```

   

6. Generar una factura para un cliente específico en una fecha determinada

   ```mysql
   
   ```

   

7. Listar todas las órdenes de compra y sus detalles

   ```mysql
   
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

    



