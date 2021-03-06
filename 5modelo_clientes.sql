/*20180104*/
/*USE ODS;

DROP TABLE IF EXISTS ODS_HC_CLIENTES;

TRUNCATE TABLE ODS_HC_CLIENTES;

CREATE TABLE ODS_HC_CLIENTES
(ID_CLIENTE INT NOT NULL PRIMARY KEY
, NOMBRE_CLIENTE VARCHAR(512)
, APELLIDOS_CLIENTE VARCHAR(512)
, NUMDOC_CLIENTE VARCHAR(24)
, ID_SEXO INT(10) UNSIGNED
, ID_DIRECCION_CLIENTE INT
, TELEFONO_CLIENTE BIGINT
, EMAIL VARCHAR(512)
, FC_NACIMIENTO DATE
, ID_PROFESION INT
, ID_COMPANYA INT
, FC_INSERT DATETIME
, FC_MODIFICACION DATETIME);

*/


/*
USE ODS;
DROP TABLE IF EXISTS ODS_DM_SEXOS;
CREATE TABLE ODS_DM_SEXOS
(ID_SEXO INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
, DE_SEXO VARCHAR(64)
, FC_INSERT DATETIME
, FC_MODIFICACION DATETIME);
*/

/*USE ODS;
DROP TABLE IF EXISTS ODS_DM_PROFESIONES;
CREATE TABLE ODS_DM_PROFESIONES
(ID_PROFESION INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY
, DE_PROFESION VARCHAR(512)
, FC_INSERT DATETIME
, FC_MODIFICACION DATETIME);*/

/*USE ODS;
DROP TABLE IF EXISTS ODS_DM_COMPANYAS;
CREATE TABLE ODS_DM_COMPANYAS
(ID_COMPANYA INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY
, DE_COMPANYA VARCHAR(512)
, FC_INSERT DATETIME
, FC_MODIFICACION DATETIME);
*/

/*USE ODS;
DROP TABLE IF EXISTS ODS_HC_DIRECCIONES;
CREATE TABLE ODS_HC_DIRECCIONES
(ID_DIRECCION INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY
, DE_DIRECCION VARCHAR(512)
, DE_CP INT
, ID_CIUDAD_ESTADO INT
, FC_INSERT DATETIME
, FC_MODIFICACION DATETIME);*/

/*USE ODS;
SET FOREIGN_KEY_CHECKS=0;

SET FOREIGN_KEY_CHECKS=1;
TRUNCATE TABLE ODS_DM_CIUDADES_ESTADOS;

DROP TABLE IF EXISTS ODS_DM_CIUDADES_ESTADOS;
CREATE TABLE ODS_DM_CIUDADES_ESTADOS
(ID_CIUDAD_ESTADO INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY
, DE_CIUDAD VARCHAR(512)
, DE_ESTADO VARCHAR(512)
, ID_PAIS INT
, FC_INSERT DATETIME
, FC_MODIFICACION DATETIME);*/


/*
USE ODS;
SET FOREIGN_KEY_CHECKS=1;
TRUNCATE ODS_DM_PAISES;

DROP TABLE IF EXISTS ODS_DM_PAISES;
CREATE TABLE ODS_DM_PAISES
(ID_PAIS INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY
, DE_PAIS VARCHAR(512)
, FC_INSERT DATETIME
, FC_MODIFICACION DATETIME);*/

/*CREAMOS LAS FK DEL MODELO DE CLIENTES*/

