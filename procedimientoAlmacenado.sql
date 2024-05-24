DELIMITER $$

CREATE PROCEDURE Insertar_cama (IN p_id_departamento int, IN p_numero_cama int, IN p_piso varchar(255), IN p_estatus varchar(255)) 
BEGIN
    INSERT INTO cama (id_departamento, numero_cama, piso, estatus) VALUES (p_id_departamento, p_numero_cama, p_piso, p_estatus);
END $$

CREATE PROCEDURE Actualizar_cama (IN p_id_cama int, IN p_id_departamento int, IN p_numero_cama int, IN p_piso varchar(255), IN p_estatus varchar(255)) 
BEGIN
    UPDATE cama SET id_departamento = p_id_departamento, numero_cama = p_numero_cama, piso = p_piso, estatus = p_estatus WHERE id_cama = p_id_cama;
END $$

CREATE PROCEDURE Eliminar_cama (IN p_id_cama int) 
BEGIN
    DELETE FROM cama WHERE id_cama = p_id_cama;
END $$

CREATE PROCEDURE ObtenerTodos_cama () 
BEGIN
    SELECT * FROM cama;
END $$

CREATE PROCEDURE Insertar_cita (IN p_id_paciente int, IN p_id_medico int, IN p_fecha_hora varchar(255), IN p_motivo text, IN p_estatus varchar(255)) 
BEGIN
    INSERT INTO cita (id_paciente, id_medico, fecha_hora, motivo, estatus) VALUES (p_id_paciente, p_id_medico, p_fecha_hora, p_motivo, p_estatus);
END $$

CREATE PROCEDURE Actualizar_cita (IN p_id_cita int, IN p_id_paciente int, IN p_id_medico int, IN p_fecha_hora varchar(255), IN p_motivo text, IN p_estatus varchar(255)) 
BEGIN
    UPDATE cita SET id_paciente = p_id_paciente, id_medico = p_id_medico, fecha_hora = p_fecha_hora, motivo = p_motivo, estatus = p_estatus WHERE id_cita = p_id_cita;
END $$

CREATE PROCEDURE Eliminar_cita (IN p_id_cita int) 
BEGIN
    DELETE FROM cita WHERE id_cita = p_id_cita;
END $$

CREATE PROCEDURE ObtenerTodos_cita () 
BEGIN
    SELECT * FROM cita;
END $$

CREATE PROCEDURE Insertar_compra (IN p_id_proveedor int, IN p_fecha_compra varchar(255), IN p_monto_total int) 
BEGIN
    INSERT INTO compra (id_proveedor, fecha_compra, monto_total) VALUES (p_id_proveedor, p_fecha_compra, p_monto_total);
END $$

CREATE PROCEDURE Actualizar_compra (IN p_id_compra int, IN p_id_proveedor int, IN p_fecha_compra varchar(255), IN p_monto_total int) 
BEGIN
    UPDATE compra SET id_proveedor = p_id_proveedor, fecha_compra = p_fecha_compra, monto_total = p_monto_total WHERE id_compra = p_id_compra;
END $$

CREATE PROCEDURE Eliminar_compra (IN p_id_compra int) 
BEGIN
    DELETE FROM compra WHERE id_compra = p_id_compra;
END $$

CREATE PROCEDURE ObtenerTodos_compra () 
BEGIN
    SELECT * FROM compra;
END $$

CREATE PROCEDURE Insertar_consulta (IN p_id_cita int, IN p_diagnostico varchar(255), IN p_tratamiento varchar(255), IN p_medicamentos varchar(255), IN p_notas text) 
BEGIN
    INSERT INTO consulta (id_cita, diagnostico, tratamiento, medicamentos, notas) VALUES (p_id_cita, p_diagnostico, p_tratamiento, p_medicamentos, p_notas);
END $$

CREATE PROCEDURE Actualizar_consulta (IN p_id_consulta int, IN p_id_cita int, IN p_diagnostico varchar(255), IN p_tratamiento varchar(255), IN p_medicamentos varchar(255), IN p_notas text) 
BEGIN
    UPDATE consulta SET id_cita = p_id_cita, diagnostico = p_diagnostico, tratamiento = p_tratamiento, medicamentos = p_medicamentos, notas = p_notas WHERE id_consulta = p_id_consulta;
END $$

