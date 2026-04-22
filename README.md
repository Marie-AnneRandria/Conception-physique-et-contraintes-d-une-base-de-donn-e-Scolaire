
# TP2 - Conception physique et contraintes

### 8TRD157 – Bases de données avancées | UQAC
---
## 🎯 Objectif principal
 
Ce travail pratique vise à concevoir et implémenter la couche physique d'une base de données relationnelle dans un environnement Oracle. Il s'agit de traduire un modèle conceptuel (issu du TP1) en un schéma physique complet, incluant la création des tables, l'application des règles d'affaires sous forme de contraintes, l'encapsulation des opérations via des procédures stockées, l'insertion de données de test, ainsi que la gestion des droits d'accès par profil utilisateur.
 
---
 
## 🛠️ Outils et technologies utilisés
 
| Catégorie | Technologie |
|---|---|
| SGBD | Oracle Express (10g / 11g) |
| Langage | SQL (DDL, DML, DCL) |
| Langage procédural | PL/SQL (TRIGGERS, PROCEDURES, SEQUENCES) |
| Interface de commande | Oracle SQLPlus |
| Environnement graphique | Oracle SQL Developer |
| Éditeur de texte | VSCode / Notepad++ |
| Expressions régulières | Fonction Oracle `REGEXP_LIKE` |
 
---
 
## 📋 Méthodologie
 
### Étape 1 — Installation et configuration de l'environnement
Mise en place d'Oracle Express sur la machine locale. Création du compte Oracle pour le téléchargement. Test de la connexion via SQLPlus avec l'utilisateur `system`.
 
### Étape 2 — Création des tables (`cretab.sql`)
Rédaction du script SQL de création des tables en respectant les contraintes suivantes :
- Identification des clés primaires (`PRIMARY KEY`)
- Définition des contraintes de valeur (`NOT NULL`)
- Ajout des clés candidates (`UNIQUE`)
- Inclusion des instructions `DROP TABLE` en début de script pour permettre les relances
### Étape 3 — Identification et implémentation des contraintes
Analyse des règles d'affaires du système et choix de l'approche d'implémentation appropriée pour chacune :
- **CHECK** : contraintes statiques simples sur les valeurs d'une colonne
- **FOREIGN KEY** : contraintes de domaine via référence à une autre table
- **TRIGGER** : contraintes dynamiques complexes nécessitant une logique conditionnelle
### Étape 4 — Création des procédures stockées
Encapsulation des opérations de mise à jour de la base de données dans des procédures PL/SQL. Utilisation des `SEQUENCE` Oracle pour la génération automatique des clés artificielles, sans les passer en paramètre.
 
### Étape 5 — Insertion des données (`data.sql`)
Peuplement de la base de données via les procédures stockées :
- 2 départements
- 5 cours par département (10 au total)
- 4 enseignants, associés à un département et un cours
### Étape 6 — Gestion des droits d'accès
Création de deux utilisateurs Oracle distincts et attribution des privilèges :
- **Utilisateur administrateur (DBA)** : tous les droits sur le schéma (création, insertion, modification, suppression)
- **Utilisateur standard** : accès en lecture seule (`SELECT`) sur les tables; toute tentative d'insertion ou de modification est refusée
### Étape 7 — Tests et validation
Vérification du comportement des contraintes avec des cas valides et invalides. Validation des droits d'accès par captures d'écran pour les deux profils utilisateurs.
 
---
 
## 🏆 Résumé des compétences acquises
 
### 🔐 Gestion des droits d'accès
Création et configuration de deux profils utilisateurs Oracle avec des niveaux de privilèges différenciés. Maîtrise des commandes `GRANT` et `REVOKE` pour contrôler l'accès aux objets du schéma selon le principe du moindre privilège.
 
### 🏗️ Création des tables et modélisation physique
Traduction d'un modèle conceptuel en schéma physique Oracle. Application des types de données appropriés, définition des clés primaires et étrangères, et ajout des contraintes d'intégrité directement dans la structure des tables.
 
### ⚙️ Implémentation des contraintes (CHECK, FOREIGN KEY, TRIGGER)
Identification des règles d'affaires et sélection de la méthode d'implémentation optimale. Rédaction de triggers PL/SQL pour les contraintes dynamiques complexes, en privilégiant les `CHECK` lorsque applicable.
 
### 🔄 Procédures stockées et séquences Oracle
Encapsulation des opérations de modification de la base dans des procédures réutilisables et sécurisées. Utilisation des séquences Oracle (`CREATE SEQUENCE`) pour la génération automatique d'identifiants uniques.
 
### 🧪 Tests d'intégrité et validation
Élaboration de jeux de tests couvrant les cas valides et invalides pour chaque contrainte implémentée. Validation du comportement attendu du système face à des données incorrectes ou des opérations non autorisées.
 
### 📂 Gestion de scripts SQL structurés
Organisation du travail en fichiers SQL distincts et réutilisables (`cretab.sql`, `data.sql`). Bonne pratique d'inclusion des `DROP TABLE` pour garantir la reproductibilité des exécutions.
 
---
 
## 📁 Structure des fichiers
 
```
TP2/
├── cretab.sql       # Création des tables, contraintes et procédures stockées
├── data.sql         # Insertion des données de test
├── CREATION_UTILISATEURS.sql   # Création des utilisateurs
├── deuxieme_user.sql # Création d'un deuxième utilisateur
├── TP2_rapport.pdf      # Rapport de conception et justifications
├── TP2.pdf      # Consignes
└── TP2-GabaritRapport.doc      # Rapport de conception et justifications version word 

```
 
---
 
 


