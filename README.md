# Mini-projet-BDD
Ce projet consiste à concevoir un système d'information bancaire en appliquant la méthode MERISE.

## Membres du binôme

- GUETARNI Lahouari
- WIRGIN Arthur



## Domaine choisi

Système d'information bancaire pour une institution financière gérant des comptes clients, des crédits, des garanties et des échéanciers de remboursement.

**Inspirations :** BNP Paribas, Crédit Agricole, HSBC, JP Morgan

**Références :**
- https://mabanque.bnpparibas/
- https://www.hsbc.fr/
- https://www.credit-agricole.fr/
- https://www.jpmorgan.com/


## Étape 1 : Analyse des besoins

### Règles métier obtenues

#### 1.1 Gestion des clients

- Chaque client est identifié de manière unique dans le système
- Un client doit fournir ses informations personnelles : nom, prénom, date de naissance, adresse complète, numéro de téléphone et email
- Un client peut être une personne physique ou une personne morale (entreprise)
- Un client peut posséder plusieurs comptes bancaires
- Chaque client est rattaché à un conseiller bancaire attitré
- Un client peut changer de conseiller bancaire au cours du temps

#### 1.2 Gestion des comptes

- Chaque compte bancaire est identifié par un numéro de compte unique
- Un compte possède un libellé (ex : compte courant, compte épargne, compte professionnel)
- Un compte est obligatoirement rattaché à au moins un client titulaire
- Chaque compte possède un solde qui évolue dans le temps
- Un compte a une date d'ouverture
- Un compte peut être clôturé, auquel cas une date de clôture est enregistrée
- Chaque compte possède un statut (actif, bloqué, clôturé)

#### 1.3 Gestion des conseillers bancaires

- Chaque conseiller bancaire possède un matricule unique
- Un conseiller a un nom, un prénom, un email professionnel et un numéro de téléphone
- Un conseiller est affecté à une agence bancaire spécifique
- Un conseiller peut gérer plusieurs clients
- Un conseiller possède une spécialité (particuliers, professionnels, entreprises)

#### 1.4 Gestion des demandes de crédit

- Un client peut effectuer plusieurs demandes de crédit
- Chaque demande de crédit possède un numéro unique
- Une demande de crédit précise le montant demandé, la durée souhaitée en mois et le type de crédit (immobilier, consommation, professionnel)
- Chaque demande a une date de dépôt
- Une demande de crédit passe par différents statuts : en cours d'étude, acceptée, refusée
- Une demande acceptée génère un crédit effectif avec ses conditions : taux d'intérêt, durée réelle, montant accordé
- Une demande peut être refusée avec un motif de refus
- Chaque demande de crédit peut nécessiter une ou plusieurs garanties

#### 1.5 Gestion des garanties

- Une garantie est associée à une demande de crédit
- Chaque garantie possède un type (hypothèque, caution personnelle, nantissement, gage)
- Une garantie a une valeur estimée
- Une garantie possède une description détaillée
- Une même demande de crédit peut être couverte par plusieurs garanties
- La somme des valeurs des garanties doit généralement couvrir le montant du crédit

#### 1.6 Gestion des échéanciers

- Un crédit accepté génère un échéancier de remboursement
- Un échéancier est composé de plusieurs échéances
- Chaque échéance possède un numéro d'ordre, une date d'échéance prévue, un montant à payer
- Chaque échéance décompose le montant entre capital remboursé et intérêts
- Une échéance peut être payée, impayée ou en retard
- La date de paiement effectif est enregistrée lorsque l'échéance est réglée

#### 1.7 Gestion des agences

- Chaque agence bancaire possède un code unique
- Une agence a un nom, une adresse complète et un numéro de téléphone
- Une agence emploie plusieurs conseillers bancaires


### Dictionnaire de données