CREATE PROCEDURE Eliminar_consulta (IN p_id_consulta int) 
BEGIN
    DELETE FROM consulta WHERE id_consulta = p_id_consulta;
END $$

CREATE PROCEDURE ObtenerTodos_consulta () 
BEGIN
    SELECT * FROM consulta;
END $$

CREATE PROCEDURE Insertar_departamento (IN p_id_hospital int, IN p_nombre varchar(255), IN p_jefe_departamento varchar(255)) 
BEGIN
    INSERT INTO departamento (id_hospital, nombre, jefe_departamento) VALUES (p_id_hospital, p_nombre, p_jefe_departamento);
END $$

CREATE PROCEDURE Actualizar_departamento (IN p_id_departamento int, IN p_id_hospital int, IN p_nombre varchar(255), IN p_jefe_departamento varchar(255)) 
BEGIN
    UPDATE departamento SET id_hospital = p_id_hospital, nombre = p_nombre, jefe_departamento = p_jefe_departamento WHERE id_departamento = p_id_departamento;
END $$

CREATE PROCEDURE Eliminar_departamento (IN p_id_departamento int) 
BEGIN
    DELETE FROM departamento WHERE id_departamento = p_id_departamento;
END $$

CREATE PROCEDURE ObtenerTodos_departamento () 
BEGIN
    SELECT * FROM departamento;
END $$

CREATE PROCEDURE Insertar_detalle_compra (IN p_id_compra int, IN p_id_medicamento int, IN p_cantidad int, IN p_precio_unitario varchar(255)) 
BEGIN
    INSERT INTO detalle_compra (id_compra, id_medicamento, cantidad, precio_unitario) VALUES (p_id_compra, p_id_medicamento, p_cantidad, p_precio_unitario);
END $$

CREATE PROCEDURE Actualizar_detalle_compra (IN p_id_detalle_compra int, IN p_id_compra int, IN p_id_medicamento int, IN p_cantidad int, IN p_precio_unitario varchar(255)) 
BEGIN
    UPDATE detalle_compra SET id_compra = p_id_compra, id_medicamento = p_id_medicamento, cantidad = p_cantidad, precio_unitario = p_precio_unitario WHERE id_detalle_compra = p_id_detalle_compra;
END $$

CREATE PROCEDURE Eliminar_detalle_compra (IN p_id_detalle_compra int) 
BEGIN
    DELETE FROM detalle_compra WHERE id_detalle_compra = p_id_detalle_compra;
END $$

CREATE PROCEDURE ObtenerTodos_detalle_compra () 
BEGIN
    SELECT * FROM detalle_compra;
END $$

CREATE PROCEDURE Insertar_empleado (IN p_id_usuario int, IN p_nombre varchar(255), IN p_apellido varchar(255), IN p_fecha_nacimiento varchar(255), IN p_sexo varchar(255), IN p_direccion varchar(255), IN p_telefono varchar(255), IN p_correo_electronico varchar(255), IN p_fecha_contratacion varchar(255), IN p_cargo varchar(255)) 
BEGIN
    INSERT INTO empleado (id_usuario, nombre, apellido, fecha_nacimiento, sexo, direccion, telefono, correo_electronico, fecha_contratacion, cargo) VALUES (p_id_usuario, p_nombre, p_apellido, p_fecha_nacimiento, p_sexo, p_direccion, p_telefono, p_correo_electronico, p_fecha_contratacion, p_cargo);
END $$

CREATE PROCEDURE Actualizar_empleado (IN p_id_empleado int, IN p_id_usuario int, IN p_nombre varchar(255), IN p_apellido varchar(255), IN p_fecha_nacimiento varchar(255), IN p_sexo varchar(255), IN p_direccion varchar(255), IN p_telefono varchar(255), IN p_correo_electronico varchar(255), IN p_fecha_contratacion varchar(255), IN p_cargo varchar(255)) 
BEGIN
    UPDATE empleado SET id_usuario = p_id_usuario, nombre = p_nombre, apellido = p_apellido, fecha_nacimiento = p_fecha_nacimiento, sexo = p_sexo, direccion = p_direccion, telefono = p_telefono, correo_electronico = p_correo_electronico, fecha_contratacion = p_fecha_contratacion, cargo = p_cargo WHERE id_empleado = p_id_empleado;
END $$

CREATE PROCEDURE Eliminar_empleado (IN p_id_empleado int) 
BEGIN
    DELETE FROM empleado WHERE id_empleado = p_id_empleado;
