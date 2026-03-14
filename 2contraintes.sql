USE myminibanque;

ALTER TABLE COMPTE ADD CONSTRAINT chk_statut_compte
    CHECK (statut_compte IN ('actif', 'bloqué', 'clôturé'));

ALTER TABLE COMPTE ADD CONSTRAINT chk_dates_compte
    CHECK (date_cloture IS NULL OR date_cloture > date_ouverture);

ALTER TABLE COMPTE ADD CONSTRAINT chk_solde
    CHECK (solde_compte >= 0);

ALTER TABLE COMPTE ADD CONSTRAINT chk_type_compte
    CHECK (type_compte IN ('courant', 'épargne', 'livret', 'professionnel'));

ALTER TABLE DEMANDE_CREDIT ADD CONSTRAINT chk_statut_demande
    CHECK (statut_demande IN ('en cours d\'etude', 'acceptée', 'refusée'));

ALTER TABLE DEMANDE_CREDIT ADD CONSTRAINT chk_taux
    CHECK (taux_interet IS NULL OR (taux_interet >= 0 AND taux_interet <= 100));

ALTER TABLE DEMANDE_CREDIT ADD CONSTRAINT chk_montant_demande
    CHECK (montant_demande > 0);

ALTER TABLE DEMANDE_CREDIT ADD CONSTRAINT chk_duree
    CHECK (duree_souhaitee > 0);

ALTER TABLE ECHEANCE ADD CONSTRAINT chk_statut_echeance
    CHECK (statut_echeance IN ('payée', 'impayée', 'en attente'));

ALTER TABLE ECHEANCE ADD CONSTRAINT chk_montants_echeance
    CHECK (montant_echeance > 0 AND montant_capital >= 0 AND montant_interets >= 0);

ALTER TABLE GARANTIE ADD CONSTRAINT chk_valeur_garantie
    CHECK (valeur_garantie > 0);

ALTER TABLE GARANTIE ADD CONSTRAINT chk_type_garantie
    CHECK (type_garantie IN ('hypothèque', 'caution personnelle', 'nantissement', 'gage'));

ALTER TABLE CLIENT ADD CONSTRAINT chk_email_client
    CHECK (email_client LIKE '%@%.%');

ALTER TABLE CLIENT ADD CONSTRAINT chk_type_client
    CHECK (type_client IN ('particulier', 'professionnel', 'entreprise'));

ALTER TABLE CLIENT ADD CONSTRAINT chk_age_client
    CHECK (date_naissance <= '2007-01-01');

ALTER TABLE CLIENT ADD CONSTRAINT chk_cp_client
    CHECK (code_postal_client BETWEEN 01000 AND 99999);

ALTER TABLE CONSEILLER ADD CONSTRAINT chk_email_conseiller
    CHECK (email_conseiller LIKE '%@%.%');

ALTER TABLE CONSEILLER ADD CONSTRAINT chk_specialite_conseiller
    CHECK (specialite_conseiller IN ('particuliers', 'professionnels', 'entreprises'));

ALTER TABLE AGENCE ADD CONSTRAINT chk_cp_agence
    CHECK (code_postal_agence BETWEEN 01000 AND 99999);