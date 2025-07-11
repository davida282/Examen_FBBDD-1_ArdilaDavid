create table clientes (
    id_clientes integer(10),
    historial_compras integer(100),
    nombre_cliente varchar(50),
    telefono_cliente varchar(20),
    primary key (id_clientes, historial_compras)
);

create table proovedores (
    id_proovedores integer(10),
    bicicleta_proovedor varchar(50),
    nombre_proovedores(50), 
    primary key (id_proovedores, bicicleta_proovedor)
);

create table inventarios_repuestos (
    precio_producto decimal(10,2),
    bicicleta_proovedor_fk varchar(50),
    marca_bicicleta varchar(50),
    fecha_llegada date,
    stock_llantas integer(500),
    repuestos_bicicleta varchar(100),
    primary key (precio_producto, bicicleta_proovedor_fk),
    foreign key (bicicleta_proovedor_fk) references proovedores (bicicleta_proovedor)
);

create table ventas_compras (
    fecha_venta date primary key,
    bicicleta_proovedor_fk varchar(50),
    precio_producto_fk decimal(10,2),
    historial_compras_fk integer(100),
    foreign key (bicicleta_proovedor_fk) references proovedores (bicicleta_proovedor),
    foreign key (precio_producto_fk) references inventarios_repuestos (precio_producto),
    foreign key (historial_compras_fk) references clientes (historial_compras)
);

create table fue_vendida (
    fecha_venta_fk date,
    id_clientes_fk integer(10),
    primary key (fecha_venta_fk, id_clientes_fk),
    foreign key (fecha_venta_fk) references ventas_compras (fecha_venta),
    foreign key (id_clientes_fk) references clientes (id_clientes)
);