END $$

CREATE PROCEDURE ObtenerTodos_empleado () 
BEGIN
    SELECT * FROM empleado;
END $$

CREATE PROCEDURE Insertar_especialidad (IN p_nombre varchar(255), IN p_descripcion text) 
BEGIN
    INSERT INTO especialidad (nombre, descripcion) VALUES (p_nombre, p_descripcion);
END $$

CREATE PROCEDURE Actualizar_especialidad (IN p_id_especialidad int, IN p_nombre varchar(255), IN p_descripcion text) 
BEGIN
    UPDATE especialidad SET nombre = p_nombre, descripcion = p_descripcion WHERE id_especialidad = p_id_especialidad;
END $$

CREATE PROCEDURE Eliminar_especialidad (IN p_id_especialidad int) 
BEGIN
    DELETE FROM especialidad WHERE id_especialidad = p_id_especialidad;
END $$

CREATE PROCEDURE ObtenerTodos_especialidad () 
BEGIN
    SELECT * FROM especialidad;
END $$

CREATE PROCEDURE Insertar_examen (IN p_id_consulta int, IN p_tipo_examen varchar(255), IN p_resultado varchar(255), IN p_fecha_realizacion varchar(255)) 
BEGIN
    INSERT INTO examen (id_consulta, tipo_examen, resultado, fecha_realizacion) VALUES (p_id_consulta, p_tipo_examen, p_resultado, p_fecha_realizacion);
END $$

CREATE PROCEDURE Actualizar_examen (IN p_id_examen int, IN p_id_consulta int, IN p_tipo_examen varchar(255), IN p_resultado varchar(255), IN p_fecha_realizacion varchar(255)) 
BEGIN
    UPDATE examen SET id_consulta = p_id_consulta, tipo_examen = p_tipo_examen, resultado = p_resultado, fecha_realizacion = p_fecha_realizacion WHERE id_examen = p_id_examen;
END $$

CREATE PROCEDURE Eliminar_examen (IN p_id_examen int) 
BEGIN
    DELETE FROM examen WHERE id_examen = p_id_examen;
END $$

CREATE PROCEDURE ObtenerTodos_examen () 
BEGIN
    SELECT * FROM examen;
END $$

CREATE PROCEDURE Insertar_factura (IN p_id_ingreso int, IN p_fecha_factura varchar(255), IN p_monto_total int, IN p_forma_pago varchar(255), IN p_notas text) 
BEGIN
    INSERT INTO factura (id_ingreso, fecha_factura, monto_total, forma_pago, notas) VALUES (p_id_ingreso, p_fecha_factura, p_monto_total, p_forma_pago, p_notas);
END $$

CREATE PROCEDURE Actualizar_factura (IN p_id_factura int, IN p_id_ingreso int, IN p_fecha_factura varchar(255), IN p_monto_total int, IN p_forma_pago varchar(255), IN p_notas text) 
BEGIN
    UPDATE factura SET id_ingreso = p_id_ingreso, fecha_factura = p_fecha_factura, monto_total = p_monto_total, forma_pago = p_forma_pago, notas = p_notas WHERE id_factura = p_id_factura;
END $$

CREATE PROCEDURE Eliminar_factura (IN p_id_factura int) 
BEGIN
    DELETE FROM factura WHERE id_factura = p_id_factura;
END $$

CREATE PROCEDURE ObtenerTodos_factura () 
BEGIN
    SELECT * FROM factura;
END $$

CREATE PROCEDURE Insertar_hospital (IN p_nombre varchar(255), IN p_direccion varchar(255), IN p_telefono int, IN p_correo_electronico varchar(255), IN p_pagina_web varchar(255)) 
BEGIN
    INSERT INTO hospital (nombre, direccion, telefono, correo_electronico, pagina_web) VALUES (p_nombre, p_direccion, p_telefono, p_correo_electronico, p_pagina_web);
END $$

CREATE PROCEDURE Actualizar_hospital (IN p_id_hospital int, IN p_nombre varchar(255), IN p_direccion varchar(255), IN p_telefono int, IN p_correo_electronico varchar(255), IN p_pagina_web varchar(255)) 
BEGIN
    UPDATE hospital SET nombre = p_nombre, direccion = p_direccion, telefono = p_telefono, correo_electronico = p_correo_electronico, pagina_web = p_pagina_web WHERE id_hospital = p_id_hospital;
