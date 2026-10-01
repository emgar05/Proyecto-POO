Create database EliteTaekwondo;
use EliteTaekwondo;

Create table Secretaria(
id_secretaria int auto_increment primary key,
nombre varchar(40) not null,
edad int not null,
telefono varchar(12),
correo varchar(40) unique,
check (edad>0)
);

Create table Tutor(
id_tutor int auto_increment primary key,
nombre varchar(50) not null,
telefono varchar(12),
correo varchar(40)
);
 
Create table Alumno(
id_alumno int auto_increment primary key,
nombre varchar(60) not null,
edad int not null,
certificado_medico varchar(60),
curp varchar(25) unique,
id_tutor int not null,
id_secretaria int not null,
check (edad>0),
foreign key (id_tutor) references Tutor(id_tutor),
foreign key (id_secretaria) references Secretaria(id_secretaria)
);

Create table Comprobante_pago(
id_comprobante int auto_increment primary key,
numero_comprobante varchar(30) not null unique,
mes int not null,
año int not null,
fecha_pago date not null,
metodo_pago varchar(20) not null,
monto_total decimal(8,2) not null,
id_tutor int not null,
id_alumno int not null,
id_secretaria int not null,
check (mes between 1 and 12),
check (monto_total>0),
check (metodo_pago in ('Efectivo','Transferencia','Tarjeta')),
unique (id_alumno, mes, año),
foreign key (id_tutor) references Tutor(id_tutor),
foreign key (id_alumno) references Alumno(id_alumno),
foreign key (id_secretaria) references Secretaria(id_secretaria)
);
 
Create table Cliente(
id_cliente int auto_increment primary key,
nombre varchar(30) not null,
telefono varchar(10),
correo varchar(35)
);
 
Create table Producto(
id_producto int auto_increment primary key,
codigo varchar(12) not null unique,
nombre varchar(20) not null,
categoria varchar(20),
unidad varchar(10),
precio decimal(5,2) not null,
check (precio>=0)
);
 
Create table Inventario(
id_inventario int auto_increment primary key,
cantidad int not null,
fecha_entrada datetime,
fecha_salida datetime,
id_producto int not null,
check (cantidad >= 0),
foreign key (id_producto) references Producto(id_producto)
);
 
Create table Compra(
no_venta int auto_increment primary key,
fecha datetime not null,
total decimal(8,2) not null,
id_cliente int not null,
id_secretaria int not null,
check (total>=0),
foreign key (id_cliente) references Cliente(id_cliente),
foreign key (id_secretaria) references Secretaria(id_secretaria)
);
 
Create table Compra_producto(
no_venta int not null,
id_producto int not null,
cantidad int not null,
primary key (no_venta, id_producto),
check (cantidad>0),
foreign key (no_venta) references Compra(no_venta),
foreign key (id_producto) references Producto(id_producto)
);
 