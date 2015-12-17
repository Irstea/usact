-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.8.1
-- PostgreSQL version: 9.3
-- Project Site: pgmodeler.com.br
-- Model Author: ---

SET check_function_bodies = false;
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: usact | type: DATABASE --
-- -- DROP DATABASE IF EXISTS usact;
-- CREATE DATABASE usact
-- 	ENCODING = 'UTF8'
-- 	LC_COLLATE = 'fr_FR.UTF8'
-- 	LC_CTYPE = 'fr_FR.UTF8'
-- 	TABLESPACE = pg_default
-- 	OWNER = "eric.quinton"
-- ;
-- -- ddl-end --
-- 

-- object: calanque | type: SCHEMA --
-- DROP SCHEMA IF EXISTS calanque CASCADE;
CREATE SCHEMA calanque;
-- ddl-end --
ALTER SCHEMA calanque OWNER TO "eric.quinton";
-- ddl-end --

SET search_path TO pg_catalog,public,calanque;
-- ddl-end --

-- object: calanque.acte_contentieux_acte_contentieux_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.acte_contentieux_acte_contentieux_id_seq CASCADE;
CREATE SEQUENCE calanque.acte_contentieux_acte_contentieux_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.acte_contentieux_acte_contentieux_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.acte_contentieux | type: TABLE --
-- DROP TABLE IF EXISTS calanque.acte_contentieux CASCADE;
CREATE TABLE calanque.acte_contentieux(
	acte_contentieux_id integer NOT NULL DEFAULT nextval('calanque.acte_contentieux_acte_contentieux_id_seq'::regclass),
	acte_contentieux_libelle character varying NOT NULL,
	CONSTRAINT acte_contentieux_pk PRIMARY KEY (acte_contentieux_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.acte_contentieux IS 'Table des types d''actes contentieux';
-- ddl-end --
ALTER TABLE calanque.acte_contentieux OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.acteur_acteur_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.acteur_acteur_id_seq CASCADE;
CREATE SEQUENCE calanque.acteur_acteur_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.acteur_acteur_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.acteur | type: TABLE --
-- DROP TABLE IF EXISTS calanque.acteur CASCADE;
CREATE TABLE calanque.acteur(
	acteur_id integer NOT NULL DEFAULT nextval('calanque.acteur_acteur_id_seq'::regclass),
	acteur_niv3_id integer NOT NULL,
	acteur_physique_nom character varying,
	commune_physique character varying,
	cp_physique character varying,
	acteur_moral_nom character varying,
	commune_morale character varying,
	cp_morale character varying,
	acteur_statut character varying,
	acteur_statut_detail character varying,
	acteur_date_saisie timestamp,
	acteur_login character varying,
	particulier_resident_type_id integer,
	CONSTRAINT acteur_pk PRIMARY KEY (acteur_id)

);
-- ddl-end --
COMMENT ON COLUMN calanque.acteur.commune_physique IS 'Commune de résidence de la personne physique';
-- ddl-end --
COMMENT ON COLUMN calanque.acteur.cp_physique IS 'Code postal associé à la commune de la personne physique';
-- ddl-end --
COMMENT ON COLUMN calanque.acteur.commune_morale IS 'Commune de siège de la personne morale';
-- ddl-end --
COMMENT ON COLUMN calanque.acteur.cp_morale IS 'code postal associé à la commune de la personne morale';
-- ddl-end --
COMMENT ON COLUMN calanque.acteur.acteur_statut IS 'Statut de l''acteur';
-- ddl-end --
COMMENT ON COLUMN calanque.acteur.acteur_statut_detail IS 'Détail du statut de l''acteur';
-- ddl-end --
COMMENT ON COLUMN calanque.acteur.acteur_date_saisie IS 'Date de création de l''acteur';
-- ddl-end --
ALTER TABLE calanque.acteur OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.acteur_mandat_acteur_mandat_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.acteur_mandat_acteur_mandat_id_seq CASCADE;
CREATE SEQUENCE calanque.acteur_mandat_acteur_mandat_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.acteur_mandat_acteur_mandat_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.acteur_mandat | type: TABLE --
-- DROP TABLE IF EXISTS calanque.acteur_mandat CASCADE;
CREATE TABLE calanque.acteur_mandat(
	acteur_mandat_id integer NOT NULL DEFAULT nextval('calanque.acteur_mandat_acteur_mandat_id_seq'::regclass),
	acteur_id integer NOT NULL,
	mandat_type_id integer NOT NULL,
	mandat_detail character varying,
	CONSTRAINT acteur_mandat_pk PRIMARY KEY (acteur_mandat_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.acteur_mandat IS 'Mandats détenus par un acteur';
-- ddl-end --
ALTER TABLE calanque.acteur_mandat OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.acteur_niv1_acteur_niv1_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.acteur_niv1_acteur_niv1_id_seq CASCADE;
CREATE SEQUENCE calanque.acteur_niv1_acteur_niv1_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.acteur_niv1_acteur_niv1_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.acteur_niv1 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.acteur_niv1 CASCADE;
CREATE TABLE calanque.acteur_niv1(
	acteur_niv1_id integer NOT NULL DEFAULT nextval('calanque.acteur_niv1_acteur_niv1_id_seq'::regclass),
	acteur_niv1_libelle character varying NOT NULL,
	CONSTRAINT acteur_niv1_pk PRIMARY KEY (acteur_niv1_id)

);
-- ddl-end --
ALTER TABLE calanque.acteur_niv1 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.acteur_niv2_acteur_niv2_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.acteur_niv2_acteur_niv2_id_seq CASCADE;
CREATE SEQUENCE calanque.acteur_niv2_acteur_niv2_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.acteur_niv2_acteur_niv2_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.acteur_niv2 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.acteur_niv2 CASCADE;
CREATE TABLE calanque.acteur_niv2(
	acteur_niv2_id integer NOT NULL DEFAULT nextval('calanque.acteur_niv2_acteur_niv2_id_seq'::regclass),
	acteur_niv1_id integer NOT NULL,
	acteur_niv2_libelle character varying NOT NULL,
	CONSTRAINT acteur_niv2_pk PRIMARY KEY (acteur_niv2_id)

);
-- ddl-end --
ALTER TABLE calanque.acteur_niv2 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.acteur_niv3_acteur_niv3_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.acteur_niv3_acteur_niv3_id_seq CASCADE;
CREATE SEQUENCE calanque.acteur_niv3_acteur_niv3_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.acteur_niv3_acteur_niv3_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.acteur_niv3 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.acteur_niv3 CASCADE;
CREATE TABLE calanque.acteur_niv3(
	acteur_niv3_id integer NOT NULL DEFAULT nextval('calanque.acteur_niv3_acteur_niv3_id_seq'::regclass),
	acteur_niv2_id integer NOT NULL,
	acteur_niv3_libelle character varying,
	CONSTRAINT acteur_niv3_pk PRIMARY KEY (acteur_niv3_id)

);
-- ddl-end --
ALTER TABLE calanque.acteur_niv3 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.acteur_structure_acteur_structure_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.acteur_structure_acteur_structure_id_seq CASCADE;
CREATE SEQUENCE calanque.acteur_structure_acteur_structure_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.acteur_structure_acteur_structure_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.acteur_structure | type: TABLE --
-- DROP TABLE IF EXISTS calanque.acteur_structure CASCADE;
CREATE TABLE calanque.acteur_structure(
	acteur_structure_id integer NOT NULL DEFAULT nextval('calanque.acteur_structure_acteur_structure_id_seq'::regclass),
	acteur_id integer NOT NULL,
	structure_type_id integer NOT NULL,
	structure_statut character varying,
	structure_statut_detail character varying,
	CONSTRAINT acteur_structure_pk PRIMARY KEY (acteur_structure_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.acteur_structure IS 'Table des relations entre un acteur et les structures';
-- ddl-end --
ALTER TABLE calanque.acteur_structure OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.action_action_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.action_action_id_seq CASCADE;
CREATE SEQUENCE calanque.action_action_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.action_action_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.action | type: TABLE --
-- DROP TABLE IF EXISTS calanque.action CASCADE;
CREATE TABLE calanque.action(
	action_id integer NOT NULL DEFAULT nextval('calanque.action_action_id_seq'::regclass),
	intervention_id integer NOT NULL,
	action_type_id integer,
	action_mode_id integer,
	action_echelle_id integer,
	action_date timestamp,
	action_date_complement character varying,
	action_detail character varying,
	CONSTRAINT action_pk PRIMARY KEY (action_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.action IS 'Table des actions entreprises lors des interventions';
-- ddl-end --
COMMENT ON COLUMN calanque.action.action_date IS 'Date de l''action';
-- ddl-end --
COMMENT ON COLUMN calanque.action.action_date_complement IS 'Complément à la date d''action, si intervalle ou non connue avec précision';
-- ddl-end --
COMMENT ON COLUMN calanque.action.action_detail IS 'Détail de l''action menée';
-- ddl-end --
ALTER TABLE calanque.action OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.action_echelle_action_echelle_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.action_echelle_action_echelle_id_seq CASCADE;
CREATE SEQUENCE calanque.action_echelle_action_echelle_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.action_echelle_action_echelle_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.action_echelle | type: TABLE --
-- DROP TABLE IF EXISTS calanque.action_echelle CASCADE;
CREATE TABLE calanque.action_echelle(
	action_echelle_id integer NOT NULL DEFAULT nextval('calanque.action_echelle_action_echelle_id_seq'::regclass),
	action_echelle_libelle character varying NOT NULL,
	CONSTRAINT action_echelle_pk PRIMARY KEY (action_echelle_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.action_echelle IS 'Table des échelles des actions';
-- ddl-end --
ALTER TABLE calanque.action_echelle OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.action_mode_action_mode_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.action_mode_action_mode_id_seq CASCADE;
CREATE SEQUENCE calanque.action_mode_action_mode_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.action_mode_action_mode_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.action_mode | type: TABLE --
-- DROP TABLE IF EXISTS calanque.action_mode CASCADE;
CREATE TABLE calanque.action_mode(
	action_mode_id integer NOT NULL DEFAULT nextval('calanque.action_mode_action_mode_id_seq'::regclass),
	action_mode_libelle character varying NOT NULL,
	CONSTRAINT action_mode_pk PRIMARY KEY (action_mode_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.action_mode IS 'Table des modes d''action';
-- ddl-end --
ALTER TABLE calanque.action_mode OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.action_type_action_type_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.action_type_action_type_id_seq CASCADE;
CREATE SEQUENCE calanque.action_type_action_type_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.action_type_action_type_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.action_type | type: TABLE --
-- DROP TABLE IF EXISTS calanque.action_type CASCADE;
CREATE TABLE calanque.action_type(
	action_type_id integer NOT NULL DEFAULT nextval('calanque.action_type_action_type_id_seq'::regclass),
	action_type_libelle character varying NOT NULL,
	CONSTRAINT action_type_pk PRIMARY KEY (action_type_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.action_type IS 'Table des types de modes d''action';
-- ddl-end --
ALTER TABLE calanque.action_type OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.article_article_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.article_article_id_seq CASCADE;
CREATE SEQUENCE calanque.article_article_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.article_article_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.article | type: TABLE --
-- DROP TABLE IF EXISTS calanque.article CASCADE;
CREATE TABLE calanque.article(
	article_id integer NOT NULL DEFAULT nextval('calanque.article_article_id_seq'::regclass),
	journal_id integer NOT NULL,
	date_parution timestamp NOT NULL,
	titre character varying NOT NULL,
	auteur character varying NOT NULL,
	edition character varying,
	rubrique character varying,
	page smallint,
	entete character varying,
	piecejointe character varying,
	article_login character varying,
	article_date_saisie timestamp NOT NULL,
	CONSTRAINT article_pk PRIMARY KEY (article_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.article IS 'Table des articles';
-- ddl-end --
COMMENT ON COLUMN calanque.article.date_parution IS 'Date de parution de l''article';
-- ddl-end --
COMMENT ON COLUMN calanque.article.titre IS 'Titre de l''article';
-- ddl-end --
COMMENT ON COLUMN calanque.article.auteur IS 'Auteur de l''article';
-- ddl-end --
COMMENT ON COLUMN calanque.article.edition IS 'Édition du journal';
-- ddl-end --
COMMENT ON COLUMN calanque.article.rubrique IS 'Rubrique de l''article';
-- ddl-end --
COMMENT ON COLUMN calanque.article.page IS 'Page de l''article dans le journal';
-- ddl-end --
COMMENT ON COLUMN calanque.article.entete IS 'Entête de l''article';
-- ddl-end --
COMMENT ON COLUMN calanque.article.piecejointe IS 'Nom de la pièce jointe';
-- ddl-end --
COMMENT ON COLUMN calanque.article.article_login IS 'Login de la personne ayant enregistré l''article';
-- ddl-end --
COMMENT ON COLUMN calanque.article.article_date_saisie IS 'Date de saisie de l''article';
-- ddl-end --
ALTER TABLE calanque.article OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.article_conflit | type: TABLE --
-- DROP TABLE IF EXISTS calanque.article_conflit CASCADE;
CREATE TABLE calanque.article_conflit(
	article_id integer NOT NULL,
	conflit_id integer NOT NULL,
	action_type_id integer,
	CONSTRAINT article_conflit_pk PRIMARY KEY (article_id,conflit_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.article_conflit IS 'Table des conflits abordés dans un article';
-- ddl-end --
ALTER TABLE calanque.article_conflit OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.article_document | type: TABLE --
-- DROP TABLE IF EXISTS calanque.article_document CASCADE;
CREATE TABLE calanque.article_document(
	article_id integer NOT NULL,
	document_id integer NOT NULL,
	CONSTRAINT article_document_pk PRIMARY KEY (article_id,document_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.article_document IS 'Table de rattachement d''un document a un article';
-- ddl-end --
ALTER TABLE calanque.article_document OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.article_intervention | type: TABLE --
-- DROP TABLE IF EXISTS calanque.article_intervention CASCADE;
CREATE TABLE calanque.article_intervention(
	article_id integer NOT NULL,
	intervention_id integer NOT NULL,
	CONSTRAINT article_intervention_pk PRIMARY KEY (article_id,intervention_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.article_intervention IS 'Table des articles cités lors d''une intervention';
-- ddl-end --
ALTER TABLE calanque.article_intervention OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.bien_support_niv1_bien_support_niv1_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.bien_support_niv1_bien_support_niv1_id_seq CASCADE;
CREATE SEQUENCE calanque.bien_support_niv1_bien_support_niv1_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.bien_support_niv1_bien_support_niv1_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.bien_support_niv1 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.bien_support_niv1 CASCADE;
CREATE TABLE calanque.bien_support_niv1(
	bien_support_niv1_id integer NOT NULL DEFAULT nextval('calanque.bien_support_niv1_bien_support_niv1_id_seq'::regclass),
	bien_support_niv1_libelle character varying NOT NULL,
	CONSTRAINT bien_support_niv1_pk PRIMARY KEY (bien_support_niv1_id)

);
-- ddl-end --
COMMENT ON COLUMN calanque.bien_support_niv1.bien_support_niv1_libelle IS 'Libelle du type de bien étant à l''origine du conflit';
-- ddl-end --
ALTER TABLE calanque.bien_support_niv1 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.bien_support_niv2_bien_support_niv2_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.bien_support_niv2_bien_support_niv2_id_seq CASCADE;
CREATE SEQUENCE calanque.bien_support_niv2_bien_support_niv2_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.bien_support_niv2_bien_support_niv2_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.bien_support_niv2 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.bien_support_niv2 CASCADE;
CREATE TABLE calanque.bien_support_niv2(
	bien_support_niv2_id integer NOT NULL DEFAULT nextval('calanque.bien_support_niv2_bien_support_niv2_id_seq'::regclass),
	bien_support_niv1_id integer NOT NULL,
	bien_support_niv2_libelle character varying NOT NULL,
	CONSTRAINT bien_support_niv2_pk PRIMARY KEY (bien_support_niv2_id)

);
-- ddl-end --
COMMENT ON COLUMN calanque.bien_support_niv2.bien_support_niv2_libelle IS 'Libelle du type de bien support touché par le conflit';
-- ddl-end --
ALTER TABLE calanque.bien_support_niv2 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.commune | type: TABLE --
-- DROP TABLE IF EXISTS calanque.commune CASCADE;
CREATE TABLE calanque.commune(
	insee integer NOT NULL,
	commune_nom character varying NOT NULL,
	departement character varying NOT NULL,
	CONSTRAINT commune_pk PRIMARY KEY (insee)

);
-- ddl-end --
COMMENT ON TABLE calanque.commune IS 'Table des communes';
-- ddl-end --
COMMENT ON COLUMN calanque.commune.insee IS 'N° Insee de la commune';
-- ddl-end --
COMMENT ON COLUMN calanque.commune.commune_nom IS 'Nom de la commune';
-- ddl-end --
COMMENT ON COLUMN calanque.commune.departement IS 'Nom du département';
-- ddl-end --
ALTER TABLE calanque.commune OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.conflit_conflit_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.conflit_conflit_id_seq CASCADE;
CREATE SEQUENCE calanque.conflit_conflit_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.conflit_conflit_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.conflit | type: TABLE --
-- DROP TABLE IF EXISTS calanque.conflit CASCADE;
CREATE TABLE calanque.conflit(
	conflit_id integer NOT NULL DEFAULT nextval('calanque.conflit_conflit_id_seq'::regclass),
	perimetre_id integer NOT NULL,
	conflit_date_debut timestamp,
	conflit_date_debut_txt character varying,
	conflit_date_fin timestamp,
	conflit_date_fin_txt character varying,
	conflit_date_saisie timestamp,
	conflit_detail character varying,
	conflit_login character varying,
	CONSTRAINT conflit_pk PRIMARY KEY (conflit_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.conflit IS 'Table de description d''un conflit';
-- ddl-end --
COMMENT ON COLUMN calanque.conflit.conflit_date_debut IS 'Date de début du conflit';
-- ddl-end --
COMMENT ON COLUMN calanque.conflit.conflit_date_debut_txt IS 'Date de début du conflit, sous forme de texte';
-- ddl-end --
COMMENT ON COLUMN calanque.conflit.conflit_date_fin IS 'Date de fin du conflit';
-- ddl-end --
COMMENT ON COLUMN calanque.conflit.conflit_date_fin_txt IS 'Date de fin du conflit, au format texte';
-- ddl-end --
COMMENT ON COLUMN calanque.conflit.conflit_date_saisie IS 'Date où le conflit a été saisie';
-- ddl-end --
COMMENT ON COLUMN calanque.conflit.conflit_detail IS 'Informations complémentaires sur le conflit';
-- ddl-end --
ALTER TABLE calanque.conflit OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.decision_appel_decision_appel_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.decision_appel_decision_appel_id_seq CASCADE;
CREATE SEQUENCE calanque.decision_appel_decision_appel_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.decision_appel_decision_appel_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.decision_appel | type: TABLE --
-- DROP TABLE IF EXISTS calanque.decision_appel CASCADE;
CREATE TABLE calanque.decision_appel(
	decision_appel_id integer NOT NULL DEFAULT nextval('calanque.decision_appel_decision_appel_id_seq'::regclass),
	decision_appel_libelle character varying NOT NULL,
	CONSTRAINT decision_appel_pk PRIMARY KEY (decision_appel_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.decision_appel IS 'Table des types de décision en appel';
-- ddl-end --
ALTER TABLE calanque.decision_appel OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.decision_cassation_decision_cassation_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.decision_cassation_decision_cassation_id_seq CASCADE;
CREATE SEQUENCE calanque.decision_cassation_decision_cassation_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.decision_cassation_decision_cassation_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.decision_cassation | type: TABLE --
-- DROP TABLE IF EXISTS calanque.decision_cassation CASCADE;
CREATE TABLE calanque.decision_cassation(
	decision_cassation_id integer NOT NULL DEFAULT nextval('calanque.decision_cassation_decision_cassation_id_seq'::regclass),
	decision_cassation_libelle character varying NOT NULL,
	CONSTRAINT decision_cassation_pk PRIMARY KEY (decision_cassation_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.decision_cassation IS 'Table des sens de décision de cassation';
-- ddl-end --
ALTER TABLE calanque.decision_cassation OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.document_document_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.document_document_id_seq CASCADE;
CREATE SEQUENCE calanque.document_document_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.document_document_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.document | type: TABLE --
-- DROP TABLE IF EXISTS calanque.document CASCADE;
CREATE TABLE calanque.document(
	document_id integer NOT NULL DEFAULT nextval('calanque.document_document_id_seq'::regclass),
	mime_type_id integer NOT NULL,
	document_date_import timestamp NOT NULL,
	document_nom character varying NOT NULL,
	document_description character varying,
	data bytea,
	size integer,
	thumbnail bytea,
	CONSTRAINT document_pk PRIMARY KEY (document_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.document IS 'Table des documents';
-- ddl-end --
COMMENT ON COLUMN calanque.document.document_nom IS 'Nom du document tel qu''il a été stocké';
-- ddl-end --
COMMENT ON COLUMN calanque.document.document_description IS 'Description du document';
-- ddl-end --
COMMENT ON COLUMN calanque.document.data IS 'Contenu du document';
-- ddl-end --
COMMENT ON COLUMN calanque.document.size IS 'Taille du document';
-- ddl-end --
COMMENT ON COLUMN calanque.document.thumbnail IS 'Vignette';
-- ddl-end --
ALTER TABLE calanque.document OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.echelle_echelle_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.echelle_echelle_id_seq CASCADE;
CREATE SEQUENCE calanque.echelle_echelle_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.echelle_echelle_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.echelle | type: TABLE --
-- DROP TABLE IF EXISTS calanque.echelle CASCADE;
CREATE TABLE calanque.echelle(
	echelle_id integer NOT NULL DEFAULT nextval('calanque.echelle_echelle_id_seq'::regclass),
	echelle_libelle character varying NOT NULL,
	CONSTRAINT echelle_pk PRIMARY KEY (echelle_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.echelle IS 'Echelle du perimetre';
-- ddl-end --
COMMENT ON COLUMN calanque.echelle.echelle_libelle IS 'Indique le type d''échelle';
-- ddl-end --
ALTER TABLE calanque.echelle OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.entretien_entretien_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.entretien_entretien_id_seq CASCADE;
CREATE SEQUENCE calanque.entretien_entretien_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.entretien_entretien_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.entretien | type: TABLE --
-- DROP TABLE IF EXISTS calanque.entretien CASCADE;
CREATE TABLE calanque.entretien(
	entretien_id integer NOT NULL DEFAULT nextval('calanque.entretien_entretien_id_seq'::regclass),
	expert_id integer NOT NULL,
	entretien_date timestamp NOT NULL,
	institution character varying NOT NULL,
	statut character varying NOT NULL,
	localisation character varying NOT NULL,
	binome character varying NOT NULL,
	entretien_login character varying,
	entretien_date_saisie timestamp,
	piece_jointe character varying,
	CONSTRAINT entretien_pk PRIMARY KEY (entretien_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.entretien IS 'Table des entretiens menés';
-- ddl-end --
COMMENT ON COLUMN calanque.entretien.entretien_date IS 'Date de l''entretien';
-- ddl-end --
COMMENT ON COLUMN calanque.entretien.institution IS 'Institution représentée';
-- ddl-end --
COMMENT ON COLUMN calanque.entretien.statut IS 'Statut de l''interviewé';
-- ddl-end --
COMMENT ON COLUMN calanque.entretien.localisation IS 'Lieu de l''entretien';
-- ddl-end --
COMMENT ON COLUMN calanque.entretien.binome IS 'Binome ayant mené l''entretien';
-- ddl-end --
COMMENT ON COLUMN calanque.entretien.entretien_login IS 'Login de la personne ayant saisi l''entretien';
-- ddl-end --
COMMENT ON COLUMN calanque.entretien.entretien_date_saisie IS 'Date de création de l''entretien dans la base';
-- ddl-end --
COMMENT ON COLUMN calanque.entretien.piece_jointe IS 'Nom de la pièce jointe fournie';
-- ddl-end --
ALTER TABLE calanque.entretien OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.entretien_conflit | type: TABLE --
-- DROP TABLE IF EXISTS calanque.entretien_conflit CASCADE;
CREATE TABLE calanque.entretien_conflit(
	entretien_id integer NOT NULL,
	conflit_id integer NOT NULL,
	CONSTRAINT entretien_conflit_pk PRIMARY KEY (entretien_id,conflit_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.entretien_conflit IS 'Table des conflits relatés par les entretiens';
-- ddl-end --
ALTER TABLE calanque.entretien_conflit OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.entretien_document | type: TABLE --
-- DROP TABLE IF EXISTS calanque.entretien_document CASCADE;
CREATE TABLE calanque.entretien_document(
	entretien_id integer NOT NULL,
	document_id integer NOT NULL,
	CONSTRAINT entretien_document_pk PRIMARY KEY (entretien_id,document_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.entretien_document IS 'Table de rattachement d''un document à un entretien';
-- ddl-end --
ALTER TABLE calanque.entretien_document OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.entretien_intervention | type: TABLE --
-- DROP TABLE IF EXISTS calanque.entretien_intervention CASCADE;
CREATE TABLE calanque.entretien_intervention(
	entretien_id integer NOT NULL,
	intervention_id integer NOT NULL,
	CONSTRAINT entretien_intervention_pk PRIMARY KEY (entretien_id,intervention_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.entretien_intervention IS 'Table des interventions évoquées lors des entretiens';
-- ddl-end --
ALTER TABLE calanque.entretien_intervention OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.expert_expert_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.expert_expert_id_seq CASCADE;
CREATE SEQUENCE calanque.expert_expert_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.expert_expert_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.expert | type: TABLE --
-- DROP TABLE IF EXISTS calanque.expert CASCADE;
CREATE TABLE calanque.expert(
	expert_id integer NOT NULL DEFAULT nextval('calanque.expert_expert_id_seq'::regclass),
	acteur_id integer,
	expert_nom character varying NOT NULL,
	expert_prenom character varying NOT NULL,
	sexe character varying NOT NULL,
	commune_residence character varying,
	lien_territoire character varying NOT NULL,
	activite_assoc character varying,
	activite_prof character varying NOT NULL,
	annee_naissance integer,
	CONSTRAINT expert_pk PRIMARY KEY (expert_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.expert IS 'Table des experts entendus en entretien';
-- ddl-end --
COMMENT ON COLUMN calanque.expert.expert_nom IS 'Nom de l''expert';
-- ddl-end --
COMMENT ON COLUMN calanque.expert.expert_prenom IS 'Prénom de l''expert';
-- ddl-end --
COMMENT ON COLUMN calanque.expert.sexe IS 'Sexe (H/F)';
-- ddl-end --
COMMENT ON COLUMN calanque.expert.commune_residence IS 'Commune de résidence, précision pour les experts';
-- ddl-end --
COMMENT ON COLUMN calanque.expert.lien_territoire IS 'Lien avec le territoire (expert)';
-- ddl-end --
COMMENT ON COLUMN calanque.expert.activite_assoc IS 'Activité associative (expert)';
-- ddl-end --
COMMENT ON COLUMN calanque.expert.activite_prof IS 'Activité professionnelle (expert)';
-- ddl-end --
COMMENT ON COLUMN calanque.expert.annee_naissance IS 'Année de naissance de l''expert';
-- ddl-end --
ALTER TABLE calanque.expert OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.intervention_intervention_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.intervention_intervention_id_seq CASCADE;
CREATE SEQUENCE calanque.intervention_intervention_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.intervention_intervention_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.intervention | type: TABLE --
-- DROP TABLE IF EXISTS calanque.intervention CASCADE;
CREATE TABLE calanque.intervention(
	intervention_id integer NOT NULL DEFAULT nextval('calanque.intervention_intervention_id_seq'::regclass),
	conflit_id integer NOT NULL,
	acteur_id integer NOT NULL,
	role_id integer,
	usage_activite_niv2_id integer,
	position_usage_activite_id integer NOT NULL,
	intervention_date_entree timestamp,
	intervention_date_entree_txt character varying,
	intervention_date_sortie timestamp,
	intervention_date_sortie_txt character varying,
	intervention_detail_usage character varying,
	CONSTRAINT intervention_pk PRIMARY KEY (intervention_id)

);
-- ddl-end --
COMMENT ON COLUMN calanque.intervention.intervention_date_entree_txt IS 'Date d''entrée dans l''intervention, au format texte';
-- ddl-end --
COMMENT ON COLUMN calanque.intervention.intervention_date_sortie_txt IS 'Date de sortie de l''intervention, au format texte';
-- ddl-end --
ALTER TABLE calanque.intervention OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.intervention_juridique_intervention_juridique_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.intervention_juridique_intervention_juridique_id_seq CASCADE;
CREATE SEQUENCE calanque.intervention_juridique_intervention_juridique_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.intervention_juridique_intervention_juridique_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.intervention_juridique | type: TABLE --
-- DROP TABLE IF EXISTS calanque.intervention_juridique CASCADE;
CREATE TABLE calanque.intervention_juridique(
	intervention_juridique_id integer NOT NULL DEFAULT nextval('calanque.intervention_juridique_intervention_juridique_id_seq'::regclass),
	intervention_id integer NOT NULL,
	juridique_id integer NOT NULL,
	position_acteur_id integer NOT NULL,
	qualite_appel_id integer,
	qualite_pourvoi_id integer,
	petitionnaire smallint,
	CONSTRAINT intervention_juridique_pk PRIMARY KEY (intervention_juridique_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.intervention_juridique IS 'Table des implications juridiques des interventions';
-- ddl-end --
COMMENT ON COLUMN calanque.intervention_juridique.petitionnaire IS '0 : non, 1 : oui';
-- ddl-end --
ALTER TABLE calanque.intervention_juridique OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.journal_journal_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.journal_journal_id_seq CASCADE;
CREATE SEQUENCE calanque.journal_journal_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.journal_journal_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.journal | type: TABLE --
-- DROP TABLE IF EXISTS calanque.journal CASCADE;
CREATE TABLE calanque.journal(
	journal_id integer NOT NULL DEFAULT nextval('calanque.journal_journal_id_seq'::regclass),
	journal_libelle character varying NOT NULL,
	CONSTRAINT journal_pk PRIMARY KEY (journal_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.journal IS 'Liste des journaux';
-- ddl-end --
ALTER TABLE calanque.journal OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.juridiction_juridiction_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.juridiction_juridiction_id_seq CASCADE;
CREATE SEQUENCE calanque.juridiction_juridiction_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.juridiction_juridiction_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.juridiction | type: TABLE --
-- DROP TABLE IF EXISTS calanque.juridiction CASCADE;
CREATE TABLE calanque.juridiction(
	juridiction_id integer NOT NULL DEFAULT nextval('calanque.juridiction_juridiction_id_seq'::regclass),
	juridiction_libelle character varying NOT NULL,
	CONSTRAINT juridiction_pk PRIMARY KEY (juridiction_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.juridiction IS 'Table des juridictions';
-- ddl-end --
ALTER TABLE calanque.juridiction OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.juridique_juridique_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.juridique_juridique_id_seq CASCADE;
CREATE SEQUENCE calanque.juridique_juridique_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.juridique_juridique_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.juridique | type: TABLE --
-- DROP TABLE IF EXISTS calanque.juridique CASCADE;
CREATE TABLE calanque.juridique(
	juridique_id integer NOT NULL DEFAULT nextval('calanque.juridique_juridique_id_seq'::regclass),
	juridiction_id integer NOT NULL,
	arret_num character varying NOT NULL,
	arret_date timestamp NOT NULL,
	acte_date timestamp NOT NULL,
	juridique_sous_domaine_id integer,
	nature_requete_id integer NOT NULL,
	type_ouvrage_perm_constr_id integer,
	nature_travaux_id integer,
	decision_cassation_id integer,
	decision_appel_id integer,
	acte_contentieux_id integer,
	juridique_libelle character varying,
	objet_precision character varying,
	article1 character varying,
	article2 character varying,
	article3 character varying,
	article4 character varying,
	article5 character varying,
	jugement_date_degre1 timestamp,
	jugement_date_degre2 timestamp,
	juridique_login character varying NOT NULL,
	juridique_date_saisie timestamp NOT NULL,
	CONSTRAINT juridique_pk PRIMARY KEY (juridique_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.juridique IS 'Table des données juridiques';
-- ddl-end --
COMMENT ON COLUMN calanque.juridique.arret_num IS 'Numéro de l''arrêt';
-- ddl-end --
COMMENT ON COLUMN calanque.juridique.arret_date IS 'Date de l''arrêt';
-- ddl-end --
COMMENT ON COLUMN calanque.juridique.acte_date IS 'Date de l''acte juridique';
-- ddl-end --
COMMENT ON COLUMN calanque.juridique.juridique_libelle IS 'Libellé de la décision juridique';
-- ddl-end --
COMMENT ON COLUMN calanque.juridique.objet_precision IS 'Précisions concernant l''objet';
-- ddl-end --
COMMENT ON COLUMN calanque.juridique.jugement_date_degre1 IS 'Date du jugement de degré 1';
-- ddl-end --
COMMENT ON COLUMN calanque.juridique.jugement_date_degre2 IS 'Date de jugement de degré 2';
-- ddl-end --
COMMENT ON COLUMN calanque.juridique.juridique_login IS 'Login de la personne ayant saisi la fiche';
-- ddl-end --
COMMENT ON COLUMN calanque.juridique.juridique_date_saisie IS 'Date de saisie de la fiche';
-- ddl-end --
ALTER TABLE calanque.juridique OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.juridique_conflit | type: TABLE --
-- DROP TABLE IF EXISTS calanque.juridique_conflit CASCADE;
CREATE TABLE calanque.juridique_conflit(
	juridique_id integer NOT NULL,
	conflit_id integer NOT NULL,
	CONSTRAINT juridique_conflit_pk PRIMARY KEY (juridique_id,conflit_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.juridique_conflit IS 'Table des conflits traités par les décisions juridiques';
-- ddl-end --
ALTER TABLE calanque.juridique_conflit OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.juridique_document | type: TABLE --
-- DROP TABLE IF EXISTS calanque.juridique_document CASCADE;
CREATE TABLE calanque.juridique_document(
	juridique_id integer NOT NULL,
	document_id integer NOT NULL,
	CONSTRAINT juridique_document_pk PRIMARY KEY (juridique_id,document_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.juridique_document IS 'Table de rattachement d''un document à une décision juridique';
-- ddl-end --
ALTER TABLE calanque.juridique_document OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.juridique_domaine_juridique_domaine_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.juridique_domaine_juridique_domaine_id_seq CASCADE;
CREATE SEQUENCE calanque.juridique_domaine_juridique_domaine_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.juridique_domaine_juridique_domaine_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.juridique_domaine | type: TABLE --
-- DROP TABLE IF EXISTS calanque.juridique_domaine CASCADE;
CREATE TABLE calanque.juridique_domaine(
	juridique_domaine_id integer NOT NULL DEFAULT nextval('calanque.juridique_domaine_juridique_domaine_id_seq'::regclass),
	juridique_domaine_libelle character varying NOT NULL,
	CONSTRAINT juridique_domaine_pk PRIMARY KEY (juridique_domaine_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.juridique_domaine IS 'Table des domaines des décisions juridiques';
-- ddl-end --
ALTER TABLE calanque.juridique_domaine OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.juridique_sous_domaine_juridique_sous_domaine_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.juridique_sous_domaine_juridique_sous_domaine_id_seq CASCADE;
CREATE SEQUENCE calanque.juridique_sous_domaine_juridique_sous_domaine_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.juridique_sous_domaine_juridique_sous_domaine_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.juridique_sous_domaine | type: TABLE --
-- DROP TABLE IF EXISTS calanque.juridique_sous_domaine CASCADE;
CREATE TABLE calanque.juridique_sous_domaine(
	juridique_sous_domaine_id integer NOT NULL DEFAULT nextval('calanque.juridique_sous_domaine_juridique_sous_domaine_id_seq'::regclass),
	juridique_domaine_id integer NOT NULL,
	juridique_sous_domaine_libelle character varying NOT NULL,
	CONSTRAINT juridique_sous_domaine_pk PRIMARY KEY (juridique_sous_domaine_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.juridique_sous_domaine IS 'Table des sous-domaines des décisions juridiques';
-- ddl-end --
ALTER TABLE calanque.juridique_sous_domaine OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.localisation_localisation_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.localisation_localisation_id_seq CASCADE;
CREATE SEQUENCE calanque.localisation_localisation_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.localisation_localisation_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.localisation | type: TABLE --
-- DROP TABLE IF EXISTS calanque.localisation CASCADE;
CREATE TABLE calanque.localisation(
	localisation_id integer NOT NULL DEFAULT nextval('calanque.localisation_localisation_id_seq'::regclass),
	insee integer NOT NULL,
	precision_adresse character varying,
	CONSTRAINT localisation_pk PRIMARY KEY (localisation_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.localisation IS 'Table des localisations des périmètres des conflits';
-- ddl-end --
COMMENT ON COLUMN calanque.localisation.insee IS 'N° Insee de la commune';
-- ddl-end --
COMMENT ON COLUMN calanque.localisation.precision_adresse IS 'Complément pour préciser la localisation';
-- ddl-end --
ALTER TABLE calanque.localisation OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.mandat_type_mandat_type_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.mandat_type_mandat_type_id_seq CASCADE;
CREATE SEQUENCE calanque.mandat_type_mandat_type_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.mandat_type_mandat_type_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.mandat_type | type: TABLE --
-- DROP TABLE IF EXISTS calanque.mandat_type CASCADE;
CREATE TABLE calanque.mandat_type(
	mandat_type_id integer NOT NULL DEFAULT nextval('calanque.mandat_type_mandat_type_id_seq'::regclass),
	mandat_type_libelle character varying NOT NULL,
	CONSTRAINT mandat_type_pk PRIMARY KEY (mandat_type_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.mandat_type IS 'Table des types de mandats';
-- ddl-end --
ALTER TABLE calanque.mandat_type OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.mime_type_mime_type_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.mime_type_mime_type_id_seq CASCADE;
CREATE SEQUENCE calanque.mime_type_mime_type_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.mime_type_mime_type_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.mime_type | type: TABLE --
-- DROP TABLE IF EXISTS calanque.mime_type CASCADE;
CREATE TABLE calanque.mime_type(
	mime_type_id integer NOT NULL DEFAULT nextval('calanque.mime_type_mime_type_id_seq'::regclass),
	content_type character varying NOT NULL,
	extension character varying NOT NULL,
	CONSTRAINT mime_type_pk PRIMARY KEY (mime_type_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.mime_type IS 'Table des types mime';
-- ddl-end --
ALTER TABLE calanque.mime_type OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.nature_requete_nature_requete_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.nature_requete_nature_requete_id_seq CASCADE;
CREATE SEQUENCE calanque.nature_requete_nature_requete_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.nature_requete_nature_requete_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.nature_requete | type: TABLE --
-- DROP TABLE IF EXISTS calanque.nature_requete CASCADE;
CREATE TABLE calanque.nature_requete(
	nature_requete_id integer NOT NULL DEFAULT nextval('calanque.nature_requete_nature_requete_id_seq'::regclass),
	nature_requete_libelle character varying NOT NULL,
	CONSTRAINT nature_requete_pk PRIMARY KEY (nature_requete_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.nature_requete IS 'Table des natures de requêtes';
-- ddl-end --
ALTER TABLE calanque.nature_requete OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.nature_travaux_nature_travaux_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.nature_travaux_nature_travaux_id_seq CASCADE;
CREATE SEQUENCE calanque.nature_travaux_nature_travaux_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.nature_travaux_nature_travaux_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.nature_travaux | type: TABLE --
-- DROP TABLE IF EXISTS calanque.nature_travaux CASCADE;
CREATE TABLE calanque.nature_travaux(
	nature_travaux_id integer NOT NULL DEFAULT nextval('calanque.nature_travaux_nature_travaux_id_seq'::regclass),
	nature_travaux_libelle character varying NOT NULL,
	CONSTRAINT nature_travaux_pk PRIMARY KEY (nature_travaux_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.nature_travaux IS 'Table des natures de travaux';
-- ddl-end --
ALTER TABLE calanque.nature_travaux OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.objet_niv1_objet_niv1_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.objet_niv1_objet_niv1_id_seq CASCADE;
CREATE SEQUENCE calanque.objet_niv1_objet_niv1_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.objet_niv1_objet_niv1_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.objet_niv1 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.objet_niv1 CASCADE;
CREATE TABLE calanque.objet_niv1(
	objet_niv1_id integer NOT NULL DEFAULT nextval('calanque.objet_niv1_objet_niv1_id_seq'::regclass),
	objet_niv1_libelle character varying NOT NULL,
	type_perimetre_id integer NOT NULL DEFAULT 2,
	CONSTRAINT objet_niv1_pk PRIMARY KEY (objet_niv1_id)

);
-- ddl-end --
COMMENT ON COLUMN calanque.objet_niv1.objet_niv1_libelle IS 'Libelle du type de secteur touché';
-- ddl-end --
ALTER TABLE calanque.objet_niv1 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.objet_niv2_objet_niv2_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.objet_niv2_objet_niv2_id_seq CASCADE;
CREATE SEQUENCE calanque.objet_niv2_objet_niv2_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.objet_niv2_objet_niv2_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.objet_niv2 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.objet_niv2 CASCADE;
CREATE TABLE calanque.objet_niv2(
	objet_niv2_id integer NOT NULL DEFAULT nextval('calanque.objet_niv2_objet_niv2_id_seq'::regclass),
	objet_niv1_id integer NOT NULL,
	objet_niv2_libelle character varying NOT NULL,
	CONSTRAINT objet_niv2_pk PRIMARY KEY (objet_niv2_id)

);
-- ddl-end --
COMMENT ON COLUMN calanque.objet_niv2.objet_niv2_libelle IS 'Libelle correspondant au type d''objet étant à la base du conflit';
-- ddl-end --
ALTER TABLE calanque.objet_niv2 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.particulier_resident_type_particulier_resident_type_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.particulier_resident_type_particulier_resident_type_id_seq CASCADE;
CREATE SEQUENCE calanque.particulier_resident_type_particulier_resident_type_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.particulier_resident_type_particulier_resident_type_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.particulier_resident_type | type: TABLE --
-- DROP TABLE IF EXISTS calanque.particulier_resident_type CASCADE;
CREATE TABLE calanque.particulier_resident_type(
	particulier_resident_type_id integer NOT NULL DEFAULT nextval('calanque.particulier_resident_type_particulier_resident_type_id_seq'::regclass),
	particulier_resident_type_libelle character varying NOT NULL,
	CONSTRAINT particulier_resident_type_pk PRIMARY KEY (particulier_resident_type_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.particulier_resident_type IS 'Table des types de résidence des acteurs particuliers';
-- ddl-end --
ALTER TABLE calanque.particulier_resident_type OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.perimetre_perimetre_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.perimetre_perimetre_id_seq CASCADE;
CREATE SEQUENCE calanque.perimetre_perimetre_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.perimetre_perimetre_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.perimetre | type: TABLE --
-- DROP TABLE IF EXISTS calanque.perimetre CASCADE;
CREATE TABLE calanque.perimetre(
	perimetre_id integer NOT NULL DEFAULT nextval('calanque.perimetre_perimetre_id_seq'::regclass),
	type_perimetre_id integer NOT NULL,
	echelle_id integer,
	bien_support_niv2_id integer,
	objet_niv2_id integer NOT NULL,
	recurrence_id integer,
	perimetre_date_saisie timestamp,
	perimetre_detail character varying,
	perimetre_login character varying,
	CONSTRAINT perimetre_pk PRIMARY KEY (perimetre_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.perimetre IS 'Table de localisation d''un conflit';
-- ddl-end --
COMMENT ON COLUMN calanque.perimetre.perimetre_date_saisie IS 'Date de saisie du perimetre';
-- ddl-end --
COMMENT ON COLUMN calanque.perimetre.perimetre_detail IS 'Informations complémentaires sur le perimetre';
-- ddl-end --
ALTER TABLE calanque.perimetre OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.perimetre_localisation | type: TABLE --
-- DROP TABLE IF EXISTS calanque.perimetre_localisation CASCADE;
CREATE TABLE calanque.perimetre_localisation(
	perimetre_id integer NOT NULL,
	localisation_id integer NOT NULL,
	CONSTRAINT perimetre_localisation_pk PRIMARY KEY (perimetre_id,localisation_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.perimetre_localisation IS 'Table de correspondance entre les périmètres et les localisations';
-- ddl-end --
ALTER TABLE calanque.perimetre_localisation OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.position_acteur_position_acteur_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.position_acteur_position_acteur_id_seq CASCADE;
CREATE SEQUENCE calanque.position_acteur_position_acteur_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.position_acteur_position_acteur_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.position_acteur | type: TABLE --
-- DROP TABLE IF EXISTS calanque.position_acteur CASCADE;
CREATE TABLE calanque.position_acteur(
	position_acteur_id integer NOT NULL DEFAULT nextval('calanque.position_acteur_position_acteur_id_seq'::regclass),
	position_acteur_libelle character varying NOT NULL,
	CONSTRAINT position_acteur_pk PRIMARY KEY (position_acteur_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.position_acteur IS 'Table des positions des acteurs';
-- ddl-end --
ALTER TABLE calanque.position_acteur OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.position_usage_activite_position_usage_activite_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.position_usage_activite_position_usage_activite_id_seq CASCADE;
CREATE SEQUENCE calanque.position_usage_activite_position_usage_activite_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.position_usage_activite_position_usage_activite_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.position_usage_activite | type: TABLE --
-- DROP TABLE IF EXISTS calanque.position_usage_activite CASCADE;
CREATE TABLE calanque.position_usage_activite(
	position_usage_activite_id integer NOT NULL DEFAULT nextval('calanque.position_usage_activite_position_usage_activite_id_seq'::regclass),
	position_usage_activite_libelle character varying NOT NULL,
	CONSTRAINT position_usage_activite_pk PRIMARY KEY (position_usage_activite_id)

);
-- ddl-end --
ALTER TABLE calanque.position_usage_activite OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.qualite_appel_qualite_appel_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.qualite_appel_qualite_appel_id_seq CASCADE;
CREATE SEQUENCE calanque.qualite_appel_qualite_appel_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.qualite_appel_qualite_appel_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.qualite_appel | type: TABLE --
-- DROP TABLE IF EXISTS calanque.qualite_appel CASCADE;
CREATE TABLE calanque.qualite_appel(
	qualite_appel_id integer NOT NULL DEFAULT nextval('calanque.qualite_appel_qualite_appel_id_seq'::regclass),
	qualite_appel_libelle character varying NOT NULL,
	CONSTRAINT qualite_appel_pk PRIMARY KEY (qualite_appel_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.qualite_appel IS 'Table des qualités d''appel (demandeur, défendeur)';
-- ddl-end --
ALTER TABLE calanque.qualite_appel OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.recurrence_recurrence_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.recurrence_recurrence_id_seq CASCADE;
CREATE SEQUENCE calanque.recurrence_recurrence_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.recurrence_recurrence_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.recurrence | type: TABLE --
-- DROP TABLE IF EXISTS calanque.recurrence CASCADE;
CREATE TABLE calanque.recurrence(
	recurrence_id integer NOT NULL DEFAULT nextval('calanque.recurrence_recurrence_id_seq'::regclass),
	recurrence_libelle character varying NOT NULL,
	CONSTRAINT recurrence_pk PRIMARY KEY (recurrence_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.recurrence IS 'Recurrence d''apparition du conflit';
-- ddl-end --
ALTER TABLE calanque.recurrence OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.registre_argument_niv1_registre_argument_niv1_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.registre_argument_niv1_registre_argument_niv1_id_seq CASCADE;
CREATE SEQUENCE calanque.registre_argument_niv1_registre_argument_niv1_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.registre_argument_niv1_registre_argument_niv1_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.registre_argument_niv1 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.registre_argument_niv1 CASCADE;
CREATE TABLE calanque.registre_argument_niv1(
	registre_argument_niv1_id integer NOT NULL DEFAULT nextval('calanque.registre_argument_niv1_registre_argument_niv1_id_seq'::regclass),
	registre_argument_niv1_libelle character varying NOT NULL,
	CONSTRAINT registre_argument_niv1_pk PRIMARY KEY (registre_argument_niv1_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.registre_argument_niv1 IS 'Table des registres d''argument - niveau 1';
-- ddl-end --
ALTER TABLE calanque.registre_argument_niv1 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.registre_argument_niv2_registre_argument_niv2_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.registre_argument_niv2_registre_argument_niv2_id_seq CASCADE;
CREATE SEQUENCE calanque.registre_argument_niv2_registre_argument_niv2_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.registre_argument_niv2_registre_argument_niv2_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.registre_argument_niv2 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.registre_argument_niv2 CASCADE;
CREATE TABLE calanque.registre_argument_niv2(
	registre_argument_niv2_id integer NOT NULL DEFAULT nextval('calanque.registre_argument_niv2_registre_argument_niv2_id_seq'::regclass),
	registre_argument_niv1_id integer NOT NULL,
	registre_argument_niv2_libelle character varying NOT NULL,
	CONSTRAINT registre_argument_niv2_pk PRIMARY KEY (registre_argument_niv2_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.registre_argument_niv2 IS 'Table des registres d''argument - niveau 2';
-- ddl-end --
ALTER TABLE calanque.registre_argument_niv2 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.resolution_resolution_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.resolution_resolution_id_seq CASCADE;
CREATE SEQUENCE calanque.resolution_resolution_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.resolution_resolution_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.resolution | type: TABLE --
-- DROP TABLE IF EXISTS calanque.resolution CASCADE;
CREATE TABLE calanque.resolution(
	resolution_id integer NOT NULL DEFAULT nextval('calanque.resolution_resolution_id_seq'::regclass),
	conflit_id integer NOT NULL,
	solution_proposee_id integer,
	resolution_echelle_id integer,
	resolution_nature_id integer,
	resolution_acteur_id integer,
	resolution_mode_niv2_id integer,
	resolution_detail character varying,
	CONSTRAINT resolution_pk PRIMARY KEY (resolution_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.resolution IS 'Table des résolutions des conflits';
-- ddl-end --
ALTER TABLE calanque.resolution OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.resolution_acteur_resolution_acteur_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.resolution_acteur_resolution_acteur_id_seq CASCADE;
CREATE SEQUENCE calanque.resolution_acteur_resolution_acteur_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.resolution_acteur_resolution_acteur_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.resolution_acteur | type: TABLE --
-- DROP TABLE IF EXISTS calanque.resolution_acteur CASCADE;
CREATE TABLE calanque.resolution_acteur(
	resolution_acteur_id integer NOT NULL DEFAULT nextval('calanque.resolution_acteur_resolution_acteur_id_seq'::regclass),
	resolution_acteur_libelle character varying NOT NULL,
	CONSTRAINT resolution_acteur_pk PRIMARY KEY (resolution_acteur_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.resolution_acteur IS 'Table des actions entreprises au niveau des acteurs';
-- ddl-end --
ALTER TABLE calanque.resolution_acteur OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.resolution_echelle_resolution_echelle_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.resolution_echelle_resolution_echelle_id_seq CASCADE;
CREATE SEQUENCE calanque.resolution_echelle_resolution_echelle_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.resolution_echelle_resolution_echelle_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.resolution_echelle | type: TABLE --
-- DROP TABLE IF EXISTS calanque.resolution_echelle CASCADE;
CREATE TABLE calanque.resolution_echelle(
	resolution_echelle_id integer NOT NULL DEFAULT nextval('calanque.resolution_echelle_resolution_echelle_id_seq'::regclass),
	resolution_echelle_libelle character varying NOT NULL,
	CONSTRAINT resolution_echelle_pk PRIMARY KEY (resolution_echelle_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.resolution_echelle IS 'Table des échelles géographiques des résolutions';
-- ddl-end --
ALTER TABLE calanque.resolution_echelle OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.resolution_mode_niv1_resolution_mode_niv1_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.resolution_mode_niv1_resolution_mode_niv1_id_seq CASCADE;
CREATE SEQUENCE calanque.resolution_mode_niv1_resolution_mode_niv1_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.resolution_mode_niv1_resolution_mode_niv1_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.resolution_mode_niv1 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.resolution_mode_niv1 CASCADE;
CREATE TABLE calanque.resolution_mode_niv1(
	resolution_mode_niv1_id integer NOT NULL DEFAULT nextval('calanque.resolution_mode_niv1_resolution_mode_niv1_id_seq'::regclass),
	resolution_mode_niv1_libelle character varying NOT NULL,
	CONSTRAINT resolution_mode_niv1_pk PRIMARY KEY (resolution_mode_niv1_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.resolution_mode_niv1 IS 'Table des modes de résolution - niveau 1';
-- ddl-end --
ALTER TABLE calanque.resolution_mode_niv1 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.resolution_mode_niv2_resolution_mode_niv2_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.resolution_mode_niv2_resolution_mode_niv2_id_seq CASCADE;
CREATE SEQUENCE calanque.resolution_mode_niv2_resolution_mode_niv2_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.resolution_mode_niv2_resolution_mode_niv2_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.resolution_mode_niv2 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.resolution_mode_niv2 CASCADE;
CREATE TABLE calanque.resolution_mode_niv2(
	resolution_mode_niv2_id integer NOT NULL DEFAULT nextval('calanque.resolution_mode_niv2_resolution_mode_niv2_id_seq'::regclass),
	resolution_mode_niv2_libelle character varying NOT NULL,
	resolution_mode_niv1_id integer NOT NULL,
	CONSTRAINT resolution_mode_niv2_pk PRIMARY KEY (resolution_mode_niv2_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.resolution_mode_niv2 IS 'Table des modes de résolution - niveau 2';
-- ddl-end --
ALTER TABLE calanque.resolution_mode_niv2 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.resolution_nature_resolution_nature_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.resolution_nature_resolution_nature_id_seq CASCADE;
CREATE SEQUENCE calanque.resolution_nature_resolution_nature_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.resolution_nature_resolution_nature_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.resolution_nature | type: TABLE --
-- DROP TABLE IF EXISTS calanque.resolution_nature CASCADE;
CREATE TABLE calanque.resolution_nature(
	resolution_nature_id integer NOT NULL DEFAULT nextval('calanque.resolution_nature_resolution_nature_id_seq'::regclass),
	resolution_nature_libelle character varying NOT NULL,
	CONSTRAINT resolution_nature_pk PRIMARY KEY (resolution_nature_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.resolution_nature IS 'Table des natures de résolution';
-- ddl-end --
ALTER TABLE calanque.resolution_nature OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.revend_support_niv1_revend_support_niv1_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.revend_support_niv1_revend_support_niv1_id_seq CASCADE;
CREATE SEQUENCE calanque.revend_support_niv1_revend_support_niv1_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.revend_support_niv1_revend_support_niv1_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.revend_support_niv1 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.revend_support_niv1 CASCADE;
CREATE TABLE calanque.revend_support_niv1(
	revend_support_niv1_id integer NOT NULL DEFAULT nextval('calanque.revend_support_niv1_revend_support_niv1_id_seq'::regclass),
	revend_support_niv1_libelle character varying NOT NULL,
	CONSTRAINT revend_support_niv1_pk PRIMARY KEY (revend_support_niv1_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.revend_support_niv1 IS 'Table des supports de revendication niveau 1';
-- ddl-end --
ALTER TABLE calanque.revend_support_niv1 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.revend_support_niv2_revend_support_niv2_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.revend_support_niv2_revend_support_niv2_id_seq CASCADE;
CREATE SEQUENCE calanque.revend_support_niv2_revend_support_niv2_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.revend_support_niv2_revend_support_niv2_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.revend_support_niv2 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.revend_support_niv2 CASCADE;
CREATE TABLE calanque.revend_support_niv2(
	revend_support_niv2_id integer NOT NULL DEFAULT nextval('calanque.revend_support_niv2_revend_support_niv2_id_seq'::regclass),
	revend_support_niv1_id integer NOT NULL,
	revend_support_niv2_libelle character varying NOT NULL,
	CONSTRAINT revend_support_niv2_pk PRIMARY KEY (revend_support_niv2_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.revend_support_niv2 IS 'Table des supports de revendication niveau 2';
-- ddl-end --
ALTER TABLE calanque.revend_support_niv2 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.revendication_revendication_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.revendication_revendication_id_seq CASCADE;
CREATE SEQUENCE calanque.revendication_revendication_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.revendication_revendication_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.revendication | type: TABLE --
-- DROP TABLE IF EXISTS calanque.revendication CASCADE;
CREATE TABLE calanque.revendication(
	revendication_id integer NOT NULL DEFAULT nextval('calanque.revendication_revendication_id_seq'::regclass),
	intervention_id integer NOT NULL,
	revendication_niv2_id integer,
	revend_support_niv2_id integer,
	registre_argument_niv2_id integer,
	revendication_detail character varying,
	argument_detail character varying,
	CONSTRAINT revendication_pk PRIMARY KEY (revendication_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.revendication IS 'Table des revendications portées par les interventions';
-- ddl-end --
COMMENT ON COLUMN calanque.revendication.revendication_detail IS 'Détail de la revendication';
-- ddl-end --
COMMENT ON COLUMN calanque.revendication.argument_detail IS 'Détail des arguments présentés';
-- ddl-end --
ALTER TABLE calanque.revendication OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.revendication_niv1_revendication_niv1_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.revendication_niv1_revendication_niv1_id_seq CASCADE;
CREATE SEQUENCE calanque.revendication_niv1_revendication_niv1_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.revendication_niv1_revendication_niv1_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.revendication_niv1 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.revendication_niv1 CASCADE;
CREATE TABLE calanque.revendication_niv1(
	revendication_niv1_id integer NOT NULL DEFAULT nextval('calanque.revendication_niv1_revendication_niv1_id_seq'::regclass),
	revendication_niv1_libelle character varying NOT NULL,
	CONSTRAINT revendication_niv1_pk PRIMARY KEY (revendication_niv1_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.revendication_niv1 IS 'Table des niveaux 1 de revendication';
-- ddl-end --
ALTER TABLE calanque.revendication_niv1 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.revendication_niv2_revendication_niv2_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.revendication_niv2_revendication_niv2_id_seq CASCADE;
CREATE SEQUENCE calanque.revendication_niv2_revendication_niv2_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.revendication_niv2_revendication_niv2_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.revendication_niv2 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.revendication_niv2 CASCADE;
CREATE TABLE calanque.revendication_niv2(
	revendication_niv2_id integer NOT NULL DEFAULT nextval('calanque.revendication_niv2_revendication_niv2_id_seq'::regclass),
	revendication_niv1_id integer NOT NULL,
	revendication_niv2_libelle character varying NOT NULL,
	CONSTRAINT revendication_niv2_pk PRIMARY KEY (revendication_niv2_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.revendication_niv2 IS 'Table des revendications de niveau 2';
-- ddl-end --
ALTER TABLE calanque.revendication_niv2 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.role_role_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.role_role_id_seq CASCADE;
CREATE SEQUENCE calanque.role_role_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.role_role_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.role | type: TABLE --
-- DROP TABLE IF EXISTS calanque.role CASCADE;
CREATE TABLE calanque.role(
	role_id integer NOT NULL DEFAULT nextval('calanque.role_role_id_seq'::regclass),
	role_libelle character varying NOT NULL,
	CONSTRAINT role_pk PRIMARY KEY (role_id)

);
-- ddl-end --
ALTER TABLE calanque.role OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.solution_proposee_solution_proposee_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.solution_proposee_solution_proposee_id_seq CASCADE;
CREATE SEQUENCE calanque.solution_proposee_solution_proposee_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.solution_proposee_solution_proposee_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.solution_proposee | type: TABLE --
-- DROP TABLE IF EXISTS calanque.solution_proposee CASCADE;
CREATE TABLE calanque.solution_proposee(
	solution_proposee_id integer NOT NULL DEFAULT nextval('calanque.solution_proposee_solution_proposee_id_seq'::regclass),
	intervention_id integer NOT NULL,
	solution_proposee_libelle character varying NOT NULL,
	CONSTRAINT solution_proposee_pk PRIMARY KEY (solution_proposee_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.solution_proposee IS 'Table des solutions proposées';
-- ddl-end --
ALTER TABLE calanque.solution_proposee OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.structure_type_structure_type_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.structure_type_structure_type_id_seq CASCADE;
CREATE SEQUENCE calanque.structure_type_structure_type_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.structure_type_structure_type_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.structure_type | type: TABLE --
-- DROP TABLE IF EXISTS calanque.structure_type CASCADE;
CREATE TABLE calanque.structure_type(
	structure_type_id integer NOT NULL DEFAULT nextval('calanque.structure_type_structure_type_id_seq'::regclass),
	structure_type_libelle character varying NOT NULL,
	CONSTRAINT structure_type_pk PRIMARY KEY (structure_type_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.structure_type IS 'Type de structure';
-- ddl-end --
ALTER TABLE calanque.structure_type OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.type_ouvrage_perm_constr_type_ouvrage_perm_constr_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.type_ouvrage_perm_constr_type_ouvrage_perm_constr_id_seq CASCADE;
CREATE SEQUENCE calanque.type_ouvrage_perm_constr_type_ouvrage_perm_constr_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.type_ouvrage_perm_constr_type_ouvrage_perm_constr_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.type_ouvrage_perm_constr | type: TABLE --
-- DROP TABLE IF EXISTS calanque.type_ouvrage_perm_constr CASCADE;
CREATE TABLE calanque.type_ouvrage_perm_constr(
	type_ouvrage_perm_constr_id integer NOT NULL DEFAULT nextval('calanque.type_ouvrage_perm_constr_type_ouvrage_perm_constr_id_seq'::regclass),
	type_ouvrage_perm_constr_libelle character varying NOT NULL,
	CONSTRAINT type_ouvrage_perm_constr_pk PRIMARY KEY (type_ouvrage_perm_constr_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.type_ouvrage_perm_constr IS 'Table des types d''ouvrage utilisés dans les permis de construire';
-- ddl-end --
ALTER TABLE calanque.type_ouvrage_perm_constr OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.type_perimetre_type_perimetre_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.type_perimetre_type_perimetre_id_seq CASCADE;
CREATE SEQUENCE calanque.type_perimetre_type_perimetre_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.type_perimetre_type_perimetre_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.type_perimetre | type: TABLE --
-- DROP TABLE IF EXISTS calanque.type_perimetre CASCADE;
CREATE TABLE calanque.type_perimetre(
	type_perimetre_id integer NOT NULL DEFAULT nextval('calanque.type_perimetre_type_perimetre_id_seq'::regclass),
	type_perimetre_libelle character varying NOT NULL,
	CONSTRAINT type_perimetre_pk PRIMARY KEY (type_perimetre_id)

);
-- ddl-end --
COMMENT ON TABLE calanque.type_perimetre IS 'Type de perimetre du conflit';
-- ddl-end --
COMMENT ON COLUMN calanque.type_perimetre.type_perimetre_libelle IS 'Libelle du type de perimetre';
-- ddl-end --
ALTER TABLE calanque.type_perimetre OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.usage_activite_niv1_usage_activite_niv1_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.usage_activite_niv1_usage_activite_niv1_id_seq CASCADE;
CREATE SEQUENCE calanque.usage_activite_niv1_usage_activite_niv1_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.usage_activite_niv1_usage_activite_niv1_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.usage_activite_niv1 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.usage_activite_niv1 CASCADE;
CREATE TABLE calanque.usage_activite_niv1(
	usage_activite_niv1_id integer NOT NULL DEFAULT nextval('calanque.usage_activite_niv1_usage_activite_niv1_id_seq'::regclass),
	usage_activite_niv1_libelle character varying NOT NULL,
	position_usage_activite_id integer NOT NULL DEFAULT 1,
	CONSTRAINT usage_activite_niv1_pk PRIMARY KEY (usage_activite_niv1_id)

);
-- ddl-end --
ALTER TABLE calanque.usage_activite_niv1 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.usage_activite_niv2_usage_activite_niv2_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS calanque.usage_activite_niv2_usage_activite_niv2_id_seq CASCADE;
CREATE SEQUENCE calanque.usage_activite_niv2_usage_activite_niv2_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE calanque.usage_activite_niv2_usage_activite_niv2_id_seq OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.usage_activite_niv2 | type: TABLE --
-- DROP TABLE IF EXISTS calanque.usage_activite_niv2 CASCADE;
CREATE TABLE calanque.usage_activite_niv2(
	usage_activite_niv2_id integer NOT NULL DEFAULT nextval('calanque.usage_activite_niv2_usage_activite_niv2_id_seq'::regclass),
	usage_activite_niv1_id integer NOT NULL,
	usage_activite_niv2_libelle character varying NOT NULL,
	CONSTRAINT usage_activite_niv2_pk PRIMARY KEY (usage_activite_niv2_id)

);
-- ddl-end --
ALTER TABLE calanque.usage_activite_niv2 OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.suppr_accent | type: FUNCTION --
-- DROP FUNCTION IF EXISTS calanque.suppr_accent(character varying) CASCADE;
CREATE FUNCTION calanque.suppr_accent ( _param1 character varying)
	RETURNS character varying
	LANGUAGE sql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 100
	AS $$

select translate($1, 'àéèêëïîôöùûüÿç«»', 'aeeeeiioouuuyc""');

$$;
-- ddl-end --
ALTER FUNCTION calanque.suppr_accent(character varying) OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.correct_points | type: FUNCTION --
-- DROP FUNCTION IF EXISTS calanque.correct_points(character varying) CASCADE;
CREATE FUNCTION calanque.correct_points ( _param1 character varying)
	RETURNS character varying
	LANGUAGE sql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 100
	AS $$

select translate($1, '…', '.');

$$;
-- ddl-end --
ALTER FUNCTION calanque.correct_points(character varying) OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.change_guillemet | type: FUNCTION --
-- DROP FUNCTION IF EXISTS calanque.change_guillemet(character varying) CASCADE;
CREATE FUNCTION calanque.change_guillemet ( _param1 character varying)
	RETURNS character varying
	LANGUAGE sql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 100
	AS $$

select translate($1, '«»', '""');

$$;
-- ddl-end --
ALTER FUNCTION calanque.change_guillemet(character varying) OWNER TO "eric.quinton";
-- ddl-end --

-- object: calanque.v_infos_conflit | type: VIEW --
-- DROP VIEW IF EXISTS calanque.v_infos_conflit CASCADE;
CREATE VIEW calanque.v_infos_conflit
AS 

 WITH vt_nbart_confl AS (
         SELECT article_conflit.conflit_id,
            count(DISTINCT article_conflit.article_id) AS nbart_confl
           FROM calanque.article_conflit
          GROUP BY article_conflit.conflit_id
          ORDER BY article_conflit.conflit_id
        ), vt_nbentr_confl AS (
         SELECT entretien_conflit.conflit_id,
            count(DISTINCT entretien_conflit.entretien_id) AS nbentr_confl
           FROM calanque.entretien_conflit
          GROUP BY entretien_conflit.conflit_id
          ORDER BY entretien_conflit.conflit_id
        ), vt_nbjur_confl AS (
         SELECT juridique_conflit.conflit_id,
            count(DISTINCT juridique_conflit.juridique_id) AS nbjur_confl
           FROM calanque.juridique_conflit
          GROUP BY juridique_conflit.conflit_id
          ORDER BY juridique_conflit.conflit_id
        ), vt_nbinterv_confl AS (
         SELECT intervention.conflit_id,
            count(DISTINCT intervention.intervention_id) AS nbinterv_confl
           FROM calanque.intervention
          GROUP BY intervention.conflit_id
          ORDER BY intervention.conflit_id
        )
 SELECT conflit.conflit_id,
    conflit.perimetre_id,
    conflit.conflit_date_debut,
    conflit.conflit_date_debut_txt,
    conflit.conflit_date_fin,
    conflit.conflit_date_fin_txt,
    conflit.conflit_date_saisie,
    conflit.conflit_detail,
    conflit.conflit_login,
    vt_nbart_confl.nbart_confl,
    vt_nbentr_confl.nbentr_confl,
    vt_nbjur_confl.nbjur_confl,
    vt_nbinterv_confl.nbinterv_confl,
    concat(date_part('year'::text, conflit.conflit_date_debut), to_number(substr((conflit.conflit_date_debut_txt)::text, 7, 10), '9999'::text)) AS conflit_annee_debut,
    concat(date_part('year'::text, conflit.conflit_date_fin), to_number(substr((conflit.conflit_date_fin_txt)::text, 7, 10), '9999'::text)) AS conflit_annee_fin
   FROM ((((calanque.conflit
     LEFT JOIN vt_nbart_confl USING (conflit_id))
     LEFT JOIN vt_nbentr_confl USING (conflit_id))
     LEFT JOIN vt_nbjur_confl USING (conflit_id))
     LEFT JOIN vt_nbinterv_confl USING (conflit_id))
  ORDER BY conflit.perimetre_id, conflit.conflit_id;;
-- ddl-end --
ALTER VIEW calanque.v_infos_conflit OWNER TO "sandrine.lyser";
-- ddl-end --

-- object: calanque.v_resolution | type: VIEW --
-- DROP VIEW IF EXISTS calanque.v_resolution CASCADE;
CREATE VIEW calanque.v_resolution
AS 

 SELECT resolution.resolution_id,
    resolution.conflit_id,
    resolution.solution_proposee_id,
    resolution.resolution_echelle_id,
    resolution.resolution_nature_id,
    resolution.resolution_acteur_id,
    resolution.resolution_mode_niv2_id,
    resolution.resolution_detail,
    resolution_echelle.resolution_echelle_libelle,
    resolution_nature.resolution_nature_libelle,
    resolution_acteur.resolution_acteur_libelle,
    resolution_mode_niv1.resolution_mode_niv1_id,
    resolution_mode_niv1.resolution_mode_niv1_libelle,
    resolution_mode_niv2.resolution_mode_niv2_libelle,
    solution_proposee.solution_proposee_libelle,
    solution_proposee.intervention_id
   FROM ((((((calanque.resolution
     LEFT JOIN calanque.resolution_mode_niv2 USING (resolution_mode_niv2_id))
     LEFT JOIN calanque.resolution_mode_niv1 USING (resolution_mode_niv1_id))
     LEFT JOIN calanque.resolution_acteur USING (resolution_acteur_id))
     LEFT JOIN calanque.resolution_echelle USING (resolution_echelle_id))
     LEFT JOIN calanque.resolution_nature USING (resolution_nature_id))
     LEFT JOIN calanque.solution_proposee USING (solution_proposee_id))
  ORDER BY resolution.conflit_id, resolution.resolution_id;;
-- ddl-end --
ALTER VIEW calanque.v_resolution OWNER TO "sandrine.lyser";
-- ddl-end --

-- object: calanque.v_infos_article | type: VIEW --
-- DROP VIEW IF EXISTS calanque.v_infos_article CASCADE;
CREATE VIEW calanque.v_infos_article
AS 

 WITH vt_conflict_art AS (
         SELECT article_conflit.article_id,
            count(DISTINCT article_conflit.conflit_id) AS nbconfl_art,
            count(DISTINCT perimetre.perimetre_id) AS nbperim_art
           FROM ((calanque.article_conflit
             JOIN calanque.conflit ON ((article_conflit.conflit_id = conflit.conflit_id)))
             JOIN calanque.perimetre ON ((conflit.perimetre_id = perimetre.perimetre_id)))
          GROUP BY article_conflit.article_id
        ), vt_nbinterv_art AS (
         SELECT article_intervention.article_id,
            count(article_intervention.intervention_id) AS nbinterv_art
           FROM calanque.article_intervention
          GROUP BY article_intervention.article_id
        ), vt_nbactr_art AS (
         SELECT article_intervention.article_id,
            count(DISTINCT intervention.acteur_id) AS nbacteur_art
           FROM (calanque.article_intervention
             JOIN calanque.intervention ON ((article_intervention.intervention_id = intervention.intervention_id)))
          GROUP BY article_intervention.article_id
        )
 SELECT article.article_id,
    article.journal_id,
    article.date_parution,
    article.titre,
    article.auteur,
    article.edition,
    article.rubrique,
    article.page,
    article.entete,
    article.piecejointe,
    article.article_login,
    article.article_date_saisie,
    journal.journal_libelle,
    vt_conflict_art.nbconfl_art,
    vt_conflict_art.nbperim_art,
    vt_nbinterv_art.nbinterv_art,
    vt_nbactr_art.nbacteur_art
   FROM ((((calanque.article
     JOIN calanque.journal USING (journal_id))
     LEFT JOIN vt_conflict_art USING (article_id))
     LEFT JOIN vt_nbinterv_art USING (article_id))
     LEFT JOIN vt_nbactr_art USING (article_id))
  ORDER BY article.article_id;;
-- ddl-end --
ALTER VIEW calanque.v_infos_article OWNER TO "sandrine.lyser";
-- ddl-end --

-- object: calanque.v_infos_perimetre | type: VIEW --
-- DROP VIEW IF EXISTS calanque.v_infos_perimetre CASCADE;
CREATE VIEW calanque.v_infos_perimetre
AS 

 WITH vt_loc_perim AS (
         SELECT perimetre_1.perimetre_id,
            localisation.localisation_id,
            localisation.precision_adresse,
            commune.insee,
            commune.commune_nom,
            commune.departement
           FROM (((calanque.perimetre perimetre_1
             LEFT JOIN calanque.perimetre_localisation ON ((perimetre_1.perimetre_id = perimetre_localisation.perimetre_id)))
             LEFT JOIN calanque.localisation ON ((perimetre_localisation.localisation_id = localisation.localisation_id)))
             LEFT JOIN calanque.commune ON ((localisation.insee = commune.insee)))
        ), vt_nbconfl_debut_fin AS (
         SELECT v_infos_conflit.perimetre_id,
            min(v_infos_conflit.conflit_annee_debut) AS annee_debut,
            max(v_infos_conflit.conflit_annee_fin) AS annee_fin,
            count(v_infos_conflit.conflit_id) AS nbexpr
           FROM calanque.v_infos_conflit
          GROUP BY v_infos_conflit.perimetre_id
        ), vt_nbactr_perim AS (
         SELECT perimetre_1.perimetre_id,
            count(DISTINCT acteur.acteur_id) AS nbacteur
           FROM (((calanque.acteur
             JOIN calanque.intervention ON ((acteur.acteur_id = intervention.acteur_id)))
             LEFT JOIN calanque.conflit ON ((intervention.conflit_id = conflit.conflit_id)))
             LEFT JOIN calanque.perimetre perimetre_1 ON ((conflit.perimetre_id = perimetre_1.perimetre_id)))
          GROUP BY perimetre_1.perimetre_id
        ), vt_nbresol_perim AS (
         SELECT perimetre_1.perimetre_id,
            count(resolution.resolution_id) AS nbresol
           FROM ((calanque.resolution
             RIGHT JOIN calanque.conflit ON ((resolution.conflit_id = conflit.conflit_id)))
             JOIN calanque.perimetre perimetre_1 ON ((conflit.perimetre_id = perimetre_1.perimetre_id)))
          GROUP BY perimetre_1.perimetre_id
        ), vt_nbart_perim AS (
         SELECT perimetre_1.perimetre_id,
            count(DISTINCT article_conflit.article_id) AS nbart
           FROM ((calanque.article_conflit
             RIGHT JOIN calanque.conflit ON ((article_conflit.conflit_id = conflit.conflit_id)))
             JOIN calanque.perimetre perimetre_1 ON ((conflit.perimetre_id = perimetre_1.perimetre_id)))
          GROUP BY perimetre_1.perimetre_id
        ), vt_nbentr_perim AS (
         SELECT perimetre_1.perimetre_id,
            count(DISTINCT entretien_conflit.entretien_id) AS nbentr
           FROM ((calanque.entretien_conflit
             RIGHT JOIN calanque.conflit ON ((entretien_conflit.conflit_id = conflit.conflit_id)))
             JOIN calanque.perimetre perimetre_1 ON ((conflit.perimetre_id = perimetre_1.perimetre_id)))
          GROUP BY perimetre_1.perimetre_id
        ), vt_nbjur_perim AS (
         SELECT perimetre_1.perimetre_id,
            count(DISTINCT juridique_conflit.juridique_id) AS nbjurid
           FROM ((calanque.juridique_conflit
             RIGHT JOIN calanque.conflit ON ((juridique_conflit.conflit_id = conflit.conflit_id)))
             JOIN calanque.perimetre perimetre_1 ON ((conflit.perimetre_id = perimetre_1.perimetre_id)))
          GROUP BY perimetre_1.perimetre_id
        )
 SELECT perimetre.perimetre_id,
    perimetre.echelle_id,
    perimetre.recurrence_id,
    bien_support_niv2.bien_support_niv1_id,
    perimetre.bien_support_niv2_id,
    perimetre.objet_niv2_id,
    objet_niv1.objet_niv1_id,
    perimetre.type_perimetre_id,
    perimetre.perimetre_date_saisie,
    perimetre.perimetre_detail,
    perimetre.perimetre_login,
    type_perimetre.type_perimetre_libelle,
    objet_niv1.objet_niv1_libelle,
    objet_niv2.objet_niv2_libelle,
    bien_support_niv2.bien_support_niv2_libelle,
    bien_support_niv1.bien_support_niv1_libelle,
    recurrence.recurrence_libelle,
    echelle.echelle_libelle,
    vt_loc_perim.localisation_id,
    vt_loc_perim.precision_adresse,
    vt_loc_perim.insee,
    vt_loc_perim.commune_nom,
    vt_loc_perim.departement,
    vt_nbconfl_debut_fin.annee_debut,
    vt_nbconfl_debut_fin.annee_fin,
    vt_nbconfl_debut_fin.nbexpr,
    vt_nbactr_perim.nbacteur,
    vt_nbresol_perim.nbresol,
    vt_nbart_perim.nbart,
    vt_nbentr_perim.nbentr,
    vt_nbjur_perim.nbjurid
   FROM ((((((((((((((calanque.perimetre
     JOIN calanque.type_perimetre USING (type_perimetre_id))
     JOIN calanque.objet_niv1 USING (type_perimetre_id))
     JOIN calanque.objet_niv2 USING (objet_niv2_id, objet_niv1_id))
     LEFT JOIN calanque.bien_support_niv2 USING (bien_support_niv2_id))
     LEFT JOIN calanque.bien_support_niv1 USING (bien_support_niv1_id))
     LEFT JOIN calanque.recurrence USING (recurrence_id))
     LEFT JOIN calanque.echelle USING (echelle_id))
     LEFT JOIN vt_loc_perim USING (perimetre_id))
     LEFT JOIN vt_nbconfl_debut_fin USING (perimetre_id))
     LEFT JOIN vt_nbactr_perim USING (perimetre_id))
     LEFT JOIN vt_nbresol_perim USING (perimetre_id))
     LEFT JOIN vt_nbart_perim USING (perimetre_id))
     LEFT JOIN vt_nbentr_perim USING (perimetre_id))
     LEFT JOIN vt_nbjur_perim USING (perimetre_id))
  ORDER BY perimetre.perimetre_id;;
-- ddl-end --
ALTER VIEW calanque.v_infos_perimetre OWNER TO "sandrine.lyser";
-- ddl-end --

-- object: calanque.v_infos_entretien | type: VIEW --
-- DROP VIEW IF EXISTS calanque.v_infos_entretien CASCADE;
CREATE VIEW calanque.v_infos_entretien
AS 

 WITH vt_conflict_entr AS (
         SELECT entretien_conflit.entretien_id,
            count(DISTINCT entretien_conflit.conflit_id) AS nbconfl_entr,
            count(DISTINCT perimetre.perimetre_id) AS nbperim_entr
           FROM ((calanque.entretien_conflit
             JOIN calanque.conflit ON ((entretien_conflit.conflit_id = conflit.conflit_id)))
             JOIN calanque.perimetre ON ((conflit.perimetre_id = perimetre.perimetre_id)))
          GROUP BY entretien_conflit.entretien_id
        ), vt_nbinterv_entr AS (
         SELECT entretien_intervention.entretien_id,
            count(entretien_intervention.intervention_id) AS nbinterv_entr
           FROM calanque.entretien_intervention
          GROUP BY entretien_intervention.entretien_id
        ), vt_nbactr_entr AS (
         SELECT entretien_intervention.entretien_id,
            count(DISTINCT intervention.acteur_id) AS nbacteur_entr
           FROM (calanque.entretien_intervention
             JOIN calanque.intervention ON ((entretien_intervention.intervention_id = intervention.intervention_id)))
          GROUP BY entretien_intervention.entretien_id
        )
 SELECT entretien.entretien_id,
    entretien.expert_id,
    entretien.entretien_date,
    entretien.institution,
    entretien.statut,
    entretien.localisation,
    entretien.binome,
    entretien.entretien_login,
    entretien.entretien_date_saisie,
    entretien.piece_jointe,
    expert.acteur_id,
    expert.expert_nom,
    expert.expert_prenom,
    expert.sexe,
    expert.commune_residence,
    expert.lien_territoire,
    expert.activite_assoc,
    expert.activite_prof,
    expert.annee_naissance,
    vt_conflict_entr.nbconfl_entr,
    vt_conflict_entr.nbperim_entr,
    vt_nbinterv_entr.nbinterv_entr,
    vt_nbactr_entr.nbacteur_entr
   FROM ((((calanque.entretien
     JOIN calanque.expert USING (expert_id))
     LEFT JOIN vt_conflict_entr USING (entretien_id))
     LEFT JOIN vt_nbinterv_entr USING (entretien_id))
     LEFT JOIN vt_nbactr_entr USING (entretien_id))
  ORDER BY entretien.entretien_id;;
-- ddl-end --
ALTER VIEW calanque.v_infos_entretien OWNER TO "sandrine.lyser";
-- ddl-end --

-- object: calanque.v_infos_juridique | type: VIEW --
-- DROP VIEW IF EXISTS calanque.v_infos_juridique CASCADE;
CREATE VIEW calanque.v_infos_juridique
AS 

 WITH vt_conflict_jur AS (
         SELECT juridique_conflit.juridique_id,
            count(DISTINCT juridique_conflit.conflit_id) AS nbconfl_jur,
            count(DISTINCT perimetre.perimetre_id) AS nbperim_jur
           FROM ((calanque.juridique_conflit
             JOIN calanque.conflit ON ((juridique_conflit.conflit_id = conflit.conflit_id)))
             JOIN calanque.perimetre ON ((conflit.perimetre_id = perimetre.perimetre_id)))
          GROUP BY juridique_conflit.juridique_id
        ), vt_nbinterv_jur AS (
         SELECT intervention_juridique.juridique_id,
            count(intervention_juridique.intervention_id) AS nbinterv_jur
           FROM calanque.intervention_juridique
          GROUP BY intervention_juridique.juridique_id
        ), vt_nbactr_jur AS (
         SELECT intervention_juridique.juridique_id,
            count(DISTINCT intervention.acteur_id) AS nbacteur_jur
           FROM (calanque.intervention_juridique
             JOIN calanque.intervention ON ((intervention_juridique.intervention_id = intervention.intervention_id)))
          GROUP BY intervention_juridique.juridique_id
        )
 SELECT juridique.juridique_id,
    juridique.juridiction_id,
    juridique.arret_num,
    juridique.arret_date,
    juridique.acte_date,
    juridique.juridique_sous_domaine_id,
    juridique.nature_requete_id,
    juridique.type_ouvrage_perm_constr_id,
    juridique.nature_travaux_id,
    juridique.decision_cassation_id,
    juridique.decision_appel_id,
    juridique.acte_contentieux_id,
    juridique.juridique_libelle,
    juridique.objet_precision,
    juridique.article1,
    juridique.article2,
    juridique.article3,
    juridique.article4,
    juridique.article5,
    juridique.jugement_date_degre1,
    juridique.jugement_date_degre2,
    juridique.juridique_login,
    juridique.juridique_date_saisie,
    juridiction.juridiction_libelle,
    juridique_sous_domaine.juridique_sous_domaine_libelle,
    juridique_domaine.juridique_domaine_id,
    juridique_domaine.juridique_domaine_libelle,
    nature_requete.nature_requete_libelle,
    type_ouvrage_perm_constr.type_ouvrage_perm_constr_libelle,
    nature_travaux.nature_travaux_libelle,
    decision_cassation.decision_cassation_libelle,
    decision_appel.decision_appel_libelle,
    acte_contentieux.acte_contentieux_libelle,
    vt_conflict_jur.nbconfl_jur,
    vt_conflict_jur.nbperim_jur,
    vt_nbinterv_jur.nbinterv_jur,
    vt_nbactr_jur.nbacteur_jur
   FROM ((((((((((((calanque.juridique
     JOIN calanque.juridiction USING (juridiction_id))
     JOIN calanque.juridique_sous_domaine USING (juridique_sous_domaine_id))
     JOIN calanque.juridique_domaine USING (juridique_domaine_id))
     JOIN calanque.nature_requete USING (nature_requete_id))
     LEFT JOIN calanque.type_ouvrage_perm_constr USING (type_ouvrage_perm_constr_id))
     LEFT JOIN calanque.nature_travaux USING (nature_travaux_id))
     LEFT JOIN calanque.decision_cassation USING (decision_cassation_id))
     LEFT JOIN calanque.decision_appel USING (decision_appel_id))
     LEFT JOIN calanque.acte_contentieux USING (acte_contentieux_id))
     LEFT JOIN vt_conflict_jur USING (juridique_id))
     LEFT JOIN vt_nbinterv_jur USING (juridique_id))
     LEFT JOIN vt_nbactr_jur USING (juridique_id))
  ORDER BY juridique.juridique_id;;
-- ddl-end --
ALTER VIEW calanque.v_infos_juridique OWNER TO "sandrine.lyser";
-- ddl-end --

-- object: calanque.v_article_conflit | type: VIEW --
-- DROP VIEW IF EXISTS calanque.v_article_conflit CASCADE;
CREATE VIEW calanque.v_article_conflit
AS 

 SELECT article_conflit.article_id,
    article_conflit.conflit_id,
    article_conflit.action_type_id,
    action_type.action_type_libelle
   FROM (calanque.article_conflit
     LEFT JOIN calanque.action_type USING (action_type_id))
  ORDER BY article_conflit.article_id;;
-- ddl-end --
ALTER VIEW calanque.v_article_conflit OWNER TO "sandrine.lyser";
-- ddl-end --

-- object: calanque.v_intervention_juridique | type: VIEW --
-- DROP VIEW IF EXISTS calanque.v_intervention_juridique CASCADE;
CREATE VIEW calanque.v_intervention_juridique
AS 

 SELECT intervention_juridique.intervention_juridique_id,
    intervention_juridique.intervention_id,
    intervention_juridique.juridique_id,
    intervention_juridique.position_acteur_id,
    intervention_juridique.qualite_appel_id,
    intervention_juridique.qualite_pourvoi_id,
    intervention_juridique.petitionnaire,
    position_acteur.position_acteur_libelle,
    appel.qualite_appel_libelle,
    pourvoi.qualite_appel_libelle AS qualite_pourvoi_libelle
   FROM (((calanque.intervention_juridique
     JOIN calanque.position_acteur USING (position_acteur_id))
     LEFT JOIN calanque.qualite_appel appel ON ((intervention_juridique.qualite_appel_id = appel.qualite_appel_id)))
     LEFT JOIN calanque.qualite_appel pourvoi ON ((intervention_juridique.qualite_pourvoi_id = pourvoi.qualite_appel_id)))
  ORDER BY intervention_juridique.intervention_juridique_id;;
-- ddl-end --
ALTER VIEW calanque.v_intervention_juridique OWNER TO "sandrine.lyser";
-- ddl-end --

-- object: calanque.v_infos_intervention | type: VIEW --
-- DROP VIEW IF EXISTS calanque.v_infos_intervention CASCADE;
CREATE VIEW calanque.v_infos_intervention
AS 

 WITH v_nbaction_interv AS (
         SELECT action.intervention_id,
            count(action.action_id) AS nb_action_interv
           FROM calanque.action
          GROUP BY action.intervention_id
        ), v_nbrevend_interv AS (
         SELECT revendication.intervention_id,
            count(revendication.revendication_id) AS nb_revend_interv
           FROM calanque.revendication
          GROUP BY revendication.intervention_id
        ), v_solution_interv AS (
         SELECT solution_proposee.intervention_id,
            count(solution_proposee.solution_proposee_id) AS nb_solution_interv
           FROM calanque.solution_proposee
          GROUP BY solution_proposee.intervention_id
        )
 SELECT conflit.perimetre_id,
    intervention.intervention_id,
    intervention.conflit_id,
    intervention.acteur_id,
    intervention.role_id,
    intervention.usage_activite_niv2_id,
    intervention.position_usage_activite_id,
    intervention.intervention_date_entree,
    intervention.intervention_date_entree_txt,
    intervention.intervention_date_sortie,
    intervention.intervention_date_sortie_txt,
    intervention.intervention_detail_usage,
    position_usage_activite.position_usage_activite_libelle,
    usage_activite_niv1.usage_activite_niv1_libelle,
    usage_activite_niv2.usage_activite_niv2_libelle,
    role.role_libelle,
    v_nbaction_interv.nb_action_interv,
    v_nbrevend_interv.nb_revend_interv,
    v_solution_interv.nb_solution_interv
   FROM ((((((((calanque.intervention
     LEFT JOIN calanque.conflit USING (conflit_id))
     LEFT JOIN calanque.position_usage_activite USING (position_usage_activite_id))
     LEFT JOIN calanque.usage_activite_niv2 USING (usage_activite_niv2_id))
     LEFT JOIN calanque.usage_activite_niv1 USING (usage_activite_niv1_id))
     LEFT JOIN calanque.role USING (role_id))
     LEFT JOIN v_nbaction_interv USING (intervention_id))
     LEFT JOIN v_nbrevend_interv USING (intervention_id))
     LEFT JOIN v_solution_interv USING (intervention_id))
  ORDER BY intervention.intervention_id;;
-- ddl-end --
ALTER VIEW calanque.v_infos_intervention OWNER TO "sandrine.lyser";
-- ddl-end --

-- object: calanque.v_infos_acteur | type: VIEW --
-- DROP VIEW IF EXISTS calanque.v_infos_acteur CASCADE;
CREATE VIEW calanque.v_infos_acteur
AS 

 WITH v_nbinterv_actr AS (
         SELECT acteur_1.acteur_id,
            count(intervention.intervention_id) AS nbinterv_actr
           FROM (calanque.acteur acteur_1
             LEFT JOIN calanque.intervention USING (acteur_id))
          GROUP BY acteur_1.acteur_id
        ), v_nbstruct_actr AS (
         SELECT acteur_1.acteur_id,
            count(acteur_structure.acteur_structure_id) AS nbstruct_actr
           FROM (calanque.acteur_structure
             RIGHT JOIN calanque.acteur acteur_1 USING (acteur_id))
          GROUP BY acteur_1.acteur_id
        ), v_nbmandat_actr AS (
         SELECT acteur_1.acteur_id,
            count(acteur_mandat.acteur_mandat_id) AS nbmandat_actr
           FROM (calanque.acteur_mandat
             RIGHT JOIN calanque.acteur acteur_1 USING (acteur_id))
          GROUP BY acteur_1.acteur_id
        ), v_nbart_actr AS (
         SELECT acteur_1.acteur_id,
            count(DISTINCT article_intervention.article_id) AS nbart_actr
           FROM ((calanque.acteur acteur_1
             LEFT JOIN calanque.intervention ON ((acteur_1.acteur_id = intervention.acteur_id)))
             JOIN calanque.article_intervention ON ((intervention.intervention_id = article_intervention.intervention_id)))
          GROUP BY acteur_1.acteur_id
        ), v_nbentr_actr AS (
         SELECT acteur_1.acteur_id,
            count(DISTINCT entretien_intervention.entretien_id) AS nbentr_actr
           FROM ((calanque.acteur acteur_1
             LEFT JOIN calanque.intervention ON ((acteur_1.acteur_id = intervention.acteur_id)))
             JOIN calanque.entretien_intervention ON ((intervention.intervention_id = entretien_intervention.intervention_id)))
          GROUP BY acteur_1.acteur_id
        ), v_nbjur_actr AS (
         SELECT acteur_1.acteur_id,
            count(DISTINCT intervention_juridique.intervention_juridique_id) AS nbjur_actr
           FROM ((calanque.acteur acteur_1
             LEFT JOIN calanque.intervention ON ((acteur_1.acteur_id = intervention.acteur_id)))
             JOIN calanque.intervention_juridique ON ((intervention.intervention_id = intervention_juridique.intervention_id)))
          GROUP BY acteur_1.acteur_id
        )
 SELECT acteur.acteur_id,
    acteur.acteur_niv3_id,
    acteur.acteur_physique_nom,
    acteur.commune_physique,
    acteur.cp_physique,
    acteur.acteur_moral_nom,
    acteur.commune_morale,
    acteur.cp_morale,
    acteur.acteur_statut,
    acteur.acteur_statut_detail,
    acteur.acteur_date_saisie,
    acteur.acteur_login,
    acteur.particulier_resident_type_id,
    acteur_niv3.acteur_niv3_libelle,
    acteur_niv2.acteur_niv2_libelle,
    acteur_niv1.acteur_niv1_libelle,
    particulier_resident_type.particulier_resident_type_libelle,
    v_nbinterv_actr.nbinterv_actr,
    v_nbstruct_actr.nbstruct_actr,
    v_nbmandat_actr.nbmandat_actr,
    v_nbart_actr.nbart_actr,
    v_nbentr_actr.nbentr_actr,
    v_nbjur_actr.nbjur_actr
   FROM ((((((((((calanque.acteur
     LEFT JOIN calanque.acteur_niv3 USING (acteur_niv3_id))
     LEFT JOIN calanque.acteur_niv2 USING (acteur_niv2_id))
     LEFT JOIN calanque.acteur_niv1 USING (acteur_niv1_id))
     LEFT JOIN calanque.particulier_resident_type USING (particulier_resident_type_id))
     LEFT JOIN v_nbinterv_actr USING (acteur_id))
     LEFT JOIN v_nbstruct_actr USING (acteur_id))
     LEFT JOIN v_nbmandat_actr USING (acteur_id))
     LEFT JOIN v_nbart_actr USING (acteur_id))
     LEFT JOIN v_nbentr_actr USING (acteur_id))
     LEFT JOIN v_nbjur_actr USING (acteur_id))
  ORDER BY acteur.acteur_id;;
-- ddl-end --
ALTER VIEW calanque.v_infos_acteur OWNER TO "sandrine.lyser";
-- ddl-end --

-- object: calanque.v_revendication | type: VIEW --
-- DROP VIEW IF EXISTS calanque.v_revendication CASCADE;
CREATE VIEW calanque.v_revendication
AS 

 SELECT revendication.revendication_id,
    revendication.intervention_id,
    revendication.revendication_niv2_id,
    revendication.revend_support_niv2_id,
    revendication.registre_argument_niv2_id,
    revendication.revendication_detail,
    revendication.argument_detail,
    revendication_niv2.revendication_niv1_id,
    revendication_niv1.revendication_niv1_libelle,
    revendication_niv2.revendication_niv2_libelle,
    revend_support_niv2.revend_support_niv1_id,
    revend_support_niv1.revend_support_niv1_libelle,
    revend_support_niv2.revend_support_niv2_libelle,
    registre_argument_niv2.registre_argument_niv1_id,
    registre_argument_niv1.registre_argument_niv1_libelle,
    registre_argument_niv2.registre_argument_niv2_libelle
   FROM ((((((calanque.revendication
     LEFT JOIN calanque.revend_support_niv2 USING (revend_support_niv2_id))
     LEFT JOIN calanque.revend_support_niv1 USING (revend_support_niv1_id))
     LEFT JOIN calanque.registre_argument_niv2 USING (registre_argument_niv2_id))
     LEFT JOIN calanque.registre_argument_niv1 USING (registre_argument_niv1_id))
     LEFT JOIN calanque.revendication_niv2 USING (revendication_niv2_id))
     LEFT JOIN calanque.revendication_niv1 USING (revendication_niv1_id))
  ORDER BY revendication.intervention_id, revendication.revendication_id;;
-- ddl-end --
ALTER VIEW calanque.v_revendication OWNER TO "sandrine.lyser";
-- ddl-end --

-- object: calanque.v_solution | type: VIEW --
-- DROP VIEW IF EXISTS calanque.v_solution CASCADE;
CREATE VIEW calanque.v_solution
AS 

 SELECT solution_proposee.intervention_id,
    intervention.acteur_id,
    solution_proposee.solution_proposee_id,
    solution_proposee.solution_proposee_libelle
   FROM (calanque.solution_proposee
     LEFT JOIN calanque.intervention USING (intervention_id))
  ORDER BY solution_proposee.intervention_id, solution_proposee.solution_proposee_id;;
-- ddl-end --
ALTER VIEW calanque.v_solution OWNER TO "sandrine.lyser";
-- ddl-end --

-- object: calanque.v_modesaction | type: VIEW --
-- DROP VIEW IF EXISTS calanque.v_modesaction CASCADE;
CREATE VIEW calanque.v_modesaction
AS 

 SELECT intervention.acteur_id,
    action.action_id,
    action.intervention_id,
    action.action_type_id,
    action.action_mode_id,
    action.action_echelle_id,
    concat(to_char(action.action_date, 'FMDD FMmonth FMYYYY'::text), action.action_date_complement) AS action_date_txt,
    action.action_detail,
    action_type.action_type_libelle,
    action_mode.action_mode_libelle,
    action_echelle.action_echelle_libelle
   FROM ((((calanque.action
     LEFT JOIN calanque.action_type USING (action_type_id))
     LEFT JOIN calanque.action_mode USING (action_mode_id))
     LEFT JOIN calanque.action_echelle USING (action_echelle_id))
     LEFT JOIN calanque.intervention USING (intervention_id))
  ORDER BY action.intervention_id, action.action_id;;
-- ddl-end --
ALTER VIEW calanque.v_modesaction OWNER TO "sandrine.lyser";
-- ddl-end --

-- object: calanque.v_mandat_acteur | type: VIEW --
-- DROP VIEW IF EXISTS calanque.v_mandat_acteur CASCADE;
CREATE VIEW calanque.v_mandat_acteur
AS 

 SELECT acteur_mandat.mandat_type_id,
    acteur_mandat.acteur_mandat_id,
    acteur_mandat.acteur_id,
    acteur_mandat.mandat_detail,
    mandat_type.mandat_type_libelle
   FROM (calanque.acteur_mandat
     LEFT JOIN calanque.mandat_type USING (mandat_type_id))
  ORDER BY acteur_mandat.acteur_id;;
-- ddl-end --
ALTER VIEW calanque.v_mandat_acteur OWNER TO "sandrine.lyser";
-- ddl-end --

-- object: calanque.v_structure_acteur | type: VIEW --
-- DROP VIEW IF EXISTS calanque.v_structure_acteur CASCADE;
CREATE VIEW calanque.v_structure_acteur
AS 

 SELECT acteur_structure.structure_type_id,
    acteur_structure.acteur_structure_id,
    acteur_structure.acteur_id,
    acteur_structure.structure_statut,
    acteur_structure.structure_statut_detail,
    structure_type.structure_type_libelle
   FROM (calanque.acteur_structure
     LEFT JOIN calanque.structure_type USING (structure_type_id))
  ORDER BY acteur_structure.acteur_id;;
-- ddl-end --
ALTER VIEW calanque.v_structure_acteur OWNER TO "sandrine.lyser";
-- ddl-end --

-- object: acteur_niv3_acteur_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.acteur DROP CONSTRAINT IF EXISTS acteur_niv3_acteur_fk CASCADE;
ALTER TABLE calanque.acteur ADD CONSTRAINT acteur_niv3_acteur_fk FOREIGN KEY (acteur_niv3_id)
REFERENCES calanque.acteur_niv3 (acteur_niv3_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: particulier_resident_type_acteur_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.acteur DROP CONSTRAINT IF EXISTS particulier_resident_type_acteur_fk CASCADE;
ALTER TABLE calanque.acteur ADD CONSTRAINT particulier_resident_type_acteur_fk FOREIGN KEY (particulier_resident_type_id)
REFERENCES calanque.particulier_resident_type (particulier_resident_type_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: acteur_acteur_mandat_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.acteur_mandat DROP CONSTRAINT IF EXISTS acteur_acteur_mandat_fk CASCADE;
ALTER TABLE calanque.acteur_mandat ADD CONSTRAINT acteur_acteur_mandat_fk FOREIGN KEY (acteur_id)
REFERENCES calanque.acteur (acteur_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: mandat_type_acteur_mandat_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.acteur_mandat DROP CONSTRAINT IF EXISTS mandat_type_acteur_mandat_fk CASCADE;
ALTER TABLE calanque.acteur_mandat ADD CONSTRAINT mandat_type_acteur_mandat_fk FOREIGN KEY (mandat_type_id)
REFERENCES calanque.mandat_type (mandat_type_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: acteur_niv1_acteur_niv2_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.acteur_niv2 DROP CONSTRAINT IF EXISTS acteur_niv1_acteur_niv2_fk CASCADE;
ALTER TABLE calanque.acteur_niv2 ADD CONSTRAINT acteur_niv1_acteur_niv2_fk FOREIGN KEY (acteur_niv1_id)
REFERENCES calanque.acteur_niv1 (acteur_niv1_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: acteur_niv2_acteur_niv3_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.acteur_niv3 DROP CONSTRAINT IF EXISTS acteur_niv2_acteur_niv3_fk CASCADE;
ALTER TABLE calanque.acteur_niv3 ADD CONSTRAINT acteur_niv2_acteur_niv3_fk FOREIGN KEY (acteur_niv2_id)
REFERENCES calanque.acteur_niv2 (acteur_niv2_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: acteur_acteur_structure_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.acteur_structure DROP CONSTRAINT IF EXISTS acteur_acteur_structure_fk CASCADE;
ALTER TABLE calanque.acteur_structure ADD CONSTRAINT acteur_acteur_structure_fk FOREIGN KEY (acteur_id)
REFERENCES calanque.acteur (acteur_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: structure_type_acteur_structure_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.acteur_structure DROP CONSTRAINT IF EXISTS structure_type_acteur_structure_fk CASCADE;
ALTER TABLE calanque.acteur_structure ADD CONSTRAINT structure_type_acteur_structure_fk FOREIGN KEY (structure_type_id)
REFERENCES calanque.structure_type (structure_type_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: action_echelle_action_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.action DROP CONSTRAINT IF EXISTS action_echelle_action_fk CASCADE;
ALTER TABLE calanque.action ADD CONSTRAINT action_echelle_action_fk FOREIGN KEY (action_echelle_id)
REFERENCES calanque.action_echelle (action_echelle_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: action_mode_action_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.action DROP CONSTRAINT IF EXISTS action_mode_action_fk CASCADE;
ALTER TABLE calanque.action ADD CONSTRAINT action_mode_action_fk FOREIGN KEY (action_mode_id)
REFERENCES calanque.action_mode (action_mode_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: action_type_action_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.action DROP CONSTRAINT IF EXISTS action_type_action_fk CASCADE;
ALTER TABLE calanque.action ADD CONSTRAINT action_type_action_fk FOREIGN KEY (action_type_id)
REFERENCES calanque.action_type (action_type_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: intervention_action_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.action DROP CONSTRAINT IF EXISTS intervention_action_fk CASCADE;
ALTER TABLE calanque.action ADD CONSTRAINT intervention_action_fk FOREIGN KEY (intervention_id)
REFERENCES calanque.intervention (intervention_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: journal_article_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.article DROP CONSTRAINT IF EXISTS journal_article_fk CASCADE;
ALTER TABLE calanque.article ADD CONSTRAINT journal_article_fk FOREIGN KEY (journal_id)
REFERENCES calanque.journal (journal_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: action_type_article_conflit_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.article_conflit DROP CONSTRAINT IF EXISTS action_type_article_conflit_fk CASCADE;
ALTER TABLE calanque.article_conflit ADD CONSTRAINT action_type_article_conflit_fk FOREIGN KEY (action_type_id)
REFERENCES calanque.action_type (action_type_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: article_article_conflit_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.article_conflit DROP CONSTRAINT IF EXISTS article_article_conflit_fk CASCADE;
ALTER TABLE calanque.article_conflit ADD CONSTRAINT article_article_conflit_fk FOREIGN KEY (article_id)
REFERENCES calanque.article (article_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: conflit_article_conflit_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.article_conflit DROP CONSTRAINT IF EXISTS conflit_article_conflit_fk CASCADE;
ALTER TABLE calanque.article_conflit ADD CONSTRAINT conflit_article_conflit_fk FOREIGN KEY (conflit_id)
REFERENCES calanque.conflit (conflit_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: article_article_document_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.article_document DROP CONSTRAINT IF EXISTS article_article_document_fk CASCADE;
ALTER TABLE calanque.article_document ADD CONSTRAINT article_article_document_fk FOREIGN KEY (article_id)
REFERENCES calanque.article (article_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: document_article_document_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.article_document DROP CONSTRAINT IF EXISTS document_article_document_fk CASCADE;
ALTER TABLE calanque.article_document ADD CONSTRAINT document_article_document_fk FOREIGN KEY (document_id)
REFERENCES calanque.document (document_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: article_article_intervention_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.article_intervention DROP CONSTRAINT IF EXISTS article_article_intervention_fk CASCADE;
ALTER TABLE calanque.article_intervention ADD CONSTRAINT article_article_intervention_fk FOREIGN KEY (article_id)
REFERENCES calanque.article (article_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: intervention_article_intervention_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.article_intervention DROP CONSTRAINT IF EXISTS intervention_article_intervention_fk CASCADE;
ALTER TABLE calanque.article_intervention ADD CONSTRAINT intervention_article_intervention_fk FOREIGN KEY (intervention_id)
REFERENCES calanque.intervention (intervention_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: bien_support_niv1_bien_support_niv2_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.bien_support_niv2 DROP CONSTRAINT IF EXISTS bien_support_niv1_bien_support_niv2_fk CASCADE;
ALTER TABLE calanque.bien_support_niv2 ADD CONSTRAINT bien_support_niv1_bien_support_niv2_fk FOREIGN KEY (bien_support_niv1_id)
REFERENCES calanque.bien_support_niv1 (bien_support_niv1_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: perimetre_conflit_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.conflit DROP CONSTRAINT IF EXISTS perimetre_conflit_fk CASCADE;
ALTER TABLE calanque.conflit ADD CONSTRAINT perimetre_conflit_fk FOREIGN KEY (perimetre_id)
REFERENCES calanque.perimetre (perimetre_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: mime_type_document_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.document DROP CONSTRAINT IF EXISTS mime_type_document_fk CASCADE;
ALTER TABLE calanque.document ADD CONSTRAINT mime_type_document_fk FOREIGN KEY (mime_type_id)
REFERENCES calanque.mime_type (mime_type_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: expert_entretien_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.entretien DROP CONSTRAINT IF EXISTS expert_entretien_fk CASCADE;
ALTER TABLE calanque.entretien ADD CONSTRAINT expert_entretien_fk FOREIGN KEY (expert_id)
REFERENCES calanque.expert (expert_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: conflit_entretien_conflit_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.entretien_conflit DROP CONSTRAINT IF EXISTS conflit_entretien_conflit_fk CASCADE;
ALTER TABLE calanque.entretien_conflit ADD CONSTRAINT conflit_entretien_conflit_fk FOREIGN KEY (conflit_id)
REFERENCES calanque.conflit (conflit_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: entretien_entretien_conflit_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.entretien_conflit DROP CONSTRAINT IF EXISTS entretien_entretien_conflit_fk CASCADE;
ALTER TABLE calanque.entretien_conflit ADD CONSTRAINT entretien_entretien_conflit_fk FOREIGN KEY (entretien_id)
REFERENCES calanque.entretien (entretien_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: document_entretien_document_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.entretien_document DROP CONSTRAINT IF EXISTS document_entretien_document_fk CASCADE;
ALTER TABLE calanque.entretien_document ADD CONSTRAINT document_entretien_document_fk FOREIGN KEY (document_id)
REFERENCES calanque.document (document_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: entretien_entretien_document_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.entretien_document DROP CONSTRAINT IF EXISTS entretien_entretien_document_fk CASCADE;
ALTER TABLE calanque.entretien_document ADD CONSTRAINT entretien_entretien_document_fk FOREIGN KEY (entretien_id)
REFERENCES calanque.entretien (entretien_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: entretien_entretien_intervention_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.entretien_intervention DROP CONSTRAINT IF EXISTS entretien_entretien_intervention_fk CASCADE;
ALTER TABLE calanque.entretien_intervention ADD CONSTRAINT entretien_entretien_intervention_fk FOREIGN KEY (entretien_id)
REFERENCES calanque.entretien (entretien_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: intervention_entretien_intervention_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.entretien_intervention DROP CONSTRAINT IF EXISTS intervention_entretien_intervention_fk CASCADE;
ALTER TABLE calanque.entretien_intervention ADD CONSTRAINT intervention_entretien_intervention_fk FOREIGN KEY (intervention_id)
REFERENCES calanque.intervention (intervention_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: acteur_expert_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.expert DROP CONSTRAINT IF EXISTS acteur_expert_fk CASCADE;
ALTER TABLE calanque.expert ADD CONSTRAINT acteur_expert_fk FOREIGN KEY (acteur_id)
REFERENCES calanque.acteur (acteur_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: acteur_intervention_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.intervention DROP CONSTRAINT IF EXISTS acteur_intervention_fk CASCADE;
ALTER TABLE calanque.intervention ADD CONSTRAINT acteur_intervention_fk FOREIGN KEY (acteur_id)
REFERENCES calanque.acteur (acteur_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: conflit_intervention_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.intervention DROP CONSTRAINT IF EXISTS conflit_intervention_fk CASCADE;
ALTER TABLE calanque.intervention ADD CONSTRAINT conflit_intervention_fk FOREIGN KEY (conflit_id)
REFERENCES calanque.conflit (conflit_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: position_usage_activite_intervention_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.intervention DROP CONSTRAINT IF EXISTS position_usage_activite_intervention_fk CASCADE;
ALTER TABLE calanque.intervention ADD CONSTRAINT position_usage_activite_intervention_fk FOREIGN KEY (position_usage_activite_id)
REFERENCES calanque.position_usage_activite (position_usage_activite_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: role_intervention_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.intervention DROP CONSTRAINT IF EXISTS role_intervention_fk CASCADE;
ALTER TABLE calanque.intervention ADD CONSTRAINT role_intervention_fk FOREIGN KEY (role_id)
REFERENCES calanque.role (role_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: usage_activite_niv2_intervention_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.intervention DROP CONSTRAINT IF EXISTS usage_activite_niv2_intervention_fk CASCADE;
ALTER TABLE calanque.intervention ADD CONSTRAINT usage_activite_niv2_intervention_fk FOREIGN KEY (usage_activite_niv2_id)
REFERENCES calanque.usage_activite_niv2 (usage_activite_niv2_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: intervention_intervention_juridique_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.intervention_juridique DROP CONSTRAINT IF EXISTS intervention_intervention_juridique_fk CASCADE;
ALTER TABLE calanque.intervention_juridique ADD CONSTRAINT intervention_intervention_juridique_fk FOREIGN KEY (intervention_id)
REFERENCES calanque.intervention (intervention_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: juridique_intervention_juridique_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.intervention_juridique DROP CONSTRAINT IF EXISTS juridique_intervention_juridique_fk CASCADE;
ALTER TABLE calanque.intervention_juridique ADD CONSTRAINT juridique_intervention_juridique_fk FOREIGN KEY (juridique_id)
REFERENCES calanque.juridique (juridique_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: position_acteur_intervention_juridique_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.intervention_juridique DROP CONSTRAINT IF EXISTS position_acteur_intervention_juridique_fk CASCADE;
ALTER TABLE calanque.intervention_juridique ADD CONSTRAINT position_acteur_intervention_juridique_fk FOREIGN KEY (position_acteur_id)
REFERENCES calanque.position_acteur (position_acteur_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: qualite_appel_intervention_juridique_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.intervention_juridique DROP CONSTRAINT IF EXISTS qualite_appel_intervention_juridique_fk CASCADE;
ALTER TABLE calanque.intervention_juridique ADD CONSTRAINT qualite_appel_intervention_juridique_fk FOREIGN KEY (qualite_appel_id)
REFERENCES calanque.qualite_appel (qualite_appel_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: qualite_appel_intervention_juridique_fk1 | type: CONSTRAINT --
-- ALTER TABLE calanque.intervention_juridique DROP CONSTRAINT IF EXISTS qualite_appel_intervention_juridique_fk1 CASCADE;
ALTER TABLE calanque.intervention_juridique ADD CONSTRAINT qualite_appel_intervention_juridique_fk1 FOREIGN KEY (qualite_pourvoi_id)
REFERENCES calanque.qualite_appel (qualite_appel_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: acte_contentieux_juridique_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.juridique DROP CONSTRAINT IF EXISTS acte_contentieux_juridique_fk CASCADE;
ALTER TABLE calanque.juridique ADD CONSTRAINT acte_contentieux_juridique_fk FOREIGN KEY (acte_contentieux_id)
REFERENCES calanque.acte_contentieux (acte_contentieux_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: decision_appel_juridique_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.juridique DROP CONSTRAINT IF EXISTS decision_appel_juridique_fk CASCADE;
ALTER TABLE calanque.juridique ADD CONSTRAINT decision_appel_juridique_fk FOREIGN KEY (decision_appel_id)
REFERENCES calanque.decision_appel (decision_appel_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: decision_cassation_sens_juridique_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.juridique DROP CONSTRAINT IF EXISTS decision_cassation_sens_juridique_fk CASCADE;
ALTER TABLE calanque.juridique ADD CONSTRAINT decision_cassation_sens_juridique_fk FOREIGN KEY (decision_cassation_id)
REFERENCES calanque.decision_cassation (decision_cassation_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: juridiction_juridique_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.juridique DROP CONSTRAINT IF EXISTS juridiction_juridique_fk CASCADE;
ALTER TABLE calanque.juridique ADD CONSTRAINT juridiction_juridique_fk FOREIGN KEY (juridiction_id)
REFERENCES calanque.juridiction (juridiction_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: juridique_sous_domaine_juridique_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.juridique DROP CONSTRAINT IF EXISTS juridique_sous_domaine_juridique_fk CASCADE;
ALTER TABLE calanque.juridique ADD CONSTRAINT juridique_sous_domaine_juridique_fk FOREIGN KEY (juridique_sous_domaine_id)
REFERENCES calanque.juridique_sous_domaine (juridique_sous_domaine_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: nature_requete_juridique_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.juridique DROP CONSTRAINT IF EXISTS nature_requete_juridique_fk CASCADE;
ALTER TABLE calanque.juridique ADD CONSTRAINT nature_requete_juridique_fk FOREIGN KEY (nature_requete_id)
REFERENCES calanque.nature_requete (nature_requete_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: nature_travaux_juridique_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.juridique DROP CONSTRAINT IF EXISTS nature_travaux_juridique_fk CASCADE;
ALTER TABLE calanque.juridique ADD CONSTRAINT nature_travaux_juridique_fk FOREIGN KEY (nature_travaux_id)
REFERENCES calanque.nature_travaux (nature_travaux_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: type_ouvrage_perm_constr_juridique_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.juridique DROP CONSTRAINT IF EXISTS type_ouvrage_perm_constr_juridique_fk CASCADE;
ALTER TABLE calanque.juridique ADD CONSTRAINT type_ouvrage_perm_constr_juridique_fk FOREIGN KEY (type_ouvrage_perm_constr_id)
REFERENCES calanque.type_ouvrage_perm_constr (type_ouvrage_perm_constr_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: conflit_juridique_conflit_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.juridique_conflit DROP CONSTRAINT IF EXISTS conflit_juridique_conflit_fk CASCADE;
ALTER TABLE calanque.juridique_conflit ADD CONSTRAINT conflit_juridique_conflit_fk FOREIGN KEY (conflit_id)
REFERENCES calanque.conflit (conflit_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: juridique_juridique_conflit_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.juridique_conflit DROP CONSTRAINT IF EXISTS juridique_juridique_conflit_fk CASCADE;
ALTER TABLE calanque.juridique_conflit ADD CONSTRAINT juridique_juridique_conflit_fk FOREIGN KEY (juridique_id)
REFERENCES calanque.juridique (juridique_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: document_juridique_document_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.juridique_document DROP CONSTRAINT IF EXISTS document_juridique_document_fk CASCADE;
ALTER TABLE calanque.juridique_document ADD CONSTRAINT document_juridique_document_fk FOREIGN KEY (document_id)
REFERENCES calanque.document (document_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: juridique_juridique_document_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.juridique_document DROP CONSTRAINT IF EXISTS juridique_juridique_document_fk CASCADE;
ALTER TABLE calanque.juridique_document ADD CONSTRAINT juridique_juridique_document_fk FOREIGN KEY (juridique_id)
REFERENCES calanque.juridique (juridique_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: juridique_domaine_juridique_sous_domaine_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.juridique_sous_domaine DROP CONSTRAINT IF EXISTS juridique_domaine_juridique_sous_domaine_fk CASCADE;
ALTER TABLE calanque.juridique_sous_domaine ADD CONSTRAINT juridique_domaine_juridique_sous_domaine_fk FOREIGN KEY (juridique_domaine_id)
REFERENCES calanque.juridique_domaine (juridique_domaine_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: commune_localisation_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.localisation DROP CONSTRAINT IF EXISTS commune_localisation_fk CASCADE;
ALTER TABLE calanque.localisation ADD CONSTRAINT commune_localisation_fk FOREIGN KEY (insee)
REFERENCES calanque.commune (insee) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: type_perimetre_objet_niv1_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.objet_niv1 DROP CONSTRAINT IF EXISTS type_perimetre_objet_niv1_fk CASCADE;
ALTER TABLE calanque.objet_niv1 ADD CONSTRAINT type_perimetre_objet_niv1_fk FOREIGN KEY (type_perimetre_id)
REFERENCES calanque.type_perimetre (type_perimetre_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: objet_niv1_objet_niv2_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.objet_niv2 DROP CONSTRAINT IF EXISTS objet_niv1_objet_niv2_fk CASCADE;
ALTER TABLE calanque.objet_niv2 ADD CONSTRAINT objet_niv1_objet_niv2_fk FOREIGN KEY (objet_niv1_id)
REFERENCES calanque.objet_niv1 (objet_niv1_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: bien_support_niv2_perimetre_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.perimetre DROP CONSTRAINT IF EXISTS bien_support_niv2_perimetre_fk CASCADE;
ALTER TABLE calanque.perimetre ADD CONSTRAINT bien_support_niv2_perimetre_fk FOREIGN KEY (bien_support_niv2_id)
REFERENCES calanque.bien_support_niv2 (bien_support_niv2_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: echelle_perimetre_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.perimetre DROP CONSTRAINT IF EXISTS echelle_perimetre_fk CASCADE;
ALTER TABLE calanque.perimetre ADD CONSTRAINT echelle_perimetre_fk FOREIGN KEY (echelle_id)
REFERENCES calanque.echelle (echelle_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: objet_niv2_perimetre_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.perimetre DROP CONSTRAINT IF EXISTS objet_niv2_perimetre_fk CASCADE;
ALTER TABLE calanque.perimetre ADD CONSTRAINT objet_niv2_perimetre_fk FOREIGN KEY (objet_niv2_id)
REFERENCES calanque.objet_niv2 (objet_niv2_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: recurrence_perimetre_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.perimetre DROP CONSTRAINT IF EXISTS recurrence_perimetre_fk CASCADE;
ALTER TABLE calanque.perimetre ADD CONSTRAINT recurrence_perimetre_fk FOREIGN KEY (recurrence_id)
REFERENCES calanque.recurrence (recurrence_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: type_perimetre_perimetre_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.perimetre DROP CONSTRAINT IF EXISTS type_perimetre_perimetre_fk CASCADE;
ALTER TABLE calanque.perimetre ADD CONSTRAINT type_perimetre_perimetre_fk FOREIGN KEY (type_perimetre_id)
REFERENCES calanque.type_perimetre (type_perimetre_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: localisation_perimetre_localisation_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.perimetre_localisation DROP CONSTRAINT IF EXISTS localisation_perimetre_localisation_fk CASCADE;
ALTER TABLE calanque.perimetre_localisation ADD CONSTRAINT localisation_perimetre_localisation_fk FOREIGN KEY (localisation_id)
REFERENCES calanque.localisation (localisation_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: perimetre_perimetre_localisation_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.perimetre_localisation DROP CONSTRAINT IF EXISTS perimetre_perimetre_localisation_fk CASCADE;
ALTER TABLE calanque.perimetre_localisation ADD CONSTRAINT perimetre_perimetre_localisation_fk FOREIGN KEY (perimetre_id)
REFERENCES calanque.perimetre (perimetre_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: registre_argument_niv1_registre_argument_niv2_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.registre_argument_niv2 DROP CONSTRAINT IF EXISTS registre_argument_niv1_registre_argument_niv2_fk CASCADE;
ALTER TABLE calanque.registre_argument_niv2 ADD CONSTRAINT registre_argument_niv1_registre_argument_niv2_fk FOREIGN KEY (registre_argument_niv1_id)
REFERENCES calanque.registre_argument_niv1 (registre_argument_niv1_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: conflit_resolution_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.resolution DROP CONSTRAINT IF EXISTS conflit_resolution_fk CASCADE;
ALTER TABLE calanque.resolution ADD CONSTRAINT conflit_resolution_fk FOREIGN KEY (conflit_id)
REFERENCES calanque.conflit (conflit_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: resolution_acteur_resolution_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.resolution DROP CONSTRAINT IF EXISTS resolution_acteur_resolution_fk CASCADE;
ALTER TABLE calanque.resolution ADD CONSTRAINT resolution_acteur_resolution_fk FOREIGN KEY (resolution_acteur_id)
REFERENCES calanque.resolution_acteur (resolution_acteur_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: resolution_echelle_resolution_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.resolution DROP CONSTRAINT IF EXISTS resolution_echelle_resolution_fk CASCADE;
ALTER TABLE calanque.resolution ADD CONSTRAINT resolution_echelle_resolution_fk FOREIGN KEY (resolution_echelle_id)
REFERENCES calanque.resolution_echelle (resolution_echelle_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: resolution_mode_niv2_resolution_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.resolution DROP CONSTRAINT IF EXISTS resolution_mode_niv2_resolution_fk CASCADE;
ALTER TABLE calanque.resolution ADD CONSTRAINT resolution_mode_niv2_resolution_fk FOREIGN KEY (resolution_mode_niv2_id)
REFERENCES calanque.resolution_mode_niv2 (resolution_mode_niv2_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: resolution_nature_resolution_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.resolution DROP CONSTRAINT IF EXISTS resolution_nature_resolution_fk CASCADE;
ALTER TABLE calanque.resolution ADD CONSTRAINT resolution_nature_resolution_fk FOREIGN KEY (resolution_nature_id)
REFERENCES calanque.resolution_nature (resolution_nature_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: solution_proposee_resolution_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.resolution DROP CONSTRAINT IF EXISTS solution_proposee_resolution_fk CASCADE;
ALTER TABLE calanque.resolution ADD CONSTRAINT solution_proposee_resolution_fk FOREIGN KEY (solution_proposee_id)
REFERENCES calanque.solution_proposee (solution_proposee_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: resolution_mode_niv1_resolution_mode_niv2_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.resolution_mode_niv2 DROP CONSTRAINT IF EXISTS resolution_mode_niv1_resolution_mode_niv2_fk CASCADE;
ALTER TABLE calanque.resolution_mode_niv2 ADD CONSTRAINT resolution_mode_niv1_resolution_mode_niv2_fk FOREIGN KEY (resolution_mode_niv1_id)
REFERENCES calanque.resolution_mode_niv1 (resolution_mode_niv1_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: revend_support_niv1_revend_support_niv2_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.revend_support_niv2 DROP CONSTRAINT IF EXISTS revend_support_niv1_revend_support_niv2_fk CASCADE;
ALTER TABLE calanque.revend_support_niv2 ADD CONSTRAINT revend_support_niv1_revend_support_niv2_fk FOREIGN KEY (revend_support_niv1_id)
REFERENCES calanque.revend_support_niv1 (revend_support_niv1_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: intervention_revendication_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.revendication DROP CONSTRAINT IF EXISTS intervention_revendication_fk CASCADE;
ALTER TABLE calanque.revendication ADD CONSTRAINT intervention_revendication_fk FOREIGN KEY (intervention_id)
REFERENCES calanque.intervention (intervention_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: registre_argument_niv2_revendication_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.revendication DROP CONSTRAINT IF EXISTS registre_argument_niv2_revendication_fk CASCADE;
ALTER TABLE calanque.revendication ADD CONSTRAINT registre_argument_niv2_revendication_fk FOREIGN KEY (registre_argument_niv2_id)
REFERENCES calanque.registre_argument_niv2 (registre_argument_niv2_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: revend_support_niv2_revendication_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.revendication DROP CONSTRAINT IF EXISTS revend_support_niv2_revendication_fk CASCADE;
ALTER TABLE calanque.revendication ADD CONSTRAINT revend_support_niv2_revendication_fk FOREIGN KEY (revend_support_niv2_id)
REFERENCES calanque.revend_support_niv2 (revend_support_niv2_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: revendication_niv2_revendication_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.revendication DROP CONSTRAINT IF EXISTS revendication_niv2_revendication_fk CASCADE;
ALTER TABLE calanque.revendication ADD CONSTRAINT revendication_niv2_revendication_fk FOREIGN KEY (revendication_niv2_id)
REFERENCES calanque.revendication_niv2 (revendication_niv2_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: revendication_niv1_revendication_niv2_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.revendication_niv2 DROP CONSTRAINT IF EXISTS revendication_niv1_revendication_niv2_fk CASCADE;
ALTER TABLE calanque.revendication_niv2 ADD CONSTRAINT revendication_niv1_revendication_niv2_fk FOREIGN KEY (revendication_niv1_id)
REFERENCES calanque.revendication_niv1 (revendication_niv1_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: intervention_solution_proposee_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.solution_proposee DROP CONSTRAINT IF EXISTS intervention_solution_proposee_fk CASCADE;
ALTER TABLE calanque.solution_proposee ADD CONSTRAINT intervention_solution_proposee_fk FOREIGN KEY (intervention_id)
REFERENCES calanque.intervention (intervention_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: position_usage_activite_usage_activite_niv1_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.usage_activite_niv1 DROP CONSTRAINT IF EXISTS position_usage_activite_usage_activite_niv1_fk CASCADE;
ALTER TABLE calanque.usage_activite_niv1 ADD CONSTRAINT position_usage_activite_usage_activite_niv1_fk FOREIGN KEY (position_usage_activite_id)
REFERENCES calanque.position_usage_activite (position_usage_activite_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: usage_activite_niv1_usage_activite_niv2_fk | type: CONSTRAINT --
-- ALTER TABLE calanque.usage_activite_niv2 DROP CONSTRAINT IF EXISTS usage_activite_niv1_usage_activite_niv2_fk CASCADE;
ALTER TABLE calanque.usage_activite_niv2 ADD CONSTRAINT usage_activite_niv1_usage_activite_niv2_fk FOREIGN KEY (usage_activite_niv1_id)
REFERENCES calanque.usage_activite_niv1 (usage_activite_niv1_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


