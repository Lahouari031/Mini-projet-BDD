-- ============================================================
--  Script d'insertion – Base de données bancaire
-- ============================================================

-- ------------------------------------------------------------
-- 1. AGENCE (5 lignes – agences parisiennes réalistes)
-- ------------------------------------------------------------
INSERT INTO AGENCE (id_agence, nom_agence, numero_rue_agence, nom_rue_agence, code_postal_agence, ville_agence, telephone_agence) VALUES
(1, 'Agence Paris Opéra',        35,  'Boulevard des Capucines',  75009, 'Paris', 33142681500),
(2, 'Agence Paris Marais',       12,  'Rue de Bretagne',          75003, 'Paris', 33142721830),
(3, 'Agence Paris Montparnasse', 78,  'Boulevard du Montparnasse',75014, 'Paris', 33143204700),
(4, 'Agence Paris La Défense',   4,   'Place de la Défense',      92400, 'Paris', 33147623900),
(5, 'Agence Paris Nation',       53,  'Avenue du Trône',          75011, 'Paris', 33143731200);

-- ------------------------------------------------------------
-- 2. GARANTIE (10 lignes)
-- ------------------------------------------------------------
INSERT INTO GARANTIE (id_garantie, valeur_garantie, type_garantie, description_garantie) VALUES
(1,  250000.00, 'hypothèque',        'Hypothèque sur résidence principale'),
(2,  180000.00, 'hypothèque',        'Hypothèque sur bien locatif'),
(3,   50000.00, 'caution personnelle','Caution solidaire conjoint'),
(4,   30000.00, 'caution personnelle','Caution parentale'),
(5,   75000.00, 'nantissement',      'Nantissement contrat assurance-vie'),
(6,   40000.00, 'nantissement',      'Nantissement parts sociales SARL'),
(7,   20000.00, 'gage',              'Gage sur véhicule professionnel'),
(8,   15000.00, 'gage',              'Gage sur matériel industriel'),
(9,  120000.00, 'hypothèque',        'Hypothèque sur local commercial'),
(10,  60000.00, 'caution personnelle','Caution dirigeant société');

-- ------------------------------------------------------------
-- 3. ECHEANCE (15 lignes)
-- ------------------------------------------------------------
INSERT INTO ECHEANCE (id_echeance, date_echeance_prevue, montant_echeance, montant_capital, montant_interets, date_paiement_effectif, statut_echeance) VALUES
(1,  '2024-01-15', 850.00,  720.00,  130.00, '2024-01-15', 'payée'),
(2,  '2024-02-15', 850.00,  724.32,  125.68, '2024-02-15', 'payée'),
(3,  '2024-03-15', 850.00,  728.66,  121.34, '2024-03-17', 'payée'),
(4,  '2024-04-15', 850.00,  733.03,  116.97, '2024-04-15', 'payée'),
(5,  '2024-05-15', 850.00,  737.43,  112.57, '2024-05-15', 'payée'),
(6,  '2024-06-15', 850.00,  741.86,  108.14, NULL,          'impayée'),
(7,  '2024-07-15', 850.00,  746.32,  103.68, NULL,          'impayée'),
(8,  '2024-08-15', 850.00,  750.81,   99.19, NULL,          'en attente'),
(9,  '2024-09-15', 450.00,  390.00,   60.00, '2024-09-15', 'payée'),
(10, '2024-10-15', 450.00,  393.00,   57.00, '2024-10-15', 'payée'),
(11, '2024-11-15', 450.00,  396.00,   54.00, NULL,          'en attente'),
(12, '2025-01-20', 1200.00, 1050.00, 150.00, '2025-01-20', 'payée'),
(13, '2025-02-20', 1200.00, 1057.00, 143.00, '2025-02-22', 'payée'),
(14, '2025-03-20', 1200.00, 1064.00, 136.00, NULL,          'impayée'),
(15, '2025-04-20', 1200.00, 1071.00, 129.00, NULL,          'en attente');

-- ------------------------------------------------------------
-- 4. CONSEILLER (10 lignes – certains avec manager)
-- ------------------------------------------------------------
-- Les managers doivent être insérés avant les conseillers qui y font référence.
-- On insère d'abord les conseillers sans manager (id_conseiller_manager NULL).
INSERT INTO CONSEILLER (id_conseiller, nom_conseiller, prenom_conseiller, email_conseiller, specialite_conseiller, id_conseiller_manager, id_agence) VALUES
(1,  'Dupont',    'Laurent',   'l.dupont@banque.fr',    'particuliers',   NULL, 1),
(2,  'Martin',    'Sophie',    's.martin@banque.fr',    'professionnels', NULL, 2),
(3,  'Bernard',   'Frédéric',  'f.bernard@banque.fr',   'entreprises',    NULL, 3),
(4,  'Leroy',     'Isabelle',  'i.leroy@banque.fr',     'particuliers',   NULL, 4),
(5,  'Moreau',    'Thomas',    't.moreau@banque.fr',    'entreprises',    NULL, 5),
(6,  'Petit',     'Camille',   'c.petit@banque.fr',     'particuliers',   1,    1),
(7,  'Roux',      'Julien',    'j.roux@banque.fr',      'professionnels', 2,    2),
(8,  'Simon',     'Aurélie',   'a.simon@banque.fr',     'particuliers',   1,    1),
(9,  'Laurent',   'Nicolas',   'n.laurent@banque.fr',   'entreprises',    3,    3),
(10, 'Lefebvre',  'Marie',     'm.lefebvre@banque.fr',  'professionnels', 2,    4);

