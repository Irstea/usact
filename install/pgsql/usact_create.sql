create schema if not exists usact;
alter schema usact owned by usact;

set search_path = usact;

CREATE SEQUENCE acte_contentieux_acte_contentieux_id_seq;

CREATE TABLE acte_contentieux (
                acte_contentieux_id INTEGER NOT NULL DEFAULT nextval('acte_contentieux_acte_contentieux_id_seq'),
                acte_contentieux_libelle VARCHAR NOT NULL,
                CONSTRAINT acte_contentieux_pk PRIMARY KEY (acte_contentieux_id)
);
COMMENT ON TABLE acte_contentieux IS 'Table des types d''actes contentieux';


ALTER SEQUENCE acte_contentieux_acte_contentieux_id_seq OWNED BY acte_contentieux.acte_contentieux_id;

CREATE SEQUENCE acteur_acteur_id_seq;

CREATE TABLE acteur (
                acteur_id INTEGER NOT NULL DEFAULT nextval('acteur_acteur_id_seq'),
                acteur_niv3_id INTEGER NOT NULL,
                acteur_physique_nom VARCHAR,
                commune_physique VARCHAR,
                cp_physique VARCHAR,
                acteur_moral_nom VARCHAR,
                commune_morale VARCHAR,
                cp_morale VARCHAR,
                acteur_statut VARCHAR,
                acteur_statut_detail VARCHAR,
                acteur_date_saisie TIMESTAMP,
                acteur_login VARCHAR,
                particulier_resident_type_id INTEGER,
                CONSTRAINT acteur_pk PRIMARY KEY (acteur_id)
);
COMMENT ON COLUMN acteur.commune_physique IS 'Commune de résidence de la personne physique';
COMMENT ON COLUMN acteur.cp_physique IS 'Code postal associé à la commune de la personne physique';
COMMENT ON COLUMN acteur.commune_morale IS 'Commune de siège de la personne morale';
COMMENT ON COLUMN acteur.cp_morale IS 'code postal associé à la commune de la personne morale';
COMMENT ON COLUMN acteur.acteur_statut IS 'Statut de l''acteur';
COMMENT ON COLUMN acteur.acteur_statut_detail IS 'Détail du statut de l''acteur';
COMMENT ON COLUMN acteur.acteur_date_saisie IS 'Date de création de l''acteur';


ALTER SEQUENCE acteur_acteur_id_seq OWNED BY acteur.acteur_id;

CREATE SEQUENCE acteur_mandat_acteur_mandat_id_seq;

CREATE TABLE acteur_mandat (
                acteur_mandat_id INTEGER NOT NULL DEFAULT nextval('acteur_mandat_acteur_mandat_id_seq'),
                acteur_id INTEGER NOT NULL,
                mandat_type_id INTEGER NOT NULL,
                mandat_detail VARCHAR,
                CONSTRAINT acteur_mandat_pk PRIMARY KEY (acteur_mandat_id)
);
COMMENT ON TABLE acteur_mandat IS 'Mandats détenus par un acteur';


ALTER SEQUENCE acteur_mandat_acteur_mandat_id_seq OWNED BY acteur_mandat.acteur_mandat_id;

CREATE SEQUENCE acteur_niv1_acteur_niv1_id_seq;

CREATE TABLE acteur_niv1 (
                acteur_niv1_id INTEGER NOT NULL DEFAULT nextval('acteur_niv1_acteur_niv1_id_seq'),
                acteur_niv1_libelle VARCHAR NOT NULL,
                CONSTRAINT acteur_niv1_pk PRIMARY KEY (acteur_niv1_id)
);


ALTER SEQUENCE acteur_niv1_acteur_niv1_id_seq OWNED BY acteur_niv1.acteur_niv1_id;

CREATE SEQUENCE acteur_niv2_acteur_niv2_id_seq;

CREATE TABLE acteur_niv2 (
                acteur_niv2_id INTEGER NOT NULL DEFAULT nextval('acteur_niv2_acteur_niv2_id_seq'),
                acteur_niv1_id INTEGER NOT NULL,
                acteur_niv2_libelle VARCHAR NOT NULL,
                CONSTRAINT acteur_niv2_pk PRIMARY KEY (acteur_niv2_id)
);


ALTER SEQUENCE acteur_niv2_acteur_niv2_id_seq OWNED BY acteur_niv2.acteur_niv2_id;

CREATE SEQUENCE acteur_niv3_acteur_niv3_id_seq;

CREATE TABLE acteur_niv3 (
                acteur_niv3_id INTEGER NOT NULL DEFAULT nextval('acteur_niv3_acteur_niv3_id_seq'),
                acteur_niv2_id INTEGER NOT NULL,
                acteur_niv3_libelle VARCHAR,
                CONSTRAINT acteur_niv3_pk PRIMARY KEY (acteur_niv3_id)
);


ALTER SEQUENCE acteur_niv3_acteur_niv3_id_seq OWNED BY acteur_niv3.acteur_niv3_id;

CREATE SEQUENCE acteur_structure_acteur_structure_id_seq;

CREATE TABLE acteur_structure (
                acteur_structure_id INTEGER NOT NULL DEFAULT nextval('acteur_structure_acteur_structure_id_seq'),
                acteur_id INTEGER NOT NULL,
                structure_type_id INTEGER NOT NULL,
                structure_statut VARCHAR,
                structure_statut_detail VARCHAR,
                CONSTRAINT acteur_structure_pk PRIMARY KEY (acteur_structure_id)
);
COMMENT ON TABLE acteur_structure IS 'Table des relations entre un acteur et les structures';


ALTER SEQUENCE acteur_structure_acteur_structure_id_seq OWNED BY acteur_structure.acteur_structure_id;

CREATE SEQUENCE action_action_id_seq;

CREATE TABLE action (
                action_id INTEGER NOT NULL DEFAULT nextval('action_action_id_seq'),
                intervention_id INTEGER NOT NULL,
                action_type_id INTEGER,
                action_mode_id INTEGER,
                action_echelle_id INTEGER,
                action_date TIMESTAMP,
                action_date_complement VARCHAR,
                action_detail VARCHAR,
                CONSTRAINT action_pk PRIMARY KEY (action_id)
);
COMMENT ON TABLE action IS 'Table des actions entreprises lors des interventions';
COMMENT ON COLUMN action.action_date IS 'Date de l''action';
COMMENT ON COLUMN action.action_date_complement IS 'Complément à la date d''action, si intervalle ou non connue avec précision';
COMMENT ON COLUMN action.action_detail IS 'Détail de l''action menée';


ALTER SEQUENCE action_action_id_seq OWNED BY action.action_id;

CREATE SEQUENCE action_echelle_action_echelle_id_seq;

CREATE TABLE action_echelle (
                action_echelle_id INTEGER NOT NULL DEFAULT nextval('action_echelle_action_echelle_id_seq'),
                action_echelle_libelle VARCHAR NOT NULL,
                CONSTRAINT action_echelle_pk PRIMARY KEY (action_echelle_id)
);
COMMENT ON TABLE action_echelle IS 'Table des échelles des actions';


ALTER SEQUENCE action_echelle_action_echelle_id_seq OWNED BY action_echelle.action_echelle_id;

CREATE SEQUENCE action_mode_action_mode_id_seq;

CREATE TABLE action_mode (
                action_mode_id INTEGER NOT NULL DEFAULT nextval('action_mode_action_mode_id_seq'),
                action_mode_libelle VARCHAR NOT NULL,
                CONSTRAINT action_mode_pk PRIMARY KEY (action_mode_id)
);
COMMENT ON TABLE action_mode IS 'Table des modes d''action';


ALTER SEQUENCE action_mode_action_mode_id_seq OWNED BY action_mode.action_mode_id;

CREATE SEQUENCE action_type_action_type_id_seq;

CREATE TABLE action_type (
                action_type_id INTEGER NOT NULL DEFAULT nextval('action_type_action_type_id_seq'),
                action_type_libelle VARCHAR NOT NULL,
                CONSTRAINT action_type_pk PRIMARY KEY (action_type_id)
);
COMMENT ON TABLE action_type IS 'Table des types de modes d''action';


ALTER SEQUENCE action_type_action_type_id_seq OWNED BY action_type.action_type_id;

CREATE SEQUENCE article_article_id_seq;

