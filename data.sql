
/*Tâche 3: Insertion des donnees */

/* 1- Création de deux departements*/

EXEC P_AJOUT_DEPARTEMENT(125,'DEPARTEMENT D''INFORMATIQUE ET MATHEMATIQUES') ;

EXEC P_AJOUT_DEPARTEMENT(300,'DEPARTEMENT DES ARTS ET DES LETTRES');


/*  2- Ajout des 5 cours par departement */



/*Insertion de 5 cours pour le departement d''informatique et mathématiques */
                    
EXEC P_AJOUT_COURS('8MAT104', 'CALCULS INTEGRALES', 125,NULL, 3,6,3);
EXEC P_AJOUT_COURS('8MAT302', 'INTRODUCTION A L''ALGEBRE LINAEAIRE',125, NULL);
EXEC P_AJOUT_COURS('3MAT209', 'CALCULS NUMERIQUES', 125);
EXEC P_AJOUT_COURS('8INF101', 'BASES DES DONNES', 125,NULL, 3,6,3);
EXEC P_AJOUT_COURS('9INF452', 'BASE DES DONNES AVANCEES', 125,NULL, 15,100,182);


/*Insertion de 5 cours Dans le departement des arts et des lettres*/
EXEC P_AJOUT_COURS('6FRA990','LETTRES MODERNES FRANCAISE',300);
EXEC P_AJOUT_COURS('7FRA521','LITTERATURE ANCIENNE',300);
EXEC P_AJOUT_COURS('8ENG412','NOTIONS DE BASE POUR  ANGLAIS',300);
EXEC P_AJOUT_COURS('6DIG940', 'LITTERATURE DES BEAUX ARTS', 300);
EXEC P_AJOUT_COURS('6DIG514', 'LES BEAUX ARTS POUR DEBUTANT', 300);

SELECT * FROM COURS ;

/* 3 - Creation des 4 enseignants */


EXEC P_AJOUT_ENSEIGNANT('PAB350', 'PATRICIA', 'BOUDREAULT', NULL, '4521', '3', 125 ) ;
EXEC P_AJOUT_ENSEIGNANT('JINAULT85', 'JIMMY-GIRARD', 'NAULT', NULL, '4460','2',125) ;
EXEC P_AJOUT_ENSEIGNANT('WIFOT44', 'WILSON', 'FOTSING', NULL, '0254', '1',300 ) ;
EXEC P_AJOUT_ENSEIGNANT('MARIAY17', 'MARIE-ANNE', 'RANDRIANARINOVY', NULL, '1247', '4' ) ;
EXEC P_AJOUT_ENSEIGNANT('WILSDEFOT5', 'WILSON', 'FOTSING' ) ;

SELECT * FROM ENSEIGNANT ;

/*  ON ASSOCIE CHAQUE ENSEIGNANT N'AYANT PAS DE DEPARTEMENT  A UN DEPARTEMENT */
UPDATE ENSEIGNANT SET NRO_DEPARTEMENT = 125 WHERE ENSEIGNANT.MATRICULE_ENSEIGNANT = 'MARIAY17' ;
UPDATE ENSEIGNANT SET NRO_DEPARTEMENT = 300 WHERE ENSEIGNANT.NRO_DEPARTEMENT IS NULL  ;
SELECT * FROM ENSEIGNANT ;

/* ASSOCIONS CES ENSEIGNANTS A UN COURS */ 
UPDATE COURS SET RESP_COURS = 'PAB350' WHERE COURS.SIGLE_COURS = '8MAT104';
UPDATE COURS SET RESP_COURS = 'JINAULT85' WHERE COURS.SIGLE_COURS = '9INF452';
UPDATE COURS SET RESP_COURS = 'WIFOT44' WHERE COURS.SIGLE_COURS = '6FRA990';
UPDATE COURS SET RESP_COURS = 'MARIAY17' WHERE COURS.SIGLE_COURS = '8INF101';
UPDATE COURS SET RESP_COURS = 'WILSDEFOT5' WHERE COURS.SIGLE_COURS = '8ENG412';

SELECT * FROM COURS ;

----------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
-- QUESTION THEORIQUE : CREATION DE LA VUE DEPARTEMENT 
-------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
-- JE NOMME D ABORD LES DIRECTEURS DE DEPARTEMENT
INSERT INTO DIRECTEUR_DEPARTEMENT (ID_DIR_DPT, NRO_DEPARTEMENT, MATRICULE_DIRECTEUR)
VALUES (SEQ_ID_DIR_DPT.NEXTVAL, 125, 'PAB350');

INSERT INTO DIRECTEUR_DEPARTEMENT (ID_DIR_DPT,NRO_DEPARTEMENT, MATRICULE_DIRECTEUR)
VALUES(SEQ_ID_DIR_DPT.NEXTVAL, 300,'WIFOT44');

CREATE OR REPLACE VIEW VUE_DEPARTEMENT AS
SELECT 
    D.NRO_DEPARTEMENT, D.NOM_DEPARTEMENT,
    E.MATRICULE_ENSEIGNANT AS DIRECTEUR, E.PRENOM AS PRENOM, E.NOM AS NOM
FROM 
    DEPARTEMENT D LEFT JOIN DIRECTEUR_DEPARTEMENT DIR ON D.NRO_DEPARTEMENT = DIR.NRO_DEPARTEMENT
                  LEFT JOIN ENSEIGNANT E  ON E.MATRICULE_ENSEIGNANT = DIR.MATRICULE_DIRECTEUR
ORDER BY D.NRO_DEPARTEMENT, E.NOM;

SELECT * FROM VUE_DEPARTEMENT ;


----------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
-- ON VA AUSSI CREER LA VUE DES COURS
-------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW VUE_COURS AS
SELECT C.SIGLE_COURS, C.TITRE_COURS,
       D.NOM_DEPARTEMENT, 
       C.RESP_COURS AS ENSEIGNANT_RESPONSABLE, E.PRENOM AS PRENOM, E.NOM AS NOM,
       C.NBR_CREDITS, C.HEURES_THEORIQUES, C.HEURE_PERSO
FROM COURS C 
    LEFT JOIN ENSEIGNANT E ON C.RESP_COURS = E.MATRICULE_ENSEIGNANT
    LEFT JOIN DEPARTEMENT D ON C.NRO_DEPARTEMENT = D.NRO_DEPARTEMENT ;