/*
USE ODS;


ALTER TABLE ODS.ODS_HC_CLIENTES ADD INDEX fk_cli_sexo_idx (ID_SEXO ASC);
ALTER TABLE ODS.ODS_HC_CLIENTES ADD CONSTRAINT fk_cli_sexo FOREIGN KEY (ID_SEXO)
	REFERENCES ODS.ODS_DM_SEXOS (ID_SEXO);
    


#ALTER TABLE ODS.ODS_HC_CLIENTES MODIFY COLUMN ID_PROFESION INT(10) UNSIGNED;
ALTER TABLE ODS.ODS_HC_CLIENTES ADD INDEX fk_cli_prof_idx (ID_PROFESION ASC);
ALTER TABLE ODS.ODS_HC_CLIENTES ADD CONSTRAINT fk_cli_prof_idx FOREIGN KEY (ID_PROFESION)
	REFERENCES ODS.ODS_DM_PROFESIONES (ID_PROFESION);
    

#ALTER TABLE ODS.ODS_HC_CLIENTES MODIFY COLUMN ID_COMPANYA INT(10) UNSIGNED;
ALTER TABLE ODS.ODS_HC_CLIENTES ADD INDEX fk_cli_comp_idx (ID_COMPANYA ASC);
ALTER TABLE ODS.ODS_HC_CLIENTES ADD CONSTRAINT fk_cli_comp FOREIGN KEY (ID_COMPANYA)
	REFERENCES ODS.ODS_DM_COMPANYAS (ID_COMPANYA);
    
    
#ALTER TABLE ODS.ODS_HC_CLIENTES MODIFY COLUMN ID_DIRECCION_CLIENTE INT(10) UNSIGNED;
ALTER TABLE ODS.ODS_HC_CLIENTES ADD INDEX fk_cli_dir_idx (ID_DIRECCION_CLIENTE ASC);
ALTER TABLE ODS.ODS_HC_CLIENTES ADD CONSTRAINT fk_cli_dir FOREIGN KEY (ID_DIRECCION_CLIENTE)
	REFERENCES ODS.ODS_HC_DIRECCIONES (ID_DIRECCION);


#ALTER TABLE ODS.ODS_DM_CIUDADES_ESTADOS MODIFY COLUMN ID_PAIS INT(10) UNSIGNED;
ALTER TABLE ODS.ODS_DM_CIUDADES_ESTADOS ADD INDEX fk_ciu_pai_idx (ID_PAIS ASC);
ALTER TABLE ODS.ODS_DM_CIUDADES_ESTADOS ADD CONSTRAINT fk_ciu_pai FOREIGN KEY (ID_PAIS)
	REFERENCES ODS.ODS_DM_PAISES (ID_PAIS);
    
    
#ALTER TABLE ODS.ODS_HC_DIRECCIONES MODIFY COLUMN ID_CIUDAD_ESTADO INT(10) UNSIGNED;

ALTER TABLE ODS.ODS_HC_DIRECCIONES ADD INDEX fk_dir_ciu_idx (ID_CIUDAD_ESTADO ASC);
ALTER TABLE ODS.ODS_HC_DIRECCIONES ADD CONSTRAINT fk_dir_ciu FOREIGN KEY (ID_CIUDAD_ESTADO)
	REFERENCES ODS.ODS_DM_CIUDADES_ESTADOS(ID_CIUDAD_ESTADO);
    */




/*POBLADO DE DATOS*/

/*
USE ODS;

INSERT INTO ODS_DM_SEXOS VALUES (1,'MALE',now(),now());
INSERT INTO ODS_DM_SEXOS VALUES (2,'FEMALE',now(),now());
INSERT INTO ODS_DM_SEXOS VALUES (99,'DESCONOCIDO',now(),now());
INSERT INTO ODS_DM_SEXOS VALUES (98,'NO APLICA',now(),now());

COMMIT;

ANALYZE TABLE ODS_DM_SEXOS;

*/

/*



INSERT INTO ODS_DM_PROFESIONES(DE_PROFESION,FC_INSERT,FC_MODIFICACION)
SELECT DISTINCT UPPER(TRIM(PROFESION)) PROFESION, NOW(),NOW()
FROM STAGE.STG_CLIENTES_CRM
WHERE TRIM(PROFESION)<>'';

COMMIT;

INSERT INTO ODS_DM_PROFESIONES VALUES (9998,'NO APLICA', NOW(),NOW());
INSERT INTO ODS_DM_PROFESIONES VALUES (9999,'DESCONOCIDO', NOW(),NOW());

ANALYZE TABLE ODS_DM_PROFESIONES;


INSERT INTO ODS_DM_COMPANYAS (DE_COMPANYA, FC_INSERT, FC_MODIFICACION)
SELECT distinct UPPER(TRIM(COMPANY)) DE_COMPANYA, NOW(), now()
FROM STAGE.STG_CLIENTES_CRM
WHERE length(TRIM(COMPANY))<>0;

INSERT INTO ODS_DM_COMPANYAS VALUES (99998,'NO APLICA', NOW(),NOW());
INSERT INTO ODS_DM_COMPANYAS VALUES (99999,'DESCONOCIDO', NOW(),NOW());

ANALYZE TABLE ODS_DM_COMPANYAS;


*/