CREATE TABLE article (
                article_id INTEGER NOT NULL DEFAULT nextval('article_article_id_seq'),
                journal_id INTEGER NOT NULL,
                date_parution TIMESTAMP NOT NULL,
                titre VARCHAR NOT NULL,
                auteur VARCHAR NOT NULL,
                edition VARCHAR,
                rubrique VARCHAR,
                page SMALLINT,
                entete VARCHAR,
                piecejointe VARCHAR,
                article_login VARCHAR,
                article_date_saisie TIMESTAMP NOT NULL,
                CONSTRAINT article_pk PRIMARY KEY (article_id)
);
COMMENT ON TABLE article IS 'Table des articles';
COMMENT ON COLUMN article.date_parution IS 'Date de parution de l''article';
COMMENT ON COLUMN article.titre IS 'Titre de l''article';
COMMENT ON COLUMN article.auteur IS 'Auteur de l''article';
COMMENT ON COLUMN article.edition IS 'Édition du journal';
COMMENT ON COLUMN article.rubrique IS 'Rubrique de l''article';
COMMENT ON COLUMN article.page IS 'Page de l''article dans le journal';
COMMENT ON COLUMN article.entete IS 'Entête de l''article';
COMMENT ON COLUMN article.piecejointe IS 'Nom de la pièce jointe';
COMMENT ON COLUMN article.article_login IS 'Login de la personne ayant enregistré l''article';
COMMENT ON COLUMN article.article_date_saisie IS 'Date de saisie de l''article';


ALTER SEQUENCE article_article_id_seq OWNED BY article.article_id;

CREATE TABLE article_conflit (
                article_id INTEGER NOT NULL,
                conflit_id INTEGER NOT NULL,
                action_type_id INTEGER,
                CONSTRAINT article_conflit_pk PRIMARY KEY (article_id, conflit_id)
);
COMMENT ON TABLE article_conflit IS 'Table des conflits abordés dans un article';


CREATE TABLE article_document (
                article_id INTEGER NOT NULL,
                document_id INTEGER NOT NULL,
                CONSTRAINT article_document_pk PRIMARY KEY (article_id, document_id)
);
COMMENT ON TABLE article_document IS 'Table de rattachement d''un document a un article';


CREATE TABLE article_intervention (
                article_id INTEGER NOT NULL,
                intervention_id INTEGER NOT NULL,
                CONSTRAINT article_intervention_pk PRIMARY KEY (article_id, intervention_id)
);
COMMENT ON TABLE article_intervention IS 'Table des articles cités lors d''une intervention';


CREATE SEQUENCE bien_support_niv1_bien_support_niv1_id_seq;

CREATE TABLE bien_support_niv1 (
                bien_support_niv1_id INTEGER NOT NULL DEFAULT nextval('bien_support_niv1_bien_support_niv1_id_seq'),
                bien_support_niv1_libelle VARCHAR NOT NULL,
                CONSTRAINT bien_support_niv1_pk PRIMARY KEY (bien_support_niv1_id)
);
COMMENT ON COLUMN bien_support_niv1.bien_support_niv1_libelle IS 'Libelle du type de bien étant à l''origine du conflit';


ALTER SEQUENCE bien_support_niv1_bien_support_niv1_id_seq OWNED BY bien_support_niv1.bien_support_niv1_id;

CREATE SEQUENCE bien_support_niv2_bien_support_niv2_id_seq;

CREATE TABLE bien_support_niv2 (
                bien_support_niv2_id INTEGER NOT NULL DEFAULT nextval('bien_support_niv2_bien_support_niv2_id_seq'),
                bien_support_niv1_id INTEGER NOT NULL,
                bien_support_niv2_libelle VARCHAR NOT NULL,
                CONSTRAINT bien_support_niv2_pk PRIMARY KEY (bien_support_niv2_id)
);
COMMENT ON COLUMN bien_support_niv2.bien_support_niv2_libelle IS 'Libelle du type de bien support touché par le conflit';


ALTER SEQUENCE bien_support_niv2_bien_support_niv2_id_seq OWNED BY bien_support_niv2.bien_support_niv2_id;

CREATE TABLE commune (
                insee INTEGER NOT NULL,
                commune_nom VARCHAR NOT NULL,
                departement VARCHAR NOT NULL,
                CONSTRAINT commune_pk PRIMARY KEY (insee)
);
COMMENT ON TABLE commune IS 'Table des communes';
COMMENT ON COLUMN commune.insee IS 'N° Insee de la commune';
COMMENT ON COLUMN commune.commune_nom IS 'Nom de la commune';
COMMENT ON COLUMN commune.departement IS 'Nom du département';


CREATE SEQUENCE conflit_conflit_id_seq;

CREATE TABLE conflit (
                conflit_id INTEGER NOT NULL DEFAULT nextval('conflit_conflit_id_seq'),
                perimetre_id INTEGER NOT NULL,
                conflit_date_debut TIMESTAMP,
                conflit_date_debut_txt VARCHAR,
                conflit_date_fin TIMESTAMP,
                conflit_date_fin_txt VARCHAR,
                conflit_date_saisie TIMESTAMP,
                conflit_detail VARCHAR,
                conflit_login VARCHAR,
                CONSTRAINT conflit_pk PRIMARY KEY (conflit_id)
);
COMMENT ON TABLE conflit IS 'Table de description d''un conflit';
COMMENT ON COLUMN conflit.conflit_date_debut IS 'Date de début du conflit';
COMMENT ON COLUMN conflit.conflit_date_debut_txt IS 'Date de début du conflit, sous forme de texte';
COMMENT ON COLUMN conflit.conflit_date_fin IS 'Date de fin du conflit';
COMMENT ON COLUMN conflit.conflit_date_fin_txt IS 'Date de fin du conflit, au format texte';
COMMENT ON COLUMN conflit.conflit_date_saisie IS 'Date où le conflit a été saisie';
COMMENT ON COLUMN conflit.conflit_detail IS 'Informations complémentaires sur le conflit';


ALTER SEQUENCE conflit_conflit_id_seq OWNED BY conflit.conflit_id;

CREATE SEQUENCE decision_appel_decision_appel_id_seq;

CREATE TABLE decision_appel (
                decision_appel_id INTEGER NOT NULL DEFAULT nextval('decision_appel_decision_appel_id_seq'),
                decision_appel_libelle VARCHAR NOT NULL,
                CONSTRAINT decision_appel_pk PRIMARY KEY (decision_appel_id)
);
COMMENT ON TABLE decision_appel IS 'Table des types de décision en appel';


ALTER SEQUENCE decision_appel_decision_appel_id_seq OWNED BY decision_appel.decision_appel_id;

CREATE SEQUENCE decision_cassation_decision_cassation_id_seq;

CREATE TABLE decision_cassation (
                decision_cassation_id INTEGER NOT NULL DEFAULT nextval('decision_cassation_decision_cassation_id_seq'),
                decision_cassation_libelle VARCHAR NOT NULL,
                CONSTRAINT decision_cassation_pk PRIMARY KEY (decision_cassation_id)
);
COMMENT ON TABLE decision_cassation IS 'Table des sens de décision de cassation';


ALTER SEQUENCE decision_cassation_decision_cassation_id_seq OWNED BY decision_cassation.decision_cassation_id;

CREATE SEQUENCE document_document_id_seq;

CREATE TABLE document (
                document_id INTEGER NOT NULL DEFAULT nextval('document_document_id_seq'),
                mime_type_id INTEGER NOT NULL,
                document_date_import TIMESTAMP NOT NULL,
                document_nom VARCHAR NOT NULL,
                document_description VARCHAR,
                data BYTEA,
                size INTEGER,
                thumbnail BYTEA,
                CONSTRAINT document_pk PRIMARY KEY (document_id)
);
COMMENT ON TABLE document IS 'Table des documents';
COMMENT ON COLUMN document.document_nom IS 'Nom du document tel qu''il a été stocké';
COMMENT ON COLUMN document.document_description IS 'Description du document';
COMMENT ON COLUMN document.data IS 'Contenu du document';
COMMENT ON COLUMN document.size IS 'Taille du document';
COMMENT ON COLUMN document.thumbnail IS 'Vignette';


ALTER SEQUENCE document_document_id_seq OWNED BY document.document_id;

CREATE SEQUENCE echelle_echelle_id_seq;