| Donnée | Signification | Type | Taille |
|--------|---------------|------|--------|
| num_client | Numéro d'identification unique du client | Numérique | 10 |
| nom_client | Nom de famille du client | Alphabétique | 50 |
| prenom_client | Prénom du client | Alphabétique | 50 |
| date_naissance | Date de naissance du client | Date | 10 |
| adresse_client | Adresse postale complète du client | Alphanumérique | 150 |
| telephone_client | Numéro de téléphone du client | Numérique | 15 |
| email_client | Adresse email du client | Alphanumérique | 100 |
| type_client | Type de client (physique ou morale) | Alphabétique | 20 |
| num_compte | Numéro unique du compte bancaire | Alphanumérique | 20 |
| libelle_compte | Libellé descriptif du compte | Alphabétique | 50 |
| solde_compte | Solde actuel du compte | Numérique décimal | 15,2 |
| date_ouverture | Date d'ouverture du compte | Date | 10 |
| date_cloture | Date de clôture du compte | Date | 10 |
| statut_compte | Statut actuel du compte | Alphabétique | 20 |
| matricule_conseiller | Matricule unique du conseiller bancaire | Alphanumérique | 8 |
| nom_conseiller | Nom du conseiller bancaire | Alphabétique | 50 |
| prenom_conseiller | Prénom du conseiller bancaire | Alphabétique | 50 |
| email_conseiller | Email professionnel du conseiller | Alphanumérique | 100 |
| specialite_conseiller | Domaine de spécialité du conseiller | Alphabétique | 30 |
| num_demande_credit | Numéro unique de la demande de crédit | Alphanumérique | 15 |
| montant_demande | Montant demandé pour le crédit | Numérique décimal | 12,2 |
| duree_souhaitee | Durée souhaitée en mois | Numérique | 3 |
| type_credit | Type de crédit demandé | Alphabétique | 30 |
| date_depot_demande | Date de dépôt de la demande | Date | 10 |
| statut_demande | Statut de la demande de crédit | Alphabétique | 30 |
| taux_interet | Taux d'intérêt du crédit accordé | Numérique décimal | 5,4 |
| motif_refus | Motif en cas de refus de la demande | Alphabétique | 200 |
| num_garantie | Numéro unique de la garantie | Alphanumérique | 12 |
| type_garantie | Type de garantie | Alphabétique | 30 |
| valeur_garantie | Valeur estimée de la garantie | Numérique décimal | 12,2 |
| num_echeance | Numéro d'ordre de l'échéance | Numérique | 4 |
| date_echeance_prevue | Date prévue de l'échéance | Date | 10 |
| montant_echeance | Montant total à payer | Numérique décimal | 10,2 |
| date_paiement_effectif | Date de paiement réel de l'échéance | Date | 10 |
| code_agence | Code unique de l'agence | Alphanumérique | 6 |
| nom_agence | Nom de l'agence bancaire | Alphabétique | 100 |

**Total : 35 données **


## Étape 2 : Modèle Conceptuel des Données (MCD)


### Description des entités

#### AGENCE
- **Identifiant :** id_agence
- **Attributs :** nom_agence,  numero_rue_agence, nom_rue_agence, code_postal_agence, ville_agence, telephone_agence
- **Description :** Représente les agences bancaires où travaillent les conseillers

#### CONSEILLER
- **Identifiant :** id_conseiller
- **Attributs :** nom_conseiller, prenom_conseiller, email_conseiller, specialite_conseiller
- **Description :** Représente les conseillers bancaires qui gèrent les clients

#### CLIENT
- **Identifiant :** id_client
- **Attributs :** nom_client, prenom_client, date_naissance, numero_rue_client, nom_rue_client, code_postal_client, ville_client, telephone_client, email_client, type_client
- **Description :** Représente les clients de la banque (personnes physiques ou morales)

#### COMPTE
- **Identifiant :** id_compte
- **Attributs :** libelle_compte, type_compte, solde_compte, date_ouverture, date_cloture, statut_compte
- **Description :** Représente les comptes bancaires ouverts par les clients

#### DEMANDE_CREDIT
- **Identifiant :** id_demande
- **Attributs :** duree_souhaitee, type_credit, date_depot_demande, statut_demande, motif_refus, taux_interet, montant_demande
- **Description :** Représente les demandes de crédit effectuées par les clients

#### GARANTIE
- **Identifiant :** id_garantie
- **Attributs :** valeur_garantie, type_garantie, description_garantie
- **Description :** Représente les garanties associées aux demandes de crédit

