

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
-----PREMIEREMENT JE CREE L'UTILISATEUR WILSON QUI SERA LE BBA
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

/*
CREATE USER WILSON IDENTIFIED BY "uqac2025"
ACCOUNT UNLOCK 
DEFAULT TABLESPACE USERS 
TEMPORARY TABLESPACE TEMP;

ALTER SESSION SET CONTAINER = XEPDB1;
GRANT DBA TO WILSON;

*/

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
-----jE CREE MAINTENANT LE DEUXIEME USER
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

/*ALTER SESSION SET CONTAINER = XEPDB1;


CREATE USER UTILISATEUR2
IDENTIFIED BY "uqac2025"
ACCOUNT UNLOCK
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;
*/

/*GRANT CREATE SESSION TO UTILISATEUR2;*/

-- Accès lecture seule sur toutes les tables existantes
GRANT SELECT ON LOCAL TO UTILISATEUR2;
GRANT SELECT ON WILSON.PERSONNE TO UTILISATEUR2;
GRANT SELECT ON WILSON.ADRESSE_PERSONNE TO UTILISATEUR2;
GRANT SELECT ON WILSON.ENSEIGNANT TO UTILISATEUR2;
GRANT SELECT ON WILSON.ETUDIANT TO UTILISATEUR2;
GRANT SELECT ON WILSON.DEPARTEMENT TO UTILISATEUR2;
GRANT SELECT ON WILSON.DIRECTEUR_DEPARTEMENT TO UTILISATEUR2;
GRANT SELECT ON WILSON.COURS TO UTILISATEUR2;
GRANT SELECT ON WILSON.COURS_PREALABLE TO UTILISATEUR2;
GRANT SELECT ON WILSON.COURS_ENSEIGNE TO UTILISATEUR2;
GRANT SELECT ON WILSON.PLANIFICATION TO UTILISATEUR2;
GRANT SELECT ON WILSON.INSCRIPTION TO UTILISATEUR2;
GRANT SELECT ON WILSON.VUE_DEPARTEMENT TO UTILISATEUR2; 
GRANT SELECT ON WILSON. VUE_COURS TO UTILISATEUR2