CREATE TABLE echelle (
                echelle_id INTEGER NOT NULL DEFAULT nextval('echelle_echelle_id_seq'),
                echelle_libelle VARCHAR NOT NULL,
                CONSTRAINT echelle_pk PRIMARY KEY (echelle_id)
);
COMMENT ON TABLE echelle IS 'Echelle du perimetre';
COMMENT ON COLUMN echelle.echelle_libelle IS 'Indique le type d''échelle';


ALTER SEQUENCE echelle_echelle_id_seq OWNED BY echelle.echelle_id;

CREATE SEQUENCE entretien_entretien_id_seq;

CREATE TABLE entretien (
                entretien_id INTEGER NOT NULL DEFAULT nextval('entretien_entretien_id_seq'),
                expert_id INTEGER NOT NULL,
                entretien_date TIMESTAMP NOT NULL,
                institution VARCHAR NOT NULL,
                statut VARCHAR NOT NULL,
                localisation VARCHAR NOT NULL,
                binome VARCHAR NOT NULL,
                entretien_login VARCHAR,
                entretien_date_saisie TIMESTAMP,
                piece_jointe VARCHAR,
                CONSTRAINT entretien_pk PRIMARY KEY (entretien_id)
);
COMMENT ON TABLE entretien IS 'Table des entretiens menés';
COMMENT ON COLUMN entretien.entretien_date IS 'Date de l''entretien';
COMMENT ON COLUMN entretien.institution IS 'Institution représentée';
COMMENT ON COLUMN entretien.statut IS 'Statut de l''interviewé';
COMMENT ON COLUMN entretien.localisation IS 'Lieu de l''entretien';
COMMENT ON COLUMN entretien.binome IS 'Binome ayant mené l''entretien';
COMMENT ON COLUMN entretien.entretien_login IS 'Login de la personne ayant saisi l''entretien';
COMMENT ON COLUMN entretien.entretien_date_saisie IS 'Date de création de l''entretien dans la base';
COMMENT ON COLUMN entretien.piece_jointe IS 'Nom de la pièce jointe fournie';


ALTER SEQUENCE entretien_entretien_id_seq OWNED BY entretien.entretien_id;

CREATE TABLE entretien_conflit (
                entretien_id INTEGER NOT NULL,
                conflit_id INTEGER NOT NULL,
                CONSTRAINT entretien_conflit_pk PRIMARY KEY (entretien_id, conflit_id)
);
COMMENT ON TABLE entretien_conflit IS 'Table des conflits relatés par les entretiens';


CREATE TABLE entretien_document (
                entretien_id INTEGER NOT NULL,
                document_id INTEGER NOT NULL,
                CONSTRAINT entretien_document_pk PRIMARY KEY (entretien_id, document_id)
);
COMMENT ON TABLE entretien_document IS 'Table de rattachement d''un document à un entretien';


CREATE TABLE entretien_intervention (
                entretien_id INTEGER NOT NULL,
                intervention_id INTEGER NOT NULL,
                CONSTRAINT entretien_intervention_pk PRIMARY KEY (entretien_id, intervention_id)
);
COMMENT ON TABLE entretien_intervention IS 'Table des interventions évoquées lors des entretiens';


CREATE SEQUENCE expert_expert_id_seq;

CREATE TABLE expert (
                expert_id INTEGER NOT NULL DEFAULT nextval('expert_expert_id_seq'),
                acteur_id INTEGER,
                expert_nom VARCHAR NOT NULL,
                expert_prenom VARCHAR NOT NULL,
                sexe VARCHAR NOT NULL,
                commune_residence VARCHAR,
                lien_territoire VARCHAR NOT NULL,
                activite_assoc VARCHAR,
                activite_prof VARCHAR NOT NULL,
                annee_naissance INTEGER,
                CONSTRAINT expert_pk PRIMARY KEY (expert_id)
);
COMMENT ON TABLE expert IS 'Table des experts entendus en entretien';
COMMENT ON COLUMN expert.expert_nom IS 'Nom de l''expert';
COMMENT ON COLUMN expert.expert_prenom IS 'Prénom de l''expert';
COMMENT ON COLUMN expert.sexe IS 'Sexe (H/F)';
COMMENT ON COLUMN expert.commune_residence IS 'Commune de résidence, précision pour les experts';
COMMENT ON COLUMN expert.lien_territoire IS 'Lien avec le territoire (expert)';
COMMENT ON COLUMN expert.activite_assoc IS 'Activité associative (expert)';
COMMENT ON COLUMN expert.activite_prof IS 'Activité professionnelle (expert)';
COMMENT ON COLUMN expert.annee_naissance IS 'Année de naissance de l''expert';


ALTER SEQUENCE expert_expert_id_seq OWNED BY expert.expert_id;

CREATE SEQUENCE intervention_intervention_id_seq;

CREATE TABLE intervention (
                intervention_id INTEGER NOT NULL DEFAULT nextval('intervention_intervention_id_seq'),
                conflit_id INTEGER NOT NULL,
                acteur_id INTEGER NOT NULL,
                role_id INTEGER,
                usage_activite_niv2_id INTEGER,
                position_usage_activite_id INTEGER NOT NULL,
                intervention_date_entree TIMESTAMP,
                intervention_date_entree_txt VARCHAR,
                intervention_date_sortie TIMESTAMP,
                intervention_date_sortie_txt VARCHAR,
                intervention_detail_usage VARCHAR,
                CONSTRAINT intervention_pk PRIMARY KEY (intervention_id)
);
COMMENT ON COLUMN intervention.intervention_date_entree_txt IS 'Date d''entrée dans l''intervention, au format texte';
COMMENT ON COLUMN intervention.intervention_date_sortie_txt IS 'Date de sortie de l''intervention, au format texte';


ALTER SEQUENCE intervention_intervention_id_seq OWNED BY intervention.intervention_id;

CREATE SEQUENCE intervention_juridique_intervention_juridique_id_seq;

CREATE TABLE intervention_juridique (
                intervention_juridique_id INTEGER NOT NULL DEFAULT nextval('intervention_juridique_intervention_juridique_id_seq'),
                intervention_id INTEGER NOT NULL,
                juridique_id INTEGER NOT NULL,
                position_acteur_id INTEGER NOT NULL,
                qualite_appel_id INTEGER,
                qualite_pourvoi_id INTEGER,
                petitionnaire SMALLINT,
                CONSTRAINT intervention_juridique_pk PRIMARY KEY (intervention_juridique_id)
);
COMMENT ON TABLE intervention_juridique IS 'Table des implications juridiques des interventions';
COMMENT ON COLUMN intervention_juridique.petitionnaire IS '0 : non, 1 : oui';


ALTER SEQUENCE intervention_juridique_intervention_juridique_id_seq OWNED BY intervention_juridique.intervention_juridique_id;

CREATE SEQUENCE journal_journal_id_seq;

CREATE TABLE journal (
                journal_id INTEGER NOT NULL DEFAULT nextval('journal_journal_id_seq'),
                journal_libelle VARCHAR NOT NULL,
                CONSTRAINT journal_pk PRIMARY KEY (journal_id)
);
COMMENT ON TABLE journal IS 'Liste des journaux';


ALTER SEQUENCE journal_journal_id_seq OWNED BY journal.journal_id;

CREATE SEQUENCE juridiction_juridiction_id_seq;

CREATE TABLE juridiction (
                juridiction_id INTEGER NOT NULL DEFAULT nextval('juridiction_juridiction_id_seq'),
                juridiction_libelle VARCHAR NOT NULL,
                CONSTRAINT juridiction_pk PRIMARY KEY (juridiction_id)
);
COMMENT ON TABLE juridiction IS 'Table des juridictions';


ALTER SEQUENCE juridiction_juridiction_id_seq OWNED BY juridiction.juridiction_id;

CREATE SEQUENCE juridique_juridique_id_seq;