#### ECHEANCIER
- **Identifiant :** id_echeancier
- **Description :** Représente l'échéancier de remboursement d'un crédit accepté

#### ECHEANCE (Entité faible)
- **Identifiant composé :** id_echeancier + id_echeance
- **Attributs :** date_echeance_prevue, montant_echeance, montant_capital, montant_interets, date_paiement_effectif, statut_echeance
- **Description :** Représente une échéance individuelle dans un échéancier


## Étape 3 : Modèle Logique de Données (MLD)

- COMPTE = (id_compte INT, libelle_compte VARCHAR(50), type_compte VARCHAR(50), solde_compte DOUBLE, date_ouverture DATE, date_cloture DATE, statut_compte VARCHAR(50));

- AGENCE = (id_agence INT, nom_agence VARCHAR(50), numero_rue_agence INT, nom_rue_agence VARCHAR(50), code_postal_agence INT, ville_agence VARCHAR(50), telephone_agence BIGINT);

- GARANTIE = (id_garantie INT, valeur_garantie DOUBLE, type_garantie VARCHAR(50), description_garantie VARCHAR(50));

- ECHEANCE = (id_echeance INT, date_echeance_prevue DATE, montant_echeance DOUBLE, montant_capital DOUBLE, montant_interets DOUBLE, date_paiement_effectif DATE, statut_echeance VARCHAR(50));