/*
INSERT INTO ODS_DM_PAISES (DE_PAIS, FC_INSERT, FC_MODIFICACION)
SELECT distinct UPPER(TRIM(COUNTRY)) PAIS, NOW(), NOW()
FROM STAGE.STG_CLIENTES_CRM
WHERE TRIM(COUNTRY)<>'';
INSERT INTO ODS_DM_PAISES VALUES (98,'NO APLICA', NOW(),NOW());
INSERT INTO ODS_DM_PAISES VALUES (99,'DESCONOCIDO', NOW(),NOW());

ANALYZE TABLE ODS_DM_PAISES;


INSERT INTO ODS_DM_CIUDADES_ESTADOS (DE_CIUDAD, DE_ESTADO, ID_PAIS, FC_INSERT, FC_MODIFICACION)
select distinct case when TRIM(CITY)<>'' THEN UPPER(TRIM(CITY)) ELSE 'DESCONOCIDO' END CIUDAD
, CASE WHEN TRIM(STATE)<>'' THEN UPPER(TRIM(STATE)) ELSE 'DESCONOCIDO'END ESTADO, PAI.ID_PAIS, NOW(), NOW()
FROM STAGE.STG_CLIENTES_CRM CLI
INNER JOIN ODS.ODS_DM_PAISES PAI ON CASE WHEN length(TRIM(CLI.COUNTRY))<>0 THEN CLI.COUNTRY ELSE 'DESCONOCIDO' END=PAI.DE_PAIS
WHERE TRIM(CITY)<>'' OR TRIM(STATE)<>'';

INSERT INTO ODS_DM_CIUDADES_ESTADOS VALUES (9998,'NO APLICA', 99, 99, NOW(),NOW());
INSERT INTO ODS_DM_CIUDADES_ESTADOS VALUES (9999,'DESCONOCIDO', 98, 98, NOW(),NOW());
ANALYZE TABLE ODS_DM_CIUDADES_ESTADOS;


INSERT INTO ODS_HC_DIRECCIONES (DE_DIRECCION, DE_CP, ID_CIUDAD_ESTADO, FC_INSERT, FC_MODIFICACION)
select distinct UPPER(TRIM(ADDRESS)) DIRECCION 
, CASE WHEN length(TRIM(CLI.POSTAL_CODE))<>0 THEN TRIM(CLI.POSTAL_CODE) ELSE 99999 END CP,CIU.ID_CIUDAD_ESTADO, NOW(), NOW()
FROM  STAGE.STG_CLIENTES_CRM CLI
INNER JOIN ODS.ODS_DM_PAISES PAI ON CASE WHEN length(TRIM(CLI.COUNTRY))<>0 THEN CLI.COUNTRY ELSE 'DESCONOCIDO' END=PAI.DE_PAIS
INNER JOIN ODS.ODS_DM_CIUDADES_ESTADOS CIU ON CASE WHEN LENGTH(TRIM(CLI.CITY))<>0 THEN CLI.CITY ELSE 'DESCONOCIDO' END=CIU.DE_CIUDAD
									AND CASE WHEN LENGTH(TRIM(CLI.STATE))<>0 THEN CLI.STATE ELSE 'DESCONOCIDO' END=CIU.DE_ESTADO
WHERE LENGTH(TRIM(ADDRESS))<>0;

ANALYZE TABLE ODS_HC_DIRECCIONES;


SET FOREIGN_KEY_CHECKS=0;
INSERT INTO ODS_HC_DIRECCIONES VALUES (999998,'NO APLICA', 99998, 998, NOW(),NOW());
INSERT INTO ODS_HC_DIRECCIONES VALUES (999999,'DESCONOCIDO',99999, 999,NOW(),NOW());
SET FOREIGN_KEY_CHECKS=1;

ANALYZE TABLE ODS_HC_DIRECCIONES;


USE ODS;
DROP TABLE IF EXISTS TMP_DIRECCIONES_CLIENTES;

CREATE TABLE TMP_DIRECCIONES_CLIENTES AS
SELECT DIR.ID_DIRECCION
, DIR.DE_DIRECCION
, DIR.DE_CP
, CIU.DE_CIUDAD
, CIU.DE_ESTADO
, PAI.DE_PAIS
FROM ODS.ODS_HC_DIRECCIONES DIR
INNER JOIN ODS.ODS_DM_CIUDADES_ESTADOS CIU ON DIR.ID_CIUDAD_ESTADO=CIU.ID_CIUDAD_ESTADO
INNER JOIN ODS_DM_PAISES PAI ON CIU.ID_PAIS=PAI.ID_PAIS;

ANALYZE TABLE TMP_DIRECCIONES_CLIENTES;

DROP TABLE IF EXISTS TMP_DIRECCIONES_CLIENTES2;


CREATE TABLE TMP_DIRECCIONES_CLIENTES2 AS
SELECT CLIENTES.CUSTOMER_ID ID_CLIENTE
, DIR.ID_DIRECCION
FROM STAGE.STG_CLIENTES_CRM CLIENTES
INNER JOIN ODS.TMP_DIRECCIONES_CLIENTES DIR ON CASE WHEN TRIM(ADDRESS)<>'' THEN UPPER(TRIM(CLIENTES.ADDRESS)) ELSE 'DESCONOCIDO' END=DIR.DE_DIRECCION
												AND CASE WHEN TRIM(CLIENTES.POSTAL_CODE)<>'' THEN TRIM(CLIENTES.POSTAL_CODE) ELSE 99999 END=DIR.DE_CP
                                               AND CASE WHEN TRIM(CLIENTES.CITY)<>'' THEN CLIENTES.CITY ELSE 'DESCONOCIDO' END=DIR.DE_CIUDAD
                                                AND CASE WHEN TRIM(CLIENTES.STATE)<>'' THEN CLIENTES.STATE ELSE 'DESCONOCIDO' END=DIR.DE_ESTADO
                                                AND CASE WHEN TRIM(CLIENTES.COUNTRY)<>'' THEN CLIENTES.COUNTRY ELSE 'DESCONOCIDO' END=DIR.DE_PAIS;
                                                
ANALYZE TABLE TMP_DIRECCIONES_CLIENTES2;
    
*/