-- ------------------------------------------------------------
-- 5. ECHEANCIER (8 lignes)
-- ------------------------------------------------------------
INSERT INTO ECHEANCIER (id_echeancier, id_echeance) VALUES
(1,  1),
(2,  2),
(3,  3),
(4,  6),
(5,  9),
(6,  12),
(7,  14),
(8,  8);

-- ------------------------------------------------------------
-- 6. CLIENT (15 lignes – mix particuliers / professionnels / entreprises)
-- ------------------------------------------------------------
INSERT INTO CLIENT (id_client, nom_client, prenom_client, date_naissance, numero_rue_client, nom_rue_client, code_postal_client, ville_client, telephone_client, email_client, type_client, id_conseiller) VALUES
(1,  'Girard',    'Paul',       '1985-03-12', 14, 'Rue de Rivoli',          75001, 'Paris', 33612345678, 'p.girard@gmail.com',       'particulier',    1),
(2,  'Fontaine',  'Claire',     '1990-07-24', 8,  'Avenue Victor Hugo',     75016, 'Paris', 33623456789, 'c.fontaine@gmail.com',     'particulier',    6),
(3,  'Chevalier', 'Marc',       '1978-11-05', 27, 'Rue Saint-Antoine',      75004, 'Paris', 33634567890, 'm.chevalier@gmail.com',    'particulier',    8),
(4,  'Rousseau',  'Nathalie',   '1965-01-30', 55, 'Boulevard Haussmann',    75008, 'Paris', 33645678901, 'n.rousseau@gmail.com',     'particulier',    1),
(5,  'Morel',     'Antoine',    '1982-09-18', 3,  'Rue du Faubourg Saint-Honoré', 75008, 'Paris', 33656789012, 'a.morel@gmail.com', 'particulier',    6),
(6,  'Garnier',   'Sylvie',     '1970-04-22', 19, 'Rue de la Paix',         75002, 'Paris', 33667890123, 's.garnier@yahoo.fr',       'professionnel',  2),
(7,  'Faure',     'Éric',       '1975-08-14', 42, 'Avenue de la Grande Armée', 75017, 'Paris', 33678901234, 'e.faure@pro.fr',        'professionnel',  7),
(8,  'Blanc',     'Véronique',  '1988-12-03', 11, 'Rue de Passy',           75016, 'Paris', 33689012345, 'v.blanc@pro.fr',           'professionnel', 10),
(9,  'Guerin',    'Patrick',    '1960-06-09', 67, 'Rue de la Roquette',     75011, 'Paris', 33690123456, 'p.guerin@pro.fr',          'professionnel',  7),
(10, 'Renard',    'Laure',      '1993-02-17', 5,  'Impasse des Lilas',      75020, 'Paris', 33601234567, 'l.renard@gmail.com',       'particulier',    8),
(11, 'TechVision','',           '2000-01-01', 22, 'Rue de la Bourse',       75002, 'Paris', 33155667788, 'contact@techvision.fr',    'entreprise',     3),
(12, 'Innova SAS','',           '1998-06-15', 99, 'Avenue des Champs-Élysées', 75008, 'Paris', 33144556677, 'info@innova-sas.fr',    'entreprise',     9),
(13, 'BTP Construct','',        '1995-03-20', 34, 'Rue de Bercy',           75012, 'Paris', 33143445566, 'direction@btpconstruct.fr','entreprise',     5),
(14, 'Dubois',    'François',   '1972-10-28', 16, 'Rue Lepic',              75018, 'Paris', 33611223344, 'f.dubois@gmail.com',       'particulier',    4),
(15, 'Mercier',   'Julie',      '1986-05-11', 7,  'Rue des Martyrs',        75009, 'Paris', 33622334455, 'j.mercier@gmail.com',      'particulier',    NULL);

