CREATE DATABASE IF NOT EXISTS myminibanque;
USE myminibanque;

CREATE TABLE AGENCE (
    id_agence INT PRIMARY KEY,
    nom_agence VARCHAR(50) NOT NULL,
    numero_rue_agence INT,
    nom_rue_agence VARCHAR(50),
    code_postal_agence INT,
    ville_agence VARCHAR(50),
    telephone_agence BIGINT
);

CREATE TABLE CONSEILLER (
    id_conseiller INT PRIMARY KEY,
    nom_conseiller VARCHAR(50) NOT NULL,
    prenom_conseiller VARCHAR(50) NOT NULL,
    email_conseiller VARCHAR(50) UNIQUE NOT NULL,
    specialite_conseiller VARCHAR(50),
    id_conseiller_manager INT,
    id_agence INT NOT NULL,
    
    FOREIGN KEY (id_conseiller_manager)
        REFERENCES CONSEILLER(id_conseiller)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (id_agence)
        REFERENCES AGENCE(id_agence)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE CLIENT (
    id_client INT PRIMARY KEY,
    nom_client VARCHAR(50) NOT NULL,
    prenom_client VARCHAR(50) NOT NULL,
    date_naissance DATE NOT NULL,
    numero_rue_client INT,
    nom_rue_client VARCHAR(50),
    code_postal_client INT,
    ville_client VARCHAR(50),
    telephone_client BIGINT,
    email_client VARCHAR(50) UNIQUE NOT NULL,
    type_client VARCHAR(50) NOT NULL,
    id_conseiller INT,
    
    FOREIGN KEY (id_conseiller)
        REFERENCES CONSEILLER(id_conseiller)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE COMPTE (
    id_compte INT PRIMARY KEY,
    libelle_compte VARCHAR(50),
    type_compte VARCHAR(50) NOT NULL,
    solde_compte DOUBLE NOT NULL DEFAULT 0,
    date_ouverture DATE NOT NULL,
    date_cloture DATE,
    statut_compte VARCHAR(50) NOT NULL DEFAULT 'actif'
);

CREATE TABLE POSSEDE (
    id_client INT NOT NULL,
    id_compte INT NOT NULL,
    
    PRIMARY KEY (id_client, id_compte),
    FOREIGN KEY (id_client)
        REFERENCES CLIENT(id_client)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_compte)
        REFERENCES COMPTE(id_compte)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE GARANTIE (
    id_garantie INT PRIMARY KEY,
    valeur_garantie DOUBLE NOT NULL,
    type_garantie VARCHAR(50) NOT NULL,
    description_garantie VARCHAR(50)
);

CREATE TABLE ECHEANCE (
    id_echeance INT PRIMARY KEY AUTO_INCREMENT,
    date_echeance_prevue DATE NOT NULL,
    montant_echeance DOUBLE NOT NULL,
    montant_capital DOUBLE NOT NULL,
    montant_interets DOUBLE NOT NULL,
    date_paiement_effectif  DATE,
    statut_echeance VARCHAR(50) NOT NULL DEFAULT 'en attente'
);

CREATE TABLE ECHEANCIER (
    id_echeancier INT PRIMARY KEY AUTO_INCREMENT,
    id_echeance INT NOT NULL,

    FOREIGN KEY (id_echeance)
        REFERENCES ECHEANCE(id_echeance)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE DEMANDE_CREDIT (
    id_demande INT PRIMARY KEY,
    duree_souhaitee INT NOT NULL,
    type_credit VARCHAR(50) NOT NULL,
    date_depot_demande DATE NOT NULL,
    statut_demande VARCHAR(50) NOT NULL DEFAULT 'en cours d\'etude',
    motif_refus VARCHAR(50),
    taux_interet DOUBLE,
    montant_demande DOUBLE NOT NULL,
    id_echeancier INT,
    id_client INT NOT NULL,

    FOREIGN KEY (id_echeancier)
        REFERENCES ECHEANCIER(id_echeancier)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (id_client)
        REFERENCES CLIENT(id_client)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE NECESSITE (
    id_demande INT NOT NULL,
    id_garantie INT NOT NULL,
    
    PRIMARY KEY (id_demande, id_garantie),
    FOREIGN KEY (id_demande)
        REFERENCES DEMANDE_CREDIT(id_demande)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_garantie)
        REFERENCES GARANTIE(id_garantie)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);