END $$

CREATE PROCEDURE Eliminar_hospital (IN p_id_hospital int) 
BEGIN
    DELETE FROM hospital WHERE id_hospital = p_id_hospital;
END $$

CREATE PROCEDURE ObtenerTodos_hospital () 
BEGIN
    SELECT * FROM hospital;
END $$

CREATE PROCEDURE Insertar_ingreso (IN p_id_paciente int, IN p_id_cama int, IN p_fecha_ingreso varchar(255), IN p_fecha_egreso varchar(255), IN p_motivo_ingreso varchar(255)) 
BEGIN
    INSERT INTO ingreso (id_paciente, id_cama, fecha_ingreso, fecha_egreso, motivo_ingreso) VALUES (p_id_paciente, p_id_cama, p_fecha_ingreso, p_fecha_egreso, p_motivo_ingreso);
END $$

CREATE PROCEDURE Actualizar_ingreso (IN p_id_ingreso int, IN p_id_paciente int, IN p_id_cama int, IN p_fecha_ingreso varchar(255), IN p_fecha_egreso varchar(255), IN p_motivo_ingreso varchar(255)) 
BEGIN
    UPDATE ingreso SET id_paciente = p_id_paciente, id_cama = p_id_cama, fecha_ingreso = p_fecha_ingreso, fecha_egreso = p_fecha_egreso, motivo_ingreso = p_motivo_ingreso WHERE id_ingreso = p_id_ingreso;
END $$

CREATE PROCEDURE Eliminar_ingreso (IN p_id_ingreso int) 
BEGIN
    DELETE FROM ingreso WHERE id_ingreso = p_id_ingreso;
END $$

CREATE PROCEDURE ObtenerTodos_ingreso () 
BEGIN
    SELECT * FROM ingreso;
END $$

CREATE PROCEDURE Insertar_inventario_medicamento (IN p_id_medicamento int, IN p_cantidad_stock int, IN p_fecha_vencimiento varchar(255)) 
BEGIN
    INSERT INTO inventario_medicamento (id_medicamento, cantidad_stock, fecha_vencimiento) VALUES (p_id_medicamento, p_cantidad_stock, p_fecha_vencimiento);
END $$

CREATE PROCEDURE Actualizar_inventario_medicamento (IN p_id_inventario int, IN p_id_medicamento int, IN p_cantidad_stock int, IN p_fecha_vencimiento varchar(255)) 
BEGIN
    UPDATE inventario_medicamento SET id_medicamento = p_id_medicamento, cantidad_stock = p_cantidad_stock, fecha_vencimiento = p_fecha_vencimiento WHERE id_inventario = p_id_inventario;
END $$

CREATE PROCEDURE Eliminar_inventario_medicamento (IN p_id_inventario int) 
BEGIN
    DELETE FROM inventario_medicamento WHERE id_inventario = p_id_inventario;
END $$

CREATE PROCEDURE ObtenerTodos_inventario_medicamento () 
BEGIN
    SELECT * FROM inventario_medicamento;
END $$

CREATE PROCEDURE Insertar_medicamento (IN p_nombre varchar(255), IN p_laboratorio varchar(255), IN p_composicion varchar(255), IN p_indicaciones text, IN p_contraindicaciones text, IN p_precio int) 
BEGIN
    INSERT INTO medicamento (nombre, laboratorio, composicion, indicaciones, contraindicaciones, precio) VALUES (p_nombre, p_laboratorio, p_composicion, p_indicaciones, p_contraindicaciones, p_precio);
END $$

CREATE PROCEDURE Actualizar_medicamento (IN p_id_medicamento int, IN p_nombre varchar(255), IN p_laboratorio varchar(255), IN p_composicion varchar(255), IN p_indicaciones text, IN p_contraindicaciones text, IN p_precio int) 
BEGIN
    UPDATE medicamento SET nombre = p_nombre, laboratorio = p_laboratorio, composicion = p_composicion, indicaciones = p_indicaciones, contraindicaciones = p_contraindicaciones, precio = p_precio WHERE id_medicamento = p_id_medicamento;
END $$

CREATE PROCEDURE Eliminar_medicamento (IN p_id_medicamento int) 
BEGIN
    DELETE FROM medicamento WHERE id_medicamento = p_id_medicamento;
END $$

CREATE PROCEDURE ObtenerTodos_medicamento () 
BEGIN
    SELECT * FROM medicamento;
