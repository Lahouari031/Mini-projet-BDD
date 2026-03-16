USE myminibanque;
-- liste des conseillers de l'agence 1 triée par nom (ordre alphabetique).
SELECT nom_conseiller, prenom_conseiller, email_conseiller, specialite_conseiller
FROM CONSEILLER
WHERE id_agence = 1
ORDER BY nom_conseiller ASC;
-- liste les clients dont le nom commence par une lettre entre A et 2(dans l'ordre alpahbetique).
SELECT nom_client, prenom_client, email_client, type_client
FROM CLIENT
WHERE nom_client BETWEEN 'A' AND 'Z'
ORDER BY nom_client ASC;
-- comptes actifs avec solde entre 1000 et 5000 euros , du plus petit solde au plus grand.
SELECT id_compte, libelle_compte, type_compte, solde_compte
FROM COMPTE
WHERE statut_compte = 'actif'
AND (solde_compte BETWEEN 1000 AND 50000)
ORDER BY solde_compte DESC;
-- differents types de compte disponibles sans doublons.
SELECT DISTINCT type_compte
FROM COMPTE;
-- demandes de crédits deposes en 2024 , du montant le plus grand au plus petit.
SELECT id_demande, type_credit, montant_demande, statut_demande, date_depot_demande
FROM DEMANDE_CREDIT
WHERE date_depot_demande BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY montant_demande DESC;
-- renvoie les informations clients des clients qui ont une adresse mail yahoo et gmail
SELECT nom_client, prenom_client, email_client
FROM CLIENT
WHERE email_client LIKE '%@gmail.%'
OR email_client LIKE '%@yahoo.%';
-- renvoie les informations des demandes credits qui sont de types immmobilier ou professionnel
-- triees dans l'ordre inverse de l'ordre alphabetique
SELECT id_demande, montant_demande, statut_demande, type_credit
FROM DEMANDE_CREDIT
WHERE type_credit IN ('immobilier', 'professionnel')
ORDER BY montant_demande DESC;
-- renvoie le nombre de clients par conseiller, en ordre décroissant
SELECT id_conseiller, COUNT(id_client) AS nombre_clients
FROM CLIENT
GROUP BY id_conseiller
ORDER BY nombre_clients DESC;
-- renvoie pour chaque type de crédit , le montant moyen des demandes et le nombre total de demandes
SELECT type_credit, AVG(montant_demande) AS montant_moyen, COUNT(*) AS nombre_demandes
FROM DEMANDE_CREDIT
GROUP BY type_credit;
-- renvoie pour chaque type de compte le solde total, le solde moyen et le nombre de compte.
SELECT type_compte,
       SUM(solde_compte) AS solde_total,
       AVG(solde_compte) AS solde_moyen,
       COUNT(*) AS nombre_comptes
FROM COMPTE
GROUP BY type_compte;
-- renvoie l'ID des conseillers ayant plus de 2 clients avec le nombre de clients correspondant.
SELECT id_conseiller, COUNT(id_client) AS nombre_clients
FROM CLIENT
WHERE id_conseiller IS NOT NULL
GROUP BY id_conseiller
HAVING nombre_clients > 2;
-- renvoie pour chaque statut de demande le nombre de demandes correspondant
SELECT statut_demande, COUNT(*) AS nombre_demandes
FROM DEMANDE_CREDIT
GROUP BY statut_demande;
-- renvoie l'ID des agences avec plus de 2 conseillers avec le nombre de conseillers correspondant
SELECT id_agence, COUNT(*) AS nombre_conseillers
FROM CONSEILLER
GROUP BY id_agence
HAVING nombre_conseillers > 2;
-- renvoie l'ID, le type, le monatnt et le satut des demandes de credits avce le nom
-- et prenom du client associe
SELECT dc.id_demande, dc.type_credit, dc.montant_demande, dc.statut_demande,
       c.nom_client, c.prenom_client
FROM DEMANDE_CREDIT dc
INNER JOIN CLIENT c ON dc.id_client = c.id_client;
-- renvoie l'ID, le type et montant des demandes de credit avec le type, valeur et description des garanties asscoiees
SELECT dc.id_demande, dc.type_credit, dc.montant_demande,
       g.type_garantie, g.valeur_garantie, g.description_garantie
FROM DEMANDE_CREDIT dc
INNER JOIN NECESSITE n ON dc.id_demande = n.id_demande
INNER JOIN GARANTIE g ON n.id_garantie = g.id_garantie;
-- renvoie le nom, prenom et type de tous les clients avec le nom et prenom de leur conseiller(les clients sans conseillers apparaissent aussi)
SELECT c.nom_client, c.prenom_client, c.type_client,
       co.nom_conseiller, co.prenom_conseiller
FROM CLIENT c
LEFT JOIN CONSEILLER co ON c.id_conseiller = co.id_conseiller;
-- renvoie le nom, prenom et specialite des conseillers avec le nom de leur agance, leur ville , et le nom de leur manager
SELECT co.nom_conseiller, co.prenom_conseiller, co.specialite_conseiller,
       a.nom_agence, a.ville_agence,
       manager.nom_conseiller AS nom_manager
FROM CONSEILLER co
INNER JOIN AGENCE a ON co.id_agence = a.id_agence
LEFT JOIN CONSEILLER manager ON co.id_conseiller_manager = manager.id_conseiller;
--renvoie l'ID, date prevue, montant et statut des echeances impayees avec le type et montant du credit associe, et le nom et prenom du client
SELECT e.id_echeance, e.date_echeance_prevue, e.montant_echeance, e.statut_echeance,
       dc.type_credit, dc.montant_demande,
       c.nom_client, c.prenom_client
FROM ECHEANCE e
INNER JOIN ECHEANCIER ec ON e.id_echeance = ec.id_echeance
INNER JOIN DEMANDE_CREDIT dc ON ec.id_echeancier = dc.id_echeancier
INNER JOIN CLIENT c ON dc.id_client = c.id_client
WHERE e.statut_echeance = 'impayée';
-- renvoie le nom et prenom des clients avec le libelle, type, solde et statut de leurs comptes, triees par le nom du client(ordre alphabetique) 
SELECT c.nom_client, c.prenom_client,
       co.libelle_compte, co.type_compte, co.solde_compte, co.statut_compte
FROM CLIENT c
INNER JOIN POSSEDE p ON c.id_client = p.id_client
INNER JOIN COMPTE co ON p.id_compte = co.id_compte
ORDER BY c.nom_client;
-- renvoie le nom, prenom et email des clients qui ont au moins une demande credit avec le statut accepte.
SELECT nom_client, prenom_client, email_client
FROM CLIENT
WHERE id_client IN (
    SELECT id_client
    FROM DEMANDE_CREDIT
    WHERE statut_demande = 'acceptée'
);
--renvoie le nom, prenom et temail des clients qui n'ont aucune demande de credit
SELECT nom_client, prenom_client, email_client
FROM CLIENT
WHERE id_client NOT IN (
    SELECT id_client
    FROM DEMANDE_CREDIT
    WHERE id_client IS NOT NULL
);
-- renvoie l'ID, type, montant et staut des demandes de credit dont le montant est superieur à toutes les demandes de type consommation.
SELECT id_demande, type_credit, montant_demande, statut_demande
FROM DEMANDE_CREDIT
WHERE montant_demande > ALL (
    SELECT montant_demande
    FROM DEMANDE_CREDIT
    WHERE type_credit = 'consommation'
);
-- renvoie le nom, prenom et spcialite des conseillers qui ont au moins un client de type entreprise.
SELECT nom_conseiller, prenom_conseiller, specialite_conseiller
FROM CONSEILLER
WHERE EXISTS (
    SELECT 1
    FROM CLIENT
    WHERE CLIENT.id_conseiller = CONSEILLER.id_conseiller
    AND type_client = 'entreprise'
);
-- renvoie l'ID, libelle , type et solde des comptes dont le solde est supereur à la moyenne des soldes de tous les comptes.
SELECT id_compte, libelle_compte, type_compte, solde_compte
FROM COMPTE
WHERE solde_compte > (
    SELECT AVG(solde_compte)
    FROM COMPTE
);
-- renvoie l'ID, type, montant et statut des demandes de credit necessitent au moins une garantie.
SELECT id_demande, type_credit, montant_demande, statut_demande
FROM DEMANDE_CREDIT
WHERE EXISTS (
    SELECT 1
    FROM NECESSITE
    WHERE NECESSITE.id_demande = DEMANDE_CREDIT.id_demande
);
-- renvoie pour chaque client du conseiller 1, son nom, prenom, type et le nombre de comptes qu'il possede.
SELECT c.nom_client, c.prenom_client, c.type_client,
       COUNT(p.id_compte) AS nombre_comptes
FROM CLIENT c
LEFT JOIN POSSEDE p ON c.id_client = p.id_client
WHERE c.id_conseiller = 1
GROUP BY c.id_client, c.nom_client, c.prenom_client, c.type_client;
-- renvoie le nom, prenom, telephone et email des clients du conseiller 1 ayant une demande credit encours d'etude, avec le type, montant et la demande.
SELECT c.nom_client, c.prenom_client, c.telephone_client, c.email_client,
       dc.type_credit, dc.montant_demande, dc.date_depot_demande
FROM CLIENT c
INNER JOIN DEMANDE_CREDIT dc ON c.id_client = dc.id_client
WHERE dc.statut_demande = 'en cours d etude'
AND c.id_conseiller = 1;
-- renvoie l'ID, type et montant des demandes de credit dont la somme des valeurs des garranties est superieure ou egale au montant demande.
SELECT dc.id_demande, dc.type_credit, dc.montant_demande,
       SUM(g.valeur_garantie) AS valeur_totale_garanties
FROM DEMANDE_CREDIT dc
INNER JOIN NECESSITE n ON dc.id_demande = n.id_demande
INNER JOIN GARANTIE g ON n.id_garantie = g.id_garantie
GROUP BY dc.id_demande, dc.type_credit, dc.montant_demande
HAVING valeur_totale_garanties >= dc.montant_demande;