-- ------------------------------------------------------------
-- 7. COMPTE (15 lignes)
-- ------------------------------------------------------------
INSERT INTO COMPTE (id_compte, libelle_compte, type_compte, solde_compte, date_ouverture, date_cloture, statut_compte) VALUES
(1,  'Compte courant principal',   'courant',      2450.75,  '2015-04-10', NULL,         'actif'),
(2,  'Livret A',                   'livret',       8000.00,  '2015-04-10', NULL,         'actif'),
(3,  'Compte épargne',             'épargne',      15000.00, '2018-09-01', NULL,         'actif'),
(4,  'Compte courant joint',       'courant',      3200.50,  '2020-02-14', NULL,         'actif'),
(5,  'Compte professionnel',       'professionnel',12500.00, '2016-07-20', NULL,         'actif'),
(6,  'Livret développement durable','livret',       4500.00, '2019-11-05', NULL,         'actif'),
(7,  'Compte courant secondaire',  'courant',       980.00,  '2021-03-22', NULL,         'actif'),
(8,  'Compte épargne entreprise',  'épargne',      50000.00, '2010-01-15', NULL,         'actif'),
(9,  'Compte professionnel PME',   'professionnel',37800.00, '2012-06-30', NULL,         'actif'),
(10, 'Compte courant bloqué',      'courant',          0.00, '2017-08-19', NULL,         'bloqué'),
(11, 'Compte épargne clôturé',     'épargne',          0.00, '2014-03-01', '2023-12-31', 'clôturé'),
(12, 'Livret jeune',               'livret',        1500.00, '2022-05-10', NULL,         'actif'),
(13, 'Compte courant entreprise',  'professionnel',98000.00, '2008-10-01', NULL,         'actif'),
(14, 'Compte courant particulier', 'courant',       5100.25, '2023-01-18', NULL,         'actif'),
(15, 'Livret épargne populaire',   'livret',        7200.00, '2020-07-07', NULL,         'actif');

-- ------------------------------------------------------------
-- 8. DEMANDE_CREDIT (10 lignes – 3 statuts différents)
-- ------------------------------------------------------------
INSERT INTO DEMANDE_CREDIT (id_demande, duree_souhaitee, type_credit, date_depot_demande, statut_demande, motif_refus, taux_interet, montant_demande, id_echeancier, id_client) VALUES
(1,  240, 'immobilier',   '2024-01-05',  'acceptée',          NULL,                          2.85, 200000.00, 1,    1),
(2,  60,  'consommation', '2024-02-10',  'acceptée',          NULL,                          5.20,  15000.00, 2,    2),
(3,  120, 'professionnel','2024-03-15',  'acceptée',          NULL,                          3.50,  80000.00, 3,    6),
(4,  180, 'immobilier',   '2024-04-20',  'acceptée',          NULL,                          3.10, 150000.00, 4,    4),
(5,  36,  'consommation', '2024-05-03',  'acceptée',          NULL,                          6.00,   8000.00, 5,    10),
(6,  84,  'professionnel','2024-06-18',  'acceptée',          NULL,                          4.25,  45000.00, 6,    11),
(7,  120, 'immobilier',   '2024-07-22',  'refusée',           'Taux d''endettement trop élevé', NULL, 300000.00, NULL, 3),
(8,  60,  'consommation', '2024-08-14',  'refusée',           'Revenus insuffisants',        NULL,  20000.00, NULL, 5),
(9,  240, 'immobilier',   '2024-09-30',  'en cours d''etude', NULL,                          NULL, 250000.00, NULL, 7),
(10, 48,  'professionnel','2024-10-11',  'en cours d''etude', NULL,                          NULL,  60000.00, NULL, 12);

-- ------------------------------------------------------------
-- 9. POSSEDE (18 lignes – certains clients ont plusieurs comptes)
-- ------------------------------------------------------------
INSERT INTO POSSEDE (id_client, id_compte) VALUES
(1,  1),   -- Paul Girard : courant
(1,  2),   -- Paul Girard : livret A
(2,  3),   -- Claire Fontaine : épargne
(2,  4),   -- Claire Fontaine : courant joint
(3,  4),   -- Marc Chevalier : courant joint (compte joint avec Claire)
(3,  7),   -- Marc Chevalier : courant secondaire
(4,  6),   -- Nathalie Rousseau : LDD
(4,  12),  -- Nathalie Rousseau : livret jeune
(5,  10),  -- Antoine Morel : courant bloqué
(6,  5),   -- Sylvie Garnier : professionnel
(7,  5),   -- Éric Faure : professionnel (compte joint professionnel)
(8,  15),  -- Véronique Blanc : livret épargne populaire
(9,  11),  -- Patrick Guerin : épargne clôturé
(10, 14),  -- Laure Renard : courant particulier
(11, 13),  -- TechVision : professionnel entreprise
(12, 9),   -- Innova SAS : professionnel PME
(13, 8),   -- BTP Construct : épargne entreprise
(14, 1),   -- François Dubois : courant (compte joint avec Paul Girard)
(15, 12);  -- Julie Mercier : livret jeune (compte joint avec Nathalie Rousseau)

-- ------------------------------------------------------------
-- 10. NECESSITE (12 lignes)
-- ------------------------------------------------------------
INSERT INTO NECESSITE (id_demande, id_garantie) VALUES
(1,  1),   -- immobilier accepté → hypothèque résidence principale
(1,  3),   -- + caution solidaire conjoint
(2,  4),   -- consommation accepté → caution parentale
(3,  6),   -- professionnel accepté → nantissement parts sociales
(3,  10),  -- + caution dirigeant
(4,  2),   -- immobilier accepté → hypothèque bien locatif
(4,  5),   -- + nantissement assurance-vie
(5,  4),   -- consommation accepté → caution parentale
(6,  9),   -- professionnel accepté → hypothèque local commercial
(7,  1),   -- immobilier refusé → hypothèque prévue
(8,  3),   -- consommation refusé → caution prévue
(9,  1);   -- immobilier en cours → hypothèque envisagée