END $$

CREATE PROCEDURE Insertar_medico (IN p_id_especialidad int, IN p_nombre varchar(255), IN p_apellido varchar(255), IN p_numero_licencia varchar(255), IN p_fecha_nacimiento varchar(255), IN p_sexo varchar(255), IN p_direccion varchar(255), IN p_telefono int, IN p_correo_electronico varchar(255), IN p_fecha_registro varchar(255)) 
BEGIN
    INSERT INTO medico (id_especialidad, nombre, apellido, numero_licencia, fecha_nacimiento, sexo, direccion, telefono, correo_electronico, fecha_registro) VALUES (p_id_especialidad, p_nombre, p_apellido, p_numero_licencia, p_fecha_nacimiento, p_sexo, p_direccion, p_telefono, p_correo_electronico, p_fecha_registro);
END $$

CREATE PROCEDURE Actualizar_medico (IN p_id_medico int, IN p_id_especialidad int, IN p_nombre varchar(255), IN p_apellido varchar(255), IN p_numero_licencia varchar(255), IN p_fecha_nacimiento varchar(255), IN p_sexo varchar(255), IN p_direccion varchar(255), IN p_telefono int, IN p_correo_electronico varchar(255), IN p_fecha_registro varchar(255)) 
BEGIN
    UPDATE medico SET id_especialidad = p_id_especialidad, nombre = p_nombre, apellido = p_apellido, numero_licencia = p_numero_licencia, fecha_nacimiento = p_fecha_nacimiento, sexo = p_sexo, direccion = p_direccion, telefono = p_telefono, correo_electronico = p_correo_electronico, fecha_registro = p_fecha_registro WHERE id_medico = p_id_medico;
END $$

CREATE PROCEDURE Eliminar_medico (IN p_id_medico int) 
BEGIN
    DELETE FROM medico WHERE id_medico = p_id_medico;
END $$

CREATE PROCEDURE ObtenerTodos_medico () 
BEGIN
    SELECT * FROM medico;
END $$

CREATE PROCEDURE Insertar_paciente (IN p_nombre varchar(255), IN p_apellido varchar(255), IN p_fecha_nacimiento varchar(255), IN p_sexo varchar(255), IN p_direccion varchar(255), IN p_telefono int, IN p_correo_electronico varchar(255), IN p_tipo_sangre varchar(255), IN p_alergias varchar(255), IN p_enfermedades_cronicas varchar(255), IN p_fecha_registro varchar(255)) 
BEGIN
    INSERT INTO paciente (nombre, apellido, fecha_nacimiento, sexo, direccion, telefono, correo_electronico, tipo_sangre, alergias, enfermedades_cronicas, fecha_registro) VALUES (p_nombre, p_apellido, p_fecha_nacimiento, p_sexo, p_direccion, p_telefono, p_correo_electronico, p_tipo_sangre, p_alergias, p_enfermedades_cronicas, p_fecha_registro);
END $$

CREATE PROCEDURE Actualizar_paciente (IN p_id_paciente int, IN p_nombre varchar(255), IN p_apellido varchar(255), IN p_fecha_nacimiento varchar(255), IN p_sexo varchar(255), IN p_direccion varchar(255), IN p_telefono int, IN p_correo_electronico varchar(255), IN p_tipo_sangre varchar(255), IN p_alergias varchar(255), IN p_enfermedades_cronicas varchar(255), IN p_fecha_registro varchar(255)) 
BEGIN
    UPDATE paciente SET nombre = p_nombre, apellido = p_apellido, fecha_nacimiento = p_fecha_nacimiento, sexo = p_sexo, direccion = p_direccion, telefono = p_telefono, correo_electronico = p_correo_electronico, tipo_sangre = p_tipo_sangre, alergias = p_alergias, enfermedades_cronicas = p_enfermedades_cronicas, fecha_registro = p_fecha_registro WHERE id_paciente = p_id_paciente;
END $$

CREATE PROCEDURE Eliminar_paciente (IN p_id_paciente int) 
BEGIN
    DELETE FROM paciente WHERE id_paciente = p_id_paciente;
END $$

CREATE PROCEDURE ObtenerTodos_paciente () 
BEGIN
    SELECT * FROM paciente;
END $$