CREATE TABLE juridique (
                juridique_id INTEGER NOT NULL DEFAULT nextval('juridique_juridique_id_seq'),
                juridiction_id INTEGER NOT NULL,
                arret_num VARCHAR NOT NULL,
                arret_date TIMESTAMP NOT NULL,
                acte_date TIMESTAMP NOT NULL,
                juridique_sous_domaine_id INTEGER,
                nature_requete_id INTEGER NOT NULL,
                type_ouvrage_perm_constr_id INTEGER,
                nature_travaux_id INTEGER,
                decision_cassation_id INTEGER,
                decision_appel_id INTEGER,
                acte_contentieux_id INTEGER,
                juridique_libelle VARCHAR,
                objet_precision VARCHAR,
                article1 VARCHAR,
                article2 VARCHAR,
                article3 VARCHAR,
                article4 VARCHAR,
                article5 VARCHAR,
                jugement_date_degre1 TIMESTAMP,
                jugement_date_degre2 TIMESTAMP,
                juridique_login VARCHAR NOT NULL,
                juridique_date_saisie TIMESTAMP NOT NULL,
                CONSTRAINT juridique_pk PRIMARY KEY (juridique_id)
);
COMMENT ON TABLE juridique IS 'Table des données juridiques';
COMMENT ON COLUMN juridique.arret_num IS 'Numéro de l''arrêt';
COMMENT ON COLUMN juridique.arret_date IS 'Date de l''arrêt';
COMMENT ON COLUMN juridique.acte_date IS 'Date de l''acte juridique';
COMMENT ON COLUMN juridique.juridique_libelle IS 'Libellé de la décision juridique';
COMMENT ON COLUMN juridique.objet_precision IS 'Précisions concernant l''objet';
COMMENT ON COLUMN juridique.jugement_date_degre1 IS 'Date du jugement de degré 1';
COMMENT ON COLUMN juridique.jugement_date_degre2 IS 'Date de jugement de degré 2';
COMMENT ON COLUMN juridique.juridique_login IS 'Login de la personne ayant saisi la fiche';
COMMENT ON COLUMN juridique.juridique_date_saisie IS 'Date de saisie de la fiche';


ALTER SEQUENCE juridique_juridique_id_seq OWNED BY juridique.juridique_id;

CREATE TABLE juridique_conflit (
                juridique_id INTEGER NOT NULL,
                conflit_id INTEGER NOT NULL,
                CONSTRAINT juridique_conflit_pk PRIMARY KEY (juridique_id, conflit_id)
);
COMMENT ON TABLE juridique_conflit IS 'Table des conflits traités par les décisions juridiques';


CREATE TABLE juridique_document (
                juridique_id INTEGER NOT NULL,
                document_id INTEGER NOT NULL,
                CONSTRAINT juridique_document_pk PRIMARY KEY (juridique_id, document_id)
);
COMMENT ON TABLE juridique_document IS 'Table de rattachement d''un document à une décision juridique';


CREATE SEQUENCE juridique_domaine_juridique_domaine_id_seq;

CREATE TABLE juridique_domaine (
                juridique_domaine_id INTEGER NOT NULL DEFAULT nextval('juridique_domaine_juridique_domaine_id_seq'),
                juridique_domaine_libelle VARCHAR NOT NULL,
                CONSTRAINT juridique_domaine_pk PRIMARY KEY (juridique_domaine_id)
);
COMMENT ON TABLE juridique_domaine IS 'Table des domaines des décisions juridiques';


ALTER SEQUENCE juridique_domaine_juridique_domaine_id_seq OWNED BY juridique_domaine.juridique_domaine_id;

CREATE SEQUENCE juridique_sous_domaine_juridique_sous_domaine_id_seq;

CREATE TABLE juridique_sous_domaine (
                juridique_sous_domaine_id INTEGER NOT NULL DEFAULT nextval('juridique_sous_domaine_juridique_sous_domaine_id_seq'),
                juridique_domaine_id INTEGER NOT NULL,
                juridique_sous_domaine_libelle VARCHAR NOT NULL,
                CONSTRAINT juridique_sous_domaine_pk PRIMARY KEY (juridique_sous_domaine_id)
);
COMMENT ON TABLE juridique_sous_domaine IS 'Table des sous-domaines des décisions juridiques';


ALTER SEQUENCE juridique_sous_domaine_juridique_sous_domaine_id_seq OWNED BY juridique_sous_domaine.juridique_sous_domaine_id;

CREATE SEQUENCE localisation_localisation_id_seq;

CREATE TABLE localisation (
                localisation_id INTEGER NOT NULL DEFAULT nextval('localisation_localisation_id_seq'),
                insee INTEGER NOT NULL,
                precision_adresse VARCHAR,
                CONSTRAINT localisation_pk PRIMARY KEY (localisation_id)
);
COMMENT ON TABLE localisation IS 'Table des localisations des périmètres des conflits';
COMMENT ON COLUMN localisation.insee IS 'N° Insee de la commune';
COMMENT ON COLUMN localisation.precision_adresse IS 'Complément pour préciser la localisation';


ALTER SEQUENCE localisation_localisation_id_seq OWNED BY localisation.localisation_id;

CREATE SEQUENCE mandat_type_mandat_type_id_seq;

CREATE TABLE mandat_type (
                mandat_type_id INTEGER NOT NULL DEFAULT nextval('mandat_type_mandat_type_id_seq'),
                mandat_type_libelle VARCHAR NOT NULL,
                CONSTRAINT mandat_type_pk PRIMARY KEY (mandat_type_id)
);
COMMENT ON TABLE mandat_type IS 'Table des types de mandats';


ALTER SEQUENCE mandat_type_mandat_type_id_seq OWNED BY mandat_type.mandat_type_id;

CREATE SEQUENCE mime_type_mime_type_id_seq;

CREATE TABLE mime_type (
                mime_type_id INTEGER NOT NULL DEFAULT nextval('mime_type_mime_type_id_seq'),
                content_type VARCHAR NOT NULL,
                extension VARCHAR NOT NULL,
                CONSTRAINT mime_type_pk PRIMARY KEY (mime_type_id)
);
COMMENT ON TABLE mime_type IS 'Table des types mime';


ALTER SEQUENCE mime_type_mime_type_id_seq OWNED BY mime_type.mime_type_id;

CREATE SEQUENCE nature_requete_nature_requete_id_seq;

CREATE TABLE nature_requete (
                nature_requete_id INTEGER NOT NULL DEFAULT nextval('nature_requete_nature_requete_id_seq'),
                nature_requete_libelle VARCHAR NOT NULL,
                CONSTRAINT nature_requete_pk PRIMARY KEY (nature_requete_id)
);
COMMENT ON TABLE nature_requete IS 'Table des natures de requêtes';


ALTER SEQUENCE nature_requete_nature_requete_id_seq OWNED BY nature_requete.nature_requete_id;

CREATE SEQUENCE nature_travaux_nature_travaux_id_seq;

CREATE TABLE nature_travaux (
                nature_travaux_id INTEGER NOT NULL DEFAULT nextval('nature_travaux_nature_travaux_id_seq'),
                nature_travaux_libelle VARCHAR NOT NULL,
                CONSTRAINT nature_travaux_pk PRIMARY KEY (nature_travaux_id)
);
COMMENT ON TABLE nature_travaux IS 'Table des natures de travaux';


ALTER SEQUENCE nature_travaux_nature_travaux_id_seq OWNED BY nature_travaux.nature_travaux_id;

CREATE SEQUENCE objet_niv1_objet_niv1_id_seq;

CREATE TABLE objet_niv1 (
                objet_niv1_id INTEGER NOT NULL DEFAULT nextval('objet_niv1_objet_niv1_id_seq'),
                objet_niv1_libelle VARCHAR NOT NULL,
                type_perimetre_id INTEGER DEFAULT 2 NOT NULL,
                CONSTRAINT objet_niv1_pk PRIMARY KEY (objet_niv1_id)
);
COMMENT ON COLUMN objet_niv1.objet_niv1_libelle IS 'Libelle du type de secteur touché';


ALTER SEQUENCE objet_niv1_objet_niv1_id_seq OWNED BY objet_niv1.objet_niv1_id;

CREATE SEQUENCE objet_niv2_objet_niv2_id_seq;

CREATE TABLE objet_niv2 (
                objet_niv2_id INTEGER NOT NULL DEFAULT nextval('objet_niv2_objet_niv2_id_seq'),
                objet_niv1_id INTEGER NOT NULL,
                objet_niv2_libelle VARCHAR NOT NULL,
                CONSTRAINT objet_niv2_pk PRIMARY KEY (objet_niv2_id)
);
COMMENT ON COLUMN objet_niv2.objet_niv2_libelle IS 'Libelle correspondant au type d''objet étant à la base du conflit';


ALTER SEQUENCE objet_niv2_objet_niv2_id_seq OWNED BY objet_niv2.objet_niv2_id;