/*

USE ODS;

INSERT INTO ODS_HC_CLIENTES
select CUSTOMER_ID ID_CLIENTE
, CASE WHEN length(TRIM(FIRST_NAME))<>0 THEN TRIM(UPPER(FIRST_NAME)) ELSE 'DESCONOCIDO' END NOMBRE_CLIENTE
, CASE WHEN length(TRIM(LAST_NAME))<>0 THEN TRIM(UPPER(LAST_NAME)) ELSE 'DESCONOCIDO' END APELLIDOS_CLIENTE
, CASE WHEN length(TRIM(IDENTIFIED_DOC))<>0 THEN TRIM(UPPER(IDENTIFIED_DOC)) ELSE '99-999-9999' END NUMDOC_CLIENTE
, ID_SEXO
, CASE WHEN length(TRIM(DIR.ID_DIRECCION))<>0 THEN DIR.ID_DIRECCION ELSE 999999 END ID_DIRECCION
, CASE WHEN length(TRIM(PHONE))<>0 THEN REPLACE(PHONE,'-','') ELSE 999999999 END TELEFONO_CLIENTE
, CASE WHEN length(TRIM(EMAIL))<>0 THEN TRIM(UPPER(EMAIL)) ELSE 'DESCONOCIDO' END EMAIL
, CASE WHEN length(TRIM(BIRTHDAY))<>0 THEN str_to_date(BIRTHDAY, '%d/%m/%Y') ELSE str_to_date('31/12/9999', '%d/%m/%Y') END FC_NACIMIENTO
, PROF.ID_PROFESION
, COMP.ID_COMPANYA
, NOW()
, NOW()
from STAGE.STG_CLIENTES_CRM CLIENTES
INNER JOIN ODS.ODS_DM_SEXOS SEXO ON CASE WHEN LENGTH(TRIM(GENDER))<>0 THEN UPPER(TRIM(CLIENTES.GENDER)) ELSE 'DESCONOCIDO' END=SEXO.DE_SEXO
INNER JOIN ODS.ODS_DM_PROFESIONES PROF ON CASE WHEN LENGTH(TRIM(PROFESION))<>0 THEN UPPER(TRIM(CLIENTES.PROFESION)) ELSE 'NO APLICA' END=PROF.DE_PROFESION
INNER JOIN ODS.ODS_DM_COMPANYAS COMP ON CASE WHEN LENGTH(TRIM(COMPANY))<>0 THEN UPPER(TRIM(CLIENTES.COMPANY)) ELSE 'DESCONOCIDO' END=COMP.DE_COMPANYA
LEFT OUTER JOIN ODS.TMP_DIRECCIONES_CLIENTES2 DIR ON DIR.ID_CLIENTE=CLIENTES.CUSTOMER_ID;

ANALYZE TABLE ODS_HC_CLIENTES;
*/

    
    
    