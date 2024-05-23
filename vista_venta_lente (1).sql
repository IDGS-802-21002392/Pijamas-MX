DROP VIEW IF EXISTS vista_venta_lente;
CREATE VIEW vista_venta_lente AS(
	SELECT 
	pl.idPresupuestoLentesContacto, 
	pl.idExamenVista, ev.clave examenVista_clave, 
	ev.idEmpleado, e.idPersona idPersona_empleado, pee.nombre empleado_name, pee.apellidoPaterno empleado_apellidoPaterno, pee.apellidoMaterno empleado_apellidoMaterno, pee.genero empleado_genero, pee.fechaNacimiento empleado_fechaNacimiento, pee.calle empleado_Calle, pee.numero empleado_Numero, pee.colonia empleado_Colonia, pee.cp empleado_Cp, pee.ciudad empleado_Ciudad, pee.estado empleado_Estado, pee.telcasa empleado_Telcasa, pee.telmovil empleado_Telmovil, pee.email empleado_Email, e.idUsuario, u.nombre user_name, u.contrasenia, u.rol, u.lastToken, u.dateLastToken,e.numeroUnico empleado_numeroUnico, e.estatus empleado_estatus,
	ev.idCliente, c.idPersona idPersona_cliente, pec.nombre cliente_name, pec.apellidoPaterno cliente_apellidoPaterno, pec.apellidoMaterno cliente_apellidoMaterno, pec.genero cliente_genero, pec.fechaNacimiento cliente_fechaNacimiento, pec.calle cliente_Calle, pec.numero cliente_Numero, pec.colonia cliente_Colonia, pec.cp cliente_Cp, pec.ciudad cliente_Ciudad, pec.estado cliente_Estado, pec.telcasa cliente_Telcasa, pec.telmovil cliente_Telmovil, pec.email cliente_Email, c.numeroUnico cliente_numeroUnico, c.estatus cliente_estatus,
	ev.idGraduacion, g.esferaod, g.esferaoi, g.cilindrood, g.cilindrooi, g.ejeoi, g.ejeod, g.dip, g.estatus,
	ev.fecha, ev.estatus examenVista_estatus, 
	pl.idLenteContacto, lc.keratometria, lc.fotografia, lc.tipo, p.codigoBarras, p.nombre, p.marca, p.precioCompra, p.precioVenta, p.existencias, p.estatus producto_estatus,
	vp.cantidad, vp.precioUnitario, vp.descuento,
    v.idVenta,
    v.idEmpleado venta_idEmpleado, ve.idPersona venta_idPersona_empleado, vpee.nombre venta_empleado_name, vpee.apellidoPaterno venta_empleado_apellidoPaterno, vpee.apellidoMaterno venta_empleado_apellidoMaterno, vpee.genero venta_empleado_genero, vpee.fechaNacimiento venta_empleado_fechaNacimiento, vpee.calle venta_empleado_Calle, vpee.numero venta_empleado_Numero, vpee.colonia venta_empleado_Colonia, vpee.cp venta_empleado_Cp, vpee.ciudad venta_empleado_Ciudad, vpee.estado venta_empleado_Estado, vpee.telcasa venta_empleado_Telcasa, vpee.telmovil venta_empleado_Telmovil, vpee.email venta_empleado_Email, ve.idUsuario venta_idUsuario, vu.nombre venta_user_name, vu.contrasenia venta_password, vu.rol venta_rol, vu.lastToken venta_lastToken, vu.dateLastToken venta_dateLastToken, ve.numeroUnico venta_empleado_numeroUnico, ve.estatus venta_empleado_estatus,
	pl.clave
	FROM presupuesto_lentescontacto pl
	INNER JOIN examen_vista ev ON pl.idExamenVista = ev.idExamenVista
	INNER JOIN lente_contacto lc ON pl.idLenteContacto = lc.idLenteContacto
	INNER JOIN producto p ON lc.idProducto = p.idProducto
	INNER JOIN graduacion g ON ev.idGraduacion = g.idGraduacion
	INNER JOIN empleado e ON ev.idEmpleado = e.idEmpleado 
	INNER JOIN persona pee ON e.idPersona = pee.idPersona 
	INNER JOIN usuario u ON e.idUsuario = u.idUsuario
	INNER JOIN cliente c ON ev.idCliente = c.idCliente
	INNER JOIN persona pec ON c.idPersona = pec.idPersona
	INNER JOIN presupuesto pr ON pr.idExamenVista = ev.idExamenVista
	INNER JOIN venta_presupuesto vp ON vp.idPresupuesto = pr.idPresupuesto
    INNER JOIN venta v ON v.idVenta = vp.idVenta
    INNER JOIN empleado ve ON v.idEmpleado = ve.idEmpleado 
	INNER JOIN persona vpee ON ve.idPersona = vpee.idPersona 
	INNER JOIN usuario vu ON ve.idUsuario = vu.idUsuario
);
select * from vista_venta_lente;