CREATE SEQUENCE particulier_resident_type_particulier_resident_type_id_seq;

CREATE TABLE particulier_resident_type (
                particulier_resident_type_id INTEGER NOT NULL DEFAULT nextval('particulier_resident_type_particulier_resident_type_id_seq'),
                particulier_resident_type_libelle VARCHAR NOT NULL,
                CONSTRAINT particulier_resident_type_pk PRIMARY KEY (particulier_resident_type_id)
);
COMMENT ON TABLE particulier_resident_type IS 'Table des types de résidence des acteurs particuliers';


ALTER SEQUENCE particulier_resident_type_particulier_resident_type_id_seq OWNED BY particulier_resident_type.particulier_resident_type_id;

CREATE SEQUENCE perimetre_perimetre_id_seq;

CREATE TABLE perimetre (
                perimetre_id INTEGER NOT NULL DEFAULT nextval('perimetre_perimetre_id_seq'),
                type_perimetre_id INTEGER NOT NULL,
                echelle_id INTEGER,
                bien_support_niv2_id INTEGER,
                objet_niv2_id INTEGER NOT NULL,
                recurrence_id INTEGER,
                perimetre_date_saisie TIMESTAMP,
                perimetre_detail VARCHAR,
                perimetre_login VARCHAR,
                CONSTRAINT perimetre_pk PRIMARY KEY (perimetre_id)
);
COMMENT ON TABLE perimetre IS 'Table de localisation d''un conflit';
COMMENT ON COLUMN perimetre.perimetre_date_saisie IS 'Date de saisie du perimetre';
COMMENT ON COLUMN perimetre.perimetre_detail IS 'Informations complémentaires sur le perimetre';


ALTER SEQUENCE perimetre_perimetre_id_seq OWNED BY perimetre.perimetre_id;

CREATE TABLE perimetre_localisation (
                perimetre_id INTEGER NOT NULL,
                localisation_id INTEGER NOT NULL,
                CONSTRAINT perimetre_localisation_pk PRIMARY KEY (perimetre_id, localisation_id)
);
COMMENT ON TABLE perimetre_localisation IS 'Table de correspondance entre les périmètres et les localisations';


CREATE SEQUENCE position_acteur_position_acteur_id_seq;

CREATE TABLE position_acteur (
                position_acteur_id INTEGER NOT NULL DEFAULT nextval('position_acteur_position_acteur_id_seq'),
                position_acteur_libelle VARCHAR NOT NULL,
                CONSTRAINT position_acteur_pk PRIMARY KEY (position_acteur_id)
);
COMMENT ON TABLE position_acteur IS 'Table des positions des acteurs';


ALTER SEQUENCE position_acteur_position_acteur_id_seq OWNED BY position_acteur.position_acteur_id;

CREATE SEQUENCE position_usage_activite_position_usage_activite_id_seq;

CREATE TABLE position_usage_activite (
                position_usage_activite_id INTEGER NOT NULL DEFAULT nextval('position_usage_activite_position_usage_activite_id_seq'),
                position_usage_activite_libelle VARCHAR NOT NULL,
                CONSTRAINT position_usage_activite_pk PRIMARY KEY (position_usage_activite_id)
);


ALTER SEQUENCE position_usage_activite_position_usage_activite_id_seq OWNED BY position_usage_activite.position_usage_activite_id;

CREATE SEQUENCE qualite_appel_qualite_appel_id_seq;

CREATE TABLE qualite_appel (
                qualite_appel_id INTEGER NOT NULL DEFAULT nextval('qualite_appel_qualite_appel_id_seq'),
                qualite_appel_libelle VARCHAR NOT NULL,
                CONSTRAINT qualite_appel_pk PRIMARY KEY (qualite_appel_id)
);
COMMENT ON TABLE qualite_appel IS 'Table des qualités d''appel (demandeur, défendeur)';


ALTER SEQUENCE qualite_appel_qualite_appel_id_seq OWNED BY qualite_appel.qualite_appel_id;

CREATE SEQUENCE recurrence_recurrence_id_seq;

CREATE TABLE recurrence (
                recurrence_id INTEGER NOT NULL DEFAULT nextval('recurrence_recurrence_id_seq'),
                recurrence_libelle VARCHAR NOT NULL,
                CONSTRAINT recurrence_pk PRIMARY KEY (recurrence_id)
);
COMMENT ON TABLE recurrence IS 'Recurrence d''apparition du conflit';


ALTER SEQUENCE recurrence_recurrence_id_seq OWNED BY recurrence.recurrence_id;

CREATE SEQUENCE registre_argument_niv1_registre_argument_niv1_id_seq;

CREATE TABLE registre_argument_niv1 (
                registre_argument_niv1_id INTEGER NOT NULL DEFAULT nextval('registre_argument_niv1_registre_argument_niv1_id_seq'),
                registre_argument_niv1_libelle VARCHAR NOT NULL,
                CONSTRAINT registre_argument_niv1_pk PRIMARY KEY (registre_argument_niv1_id)
);
COMMENT ON TABLE registre_argument_niv1 IS 'Table des registres d''argument - niveau 1';


ALTER SEQUENCE registre_argument_niv1_registre_argument_niv1_id_seq OWNED BY registre_argument_niv1.registre_argument_niv1_id;

CREATE SEQUENCE registre_argument_niv2_registre_argument_niv2_id_seq;

CREATE TABLE registre_argument_niv2 (
                registre_argument_niv2_id INTEGER NOT NULL DEFAULT nextval('registre_argument_niv2_registre_argument_niv2_id_seq'),
                registre_argument_niv1_id INTEGER NOT NULL,
                registre_argument_niv2_libelle VARCHAR NOT NULL,
                CONSTRAINT registre_argument_niv2_pk PRIMARY KEY (registre_argument_niv2_id)
);
COMMENT ON TABLE registre_argument_niv2 IS 'Table des registres d''argument - niveau 2';


ALTER SEQUENCE registre_argument_niv2_registre_argument_niv2_id_seq OWNED BY registre_argument_niv2.registre_argument_niv2_id;

CREATE SEQUENCE resolution_resolution_id_seq;

CREATE TABLE resolution (
                resolution_id INTEGER NOT NULL DEFAULT nextval('resolution_resolution_id_seq'),
                conflit_id INTEGER NOT NULL,
                solution_proposee_id INTEGER,
                resolution_echelle_id INTEGER,
                resolution_nature_id INTEGER,
                resolution_acteur_id INTEGER,
                resolution_mode_niv2_id INTEGER,
                resolution_detail VARCHAR,
                CONSTRAINT resolution_pk PRIMARY KEY (resolution_id)
);
COMMENT ON TABLE resolution IS 'Table des résolutions des conflits';


ALTER SEQUENCE resolution_resolution_id_seq OWNED BY resolution.resolution_id;

CREATE SEQUENCE resolution_acteur_resolution_acteur_id_seq;

CREATE TABLE resolution_acteur (
                resolution_acteur_id INTEGER NOT NULL DEFAULT nextval('resolution_acteur_resolution_acteur_id_seq'),
                resolution_acteur_libelle VARCHAR NOT NULL,
                CONSTRAINT resolution_acteur_pk PRIMARY KEY (resolution_acteur_id)
);
COMMENT ON TABLE resolution_acteur IS 'Table des actions entreprises au niveau des acteurs';


ALTER SEQUENCE resolution_acteur_resolution_acteur_id_seq OWNED BY resolution_acteur.resolution_acteur_id;

CREATE SEQUENCE resolution_echelle_resolution_echelle_id_seq;

CREATE TABLE resolution_echelle (
                resolution_echelle_id INTEGER NOT NULL DEFAULT nextval('resolution_echelle_resolution_echelle_id_seq'),
                resolution_echelle_libelle VARCHAR NOT NULL,
                CONSTRAINT resolution_echelle_pk PRIMARY KEY (resolution_echelle_id)
);
COMMENT ON TABLE resolution_echelle IS 'Table des échelles géographiques des résolutions';


ALTER SEQUENCE resolution_echelle_resolution_echelle_id_seq OWNED BY resolution_echelle.resolution_echelle_id;

CREATE SEQUENCE resolution_mode_niv1_resolution_mode_niv1_id_seq;

