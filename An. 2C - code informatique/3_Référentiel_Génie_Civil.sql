-- Script de création de base GraceTHD V3 : référentiel <GénieCivil>

-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: ---



-- object: gracethd_genie_civil | type: SCHEMA --
-- DROP SCHEMA IF EXISTS gracethd_genie_civil CASCADE;
CREATE SCHEMA gracethd_genie_civil;
-- ddl-end --
-- ALTER SCHEMA gracethd_genie_civil OWNER TO postgres;
-- ddl-end --


SET search_path TO gracethd_genie_civil,pg_catalog,public,gracethd_commun;
-- ddl-end --

-- -- object: public.geometry | type: TYPE --
-- -- DROP TYPE IF EXISTS public.geometry CASCADE;
-- CREATE TYPE public.geometry;
-- -- ddl-end --
-- 
-- object: gracethd_genie_civil.t_pointaccueil | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_genie_civil.t_pointaccueil CASCADE;
CREATE TABLE gracethd_genie_civil.t_pointaccueil (
	pa_code character varying(254) NOT NULL,
	pa_perirec character varying(254),
	pa_codtemp character varying(254),
	pa_a_struc character varying(100),
	pa_a_haut numeric(5,2),
	pa_rotatio numeric(5,2),
	pa_datecon timestamp,
	pa_codeext character varying(254),
	pa_prop character varying(20),
	pa_gest character varying(20),
	pa_typephy character varying(3),
	pa_nature character varying(20),
	pa_secu character varying(1),
	pa_dtclass character varying(2),
	geom public.geometry,
	pa_comment character varying(254),
	pa_creadat  timestamp,
	pa_majdate  timestamp,
	pa_majsrc character varying(254),
	pa_abddate timestamp,
	pa_abdsrc character varying(254),
	CONSTRAINT "t_pointaccueil_pk " PRIMARY KEY (pa_code),
	CONSTRAINT t_pointaccueil_pa_codeext_key UNIQUE (pa_codeext),
	CONSTRAINT pa_codeext_unique UNIQUE (pa_codeext),
	CONSTRAINT pa_codtemp_unique UNIQUE (pa_codtemp)

);
-- ddl-end --
COMMENT ON TABLE gracethd_genie_civil.t_pointaccueil IS E'Site ou point technique ( poteau, chambre,traverse, crochet de façade, fixation d''encorbellement…etc.)  créé lors du déploiement du réseau de fibre optique.';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_code IS E'Code du ponctuel';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_perirec IS E'Identifiant du périmètre récolé livré à un instant t';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_codtemp IS E'Code temporaire avant création du codeext.';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_a_struc IS E'Simple, Moisé, Haubané, Couple, …';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_a_haut IS E'Hauteur en mètre entre le sol et la base de l''infrastructure (réseau en façade ou aérien)';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_rotatio IS E'Angle du grand axe du point technique en degrés dans le sens retrograde (sens des aiguilles d''une montre) à partir du Nord.';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_datecon IS E'Date de construction';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_codeext IS E'Code chez un tiers ou dans une autre base de données.';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_prop IS E'Propriétaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_gest IS E'Gestionnaire du point d''accueil';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_typephy IS E'pa_typephy';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_nature IS E'Nature du point technique/site .';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_secu IS E'Point technique/site équipé d''un système de verrouillage, ou tout autre système permettant d''en sécuriser l''accès.';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_dtclass IS E'Classe de précision du point d''accueil au sens du décret DT/DICT.';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.geom IS E'Géométrie du point accueil';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_pointaccueil.pa_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_genie_civil.t_pointaccueil OWNER TO postgres;
-- ddl-end --