CREATE PROCEDURE Insertar_paciente_seguro (IN p_id_paciente int, IN p_id_seguro int) 
BEGIN
    INSERT INTO paciente_seguro (id_paciente, id_seguro) VALUES (p_id_paciente, p_id_seguro);
END $$

CREATE PROCEDURE Actualizar_paciente_seguro (IN p_id_paciente_seguro int, IN p_id_paciente int, IN p_id_seguro int) 
BEGIN
    UPDATE paciente_seguro SET id_paciente = p_id_paciente, id_seguro = p_id_seguro WHERE id_paciente_seguro = p_id_paciente_seguro;
END $$

CREATE PROCEDURE Eliminar_paciente_seguro (IN p_id_paciente_seguro int) 
BEGIN
    DELETE FROM paciente_seguro WHERE id_paciente_seguro = p_id_paciente_seguro;
END $$

CREATE PROCEDURE ObtenerTodos_paciente_seguro () 
BEGIN
    SELECT * FROM paciente_seguro;
END $$

CREATE PROCEDURE Insertar_proveedor (IN p_nombre varchar(255), IN p_direccion varchar(255), IN p_telefono int, IN p_correo_electronico varchar(255)) 
BEGIN
    INSERT INTO proveedor (nombre, direccion, telefono, correo_electronico) VALUES (p_nombre, p_direccion, p_telefono, p_correo_electronico);
END $$

CREATE PROCEDURE Actualizar_proveedor (IN p_id_proveedor int, IN p_nombre varchar(255), IN p_direccion varchar(255), IN p_telefono int, IN p_correo_electronico varchar(255)) 
BEGIN
    UPDATE proveedor SET nombre = p_nombre, direccion = p_direccion, telefono = p_telefono, correo_electronico = p_correo_electronico WHERE id_proveedor = p_id_proveedor;
END $$

CREATE PROCEDURE Eliminar_proveedor (IN p_id_proveedor int) 
BEGIN
    DELETE FROM proveedor WHERE id_proveedor = p_id_proveedor;
END $$

CREATE PROCEDURE ObtenerTodos_proveedor () 
BEGIN
    SELECT * FROM proveedor;
END $$

CREATE PROCEDURE Insertar_seguro (IN p_nombre varchar(255), IN p_numero_poliza int, IN p_titular varchar(255), IN p_cobertura varchar(255)) 
BEGIN
    INSERT INTO seguro (nombre, numero_poliza, titular, cobertura) VALUES (p_nombre, p_numero_poliza, p_titular, p_cobertura);
END $$

CREATE PROCEDURE Actualizar_seguro (IN p_id_seguro int, IN p_nombre varchar(255), IN p_numero_poliza int, IN p_titular varchar(255), IN p_cobertura varchar(255)) 
BEGIN
    UPDATE seguro SET nombre = p_nombre, numero_poliza = p_numero_poliza, titular = p_titular, cobertura = p_cobertura WHERE id_seguro = p_id_seguro;
END $$

CREATE PROCEDURE Eliminar_seguro (IN p_id_seguro int) 
BEGIN
    DELETE FROM seguro WHERE id_seguro = p_id_seguro;
END $$

CREATE PROCEDURE ObtenerTodos_seguro () 
BEGIN
    SELECT * FROM seguro;
END $$

CREATE PROCEDURE Insertar_usuario (IN p_id_empleado int, IN p_nombre_usuario varchar(255), IN p_contraseña varchar(255), IN p_perfil varchar(255)) 
BEGIN
    INSERT INTO usuario (id_empleado, nombre_usuario, contraseña, perfil) VALUES (p_id_empleado, p_nombre_usuario, p_contraseña, p_perfil);
END $$

CREATE PROCEDURE Actualizar_usuario (IN p_id_usuario int, IN p_id_empleado int, IN p_nombre_usuario varchar(255), IN p_contraseña varchar(255), IN p_perfil varchar(255)) 
BEGIN
    UPDATE usuario SET id_empleado = p_id_empleado, nombre_usuario = p_nombre_usuario, contraseña = p_contraseña, perfil = p_perfil WHERE id_usuario = p_id_usuario;
END $$

CREATE PROCEDURE Eliminar_usuario (IN p_id_usuario int) 
BEGIN
    DELETE FROM usuario WHERE id_usuario = p_id_usuario;
END $$

CREATE PROCEDURE ObtenerTodos_usuario () 
BEGIN
    SELECT * FROM usuario;
END $$

DELIMITER ;