CREATE TABLE resolution_mode_niv1 (
                resolution_mode_niv1_id INTEGER NOT NULL DEFAULT nextval('resolution_mode_niv1_resolution_mode_niv1_id_seq'),
                resolution_mode_niv1_libelle VARCHAR NOT NULL,
                CONSTRAINT resolution_mode_niv1_pk PRIMARY KEY (resolution_mode_niv1_id)
);
COMMENT ON TABLE resolution_mode_niv1 IS 'Table des modes de résolution - niveau 1';


ALTER SEQUENCE resolution_mode_niv1_resolution_mode_niv1_id_seq OWNED BY resolution_mode_niv1.resolution_mode_niv1_id;

CREATE SEQUENCE resolution_mode_niv2_resolution_mode_niv2_id_seq;

CREATE TABLE resolution_mode_niv2 (
                resolution_mode_niv2_id INTEGER NOT NULL DEFAULT nextval('resolution_mode_niv2_resolution_mode_niv2_id_seq'),
                resolution_mode_niv2_libelle VARCHAR NOT NULL,
                resolution_mode_niv1_id INTEGER NOT NULL,
                CONSTRAINT resolution_mode_niv2_pk PRIMARY KEY (resolution_mode_niv2_id)
);
COMMENT ON TABLE resolution_mode_niv2 IS 'Table des modes de résolution - niveau 2';


ALTER SEQUENCE resolution_mode_niv2_resolution_mode_niv2_id_seq OWNED BY resolution_mode_niv2.resolution_mode_niv2_id;

CREATE SEQUENCE resolution_nature_resolution_nature_id_seq;

CREATE TABLE resolution_nature (
                resolution_nature_id INTEGER NOT NULL DEFAULT nextval('resolution_nature_resolution_nature_id_seq'),
                resolution_nature_libelle VARCHAR NOT NULL,
                CONSTRAINT resolution_nature_pk PRIMARY KEY (resolution_nature_id)
);
COMMENT ON TABLE resolution_nature IS 'Table des natures de résolution';


ALTER SEQUENCE resolution_nature_resolution_nature_id_seq OWNED BY resolution_nature.resolution_nature_id;

CREATE SEQUENCE revend_support_niv1_revend_support_niv1_id_seq;

CREATE TABLE revend_support_niv1 (
                revend_support_niv1_id INTEGER NOT NULL DEFAULT nextval('revend_support_niv1_revend_support_niv1_id_seq'),
                revend_support_niv1_libelle VARCHAR NOT NULL,
                CONSTRAINT revend_support_niv1_pk PRIMARY KEY (revend_support_niv1_id)
);
COMMENT ON TABLE revend_support_niv1 IS 'Table des supports de revendication niveau 1';


ALTER SEQUENCE revend_support_niv1_revend_support_niv1_id_seq OWNED BY revend_support_niv1.revend_support_niv1_id;

CREATE SEQUENCE revend_support_niv2_revend_support_niv2_id_seq;

CREATE TABLE revend_support_niv2 (
                revend_support_niv2_id INTEGER NOT NULL DEFAULT nextval('revend_support_niv2_revend_support_niv2_id_seq'),
                revend_support_niv1_id INTEGER NOT NULL,
                revend_support_niv2_libelle VARCHAR NOT NULL,
                CONSTRAINT revend_support_niv2_pk PRIMARY KEY (revend_support_niv2_id)
);
COMMENT ON TABLE revend_support_niv2 IS 'Table des supports de revendication niveau 2';


ALTER SEQUENCE revend_support_niv2_revend_support_niv2_id_seq OWNED BY revend_support_niv2.revend_support_niv2_id;

CREATE SEQUENCE revendication_revendication_id_seq;

CREATE TABLE revendication (
                revendication_id INTEGER NOT NULL DEFAULT nextval('revendication_revendication_id_seq'),
                intervention_id INTEGER NOT NULL,
                revendication_niv2_id INTEGER,
                revend_support_niv2_id INTEGER,
                registre_argument_niv2_id INTEGER,
                revendication_detail VARCHAR,
                argument_detail VARCHAR,
                CONSTRAINT revendication_pk PRIMARY KEY (revendication_id)
);
COMMENT ON TABLE revendication IS 'Table des revendications portées par les interventions';
COMMENT ON COLUMN revendication.revendication_detail IS 'Détail de la revendication';
COMMENT ON COLUMN revendication.argument_detail IS 'Détail des arguments présentés';


ALTER SEQUENCE revendication_revendication_id_seq OWNED BY revendication.revendication_id;

CREATE SEQUENCE revendication_niv1_revendication_niv1_id_seq;

CREATE TABLE revendication_niv1 (
                revendication_niv1_id INTEGER NOT NULL DEFAULT nextval('revendication_niv1_revendication_niv1_id_seq'),
                revendication_niv1_libelle VARCHAR NOT NULL,
                CONSTRAINT revendication_niv1_pk PRIMARY KEY (revendication_niv1_id)
);
COMMENT ON TABLE revendication_niv1 IS 'Table des niveaux 1 de revendication';


ALTER SEQUENCE revendication_niv1_revendication_niv1_id_seq OWNED BY revendication_niv1.revendication_niv1_id;

CREATE SEQUENCE revendication_niv2_revendication_niv2_id_seq;

CREATE TABLE revendication_niv2 (
                revendication_niv2_id INTEGER NOT NULL DEFAULT nextval('revendication_niv2_revendication_niv2_id_seq'),
                revendication_niv1_id INTEGER NOT NULL,
                revendication_niv2_libelle VARCHAR NOT NULL,
                CONSTRAINT revendication_niv2_pk PRIMARY KEY (revendication_niv2_id)
);
COMMENT ON TABLE revendication_niv2 IS 'Table des revendications de niveau 2';


ALTER SEQUENCE revendication_niv2_revendication_niv2_id_seq OWNED BY revendication_niv2.revendication_niv2_id;

CREATE SEQUENCE role_role_id_seq;

CREATE TABLE role (
                role_id INTEGER NOT NULL DEFAULT nextval('role_role_id_seq'),
                role_libelle VARCHAR NOT NULL,
                CONSTRAINT role_pk PRIMARY KEY (role_id)
);


ALTER SEQUENCE role_role_id_seq OWNED BY role.role_id;

CREATE SEQUENCE solution_proposee_solution_proposee_id_seq;

CREATE TABLE solution_proposee (
                solution_proposee_id INTEGER NOT NULL DEFAULT nextval('solution_proposee_solution_proposee_id_seq'),
                intervention_id INTEGER NOT NULL,
                solution_proposee_libelle VARCHAR NOT NULL,
                CONSTRAINT solution_proposee_pk PRIMARY KEY (solution_proposee_id)
);
COMMENT ON TABLE solution_proposee IS 'Table des solutions proposées';


ALTER SEQUENCE solution_proposee_solution_proposee_id_seq OWNED BY solution_proposee.solution_proposee_id;

CREATE SEQUENCE structure_type_structure_type_id_seq;

CREATE TABLE structure_type (
                structure_type_id INTEGER NOT NULL DEFAULT nextval('structure_type_structure_type_id_seq'),
                structure_type_libelle VARCHAR NOT NULL,
                CONSTRAINT structure_type_pk PRIMARY KEY (structure_type_id)
);
COMMENT ON TABLE structure_type IS 'Type de structure';


ALTER SEQUENCE structure_type_structure_type_id_seq OWNED BY structure_type.structure_type_id;

CREATE SEQUENCE type_ouvrage_perm_constr_type_ouvrage_perm_constr_id_seq;

CREATE TABLE type_ouvrage_perm_constr (
                type_ouvrage_perm_constr_id INTEGER NOT NULL DEFAULT nextval('type_ouvrage_perm_constr_type_ouvrage_perm_constr_id_seq'),
                type_ouvrage_perm_constr_libelle VARCHAR NOT NULL,
                CONSTRAINT type_ouvrage_perm_constr_pk PRIMARY KEY (type_ouvrage_perm_constr_id)
);
COMMENT ON TABLE type_ouvrage_perm_constr IS 'Table des types d''ouvrage utilisés dans les permis de construire';


ALTER SEQUENCE type_ouvrage_perm_constr_type_ouvrage_perm_constr_id_seq OWNED BY type_ouvrage_perm_constr.type_ouvrage_perm_constr_id;

CREATE SEQUENCE type_perimetre_type_perimetre_id_seq;

