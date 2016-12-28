select * from kiosco;
select * from empleado;
select * from rol;
select * from usuario;

INSERT INTO kiosco VALUES ('J11-1','Kiosco J11','5460-0923','08:00:00','17:00:00','08:05:00');
INSERT INTO empleado VALUES (1,'J11-1','Jearson','Mazariegos','2606-79674-0101','5460-0923','jearson.developer11@gmail.com',2750.00);
INSERT INTO rol VALUES (1,'Administrador'),(2,'Operador'),(3,'Reporteria'),(4,'Contabilidad');
INSERT INTO usuario(Empleado_ID_Empleado, User_Kiosco, Rol_ID_Rol, Pswd_Usuario, Fecha_Alta_Usuario,Estado_Usuario) 
			 VALUES(1, 'jmazariegos', 1, AES_ENCRYPT('jmazariegos11','11'), now(),'1');
             
SET @password='121';
select User_Kiosco, AES_DECRYPT(Pswd_Usuario,@password) FROM usuario WHERE Pswd_Usuario = AES_ENCRYPT('jmazariegos1','112');

SET @usuario='jmazariegos';
SET @password='jmazariegos11';
SET @llave='11';
SELECT Empleado_ID_Empleado, Estado_Usuario FROM usuario WHERE User_Kiosco = @usuario AND Pswd_Usuario = AES_ENCRYPT(@password,@llave);


SELECT AES_DECRYPT(Pswd_Usuario, '11') FROM usuario;

select length(AES_ENCRYPT('jmazariegos11','11'));

SELECT Empleado_ID_Empleado, Estado_Usuario FROM usuario WHERE User_Kiosco = 'jmazariegos' AND Pswd_Usuario = AES_ENCRYPT('jmazariegos11', '11');

SELECT 
    E.ID_Empleado,
    E.Kiosco_ID_Kiosco,
    U.Rol_ID_Rol,
    R.Descripcion_Rol,
    CONCAT(E.Nombre_Empleado,
            ' ',
            E.Apellido_Empleado) AS Nombre_Empleado,
    K.Descripcion_Kiosco,
    K.Horario_Ingreso_Kiosco,
    K.Horario_Max_Ingreso_Kiosco
FROM
    empleado E
INNER JOIN
    kiosco K ON E.Kiosco_ID_Kiosco = K.ID_Kiosco 
INNER JOIN
	usuario U ON E.ID_Empleado = U.Empleado_ID_Empleado
INNER JOIN
	rol R ON U.Rol_ID_Rol = R.ID_Rol
WHERE ID_Empleado = 1;

SELECT * FROM menu;
SELECT * FROM sub_menu;
SELECT * FROM rol_menu;

SET @Rol = 1;
SELECT 
    *
FROM
    MENU
WHERE
    ID_Menu IN (SELECT DISTINCT
            Sub_Menu_Menu_ID_Menu
        FROM
            rol_menu
        WHERE
            Rol_ID_Rol = @Rol)
        AND Estado_Menu = 1;
        
SELECT Sub_Menu_ID_Sub_Menu FROM rol_menu WHERE Sub_Menu_Menu_ID_Menu = 4;
SELECT * FROM rol_menu WHERE Sub_Menu_Menu_ID_Menu = 4;

SELECT 
    ID_Sub_Menu, Nombre_Sub_Menu, Ruta_Sub_Menu
FROM
    sub_menu
WHERE
    Estado_Sub_Menu = 1 AND Menu_ID_Menu = 2
        AND ID_Sub_Menu IN (SELECT 
            Sub_Menu_ID_Sub_Menu
        FROM
            rol_menu
        WHERE
            Sub_Menu_Menu_ID_Menu = 2);