-- object: gracethd_genie_civil.t_tranchee | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_genie_civil.t_tranchee CASCADE;
CREATE TABLE gracethd_genie_civil.t_tranchee (
	tr_code character varying(254) NOT NULL,
	tr_perirec character varying(254),
	tr_pa1 character varying(254),
	tr_pa2 character varying(254),
	tr_compo character varying(254),
	tr_couptyp character varying(254),
	tr_lgreel numeric(8,2),
	tr_dtclass character varying(2),
	geom public.geometry,
	tr_creadat  timestamp,
	tr_majdate  timestamp,
	tr_majsrc character varying(254),
	tr_abddate timestamp,
	tr_abdsrc character varying(254),
	tr_comment character varying(254),
	CONSTRAINT "t_tranchee_pk " PRIMARY KEY (tr_code),
	CONSTRAINT tr_code_unique UNIQUE (tr_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_genie_civil.t_tranchee IS E'Élément linéaire de Génie Civil créé lors du déploiement du réseau de fibre optique.';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_tranchee.tr_code IS E'Code de la tranchée.';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_tranchee.tr_perirec IS E'Identifiant du périmètre récolé livré à un instant t';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_tranchee.tr_pa1 IS E'Référence au point d''accueil d’une extrémité de l''ensemble de tranchées - constituant un cheminement - dont la tranchée fait partie.';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_tranchee.tr_pa2 IS E'Référence au point d''accueil de l''autre extrémité de l''ensemble de tranchées - constituant un cheminement - dont la tranchée fait partie.';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_tranchee.tr_compo IS E'Attribut d''aggrégation décrivant la composition du multitubulaire.';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_tranchee.tr_couptyp IS E'Référence à une coupe type';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_tranchee.tr_lgreel IS E'Longueur en mètres mesurée sur le terrain ou estimée.';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_tranchee.tr_dtclass IS E'Classe de précision au sens du décret DT-DICT.';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_tranchee.tr_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_tranchee.tr_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_tranchee.tr_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_tranchee.tr_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_tranchee.tr_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_tranchee.tr_comment IS E'Commentaire';
-- ddl-end --
-- ALTER TABLE gracethd_genie_civil.t_tranchee OWNER TO postgres;
-- ddl-end --

-- object: gracethd_genie_civil.t_point_leve | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_genie_civil.t_point_leve CASCADE;
CREATE TABLE gracethd_genie_civil.t_point_leve (
	pl_code character varying(254) NOT NULL,
	pl_x numeric,
	pl_y numeric,
	pl_z numeric,
	pl_charge numeric(6,2),
	geom public.geometry,
	CONSTRAINT "t_point_leve_pk " PRIMARY KEY (pl_code),
	CONSTRAINT pl_code_unique UNIQUE (pl_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_genie_civil.t_point_leve IS E'Cette classe décrit les points levés spécifiques au réseau et permet d’indiquer la profondeur ou l’altimétrie connue en certains points des tranchées. L’indication de la charge à la génératrice a pour objet de répondre à l’obligation de mentionner les points de l’ouvrage qui ne satisferaient pas à l’éventuelle règle de profondeur minimale réglementaire à la date de pose de l’ouvrage. Cette information est intrinsèquement moins fiable que les indications d’altitude de l’ouvrage, le terrain naturel ayant pu évoluer depuis la pose. Elle est donc à limiter à cet usage.';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_point_leve.pl_code IS E'Code du point levé';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_point_leve.pl_x IS E'X en lambert 93';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_point_leve.pl_y IS E'Y en lambert 93';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_point_leve.pl_z IS E'Z de la génératrice supérieure de réseau en IGN69';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_point_leve.pl_charge IS E'Charge (profondeur) de la génératrice supérieure du réseau (=0 pour les affleurants) en cm';
-- ddl-end --
COMMENT ON COLUMN gracethd_genie_civil.t_point_leve.geom IS E'Géométrie du point levé';
-- ddl-end --
-- ALTER TABLE gracethd_genie_civil.t_point_leve OWNER TO postgres;
-- ddl-end --

-- object: gracethd_genie_civil.l_pointaccueil_type_phy | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_genie_civil.l_pointaccueil_type_phy CASCADE;
CREATE TABLE gracethd_genie_civil.l_pointaccueil_type_phy (
	code character varying(3) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_pointaccueil_type_phy_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_genie_civil.l_pointaccueil_type_phy OWNER TO postgres;
-- ddl-end --

-- object: gracethd_genie_civil.l_pointaccueil_nature | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_genie_civil.l_pointaccueil_nature CASCADE;
CREATE TABLE gracethd_genie_civil.l_pointaccueil_nature (
	code character varying(5) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_pointaccueil_nature_pk PRIMARY KEY (code)

);

-- object: gracethd_genie_civil.l_bool | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_genie_civil.l_bool CASCADE;
CREATE TABLE gracethd_genie_civil.l_bool (
	code character varying(2) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_bool_pk PRIMARY KEY (code)

);

-- ddl-end --
-- ALTER TABLE gracethd_genie_civil.l_pointaccueil_nature OWNER TO postgres;
-- ddl-end --

-- object: "cheminement-a-pour-extremite1" | type: CONSTRAINT --
-- ALTER TABLE gracethd_genie_civil.t_tranchee DROP CONSTRAINT IF EXISTS "cheminement-a-pour-extremite1" CASCADE;
ALTER TABLE gracethd_genie_civil.t_tranchee ADD CONSTRAINT "cheminement-a-pour-extremite1" FOREIGN KEY (tr_pa1)
REFERENCES gracethd_genie_civil.t_pointaccueil (pa_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "cheminement-a-pour-extremite1" ON gracethd_genie_civil.t_tranchee  IS E'La tranchée est utilisée pour un ou plusieurs cheminement(s), qui ont deux extrémités. Extrémité 1. Pas de sens amont-aval.';
-- ddl-end --

-- object: "cheminement-a-pour-extremite2" | type: CONSTRAINT --
-- ALTER TABLE gracethd_genie_civil.t_tranchee DROP CONSTRAINT IF EXISTS "cheminement-a-pour-extremite2" CASCADE;
ALTER TABLE gracethd_genie_civil.t_tranchee ADD CONSTRAINT "cheminement-a-pour-extremite2" FOREIGN KEY (tr_pa2)
REFERENCES gracethd_genie_civil.t_pointaccueil (pa_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "cheminement-a-pour-extremite2" ON gracethd_genie_civil.t_tranchee  IS E'La tranchée est utilisée pour un ou plusieurs cheminement(s), qui ont chacun deux extrémités. Extrémité 2. Pas de sens amont-aval.';
-- ddl-end --

-- object: fk_t_pointaccueil_pa_prop | type: CONSTRAINT --
-- ALTER TABLE gracethd_genie_civil.t_pointaccueil DROP CONSTRAINT IF EXISTS fk_t_pointaccueil_pa_prop CASCADE;
ALTER TABLE gracethd_genie_civil.t_pointaccueil ADD CONSTRAINT fk_t_pointaccueil_pa_prop FOREIGN KEY (pa_prop)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_pointaccueil_pa_gest | type: CONSTRAINT --
-- ALTER TABLE gracethd_genie_civil.t_pointaccueil DROP CONSTRAINT IF EXISTS fk_t_pointaccueil_pa_gest CASCADE;
ALTER TABLE gracethd_genie_civil.t_pointaccueil ADD CONSTRAINT fk_t_pointaccueil_pa_gest FOREIGN KEY (pa_gest)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_t_pointaccueil_pa_typephy | type: CONSTRAINT --
-- ALTER TABLE gracethd_genie_civil.t_pointaccueil DROP CONSTRAINT IF EXISTS fk_t_pointaccueil_pa_typephy CASCADE;
ALTER TABLE gracethd_genie_civil.t_pointaccueil ADD CONSTRAINT fk_t_pointaccueil_pa_typephy FOREIGN KEY (pa_typephy)
REFERENCES gracethd_genie_civil.l_pointaccueil_type_phy (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_pointaccueil_pa_nature | type: CONSTRAINT --
-- ALTER TABLE gracethd_genie_civil.t_pointaccueil DROP CONSTRAINT IF EXISTS fk_t_pointaccueil_pa_nature CASCADE;
ALTER TABLE gracethd_genie_civil.t_pointaccueil ADD CONSTRAINT fk_t_pointaccueil_pa_nature FOREIGN KEY (pa_nature)
REFERENCES gracethd_genie_civil.l_pointaccueil_nature (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_pointaccueil_pa_dtclass | type: CONSTRAINT --
-- ALTER TABLE gracethd_genie_civil.t_pointaccueil DROP CONSTRAINT IF EXISTS fk_t_pointaccueil_pa_dtclass CASCADE;
ALTER TABLE gracethd_genie_civil.t_pointaccueil ADD CONSTRAINT fk_t_pointaccueil_pa_dtclass FOREIGN KEY (pa_dtclass)
REFERENCES gracethd_commun.l_geoloc_classe (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_pointaccueil_pa_secu | type: CONSTRAINT --
-- ALTER TABLE gracethd_genie_civil.t_pointaccueil DROP CONSTRAINT IF EXISTS fk_t_pointaccueil_pa_secu CASCADE;
ALTER TABLE gracethd_genie_civil.t_pointaccueil ADD CONSTRAINT fk_t_pointaccueil_pa_secu FOREIGN KEY (pa_secu)
REFERENCES gracethd_genie_civil.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_tranchee_tr_dtclass | type: CONSTRAINT --
-- ALTER TABLE gracethd_genie_civil.t_tranchee DROP CONSTRAINT IF EXISTS fk_t_tranchee_tr_dtclass CASCADE;
ALTER TABLE gracethd_genie_civil.t_tranchee ADD CONSTRAINT fk_t_tranchee_tr_dtclass FOREIGN KEY (tr_dtclass)
REFERENCES gracethd_commun.l_geoloc_classe (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- -- object: public.geometry | type: TYPE --
-- -- DROP TYPE IF EXISTS public.geometry CASCADE;
-- CREATE TYPE public.geometry;
-- -- ddl-end --
-- 

--l_pointaccueil_type_phy 
INSERT INTO gracethd_genie_civil.l_pointaccueil_type_phy 
     VALUES ('APP','APPUI','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_type_phy 
     VALUES ('CHB','CHAMBRE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_type_phy 
     VALUES ('FCD','ANCRAGE FACADE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_type_phy 
     VALUES ('IMM','IMMEUBLE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_type_phy 
     VALUES ('ZZZ','AUTRE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_type_phy 
     VALUES ('ADR','ARMOIRE DE RUE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_type_phy 
     VALUES ('BAT','BATIMENT','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_type_phy 
     VALUES ('CHV','CHAMBRE
     VISITABLE','Chambre accueillant au moins une baie, donc traitee comme un site technique. Provient de gracethd_genie_civil.l_site_type_phy');
INSERT INTO gracethd_genie_civil.l_pointaccueil_type_phy 
     VALUES ('COF','COFFRET','Notamment coffrets qui peuvent etre fixes sur des appuis et qui font office d armoires.Provient de gracethd_genie_civil.l_site_type_phy');
INSERT INTO gracethd_genie_civil.l_pointaccueil_type_phy 
     VALUES ('SHE','SHELTER','Provient de gracethd_genie_civil.l_site_type_phy');
INSERT INTO gracethd_genie_civil.l_pointaccueil_type_phy 
     VALUES ('STR','CONSTRUCTION SOUTERRAINE','Espace souterrain aménagé et visitable comportant un ou plusieurs locaux techniques et accueillant au moins une baie.Provient de gracethd_genie_civil.l_site_type_phy');

--l_pointaccueil_nature
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('A1','CHAMBRE A1','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('A2','CHAMBRE A2','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('A3','CHAMBRE A3','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('A4','CHAMBRE A4','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('A10','CHAMBRE A10','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('A11','CHAMBRE A11','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('A12','CHAMBRE A12','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('A13','CHAMBRE A13','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('A14','CHAMBRE A14','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('A15','CHAMBRE A15','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('A16','CHAMBRE A16','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('A17','CHAMBRE A17','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('A18','CHAMBRE A18','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('B1','CHAMBRE B1','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('B2','CHAMBRE B2','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('B3','CHAMBRE B3','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('B4','CHAMBRE B4','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('C1','CHAMBRE C1','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('C2','CHAMBRE C2','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('C3','CHAMBRE C3','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('C4','CHAMBRE C4','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D1','CHAMBRE D1','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D1C','CHAMBRE D1C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D1T','CHAMBRE D1T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D2','CHAMBRE D2','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D2C','CHAMBRE D2C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D2T','CHAMBRE D2T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D3','CHAMBRE D3','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D3C','CHAMBRE D3C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D3T','CHAMBRE D3T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D4','CHAMBRE D4','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D4C','CHAMBRE D4C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D4T','CHAMBRE D4T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D5','CHAMBRE D5','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D5C','CHAMBRE D5C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D6','CHAMBRE D6','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D6C','CHAMBRE D6C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D11','CHAMBRE D11','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D12','CHAMBRE D12','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D13','CHAMBRE D13','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('D14','CHAMBRE D14','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('E1','CHAMBRE E1','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('E2','CHAMBRE E2','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('E3','CHAMBRE E3','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('E4','CHAMBRE E4','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('J2C','CHAMBRE J2C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('J2CR','CHAMBRE J2C REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('K1C','CHAMBRE K1C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('K1CR','CHAMBRE K1C REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('K1T','CHAMBRE K1T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('K2C','CHAMBRE K2C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('K2CR','CHAMBRE K2C REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('K2T','CHAMBRE K2T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('K3C','CHAMBRE K3C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('K3CR','CHAMBRE K3C REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('K3T','CHAMBRE K3T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L0T','CHAMBRE L0T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L0TR','CHAMBRE L0T REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L1C','CHAMBRE L1C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L1T','CHAMBRE L1T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L1TR','CHAMBRE L1T REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L2C','CHAMBRE L2C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L2T','CHAMBRE L2T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L2TR','CHAMBRE L2T REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L3C','CHAMBRE L3C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L3T','CHAMBRE L3T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L3TR','CHAMBRE L3T REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L4C','CHAMBRE L4C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L4T','CHAMBRE L4T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L4TR','CHAMBRE L4T REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L5C','CHAMBRE L5C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L5T','CHAMBRE L5T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L5TR','CHAMBRE L5T REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L6T','CHAMBRE L6T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('L6TR','CHAMBRE L6T REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('M1C','CHAMBRE M1C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('M1CR','CHAMBRE M1C REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('M2T','CHAMBRE M2T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('M2TR','CHAMBRE M2T REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('M3C','CHAMBRE M3C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('M3CR','CHAMBRE M3C REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('P1C','CHAMBRE P1C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('P1CR','CHAMBRE P1C REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('P1T','CHAMBRE P1T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('P1TR','CHAMBRE P1T REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('P2C','CHAMBRE P2C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('P2CR','CHAMBRE P2C REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('P2T','CHAMBRE P2T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('P2TR','CHAMBRE P2T REHAUSSEE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('P3C','CHAMBRE P3C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('P3T','CHAMBRE P3T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('P4C','CHAMBRE P4C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('P4T','CHAMBRE P4T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('P5C','CHAMBRE P5C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('P5T','CHAMBRE P5T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('P6C','CHAMBRE P6C','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('P6T','CHAMBRE P6T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('R1T','CHAMBRE R1T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('R2T','CHAMBRE R2T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('R3T','CHAMBRE R3T','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('S1','CHAMBRE S1','SNCF Reseau : Chambre prefabriquee aux dimensions standardisees.');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('S2','CHAMBRE S2','SNCF Reseau : Chambre prefabriquee aux dimensions standardisees.');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('S3','CHAMBRE S3','SNCF Reseau : Chambre prefabriquee aux dimensions standardisees.');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('S4','CHAMBRE S4','SNCF Reseau : Chambre prefabriquee aux dimensions standardisees.');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('S5','CHAMBRE S5','SNCF Reseau : Chambre prefabriquee aux dimensions standardisees.');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('S6','CHAMBRE S6','SNCF Reseau : Chambre prefabriquee aux dimensions standardisees.');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('S6bis','CHAMBRE S6bis','SNCF Reseau : Chambre prefabriquee aux dimensions standardisees.');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('S7','CHAMBRE S7','SNCF Reseau : Chambre prefabriquee aux dimensions standardisees.');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('TU1','CHAMBRE TU1','SNCF Reseau : chambre avec trappes unifiees.');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('TU2','CHAMBRE TU2','SNCF Reseau : chambre avec trappes unifiees.');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('TU4','CHAMBRE TU4','SNCF Reseau : chambre avec trappes unifiees.');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('TU6','CHAMBRE TU6','SNCF Reseau : chambre avec trappes unifiees.');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('TU8','CHAMBRE TU8','SNCF Reseau : chambre avec trappes unifiees.');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('TU10','CHAMBRE TU10','SNCF Reseau : chambre avec trappes unifiees.');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('OHN','OUVRAGE HORS NORMES','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('PBOI','POTEAU BOIS','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('PBET','POTEAU BETON','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('PCMP','POTEAU COMPOSITE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('PMET','POTEAU METAL','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('PIND','POTEAU INDETERMINE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('POTL','POTELET','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('BOU','BOUCHON','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('REG','REGARD 30X30','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('R40','REGARD 40X40','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('BAL','BALCON','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('CRO','CROCHET','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('FAI','FAITIERE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('STR','SOUTERRAIN','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('SSO','SOUS-SOL','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('TRA','TRAVERSE','');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('Y','SITE MANCHONNAGE Y','Fenetre ouverture sur fourreaux existants pour mise en Y.');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('SITE','SITE','Lorsque le pointaccueil est un site technique');
INSERT INTO gracethd_genie_civil.l_pointaccueil_nature
     VALUES ('IND','INDETERMINE','');

-- l_bool
INSERT INTO gracethd_genie_civil.l_bool
     VALUES ('0','FAUX','');
INSERT INTO gracethd_genie_civil.l_bool
     VALUES ('1','VRAI','');

DROP INDEX IF EXISTS tr_pa1_idx; CREATE INDEX  tr_pa1_idx ON t_tranchee(tr_pa1);
DROP INDEX IF EXISTS tr_pa2_idx; CREATE INDEX  tr_pa2_idx ON t_tranchee(tr_pa2);
DROP INDEX IF EXISTS pa_prop_idx; CREATE INDEX  pa_prop_idx ON t_pointaccueil(pa_prop);
DROP INDEX IF EXISTS pa_gest_idx; CREATE INDEX  pa_gest_idx ON t_pointaccueil(pa_gest);
DROP INDEX IF EXISTS tr_couptyp_idx; CREATE INDEX  tr_couptyp_idx ON t_tranchee(tr_couptyp);