CREATE TABLE type_perimetre (
                type_perimetre_id INTEGER NOT NULL DEFAULT nextval('type_perimetre_type_perimetre_id_seq'),
                type_perimetre_libelle VARCHAR NOT NULL,
                CONSTRAINT type_perimetre_pk PRIMARY KEY (type_perimetre_id)
);
COMMENT ON TABLE type_perimetre IS 'Type de perimetre du conflit';
COMMENT ON COLUMN type_perimetre.type_perimetre_libelle IS 'Libelle du type de perimetre';


ALTER SEQUENCE type_perimetre_type_perimetre_id_seq OWNED BY type_perimetre.type_perimetre_id;

CREATE SEQUENCE usage_activite_niv1_usage_activite_niv1_id_seq;

CREATE TABLE usage_activite_niv1 (
                usage_activite_niv1_id INTEGER NOT NULL DEFAULT nextval('usage_activite_niv1_usage_activite_niv1_id_seq'),
                usage_activite_niv1_libelle VARCHAR NOT NULL,
                position_usage_activite_id INTEGER DEFAULT 1 NOT NULL,
                CONSTRAINT usage_activite_niv1_pk PRIMARY KEY (usage_activite_niv1_id)
);


ALTER SEQUENCE usage_activite_niv1_usage_activite_niv1_id_seq OWNED BY usage_activite_niv1.usage_activite_niv1_id;

CREATE SEQUENCE usage_activite_niv2_usage_activite_niv2_id_seq;

CREATE TABLE usage_activite_niv2 (
                usage_activite_niv2_id INTEGER NOT NULL DEFAULT nextval('usage_activite_niv2_usage_activite_niv2_id_seq'),
                usage_activite_niv1_id INTEGER NOT NULL,
                usage_activite_niv2_libelle VARCHAR NOT NULL,
                CONSTRAINT usage_activite_niv2_pk PRIMARY KEY (usage_activite_niv2_id)
);


ALTER SEQUENCE usage_activite_niv2_usage_activite_niv2_id_seq OWNED BY usage_activite_niv2.usage_activite_niv2_id;

