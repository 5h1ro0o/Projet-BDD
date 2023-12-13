-- Table roles :
CREATE TABLE Roles (
  role_id INT PRIMARY KEY,
  role_name VARCHAR(45)
);

-- Données roles :
INSERT INTO Roles (role_id, role_name) VALUES 
(1, 'Administrateur'),
(2, 'Data Engineers'),
(3, 'Data Analyst'),
(4, 'Data Scientist'),
(5, 'Stagiaire'),
(6, 'Métier');


-- Administrateur table :
CREATE TABLE Administrateur (
  idAdministrateur INT PRIMARY KEY,
  username VARCHAR(45),
  password VARCHAR(100),
  email VARCHAR(45),
  permission TEXT,
  Roles_role_id INT,
  FOREIGN KEY (Roles_role_id) REFERENCES Roles(role_id)
);

-- Data Engineers table :
CREATE TABLE DataEngineers (
  idDataEngineers INT PRIMARY KEY,
  username VARCHAR(45),
  password VARCHAR(100),
  email VARCHAR(45),
  permission TEXT,
  Roles_role_id INT,
  FOREIGN KEY (Roles_role_id) REFERENCES Roles(role_id)
);

-- Data Analyst table :
CREATE TABLE DataAnalyst (
  idDataAnalyst INT PRIMARY KEY,
  username VARCHAR(45),
  password VARCHAR(100),
  email VARCHAR(45),
  permission TEXT,
  Roles_role_id INT,
  FOREIGN KEY (Roles_role_id) REFERENCES Roles(role_id)
);

-- Data Scientist table :
CREATE TABLE DataScientist (
  idScientist INT PRIMARY KEY,
  username VARCHAR(45),
  password VARCHAR(100),
  email VARCHAR(45),
  permission TEXT,
  Roles_role_id INT,
  FOREIGN KEY (Roles_role_id) REFERENCES Roles(role_id)
);
-- Stagiaire table :
CREATE TABLE Stagiaire (
  idStagiaire INT PRIMARY KEY,
  username VARCHAR(45),
  password VARCHAR(100),
  email VARCHAR(45),
  Date_fin_stage DATETIME,
  permission TEXT,
  Roles_role_id INT,
  FOREIGN KEY (Roles_role_id) REFERENCES Roles(role_id)
);

-- insertion des données SQL :
-- Rôle d'Administrateur.
-- 1er Administrateur.
INSERT INTO Administrateur (idAdministrateur, username, password, email, permission, Roles_role_id) 
VALUES (101, 'admin_user1', 'admin_pass1', 'admin1@example.com', 'all_permissions', 1);
-- 2ème Administrateur.
INSERT INTO Administrateur (idAdministrateur, username, password, email, permission, Roles_role_id)
VALUES (102, 'admin_user2', 'admin_pass2', 'admin2@example.com', 'all_permissions', 1);

-- Rôle de Data Engineer.
-- 1er Data Engineer.
INSERT INTO DataEngineers (idDataEngineers, username, password, email, permission, Roles_role_id) 
VALUES (201, 'dataeng_user1', 'dataeng_pass1', 'dataeng1@example.com', 'eng_permissions', 2);
-- 2ème Data Engineer.
INSERT INTO DataEngineers (idDataEngineers, username, password, email, permission, Roles_role_id)
VALUES (202, 'dataeng_user2', 'dataeng_pass2', 'dataeng2@example.com', 'eng_permissions', 2);

-- Rôle de Data Analyst.
-- 1er Data Analyst.
INSERT INTO DataAnalyst (idDataAnalyst, username, password, email, permission, Roles_role_id) 
VALUES (301, 'dataanalyst_user1', 'dataanalyst_pass1', 'analyst1@example.com', 'analyst_permissions', 3);
-- 2ème Data Analyst.
INSERT INTO DataAnalyst (idDataAnalyst, username, password, email, permission, Roles_role_id)
VALUES (302, 'dataanalyst_user2', 'dataanalyst_pass2', 'analyst2@example.com', 'analyst_permissions', 3);

-- Rôle de Data Scientist.
-- 1er Data Scientist.
INSERT INTO DataScientist (idScientist, username, password, email, permission, Roles_role_id) 
VALUES (401, 'datasci_user1', 'datasci_pass1', 'datasci1@example.com', 'sci_permissions', 4);
-- 2ème Data Scientist.
INSERT INTO DataScientist (idScientist, username, password, email, permission, Roles_role_id)
VALUES (402, 'datasci_user2', 'datasci_pass2', 'datasci2@example.com', 'sci_permissions', 4);

-- Rôle de Stagiaire.
-- 1er Stagiaire.
INSERT INTO Stagiaire (idStagiaire, username, password, email, permission, Roles_role_id) 
VALUES (501, 'intern_user1', 'intern_pass1', 'intern1@example.com', 'intern_permissions', 5);
-- 2ème Stagiaire.
INSERT INTO Stagiaire (idStagiaire, username, password, email, permission, Roles_role_id)
VALUES (502, 'intern_user2', 'intern_pass2', 'intern2@example.com', 'intern_permissions', 5);

-- Rôle de Métier.
-- 1er Métier.
INSERT INTO Metier (idMetier, username, password, email, permission, Roles_role_id) 
VALUES (601, 'job_user1', 'job_pass1', 'job1@example.com', 'job_permissions', 6);
-- 2ème Métier.
INSERT INTO Metier (idMetier, username, password, email, permission, Roles_role_id)
VALUES (602, 'job_user2', 'job_pass2', 'job2@example.com', 'job_permissions', 6);

-- Bonne réponse :
-- Rôle d'Administrateur.
CREATE USER [admin_user1] WITH PASSWORD = 'admin_pass1';
CREATE USER [admin_user2] WITH PASSWORD = 'admin_pass2';
-- Rôle de Data Engineer.
CREATE USER [dataeng_user1] WITH PASSWORD = 'dataeng_pass1';
CREATE USER [dataeng_user2] WITH PASSWORD = 'dataeng_pass2';
-- Rôle de Data Analyst.
CREATE USER [dataanalyst_user1] WITH PASSWORD = 'dataanalyst_pass1';
CREATE USER [dataanalyst_user2] WITH PASSWORD = 'dataanalyst_pass2';
-- Rôle de Data Scientist.
CREATE USER [datasci_user1] WITH PASSWORD = 'datasci_user1';
CREATE USER [datasci_user2] WITH PASSWORD = 'datasci_user2';
-- Rôle de Stagiaire.
CREATE USER [intern_user1] WITH PASSWORD = 'intern_user1';
CREATE USER [intern_user2] WITH PASSWORD = 'intern_user2';
-- Rôle de Métier.
CREATE USER [job_user1] WITH PASSWORD = 'job_user1';
CREATE USER [job_user2] WITH PASSWORD = 'job_user2';