- CONSEILLER = (id_conseiller INT, nom_conseiller VARCHAR(50), prenom_conseiller VARCHAR(50), email_conseiller VARCHAR(50), specialite_conseiller VARCHAR(50), #id_conseiller_manager, #id_agence);

- ECHEANCIER = (id_echeancier INT, #id_echeance);

- CLIENT = (id_client INT, nom_client VARCHAR(50), prenom_client VARCHAR(50), date_naissance DATE, numero_rue_client INT, nom_rue_client VARCHAR(50), code_postal_client INT, ville_client VARCHAR(50), telephone_client BIGINT, email_client VARCHAR(50), type_client VARCHAR(50), #id_conseiller);

- DEMANDE_CREDIT = (id_demande INT, duree_souhaitee INT, type_credit VARCHAR(50), date_depot_demande DATE, statut_demande VARCHAR(50), motif_refus VARCHAR(50), taux_interet DOUBLE, montant_demande DOUBLE, #id_echeancier, #id_client);

- POSSEDE = (#id_client, #id_compte);

- NECESSITE = (#id_demande, #id_garantie);



### Associations et cardinalités

| Association | Entités liées | Cardinalités | Signification |
|-------------|---------------|--------------|---------------|
| TRAVAILLE_DANS | CONSEILLER - AGENCE | 1,n - 1,1 | Un conseiller travaille dans une seule agence. Une agence emploie plusieurs conseillers. |
| SUPERVISE | CONSEILLER - CONSEILLER | 0,1 - 0,n | Un conseiller peut superviser plusieurs conseillers (hiérarchie interne). |
| EST_SUIVI_PAR | CLIENT - CONSEILLER | 0,n - 1,1 | Un client est suivi par un seul conseiller. Un conseiller peut suivre plusieurs clients. |
| POSSEDE | CLIENT - COMPTE | 1,n - 1,n | Un client possède un ou plusieurs comptes. Un compte appartient à au moins un client. Cela permet les comptes joints. |
| EFFECTUE | CLIENT - DEMANDE_CREDIT | 1,1 - 0,n | Un client peut effectuer plusieurs demandes. Une demande est faite par un seul client. |
| NECESSITE | DEMANDE_CREDIT - GARANTIE | 1,1 - 0,n | Une demande peut nécessiter plusieurs garanties. Une garantie concerne une seule demande. |
| GENERE | DEMANDE_CREDIT - ECHEANCIER | 1,1 - 0,1 | Une demande acceptée génère un échéancier. Un échéancier concerne une seule demande. |
| CONTIENT | ECHEANCIER - ECHEANCE | 1,1 - 1,n | Un échéancier contient plusieurs échéances. Une échéance appartient à un seul échéancier. |


### Éléments de modélisation avancée

Le MCD intègre deux éléments de modélisation avancée conformément aux exigences du projet :

#### 1. Association récursive : SUPERVISE

**Description :**  
Cette association relie l'entité CONSEILLER à elle-même pour modéliser la hiérarchie managériale au sein de l'équipe bancaire.

**Cardinalités :**
- **0,1** : Un conseiller junior est supervisé par zéro ou un conseiller senior
- **0,n** : Un conseiller senior peut superviser zéro à plusieurs conseillers juniors

**Justification métier :**  
Dans une organisation bancaire, il existe une structure hiérarchique où des conseillers expérimentés (seniors) encadrent et supervisent des conseillers moins expérimentés (juniors). Cette modélisation permet de :
- Gérer les relations managériales
- Suivre la chaîne de responsabilité
- Faciliter la gestion des équipes et l'attribution des clients

**Exemple concret :**  
Le conseiller Jean Dupont (senior, spécialiste entreprises) supervise les conseillers Marie Martin et Paul Durand (juniors, spécialistes particuliers).


#### 2. Entité faible : ECHEANCE dépend de ECHEANCIER

**Description :**  
L'entité ECHEANCE est une entité faible qui dépend existentiellement de l'entité forte ECHEANCIER.

**Identifiant composé :**
- `id_echeancier` (clé étrangère héritée de l'entité forte)
- `id_echeance` (identifiant partiel - numéro d'ordre 1, 2, 3...)

**Justification métier :**  
Une échéance n'a aucun sens en dehors du contexte de son échéancier. Le numéro d'échéance (1, 2, 3...) n'est unique que dans le cadre d'un échéancier spécifique. Par exemple :
- L'échéance n°3 de l'échéancier A001 (crédit immobilier de M. Martin)
- L'échéance n°3 de l'échéancier A002 (crédit auto de Mme Dubois)

Ces deux échéances portent le même numéro mais sont différentes car elles appartiennent à des échéanciers distincts.

**Conséquences techniques :**
- **Dépendance existentielle** : Si un échéancier est supprimé, toutes ses échéances sont automatiquement supprimées (suppression en cascade)
- **Intégrité référentielle** : Une échéance ne peut être créée que si son échéancier parent existe
- **Identifiant composé** : La clé primaire de ECHEANCE est la combinaison (id_echeancier, id_echeance)

**Représentation visuelle :**  
L'entité ECHEANCE est représentée avec une couleur distincte (vert) et accompagnée d'une annotation "Entité faible dépend de ECHEANCIER" pour clarifier sa nature.


### Justifications des choix de modélisation

#### Choix 1 : Séparation DEMANDE_CREDIT et ECHEANCIER

**Pourquoi ne pas fusionner ces deux entités ?**

Une demande de crédit peut avoir trois états :
1. **En cours d'étude** : pas encore d'échéancier
2. **Refusée** : jamais d'échéancier
3. **Acceptée** : génération d'un échéancier

La séparation permet de :
- Gérer le cycle de vie complet d'une demande (dépôt - étude - décision)
- Stocker les demandes refusées avec leur motif de refus
- Créer l'échéancier uniquement quand la demande est acceptée

**Cardinalité (0,1)** : Une demande génère **zéro ou un** échéancier selon son statut.


#### Choix 2 : CLIENT possède COMPTE (1,n - 1,1)

**Pourquoi cette cardinalité ?**

- **1,n** côté CLIENT : Un client doit avoir au minimum un compte pour être client de la banque
- **1,1** côté COMPTE : Un compte appartient à exactement un titulaire

**Note sur les comptes joints :**  
L'attribut `type_compte` permet d'indiquer qu'un compte est de type "joint" ou "commun", même si techniquement il n'a qu'un seul titulaire principal dans notre modèle. Cette simplification évite la complexité d'une association many-to-many entre CLIENT et COMPTE.


#### Choix 3 : Ajout d'attributs au-delà du dictionnaire initial

Le MCD contient plus de 35 données car nous avons ajouté des attributs métier pertinents :

| Attribut ajouté | Entité | Justification |
|-----------------|--------|---------------|
| type_compte | COMPTE | Distinguer compte courant / épargne / professionnel / joint |
| montant_capital | ECHEANCE | Décomposer le montant de l'échéance (partie capital remboursée) |
| montant_interets | ECHEANCE | Décomposer le montant de l'échéance (partie intérêts) |
| description_garantie | GARANTIE | Détailler la nature de la garantie (adresse du bien, description du placement, etc.) |
| statut_echeance | ECHEANCE | Suivre l'état de paiement (payée, impayée, en retard) |



### Respect de la 3ème Forme Normale (3FN)

Le MCD respecte la 3FN :

**1FN (Première Forme Normale) :**  
- Tous les attributs contiennent des valeurs atomiques (pas de listes, pas de valeurs multiples)
- Chaque attribut a un type clairement défini

**2FN (Deuxième Forme Normale) :**  
- Chaque attribut non-clé dépend de la totalité de la clé primaire
- Pas de dépendance partielle

**3FN (Troisième Forme Normale) :**  
- Aucun attribut non-clé ne dépend d'un autre attribut non-clé
- Pas de dépendance transitive
- Exemple : Le nom de l'agence ne dépend que de `id_agence`, pas du conseiller

**Vérification :**  
- `solde_compte` dépend uniquement de `id_compte`
- `nom_conseiller` dépend uniquement de `id_conseiller`
- `montant_echeance` dépend uniquement de `(id_echeancier, id_echeance)`


## Outils utilisés

- **Modélisation :** Looping 
- **Documentation :** Markdown
- **Gestion de version :** Git / Github
- **IA Générative :** Claude pour la génération des règles métier et du dictionnaire


## Références

- Cours TI404 - Bases de données 1 : Concepts de base
- Documentation MERISE
- Sites web bancaires : BNP Paribas, Crédit Agricole, HSBC, JP Morgan
- Framework RICARDO pour le prompt engineering


## Conformité aux exigences

| Critère | Exigence | Statut |
|---------|----------|--------|
| 1 | Outil de modélisation | Looping utilisé |
| 2 | Entités, associations, attributs, identifiants, cardinalités clairement identifiés | Complet |
| 3 | Respect de la 3FN | Vérifié |
| 4 | Au moins 2 éléments de modélisation avancée | Récursive + Entité faible |
| 5 | Intégration de toutes les données du dictionnaire | 35 données + ajouts pertinents |


### Scénarios d'utilisation

## Scénario 1 — Le directeur d'agence

Le directeur d'agence est le responsable opérationnel d'une agence bancaire. Il utilise la base de données au quotidien pour surveiller l'activité de son agence : suivre ses conseillers et leur charge de travail, consulter les clients rattachés à son agence, analyser les demandes de crédit en cours, et détecter les éventuels impayés.
Les requêtes associées à ce scénario couvrent les projections et sélections simples, les tris, les filtres par plage de valeurs avec BETWEEN, les listes de valeurs avec IN, les masques avec LIKE, ainsi que les fonctions d'agrégation avec GROUP BY et HAVING pour calculer des statistiques sur ses équipes et ses portefeuilles.

## Scénario 2 — Le service des risques

L'analyste du service des risques est chargé d'évaluer l'exposition financière de la banque. Il utilise la base de données pour analyser les crédits accordés, vérifier que les garanties associées à chaque demande couvrent bien les montants empruntés, et surveiller les échéances impayées ou en retard afin de déclencher des actions de recouvrement.
Les requêtes associées à ce scénario couvrent les jointures internes et externes simples et multiples, notamment des jointures récursives sur la table CONSEILLER pour la hiérarchie managériale, ainsi que des requêtes imbriquées avec IN, NOT IN, EXISTS et ALL pour identifier les situations à risque.

## Scénario 3 — Le conseiller bancaire 

Le conseiller bancaire prépare ses rendez-vous clients en consultant la base de données. Il veut voir la liste de ses propres clients, leurs comptes, leurs demandes de crédit en cours d'étude, et vérifier que les garanties de chaque dossier sont suffisantes avant de rencontrer le client.
Les requêtes associées à ce scénario combinent jointures externes, agrégations et HAVING sur des conditions calculées, illustrant des cas d'usage métier concrets directement issus des règles définies en étape 1.