ALTER TABLE juridique ADD CONSTRAINT acte_contentieux_juridique_fk
FOREIGN KEY (acte_contentieux_id)
REFERENCES acte_contentieux (acte_contentieux_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE acteur_mandat ADD CONSTRAINT acteur_acteur_mandat_fk
FOREIGN KEY (acteur_id)
REFERENCES acteur (acteur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE acteur_structure ADD CONSTRAINT acteur_acteur_structure_fk
FOREIGN KEY (acteur_id)
REFERENCES acteur (acteur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE expert ADD CONSTRAINT acteur_expert_fk
FOREIGN KEY (acteur_id)
REFERENCES acteur (acteur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE intervention ADD CONSTRAINT acteur_intervention_fk
FOREIGN KEY (acteur_id)
REFERENCES acteur (acteur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE acteur_niv2 ADD CONSTRAINT acteur_niv1_acteur_niv2_fk
FOREIGN KEY (acteur_niv1_id)
REFERENCES acteur_niv1 (acteur_niv1_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE acteur_niv3 ADD CONSTRAINT acteur_niv2_acteur_niv3_fk
FOREIGN KEY (acteur_niv2_id)
REFERENCES acteur_niv2 (acteur_niv2_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE acteur ADD CONSTRAINT acteur_niv3_acteur_fk
FOREIGN KEY (acteur_niv3_id)
REFERENCES acteur_niv3 (acteur_niv3_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE action ADD CONSTRAINT action_echelle_action_fk
FOREIGN KEY (action_echelle_id)
REFERENCES action_echelle (action_echelle_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE action ADD CONSTRAINT action_mode_action_fk
FOREIGN KEY (action_mode_id)
REFERENCES action_mode (action_mode_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE action ADD CONSTRAINT action_type_action_fk
FOREIGN KEY (action_type_id)
REFERENCES action_type (action_type_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE article_conflit ADD CONSTRAINT action_type_article_conflit_fk
FOREIGN KEY (action_type_id)
REFERENCES action_type (action_type_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE article_conflit ADD CONSTRAINT article_article_conflit_fk
FOREIGN KEY (article_id)
REFERENCES article (article_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE article_document ADD CONSTRAINT article_article_document_fk
FOREIGN KEY (article_id)
REFERENCES article (article_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE article_intervention ADD CONSTRAINT article_article_intervention_fk
FOREIGN KEY (article_id)
REFERENCES article (article_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE bien_support_niv2 ADD CONSTRAINT bien_support_niv1_bien_support_niv2_fk
FOREIGN KEY (bien_support_niv1_id)
REFERENCES bien_support_niv1 (bien_support_niv1_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE perimetre ADD CONSTRAINT bien_support_niv2_perimetre_fk
FOREIGN KEY (bien_support_niv2_id)
REFERENCES bien_support_niv2 (bien_support_niv2_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE localisation ADD CONSTRAINT commune_localisation_fk
FOREIGN KEY (insee)
REFERENCES commune (insee)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE article_conflit ADD CONSTRAINT conflit_article_conflit_fk
FOREIGN KEY (conflit_id)
REFERENCES conflit (conflit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE entretien_conflit ADD CONSTRAINT conflit_entretien_conflit_fk
FOREIGN KEY (conflit_id)
REFERENCES conflit (conflit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE intervention ADD CONSTRAINT conflit_intervention_fk
FOREIGN KEY (conflit_id)
REFERENCES conflit (conflit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE juridique_conflit ADD CONSTRAINT conflit_juridique_conflit_fk
FOREIGN KEY (conflit_id)
REFERENCES conflit (conflit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE resolution ADD CONSTRAINT conflit_resolution_fk
FOREIGN KEY (conflit_id)
REFERENCES conflit (conflit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE juridique ADD CONSTRAINT decision_appel_juridique_fk
FOREIGN KEY (decision_appel_id)
REFERENCES decision_appel (decision_appel_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE juridique ADD CONSTRAINT decision_cassation_sens_juridique_fk
FOREIGN KEY (decision_cassation_id)
REFERENCES decision_cassation (decision_cassation_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE article_document ADD CONSTRAINT document_article_document_fk
FOREIGN KEY (document_id)
REFERENCES document (document_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE entretien_document ADD CONSTRAINT document_entretien_document_fk
FOREIGN KEY (document_id)
REFERENCES document (document_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE juridique_document ADD CONSTRAINT document_juridique_document_fk
FOREIGN KEY (document_id)
REFERENCES document (document_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE perimetre ADD CONSTRAINT echelle_perimetre_fk
FOREIGN KEY (echelle_id)
REFERENCES echelle (echelle_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE entretien_conflit ADD CONSTRAINT entretien_entretien_conflit_fk
FOREIGN KEY (entretien_id)
REFERENCES entretien (entretien_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE entretien_document ADD CONSTRAINT entretien_entretien_document_fk
FOREIGN KEY (entretien_id)
REFERENCES entretien (entretien_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE entretien_intervention ADD CONSTRAINT entretien_entretien_intervention_fk
FOREIGN KEY (entretien_id)
REFERENCES entretien (entretien_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE entretien ADD CONSTRAINT expert_entretien_fk
FOREIGN KEY (expert_id)
REFERENCES expert (expert_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE action ADD CONSTRAINT intervention_action_fk
FOREIGN KEY (intervention_id)
REFERENCES intervention (intervention_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE article_intervention ADD CONSTRAINT intervention_article_intervention_fk
FOREIGN KEY (intervention_id)
REFERENCES intervention (intervention_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE entretien_intervention ADD CONSTRAINT intervention_entretien_intervention_fk
FOREIGN KEY (intervention_id)
REFERENCES intervention (intervention_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE intervention_juridique ADD CONSTRAINT intervention_intervention_juridique_fk
FOREIGN KEY (intervention_id)
REFERENCES intervention (intervention_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE revendication ADD CONSTRAINT intervention_revendication_fk
FOREIGN KEY (intervention_id)
REFERENCES intervention (intervention_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE solution_proposee ADD CONSTRAINT intervention_solution_proposee_fk
FOREIGN KEY (intervention_id)
REFERENCES intervention (intervention_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE article ADD CONSTRAINT journal_article_fk
FOREIGN KEY (journal_id)
REFERENCES journal (journal_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE juridique ADD CONSTRAINT juridiction_juridique_fk
FOREIGN KEY (juridiction_id)
REFERENCES juridiction (juridiction_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE intervention_juridique ADD CONSTRAINT juridique_intervention_juridique_fk
FOREIGN KEY (juridique_id)
REFERENCES juridique (juridique_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE juridique_conflit ADD CONSTRAINT juridique_juridique_conflit_fk
FOREIGN KEY (juridique_id)
REFERENCES juridique (juridique_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE juridique_document ADD CONSTRAINT juridique_juridique_document_fk
FOREIGN KEY (juridique_id)
REFERENCES juridique (juridique_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE juridique_sous_domaine ADD CONSTRAINT juridique_domaine_juridique_sous_domaine_fk
FOREIGN KEY (juridique_domaine_id)
REFERENCES juridique_domaine (juridique_domaine_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE juridique ADD CONSTRAINT juridique_sous_domaine_juridique_fk
FOREIGN KEY (juridique_sous_domaine_id)
REFERENCES juridique_sous_domaine (juridique_sous_domaine_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE perimetre_localisation ADD CONSTRAINT localisation_perimetre_localisation_fk
FOREIGN KEY (localisation_id)
REFERENCES localisation (localisation_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE acteur_mandat ADD CONSTRAINT mandat_type_acteur_mandat_fk
FOREIGN KEY (mandat_type_id)
REFERENCES mandat_type (mandat_type_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE document ADD CONSTRAINT mime_type_document_fk
FOREIGN KEY (mime_type_id)
REFERENCES mime_type (mime_type_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE juridique ADD CONSTRAINT nature_requete_juridique_fk
FOREIGN KEY (nature_requete_id)
REFERENCES nature_requete (nature_requete_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE juridique ADD CONSTRAINT nature_travaux_juridique_fk
FOREIGN KEY (nature_travaux_id)
REFERENCES nature_travaux (nature_travaux_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE objet_niv2 ADD CONSTRAINT objet_niv1_objet_niv2_fk
FOREIGN KEY (objet_niv1_id)
REFERENCES objet_niv1 (objet_niv1_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE perimetre ADD CONSTRAINT objet_niv2_perimetre_fk
FOREIGN KEY (objet_niv2_id)
REFERENCES objet_niv2 (objet_niv2_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE acteur ADD CONSTRAINT particulier_resident_type_acteur_fk
FOREIGN KEY (particulier_resident_type_id)
REFERENCES particulier_resident_type (particulier_resident_type_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE conflit ADD CONSTRAINT perimetre_conflit_fk
FOREIGN KEY (perimetre_id)
REFERENCES perimetre (perimetre_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE perimetre_localisation ADD CONSTRAINT perimetre_perimetre_localisation_fk
FOREIGN KEY (perimetre_id)
REFERENCES perimetre (perimetre_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE intervention_juridique ADD CONSTRAINT position_acteur_intervention_juridique_fk
FOREIGN KEY (position_acteur_id)
REFERENCES position_acteur (position_acteur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE intervention ADD CONSTRAINT position_usage_activite_intervention_fk
FOREIGN KEY (position_usage_activite_id)
REFERENCES position_usage_activite (position_usage_activite_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE usage_activite_niv1 ADD CONSTRAINT position_usage_activite_usage_activite_niv1_fk
FOREIGN KEY (position_usage_activite_id)
REFERENCES position_usage_activite (position_usage_activite_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE intervention_juridique ADD CONSTRAINT qualite_appel_intervention_juridique_fk
FOREIGN KEY (qualite_appel_id)
REFERENCES qualite_appel (qualite_appel_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE intervention_juridique ADD CONSTRAINT qualite_appel_intervention_juridique_fk1
FOREIGN KEY (qualite_pourvoi_id)
REFERENCES qualite_appel (qualite_appel_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE perimetre ADD CONSTRAINT recurrence_perimetre_fk
FOREIGN KEY (recurrence_id)
REFERENCES recurrence (recurrence_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE registre_argument_niv2 ADD CONSTRAINT registre_argument_niv1_registre_argument_niv2_fk
FOREIGN KEY (registre_argument_niv1_id)
REFERENCES registre_argument_niv1 (registre_argument_niv1_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE revendication ADD CONSTRAINT registre_argument_niv2_revendication_fk
FOREIGN KEY (registre_argument_niv2_id)
REFERENCES registre_argument_niv2 (registre_argument_niv2_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE resolution ADD CONSTRAINT resolution_acteur_resolution_fk
FOREIGN KEY (resolution_acteur_id)
REFERENCES resolution_acteur (resolution_acteur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE resolution ADD CONSTRAINT resolution_echelle_resolution_fk
FOREIGN KEY (resolution_echelle_id)
REFERENCES resolution_echelle (resolution_echelle_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE resolution_mode_niv2 ADD CONSTRAINT resolution_mode_niv1_resolution_mode_niv2_fk
FOREIGN KEY (resolution_mode_niv1_id)
REFERENCES resolution_mode_niv1 (resolution_mode_niv1_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE resolution ADD CONSTRAINT resolution_mode_niv2_resolution_fk
FOREIGN KEY (resolution_mode_niv2_id)
REFERENCES resolution_mode_niv2 (resolution_mode_niv2_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE resolution ADD CONSTRAINT resolution_nature_resolution_fk
FOREIGN KEY (resolution_nature_id)
REFERENCES resolution_nature (resolution_nature_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE revend_support_niv2 ADD CONSTRAINT revend_support_niv1_revend_support_niv2_fk
FOREIGN KEY (revend_support_niv1_id)
REFERENCES revend_support_niv1 (revend_support_niv1_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE revendication ADD CONSTRAINT revend_support_niv2_revendication_fk
FOREIGN KEY (revend_support_niv2_id)
REFERENCES revend_support_niv2 (revend_support_niv2_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE revendication_niv2 ADD CONSTRAINT revendication_niv1_revendication_niv2_fk
FOREIGN KEY (revendication_niv1_id)
REFERENCES revendication_niv1 (revendication_niv1_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE revendication ADD CONSTRAINT revendication_niv2_revendication_fk
FOREIGN KEY (revendication_niv2_id)
REFERENCES revendication_niv2 (revendication_niv2_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE intervention ADD CONSTRAINT role_intervention_fk
FOREIGN KEY (role_id)
REFERENCES role (role_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE resolution ADD CONSTRAINT solution_proposee_resolution_fk
FOREIGN KEY (solution_proposee_id)
REFERENCES solution_proposee (solution_proposee_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE acteur_structure ADD CONSTRAINT structure_type_acteur_structure_fk
FOREIGN KEY (structure_type_id)
REFERENCES structure_type (structure_type_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE juridique ADD CONSTRAINT type_ouvrage_perm_constr_juridique_fk
FOREIGN KEY (type_ouvrage_perm_constr_id)
REFERENCES type_ouvrage_perm_constr (type_ouvrage_perm_constr_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE objet_niv1 ADD CONSTRAINT type_perimetre_objet_niv1_fk
FOREIGN KEY (type_perimetre_id)
REFERENCES type_perimetre (type_perimetre_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE perimetre ADD CONSTRAINT type_perimetre_perimetre_fk
FOREIGN KEY (type_perimetre_id)
REFERENCES type_perimetre (type_perimetre_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE usage_activite_niv2 ADD CONSTRAINT usage_activite_niv1_usage_activite_niv2_fk
FOREIGN KEY (usage_activite_niv1_id)
REFERENCES usage_activite_niv1 (usage_activite_niv1_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE intervention ADD CONSTRAINT usage_activite_niv2_intervention_fk
FOREIGN KEY (usage_activite_niv2_id)
REFERENCES usage_activite_niv2 (usage_activite_niv2_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

INSERT INTO mime_type (content_type,extension) 
VALUES
  ('application/pdf','pdf'),
  ('application/zip','zip'),
  ('audio/mpeg','mp3'),
  ('image/jpeg','jpg'),
  ('image/jpeg','jpeg'),
  ('image/png','png'),
  ('image/tiff','tiff'),
  ('text/csv','csv'),
  ('application/vnd.oasis.opendocument.text','odt'),
  ('application/vnd.oasis.opendocument.spreadsheet','ods'),
  ('application/vnd.ms-excel','xls'),
  ('application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','xlsx'),
  ('application/msword','doc'),
  ('application/vnd.openxmlformats-officedocument.wordprocessingml.document','docx');

