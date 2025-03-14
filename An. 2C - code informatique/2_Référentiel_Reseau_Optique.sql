-- Script de création de base GraceTHD V3 : référentiel <ReseauOptique>

-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- object: gracethd_reseau_optique | type: SCHEMA --
-- DROP SCHEMA IF EXISTS gracethd_reseau_optique CASCADE;
CREATE SCHEMA gracethd_reseau_optique;
-- ddl-end --
-- ALTER SCHEMA gracethd_reseau_optique OWNER TO postgres;
-- ddl-end --

SET search_path TO gracethd_reseau_optique,gracethd_commun,pg_catalog,public;
-- ddl-end --

-- object: gracethd_reseau_optique.t_noeud | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_noeud CASCADE;
CREATE TABLE gracethd_reseau_optique.t_noeud (
	nd_code character varying(254) NOT NULL,
	geom public.geometry NOT NULL,
	nd_comment character varying(254),
	nd_creadat timestamp,
	nd_majdate timestamp,
	nd_majsrc character varying(254),
	nd_abddate timestamp,
	nd_abdsrc character varying(254),
	CONSTRAINT "t_noeud_pk " PRIMARY KEY (nd_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_noeud IS E'Classe abstraite portant la géométrie d''un site ou d''un point technique.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_noeud.nd_code IS E'Code noeud';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_noeud.geom IS E'Point abstrait';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_noeud.nd_comment IS E'Commentaires';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_noeud.nd_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_noeud.nd_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_noeud.nd_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_noeud.nd_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_noeud.nd_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_noeud OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_ptech | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_ptech CASCADE;
CREATE TABLE gracethd_reseau_optique.t_ptech (
	pt_code character varying(254) NOT NULL,
	pt_codeext character varying(254) NOT NULL,
	pt_abandon character varying(1),
	pt_etiquet character varying(254),
	pt_perirec character varying(254),
	pt_nd_code character varying(254) NOT NULL,
	pt_prop character varying(20),
	pt_gest character varying(20),
	pt_proptyp character varying(3),
	pt_statut character varying(3),
	pt_avct character varying(1),
	pt_typephy character varying(1),
	pt_nature character varying(20),
	pt_secu character varying(1),
	pt_a_struc character varying(100),
	pt_a_haut numeric(5,2),
	pt_nomvoie character varying(254),
	pt_insee character varying(20),
	pt_commune character varying(254),
	pt_numero integer,
	pt_rep character varying(20),
	pt_ad_code character varying(254),
	pt_gest_do character varying(20),
	pt_prop_do character varying(20),
	pt_user character varying(20),
	pt_etat character varying(3),
	pt_datemes timestamp,
	pt_typelog character varying(1),
	pt_rf_code character varying(254),
	pt_occp character varying(10),
	pt_a_dan numeric(18,6),
	pt_a_dtetu timestamp,
	pt_a_passa character varying(1),
	pt_a_strat character varying(1),
	pt_detec character varying(1),
	pt_local character varying(254),
	pt_postal character varying(20),
	pt_section character varying(5),
	pt_idpar character varying(20),
	pt_comment character varying(254),
	pt_creadat timestamp,
	pt_majdate timestamp,
	pt_majsrc character varying(254),
	pt_abddate timestamp,
	pt_abdsrc character varying(254),
	CONSTRAINT "t_ptech_pk " PRIMARY KEY (pt_code),
	CONSTRAINT pt_codeext_unique UNIQUE (pt_codeext),
	CONSTRAINT pt_nd_code_unique UNIQUE (pt_nd_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_ptech IS E'Liste des Points Techniques faisant partie de l''Infrastructure de Génie Civil souterraine et aérienne. Il pourra donc s''agir de ponctuel de type chambre, poteau, traverse, crochet de façade, fixation d''encorbellement, … (1 enregistrement par ponctuel).';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_code IS E'Code du point technique';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_codeext IS E'Code chez un tiers ou dans une autre base de données.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_abandon IS E'Défini si l''entité est abandonnée ou non dans un SI';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_etiquet IS E'Etiquette sur le terrain';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_perirec IS E'Identifiant du périmètre récolé livré à un instant t';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_nd_code IS E'Code noeud';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_prop IS E'Propriétaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_gest IS E'Gestionnaire du point technique';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_proptyp IS E'Type de propriété';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_statut IS E'Statut de déploiement.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_avct IS E'Attribut synthétisant l''avancement. Utile pour distinguer en phase d''étude ce qui est existant et à créer.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_typephy IS E'Type de point technique';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_nature IS E'Nature du point technique.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_secu IS E'Point technique équipé d''un système de verrouillage, ou tout autre système permettant d''en sécuriser l''accès.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_a_struc IS E'Simple, Moisé, Haubané, Couple, …';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_a_haut IS E'Hauteur en mètre entre le sol et la base de l''infrastructure (réseau en façade ou aérien)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_nomvoie IS E'Nom de la voie d’accès la plus proche.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_insee IS E'Code  INSEE de la commune';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_commune IS E'Nom officiel de la commune';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_numero IS E'Si le point technique possède ou est à proximité d’une adresse postale, possibilité de saisir le numéro de plaque adresse.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_rep IS E'Indice de répétition associé au numéro (par exemple Bis, A, 1…)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_ad_code IS E'Identifiant unique contenu dans la table t_adresse. Si le point technique n''est pas localisé à une adresse postale précise, nd_voie permet une localisation à l''adresse moins précise.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_gest_do IS E'Gestionnaire de la voirie';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_prop_do IS E'Propriétaire de la voirie';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_user IS E'Utilisateur';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_etat IS E'État du point technique';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_datemes IS E'Date de mise en service';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_typelog IS E'Usage du point technique';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_rf_code IS E'Référence.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_occp IS E'Occupation.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_a_dan IS E'Effort disponible après pose (exprimé en daN – décanewtons)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_a_dtetu IS E'Date de l''étude de charge';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_a_passa IS E'0 si uniquement pour passage de câbles';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_a_strat IS E'Notion Orange disponible dans les PIT. Notion potentiellement extensible à d''autres types de réseaux.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_detec IS E'Présence d''un boitier pour un fil de détection.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_local IS E'Complément d''adresse pour identifier le local.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_postal IS E'Code  postal  du  bureau  de  distribution de la voie';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_section IS E'Si un point technique en propriété propre n’est pas en domaine public, possibilité de saisir le numéro de section cadastrale.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_idpar IS E'Si un point technique en propriété propre n’est pas en domaine public, possibilité de saisir le numéro de parcelle cadastrale.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ptech.pt_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_ptech OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_ebp | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_ebp CASCADE;
CREATE TABLE gracethd_reseau_optique.t_ebp (
	bp_code character varying(254) NOT NULL,
	bp_pt_code character varying(254),
	bp_perirec character varying(254),
	bp_etiquet character varying(254),
	bp_codeext character varying(254) NOT NULL,
	bp_abandon character varying(1),
	bp_lc_code character varying(254),
	bp_prop character varying(20),
	bp_gest character varying(20),
	bp_proptyp character varying(3),
	bp_statut character varying(3),
	bp_dateins timestamp,
	bp_avct character varying(1),
	bp_typephy character varying(5),
	bp_typelog character varying(3),
	bp_rf_code character varying(254),
	bp_user character varying(20),
	bp_etat character varying(3),
	bp_occp character varying(10),
	bp_datemes timestamp,
	bp_entrees integer,
	bp_ref_kit character varying(30),
	bp_ca_nb integer,
	bp_nb_pas integer,
	bp_linecod character varying(12),
	bp_oc_code character varying(50),
	bp_racco character varying(6),
	bp_comment character varying(254),
	bp_creadat timestamp,
	bp_majdate timestamp,
	bp_majsrc character varying(254),
	bp_abddate timestamp,
	bp_abdsrc character varying(254),
	CONSTRAINT "t_ebp_pk " PRIMARY KEY (bp_code),
	CONSTRAINT bp_codeext_unique UNIQUE (bp_codeext)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_ebp IS E'Eléments du réseau ayant un rôle passif dans le branchement optique (ex :PBO, BPE, PTO …etc.).';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_code IS E'Code de la BPE, etc.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_pt_code IS E'Code point technique';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_perirec IS E'Identifiant du périmètre récolé livré à un instant t';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_etiquet IS E'Etiquette sur le terrain';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_codeext IS E'Code chez un tiers ou dans une autre base de données.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_abandon IS E'Défini si l''entité est abandonnée ou non dans un SI';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_lc_code IS E'Identifiant unique du local dans lequel est installé l''ebp.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_prop IS E'Propriétaire de l''élément';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_gest IS E'Gestionnaire de l''élément';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_proptyp IS E'Type de propriété';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_statut IS E'Statut de déploiement.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_dateins IS E'Date d''installation';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_avct IS E'Attribut synthétisant l''avancement. Utile pour distinguer en phase d''étude ce qui est existant et à créer.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_typephy IS E'Type physique d''élément de branchement passif. Capacité de soudure.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_typelog IS E'Type de l''élément';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_rf_code IS E'Référence.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_user IS E'Utilisateur de l''élément';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_etat IS E'État';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_occp IS E'Occupation.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_datemes IS E'Date de mise en service';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_entrees IS E'Nombre d''entrées de câbles.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_ref_kit IS E'Référence du kit d''entrée de câble utilisé';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_ca_nb IS E'Nombre de cassettes contenues dans l''EBP';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_nb_pas IS E'Nombre de pas de l''organiseur de l''EBP';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_linecod IS E'Code d''une ligne (cas FTTH) selon la nomenclature du régulateur. Cas d''un PTO. (OO-XXXX-XXXX)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_oc_code IS E'Référence OC (Opérateur Commercial) de la prise terminale. Différent de bp_code. Cas d''une PTO uniquement';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_racco IS E'Codification Interop de l''échec du raccordement. Cas d''une PTO uniquement.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ebp.bp_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_ebp OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_cheminement | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_cheminement CASCADE;
CREATE TABLE gracethd_reseau_optique.t_cheminement (
	cm_code character varying(254) NOT NULL,
	cm_perirec character varying(254),
	cm_ndcode1 character varying(254) NOT NULL,
	cm_ndcode2 character varying(254) NOT NULL,
	cm_compo character varying(254),
	cm_statut character varying(3),
	cm_avct character varying(1),
	cm_typelog character varying(2),
	cm_typ_imp character varying(2),
	cm_prop character varying(20),
	cm_gest character varying(20),
	geom public.geometry NOT NULL,
	cm_codeext character varying(254),
	cm_comment character varying(254),
	cm_creadat timestamp,
	cm_majdate timestamp,
	cm_majsrc character varying(254),
	cm_abddate timestamp,
	cm_abdsrc character varying(254),
	CONSTRAINT "t_cheminement_pk " PRIMARY KEY (cm_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_cheminement IS E'Un cheminement représente, entre deux points techniques/sites :\n- Un parcours physique approchant pour l’infrastructure GC créé. Le cheminement exact est livré dans la table t_tranchee.\n- Un parcours physique à partir des données de l’exploitant pour les infrastructures existantes.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_code IS E'Code du cheminement.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_perirec IS E'Identifiant du périmètre récolé livré à un instant t';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_ndcode1 IS E'Code du Noeud à une extrémité du cheminement.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_ndcode2 IS E'Code du Noeud à l''autre extrémité du cheminement.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_compo IS E'Attribut d''aggrégation décrivant la composition du multitubulaire.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_statut IS E'Statut de déploiement.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_avct IS E'Attribut synthétisant l''avancement. Utile pour distinguer en phase d''étude ce qui est existant et à créer.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_typelog IS E'Type logique de l''infrastructure';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_typ_imp IS E'Type d''implantation';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_prop IS E'Propriétaire de la conduite du cheminement';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_gest IS E'Gestionnaire de la conduite du cheminement';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.geom IS E'Ligne';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_codeext IS E'Code chez un tiers ou dans une autre base de données.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cheminement.cm_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_cheminement OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_site | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_site CASCADE;
CREATE TABLE gracethd_reseau_optique.t_site (
	st_code character varying(254) NOT NULL,
	st_perirec character varying(254),
	st_nd_code character varying(254) NOT NULL,
	st_codeext character varying(254),
	st_abandon character varying(1),
	st_nra character varying(1),
	st_prop character varying(20),
	st_gest character varying(20),
	st_proptyp character varying(3),
	st_statut character varying(3),
	st_dateins timestamp,
	st_avct character varying(1),
	st_typephy character varying(3),
	st_typelog character varying(10),
	st_design character varying(254),
	st_ad_code character varying(254),
	st_postal character varying(254),
	st_insee character varying(20),
	st_commune character varying(254),
	st_nomvoie character varying(254),
	st_numero integer,
	st_rep character varying(20),
	st_nombat character varying(254),
	st_nom character varying(254),
	st_user character varying(20),
	st_etat character varying(3),
	st_datemes timestamp,
	st_nblines integer,
	st_ban_id character varying(24),
	st_section character varying(5),
	st_idpar character varying(20),
	st_hexacle character varying(254),
	st_comment character varying(254),
	st_creadat timestamp,
	st_majdate timestamp,
	st_majsrc character varying(254),
	st_abddate timestamp,
	st_abdsrc character varying(254),
	CONSTRAINT "t_site_pk " PRIMARY KEY (st_code),
	CONSTRAINT st_codeext_unique UNIQUE (st_codeext),
	CONSTRAINT st_nd_code_unique UNIQUE (st_nd_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_site IS E'Regroupe les sites techniques et les sites d''habitation. (Pavillons, immeubles, shelters, armoires de rue…etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_code IS E'Code du site';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_perirec IS E'Identifiant du périmètre récolé livré à un instant t';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_nd_code IS E'Identifiant unique contenu dans la table Noeud';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_codeext IS E'Code chez un tiers ou dans une autre base de données.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_abandon IS E'Défini si l''entité est abandonnée ou non dans un SI';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_nra IS E'Site NRA (1) ou non (0).';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_prop IS E'Identifiant du propriétaire du site.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_gest IS E'Identifiant du gestionnaire du site.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_proptyp IS E'Type de propriété';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_statut IS E'Statut de déploiement.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_dateins IS E'Date d''installation';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_avct IS E'Attribut synthétisant l''avancement. Utile pour distinguer en phase d''étude ce qui est existant et à créer.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_typephy IS E'Type physique du site (shelter, armoire de rue, bâti…etc.).';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_typelog IS E'Type logique du site (Réseau ou Client)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_design IS E'Concaténation "codecouleur" + separateur espace +"type de revétement"';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_ad_code IS E'Identifiant unique contenu dans la table ADRESSE';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_postal IS E'Code postal du bureau de distribution de la voie';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_insee IS E'Code  INSEE de la commune.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_commune IS E'Nom officiel de la commune.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_nomvoie IS E'Nom de la voie.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_numero IS E'Numéro de plaque adresse.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_rep IS E'Indice de répétition associé au numéro (par exemple Bis, A, 1…).';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_nombat IS E'Nom du bâtiment.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_nom IS E'Nom du site.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_user IS E'Utilisateur du site';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_etat IS E'Etat du site.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_datemes IS E'Date de mise en service';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_nblines IS E'Nombre de lignes du site.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_ban_id IS E'Identifiant de l’adresse dans la base adresse nationale.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_section IS E'Numéro de section cadastrale.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_idpar IS E'Numéro de parcelle cadastrale principale.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_hexacle IS E'Code hexacle.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_site.st_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_site OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_local | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_local CASCADE;
CREATE TABLE gracethd_reseau_optique.t_local (
	lc_code character varying(254) NOT NULL,
	lc_bp_codf character varying(254),
	lc_bp_codp character varying(254),
	lc_codeext character varying(254),
	lc_abandon character varying(1),
	lc_prop character varying(20),
	lc_gest character varying(20),
	lc_statut character varying(3),
	lc_dateins timestamp,
	lc_elec character varying(1),
	lc_bat character varying(100),
	lc_escal character varying(20),
	lc_etage character varying(20),
	lc_avct character varying(1),
	lc_perirec character varying(254),
	lc_etiquet character varying(20),
	lc_st_code character varying(254) NOT NULL,
	lc_typelog character varying(10),
	lc_proptyp character varying(3),
	lc_user character varying(20),
	lc_etat character varying(3),
	lc_datemes timestamp,
	lc_local character varying(254),
	lc_clim character varying(6),
	lc_occp character varying(10),
	lc_idmajic character varying(254),
	lc_abddate timestamp,
	lc_abdsrc character varying(254),
	lc_comment character varying(254),
	lc_creadat timestamp,
	lc_majdate timestamp,
	lc_majsrc character varying(254),
	CONSTRAINT "t_local_pk " PRIMARY KEY (lc_code),
	CONSTRAINT lc_codeext_unique UNIQUE (lc_codeext)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_local IS E'Un local est un sous ensemble d''un site (logement, local entreprise, local technique…etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_code IS E'Code du local';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_bp_codf IS E'Code du PBO pré-identifié pour alimenter le local en FTTH.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_bp_codp IS E'Code du PBO FTTE ou BPE pré-identifié pour alimenter le local sur les usages point à point de type FTTE, FTTO, GFU, FON';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_codeext IS E'Code chez un tiers ou dans une autre base de données.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_abandon IS E'Défini si l''entité est abandonnée ou non dans un SI';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_prop IS E'Propriétaire du local.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_gest IS E'Gestionnaire du local.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_statut IS E'Statut de déploiement.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_dateins IS E'Date d''installation';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_elec IS E'Présence d''une alimentation électrique';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_bat IS E'Nom du bâtiment';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_escal IS E'Nom ou numéro d’escalier du local';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_etage IS E'Numéro d’étage du local.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_avct IS E'Attribut synthétisant l''avancement. Utile pour distinguer en phase d''étude ce qui est existant et à créer.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_perirec IS E'Identifiant du périmètre récolé livré à un instant t';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_etiquet IS E'Nom du local tel qu''étiqueté sur le terrain (selon règles et plages de nommage)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_st_code IS E'Identifiant unique contenu dans la classe  SITE';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_typelog IS E'Type logique du local';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_proptyp IS E'Type de propriété';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_user IS E'Identifiant de l''utilisateur';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_etat IS E'Etat du local.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_datemes IS E'Date de mise en service du local';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_local IS E'Informations de localisation';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_clim IS E'Présence et type du système éventuel de ventilation ou de climatisation.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_occp IS E'Occupation.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_idmajic IS E'Identifiant du local dans un référentiel comme la base MAJICIII lorsque disponible.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_local.lc_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_local OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_baie | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_baie CASCADE;
CREATE TABLE gracethd_reseau_optique.t_baie (
	ba_code character varying(254) NOT NULL,
	ba_codeext character varying(254),
	ba_perirec character varying(254),
	ba_abandon character varying(1),
	ba_etiquet character varying(254),
	ba_lc_code character varying(254) NOT NULL,
	ba_prop character varying(20),
	ba_gest character varying(20),
	ba_proptyp character varying(3),
	ba_statut character varying(3),
	ba_rf_code character varying(254),
	ba_type character varying(10),
	ba_nb_u numeric(5,2),
	ba_user character varying(20),
	ba_etat character varying(3),
	ba_haut numeric(8,2),
	ba_larg numeric(8,2),
	ba_prof numeric(8,2),
	ba_comment character varying(254),
	ba_creadat timestamp,
	ba_majdate timestamp,
	ba_majsrc character varying(254),
	ba_abddate timestamp,
	ba_abdsrc character varying(254),
	CONSTRAINT "t_baie_pk " PRIMARY KEY (ba_code),
	CONSTRAINT ba_codeext_unique UNIQUE (ba_codeext)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_baie IS E'Baies et Fermes contenues dans les locaux techniques.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_code IS E'Code baie ou ferme';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_codeext IS E'Code chez un tiers ou dans une autre base de données.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_perirec IS E'Identifiant du périmètre récolé livré à un instant t';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_abandon IS E'Défini si l''entité est abandonnée ou non dans un SI';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_etiquet IS E'Etiquette sur le terrain';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_lc_code IS E'Code du local dans lequel se trouve la baie/ferme';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_prop IS E'Propriétaire de la baie/ferme';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_gest IS E'Gestionnaire de la baie/ferme';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_proptyp IS E'Type de propriété';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_statut IS E'Statut de déploiement.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_rf_code IS E'Identifiant de la référence de la baie/ferme dans la table référence.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_type IS E'Type du contenant selon qu''il s''agisse d''une BAIE ou d''une FERME.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_nb_u IS E'Taille de la baie en nombre de U';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_user IS E'Utilisateur';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_etat IS E'Etat de la BAIE/FERME';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_haut IS E'Hauteur de la baie/ferme en mm';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_larg IS E'Largeur de la baie/ferme en mm';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_prof IS E'Profondeur de la baie/ferme en mm';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_baie.ba_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_baie OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_cable | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_cable CASCADE;
CREATE TABLE gracethd_reseau_optique.t_cable (
	cb_code character varying(254) NOT NULL,
	cb_codeext character varying(254) NOT NULL,
	cb_abandon character varying(1),
	cb_perirec character varying(254),
	cb_etiquet character varying(254),
	cb_nd1 character varying(254),
	cb_nd2 character varying(254),
	cb_bp1 character varying(254),
	cb_ba1 character varying(254),
	cb_bp2 character varying(254),
	cb_ba2 character varying(254),
	cb_r1_code character varying(100),
	cb_r2_code character varying(100),
	cb_r3_code character varying(100),
	cb_fo_type character varying(20),
	cb_prop character varying(20),
	cb_gest character varying(20),
	cb_proptyp character varying(3),
	cb_statut character varying(3),
	cb_dateins timestamp,
	cb_avct character varying(1),
	cb_typephy character varying(1),
	cb_typelog character varying(2),
	cb_rf_code character varying(254),
	cb_capafo integer,
	cb_fo_disp integer,
	cb_fo_util integer,
	cb_modulo integer,
	cb_cabphy character varying(254),
	cb_lgreel numeric(7,2),
	cb_r4_code character varying(100),
	cb_user character varying(20),
	cb_etat character varying(3),
	cb_datemes timestamp,
	cb_tech character varying(3),
	cb_diam numeric(6,2),
	cb_color character varying(254),
	cb_localis character varying(254),
	cb_comment character varying(254),
	cb_creadat timestamp,
	cb_majdate timestamp,
	cb_majsrc character varying(254),
	cb_abddate timestamp,
	cb_abdsrc character varying(254),
	CONSTRAINT "t_cable_pk " PRIMARY KEY (cb_code),
	CONSTRAINT cb_codeext_unique UNIQUE (cb_codeext)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_cable IS E'Câble du réseau de fibre optique.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_code IS E'Code câble';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_codeext IS E'Code chez un tiers ou dans une autre base de données.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_abandon IS E'Défini si l''entité est abandonnée ou non dans un SI';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_perirec IS E'Identifiant du périmètre récolé livré à un instant t';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_etiquet IS E'Etiquette sur le terrain';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_nd1 IS E'Code du nœud à l''extrémité amont (sens NRO vers PTO) du câble. Pour un cable intrasite (jarretière, etc.) cb_nd1 et cb_nd2 seront identiques.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_nd2 IS E'Code du nœud à l''extrémité aval (sens NRO vers PTO) du câble. Pour un cable intrasite (jarretière, etc.) cb_nd1 et cb_nd2 seront identiques.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_bp1 IS E'Code de l’élément de branchement passif à l''extrémité amont (sens NRO vers PTO)  du câble.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_ba1 IS E'Code de la baie à l''extrémité amont (sens NRO vers PTO) du câble. En cas d’éclatement sur plusieurs baies, saisir la baie principale.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_bp2 IS E'Code de l’élément de branchement passif à l''extrémité aval (Sens NRO vers PTO) du câble.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_ba2 IS E'Code de la baie à l''extrémité aval (Sens NRO vers PTO) du câble. En cas d’éclatement sur plusieurs baies, saisir la baie principale.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_r1_code IS E'Code d''un référencement du réseau 1 (plaque, dsp, BM, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_r2_code IS E'Code d''un référencement du réseau 2 (poche, tronçon, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_r3_code IS E'Code d''un référencement du réseau 3 (secteur, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_fo_type IS E'Type de fibre (G652, G655, G657, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_prop IS E'Propriétaire du câble';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_gest IS E'Gestionnaire du câble';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_proptyp IS E'Type de propriété';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_statut IS E'Statut de déploiement.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_dateins IS E'Date de pose du câble';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_avct IS E'Attribut synthétisant l''avancement. Utile pour distinguer en phase d''étude ce qui est existant et à créer.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_typephy IS E'Type physique du câble.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_typelog IS E'Type logique du câble (collecte, transport, distribution, etc.).';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_rf_code IS E'Identifiant de la référence du câble dans la table référence.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_capafo IS E'Capacité du câble (Nombre total de fibres présentes).';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_fo_disp IS E'Nombre de fibres présentes dans le câble et encore disponibles (différence entre le nombre total de fibres et le nombre de fibres utilisées)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_fo_util IS E'Nombre de fibres utiles sur le segment d''infrastructure pour desservir les locaux clients situés en aval (incluant les besoins de l''infrastructure d''imbrication), corrigé en fonction de la localisation et du dénombrement des locaux clients après relevé terrain.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_modulo IS E'Nombre de fibres par tube (6, 12)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_cabphy IS E'Identifiant unique qui permet de reconstituer le câble physique (identifiant commun à tous les tronçons constituant le câble). Un câble physique est découpé en tronçon à chaque passage d''ebp.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_lgreel IS E'Longueur réelle du câble en mètres (selon retours terrain)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_r4_code IS E'Code d''un référencement du réseau 4';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_user IS E'Utilisateur du câble';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_etat IS E'Etat du câble';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_datemes IS E'Date de mise en service du câble';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_tech IS E'Technologie du câble (fibre optique, cuivre, coaxial, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_diam IS E'Diamètre du câble en millimètres';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_color IS E'Couleur du câble';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_localis IS E'Localisation du câble lorsqu''il s''agit d''un cablage intrasite.  Il peut s''agir d''une indication littérale, ou du code d''un tiroir, du code d''un EBP, etc.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cable.cb_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_cable OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_cableline | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_cableline CASCADE;
CREATE TABLE gracethd_reseau_optique.t_cableline (
	cl_code character varying(254) NOT NULL,
	cl_cb_code character varying(254) NOT NULL,
	geom public.geometry NOT NULL,
	cl_long numeric(7,2),
	cl_comment character varying(254),
	cl_dtclass character varying(2),
	cl_geolqlt numeric(6,2),
	cl_geolmod character varying(4),
	cl_geolsrc character varying(254),
	cl_creadat timestamp,
	cl_majdate timestamp,
	cl_majsrc character varying(254),
	cl_abddate timestamp,
	cl_abdsrc character varying(254),
	CONSTRAINT "t_cableline_pk " PRIMARY KEY (cl_code),
	CONSTRAINT cl_cb_code_unique UNIQUE (cl_cb_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_cableline IS E'Les câbles nécessitant une géométrie (globalement les câbles cheminant en extrasite) peuvent être modélisés dans cette table. Les câbles ne nécessitant pas de géométrie (globalement les câbles intrasites comme les jarretières, breakouts, etc.) n''ont ainsi pas besoin d''être modélisés géométriquement.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cableline.cl_code IS E'Code unique permettant d''identifier une géométrie modélisant un câble.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cableline.cl_cb_code IS E'Code unique du câble.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cableline.geom IS E'Ligne';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cableline.cl_long IS E'Longueur totale du câble (hérité de la géométrie)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cableline.cl_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cableline.cl_dtclass IS E'Classe de précision au sens du décret DT-DICT';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cableline.cl_geolqlt IS E'Précision du positionnement de l''objet, estimée en mètres.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cableline.cl_geolmod IS E'Mode d''implantation de l''objet.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cableline.cl_geolsrc IS E'Source de la géolocalisation pour préciser la source si nécessaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cableline.cl_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cableline.cl_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cableline.cl_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cableline.cl_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cableline.cl_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_cableline OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_cab_chem | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_cab_chem CASCADE;
CREATE TABLE gracethd_reseau_optique.t_cab_chem (
	cc_cb_code character varying(254) NOT NULL,
	cc_cm_code character varying(254) NOT NULL,
	cc_creadat timestamp,
	cc_majdate timestamp,
	cc_majsrc character varying(254),
	cc_abddate timestamp,
	cc_abdsrc character varying(254),
	CONSTRAINT "t_cab_chem_pk " PRIMARY KEY (cc_cb_code,cc_cm_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_cab_chem IS E'Relations entre les câbles et les cheminements. Un câble peut appartenir à plusieurs cheminements, et un cheminement peut être composé de plusieurs câbles.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cab_chem.cc_cb_code IS E'Code câble';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cab_chem.cc_cm_code IS E'Code du cheminement par lequel passe le câble.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cab_chem.cc_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cab_chem.cc_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cab_chem.cc_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cab_chem.cc_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cab_chem.cc_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_cab_chem OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_love | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_love CASCADE;
CREATE TABLE gracethd_reseau_optique.t_love (
	lv_id bigint NOT NULL,
	lv_cb_code character varying(254) NOT NULL,
	lv_nd_code character varying(254) NOT NULL,
	lv_long integer,
	lv_creadat timestamp,
	lv_majdate timestamp,
	lv_majsrc character varying(254),
	lv_abddate timestamp,
	lv_abdsrc character varying(254),
	CONSTRAINT "t_love_pk " PRIMARY KEY (lv_id)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_love IS E'Permet de localiser les loves de câble. Chaque enregistrement associe un câble à un Nœud Physique, ainsi qu''une longueur de love.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_love.lv_id IS E'Identifiant unique pouvant être auto-incrémenté (selon plages d''identitifiants)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_love.lv_cb_code IS E'Code du câble';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_love.lv_nd_code IS E'Code du nœud dans lequel est positionné ce love';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_love.lv_long IS E'longueur du love du câble dans le nœud en mètre';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_love.lv_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_love.lv_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_love.lv_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_love.lv_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_love.lv_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_love OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_tiroir | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_tiroir CASCADE;
CREATE TABLE gracethd_reseau_optique.t_tiroir (
	ti_code character varying(254) NOT NULL,
	ti_codeext character varying(254),
	ti_perirec character varying(254),
	ti_abandon character varying(1),
	ti_etiquet character varying(254),
	ti_ba_code character varying(254) NOT NULL,
	ti_prop character varying(20),
	ti_type character varying(10),
	ti_rf_code character varying(254),
	ti_taille numeric(5,2),
	ti_placemt numeric(5,2),
	ti_etat character varying(3),
	ti_localis character varying(254),
	ti_comment character varying(254),
	ti_creadat timestamp,
	ti_majdate timestamp,
	ti_majsrc character varying(254),
	ti_abddate timestamp,
	ti_abdsrc character varying(254),
	CONSTRAINT "t_tiroir_pk " PRIMARY KEY (ti_code),
	CONSTRAINT ti_codeext_unique UNIQUE (ti_codeext)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_tiroir IS E'Tiroirs (donc positionnés en baie), et têtes de câble optiques (positionnées sur des fermes).';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_code IS E'Code du tiroir optique';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_codeext IS E'Code chez un tiers ou dans une autre base de données.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_perirec IS E'Identifiant de perimetre récolé à un instant t';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_abandon IS E'Défini si l''entité est abandonnée ou non dans un SI';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_etiquet IS E'Etiquette sur le terrain';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_ba_code IS E'Identifiant unique contenu dans la table t_baie';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_prop IS E'Propriétaire du tiroir';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_type IS E'Type du contenant selon qu''il s''agisse d''un TIROIR ou d''une TETE DE CABLE.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_rf_code IS E'Identifiant de la référence du tiroir dans la table référence.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_taille IS E'Taille du tiroir en nombre de U';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_placemt IS E'Position du tiroir en "nombre de U"';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_etat IS E'Etat du TIROIR';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_localis IS E'Informations de localisation du tiroir';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_tiroir.ti_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_tiroir OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_cassette | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_cassette CASCADE;
CREATE TABLE gracethd_reseau_optique.t_cassette (
	cs_code character varying(254) NOT NULL,
	cs_bp_code character varying(254),
	cs_num integer,
	cs_type character varying(1),
	cs_face character varying(20),
	cs_rf_code character varying(254),
	cs_nb_pas integer,
	cs_comment character varying(254),
	cs_creadat timestamp,
	cs_majdate timestamp,
	cs_majsrc character varying(254),
	cs_abddate timestamp,
	cs_abdsrc character varying(254),
	CONSTRAINT "t_cassette_pk " PRIMARY KEY (cs_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_cassette IS E'Cassettes contenues dans les éléments de branchements passifs du réseau (voir définition table t_ebp) et modules contenus dans les tiroirs.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cassette.cs_code IS E'Code unique de la cassette (ou du module dans un tiroir).';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cassette.cs_bp_code IS E'Identifiant unique de l''EBP auquel appartient la cassette';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cassette.cs_num IS E'Numéro de la cassette (ou du module dans un tiroir) dans l''organiseur du BPE.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cassette.cs_type IS E'Type de cassette (ou du module dans un tiroir) dans un tiroir (SOUDURE, LOVAGE, SPLITTER, CONNECTEUR, …etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cassette.cs_face IS E'Face du BPE sur laquelle est enfichée la cassette/le module dans un tiroir';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cassette.cs_rf_code IS E'Identifiant unique dans la table référence.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cassette.cs_nb_pas IS E'Taille de la cassette (ou du module dans un tiroir)  (en nombre de pas)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cassette.cs_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cassette.cs_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cassette.cs_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cassette.cs_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cassette.cs_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_cassette.cs_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_cassette OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_fibre | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_fibre CASCADE;
CREATE TABLE gracethd_reseau_optique.t_fibre (
	fo_code character varying(254) NOT NULL,
	fo_cb_code character varying(254) NOT NULL,
	fo_nincab integer,
	fo_numtub integer,
	fo_nintub integer,
	fo_etat character varying(3),
	fo_code_ext character varying(254),
	fo_color character varying(10),
	fo_reper character varying(5),
	fo_proptyp character varying(3),
	fo_comment character varying(254),
	fo_creadat timestamp,
	fo_majdate timestamp,
	fo_majsrc character varying(254),
	fo_abddate timestamp,
	fo_abdsrc character varying(254),
	CONSTRAINT "t_fibre_pk " PRIMARY KEY (fo_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_fibre IS E'Fibres optiques constituant les câbles.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_fibre.fo_code IS E'Identifiant unique de la fibre';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_fibre.fo_cb_code IS E'Identifiant unique du câble auquel la fibre appartient';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_fibre.fo_nincab IS E'Numéro de fibre dans le câble';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_fibre.fo_numtub IS E'Numéro du tube auquel appartient la fibre';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_fibre.fo_nintub IS E'Numéro de la fibre dans le tube (1 à 12, …)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_fibre.fo_etat IS E'Etat de fonctionnement de la fibre.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_fibre.fo_code_ext IS E'Code chez un tiers ou dans une autre base de données.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_fibre.fo_color IS E'Numéro de fibre selon le code couleur (valeurs à adapter aux usages).';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_fibre.fo_reper IS E'Repérage du tube';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_fibre.fo_proptyp IS E'Type de propriété';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_fibre.fo_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_fibre.fo_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_fibre.fo_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_fibre.fo_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_fibre.fo_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_fibre.fo_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_fibre OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_position | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_position CASCADE;
CREATE TABLE gracethd_reseau_optique.t_position (
	ps_code character varying(254) NOT NULL,
	ps_1 character varying(254),
	ps_2 character varying(254),
	ps_numero integer,
	ps_cs_code character varying(254) NOT NULL,
	ps_type character varying(10),
	ps_fonct character varying(2),
	ps_preaff character varying(50),
	ps_ti_code character varying(254),
	ps_etat character varying(3),
	ps_usetype character varying(2),
	ps_comment character varying(254),
	ps_creadat timestamp,
	ps_majdate timestamp,
	ps_majsrc character varying(254),
	ps_abddate timestamp,
	ps_abdsrc character varying(254),
	CONSTRAINT "t_position_pk " PRIMARY KEY (ps_code),
	CONSTRAINT ps_1_unique UNIQUE (ps_1),
	CONSTRAINT ps_2_unique UNIQUE (ps_2)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_position IS E'Smoove lorsque la position appartient à une cassette, corps de traversée lorsque la position appartient à un tiroir ou une tête optique.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_code IS E'Code unique.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_1 IS E'Code unique de la fibre en entrée de la cassette.(pour continuité route optique)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_2 IS E'Code unique de la fibre en sortie de la cassette.(pour continuité route optique)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_numero IS E'Position (numéro de compartiment) du smoove ou du connecteur';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_cs_code IS E'Identifiant unique de la CASSETTE à laquelle appartient la position. (le cas échéant)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_type IS E'Type de connecteur / soudure.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_fonct IS E'Type de connectorisation (Connecteur, epissure, pigtail, ….)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_preaff IS E'Pré-affectation de la route optique au local client de l''IP, ou de l''IPE ou à l''Infrastructure d''Imbrication.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_ti_code IS E'Identifiant unique du TIROIR / de la TCOP à laquelle appartient la position. (cas échéant)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_etat IS E'Etat de fonctionnement de la position / du corps de traversée,';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_usetype IS E'Type d’usage d’un alignement de fibres. Sur un réseau FTTH, à renseigner sur la position de la dernière fibre dans le sens NRO vers PTO.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_position.ps_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_position OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_znro | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_znro CASCADE;
CREATE TABLE gracethd_reseau_optique.t_znro (
	zn_code character varying(254) NOT NULL,
	zn_nd_code character varying(254),
	zn_nom character varying(30),
	zn_nroref character varying(15),
	zn_r1_code character varying(100),
	zn_r2_code character varying(100),
	zn_lc_code character varying(254) NOT NULL,
	zn_etat character varying(2),
	geom public.geometry NOT NULL,
	zn_r3_code character varying(100),
	zn_r4_code character varying(100),
	zn_nrotype character varying(7),
	zn_etatlpm character varying(2),
	zn_datelpm timestamp,
	zn_comment character varying(254),
	zn_geolsrc character varying(254),
	zn_creadat timestamp,
	zn_majdate timestamp,
	zn_majsrc character varying(254),
	zn_abddate timestamp,
	zn_abdsrc character varying(254),
	CONSTRAINT "t_znro_pk " PRIMARY KEY (zn_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_znro IS E'Zone arrière d''un Noeud de Raccordement Optique (NRO).';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_code IS E'Code la zone arrière de NRO';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_nd_code IS E'Code interne hérité du Noeud';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_nom IS E'Nommage temporaire en attente de l''intégration dans le SI-SIG exploitant';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_nroref IS E'Référence du NRO (Interop CPN)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_r1_code IS E'Code d''un référencement du réseau 1 (plaque, dsp, BM, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_r2_code IS E'Code d''un référencement du réseau 2 (poche, tronçon, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_lc_code IS E'Local  (fonctionnel) ayant la fonction de NRO.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_etat IS E'Etat d''avancement du NRO (Interop CPN)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.geom IS E'Surface de couverture';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_r3_code IS E'Code d''un référencement du réseau 3 (secteur, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_r4_code IS E'Code d''un référencement du réseau 4';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_nrotype IS E'Type de NRO.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_etatlpm IS E'Etat d''avancement du lien entre le NRO et le SRO.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_datelpm IS E'Date d''installation du lien entre le NRO et le SRO (Interop CPN)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_geolsrc IS E'Source de la géolocalisation pour préciser la source si nécessaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_znro.zn_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_znro OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_zsro | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_zsro CASCADE;
CREATE TABLE gracethd_reseau_optique.t_zsro (
	zs_code character varying(254) NOT NULL,
	zs_nd_code character varying(254) NOT NULL,
	zs_zn_code character varying(254),
	zs_r1_code character varying(100),
	zs_r2_code character varying(100),
	zs_r3_code character varying(100),
	zs_etatpm character varying(2),
	zs_capamax integer,
	zs_nblogmt integer,
	zs_actif character varying(1),
	zs_lc_code character varying(254) NOT NULL,
	zs_lgmaxln numeric(5,2),
	zs_nom character varying(30),
	zs_znllong numeric(5,2),
	zs_refpm character varying(20),
	geom public.geometry NOT NULL,
	zs_r4_code character varying(100),
	zs_dateins timestamp,
	zs_typeemp character varying(3),
	zs_ad_code character varying(254),
	zs_typeing character varying(254),
	zs_nbcolmt integer,
	zs_datcomr timestamp,
	zs_datemad timestamp,
	zs_accgest character varying(1),
	zs_brassoi character varying(1),
	zs_comment character varying(254),
	zs_geolsrc character varying(254),
	zs_creadat timestamp,
	zs_majdate timestamp,
	zs_majsrc character varying(254),
	zs_abddate timestamp,
	zs_abdsrc character varying(254),
	CONSTRAINT "t_zsro_pk " PRIMARY KEY (zs_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_zsro IS E'Zone Arrière d''un Sous-Répartiteur Optique (SRO).';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_code IS E'Code la zone arrière de SRO';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_nd_code IS E'Code interne hérité du Noeud';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_zn_code IS E'Code de la Zone Arrière de NRO correspondante.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_r1_code IS E'Code d''un référencement du réseau 1 (plaque, dsp, BM, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_r2_code IS E'Code d''un référencement du réseau 2 (poche, tronçon, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_r3_code IS E'Code d''un référencement du réseau 3 (secteur, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_etatpm IS E'IPE : Doit être renseigné dès lors que le SRO apparait dans l''IPE.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_capamax IS E'IPE : Capacité maximum théorique du SRO.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_nblogmt IS E'IPE : Ce champ correspond au nombre total de logements dans la zone arrière du SRO Technique (c''est à dire nombre de logements total : ciblé, signé, déployé). Dans le cadre d''un SRO Intérieur il correspond à l''ensemble des logements raccordables. Dans le cadre d''un SRO Extérieur, il correspond à l''ensemble des logements dans la zone arrière du SRO, quel que soit leur statut  ';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_actif IS E'IPE: Indique s''il y a de l''electricité au SRO pour permettre à un opérateur commercial d''y disposer des équipements actifs.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_lc_code IS E'Local  (fonctionnel) ayant la fonction de SRO.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_lgmaxln IS E'Longueur maximale des lignes situées dans la zone arrière du SRO.  Elle est exprimée en kilomètres avec avec 2 chiffres après la virgule (Interop : LongueurMaxLignes)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_nom IS E'Nom collectivité de la ZSRO';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_znllong IS E'Ce champ correspond à la longueur du lien entre le SRO et le NRO, en kilomètres avec 2 chiffres après la virgule ou le point. Conditionné à la présence d''une ReferenceLienPMPRDM (Interop : LongueurLienPMPRDM)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_refpm IS E'IPE : Référence SRO propre à chaque OI et pérenne. La reference SRO est obligatoire dès lors que le SRO est en cours de déploiement et ne peut apparaître avant. La référence SRO est celle du SRO de Regroupement dans le cas de plusieurs SRO Techniques rattachés au même SRO.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.geom IS E'Surface de couverture';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_r4_code IS E'Code d''un référencement du réseau 4';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_dateins IS E'Date de passage à l''état déployé du SRO.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_typeemp IS E'Localisation physique du SRO (façade, poteau, chambre, intérieur…) et/ou type de SRO (shelter, armoire de rue, en sous-sol….).';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_ad_code IS E'Code de l''adresse dans la table adresse.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_typeing IS E'Type d''ingénierie (mono, bi, quadri) tel que décrit dans le contrat de l''OI.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_nbcolmt IS E'Nombre de colonnes montantes associées au SRO dans les cas de SRO Intérieur.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_datcomr IS E'Date à laquelle le raccordement effectif d''un client final à ce SRO est possible du point de vue de la réglementation.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_datemad IS E'Date de Première Mise à Disposition du SRO à un opérateur commercial.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_accgest IS E'Nécessité de l''accord du gestionnaire d''immeuble (copropriété, syndic, etc.)  pour raccorder l''adresse';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_brassoi IS E'Brassages uniquement par l''OI lui même.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_geolsrc IS E'Source de la géolocalisation pour préciser la source si nécessaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zsro.zs_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_zsro OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_zdep | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_zdep CASCADE;
CREATE TABLE gracethd_reseau_optique.t_zdep (
	zd_code character varying(254) NOT NULL,
	zd_nd_code character varying(254),
	zd_zs_code character varying(254),
	zd_r1_code character varying(100),
	zd_r2_code character varying(100),
	zd_r3_code character varying(100),
	zd_r4_code character varying(100),
	zd_statut character varying(3),
	geom public.geometry NOT NULL,
	zd_prop character varying(20),
	zd_gest character varying(20),
	zd_comment character varying(254),
	zd_geolsrc character varying(254),
	zd_majsrc character varying(254),
	zd_abdsrc character varying(254),
	zd_creadat timestamp,
	zd_majdate timestamp,
	zd_abddate timestamp,
	CONSTRAINT "t_zdep_pk " PRIMARY KEY (zd_code),
	CONSTRAINT zd_nd_code_unique UNIQUE (zd_nd_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_zdep IS E'Zone de déploiement. Pour définir des zones correspondant à des phases de déploiement.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_code IS E'Code de zone de déploiement d''infrastructure.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_nd_code IS E'Code interne hérité du Noeud';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_zs_code IS E'Code de la Zone arrière de SRO parente s''il s''agit d''une subdivision.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_r1_code IS E'Code d''un référencement du réseau 1 (plaque, dsp, BM, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_r2_code IS E'Code d''un référencement du réseau 2 (poche, tronçon, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_r3_code IS E'Code d''un référencement du réseau 3 (secteur, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_r4_code IS E'Code d''un référencement du réseau 4';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_statut IS E'Statut de déploiement.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.geom IS E'Surface de couverture';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_prop IS E'Propriétaire du site';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_gest IS E'Gestionnaire du site';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_geolsrc IS E'Source de la géolocalisation pour préciser la source si nécessaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zdep.zd_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_zdep OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_zpbo | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_zpbo CASCADE;
CREATE TABLE gracethd_reseau_optique.t_zpbo (
	zp_code character varying(254) NOT NULL,
	zp_nd_code character varying(254),
	zp_zs_code character varying(254) NOT NULL,
	zp_r1_code character varying(100),
	zp_r2_code character varying(100),
	zp_r3_code character varying(100),
	zp_r4_code character varying(100),
	zp_capamax integer,
	zp_comment character varying(254),
	zp_geolsrc character varying(254),
	zp_creadat timestamp,
	zp_majdate timestamp,
	zp_majsrc character varying(254),
	zp_abddate timestamp,
	zp_abdsrc character varying(254),
	zp_bp_code character varying(254) NOT NULL,
	geom public.geometry NOT NULL,
	CONSTRAINT "t_zpbo_pk " PRIMARY KEY (zp_code),
	CONSTRAINT zp_bp_code_unique UNIQUE (zp_bp_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_zpbo IS E'Zone Arrière d''un Point de Branchement Optique (PBO).';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.zp_code IS E'Code la zone arrière de PBO';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.zp_nd_code IS E'Code interne hérité du Noeud';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.zp_zs_code IS E'Code de la Zone Arrière de SRO correspondante.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.zp_r1_code IS E'Code d''un référencement du réseau 1 (plaque, dsp, BM, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.zp_r2_code IS E'Code d''un référencement du réseau 2 (poche, tronçon, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.zp_r3_code IS E'Code d''un référencement du réseau 3 (secteur, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.zp_r4_code IS E'Code d''un référencement du réseau 4';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.zp_capamax IS E'Capacité en nombre de lignes.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.zp_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.zp_geolsrc IS E'Source de la géolocalisation pour préciser la source si nécessaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.zp_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.zp_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.zp_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.zp_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.zp_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.zp_bp_code IS E'Code de l’élément de branchement passif correspondant au PBO.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zpbo.geom IS E'Surface de couverture';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_zpbo OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_zcoax | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_zcoax CASCADE;
CREATE TABLE gracethd_reseau_optique.t_zcoax (
	zc_code character varying(254) NOT NULL,
	zc_codeext character varying(254),
	zc_nd_code character varying(254),
	zc_r1_code character varying(100),
	zc_r2_code character varying(100),
	zc_r3_code character varying(100),
	zc_r4_code character varying(100),
	zc_prop character varying(20),
	zc_gest character varying(20),
	zc_statut character varying(3),
	zc_comment character varying(254),
	zc_geolsrc character varying(254),
	zc_creadat timestamp,
	zc_majdate timestamp,
	zc_majsrc character varying(254),
	zc_abddate timestamp,
	zc_abdsrc character varying(254),
	geom public.geometry NOT NULL,
	CONSTRAINT "t_zcoax_pk " PRIMARY KEY (zc_code),
	CONSTRAINT zc_nd_code_unique UNIQUE (zc_nd_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_zcoax IS E'Zone de couverture par un service de cablo-opérateur.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_code IS E'Code la zone de couverture de service cablé (COAX).';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_codeext IS E'Code de la zone dans une base de données externe.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_nd_code IS E'Code interne hérité du Noeud. Permet de rattacher la zone à un noeud si l''information est disponible.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_r1_code IS E'Code d''un référencement du réseau 1 (plaque, dsp, BM, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_r2_code IS E'Code d''un référencement du réseau 2 (poche, tronçon, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_r3_code IS E'Code d''un référencement du réseau 3 (secteur, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_r4_code IS E'Code d''un référencement du réseau 4';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_prop IS E'Propriétaire du site';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_gest IS E'Gestionnaire du site';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_statut IS E'Statut de déploiement.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_geolsrc IS E'Source de la géolocalisation pour préciser la source si nécessaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.zc_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_zcoax.geom IS E'Surface de couverture';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_zcoax OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_equipement | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_equipement CASCADE;
CREATE TABLE gracethd_reseau_optique.t_equipement (
	eq_code character varying(254) NOT NULL,
	eq_codeext character varying(254),
	eq_etiquet character varying(254),
	eq_ba_code character varying(254) NOT NULL,
	eq_prop character varying(20),
	eq_rf_code character varying(254),
	eq_dateins timestamp,
	eq_datemes timestamp,
	eq_comment character varying(254),
	eq_creadat timestamp,
	eq_majdate timestamp,
	eq_majsrc character varying(254),
	eq_abddate timestamp,
	eq_abdsrc character varying(254),
	CONSTRAINT "t_equipement_pk " PRIMARY KEY (eq_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_equipement IS E'Liste des équipements présents sur le réseau. Il pourra s''agir d''équipement actif ou d''équipement servant fournir des conditions de fonctionnement nécessaires (climatisation, atelier 48 Volts, chantier batteries et redresseurs, ...).';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_equipement.eq_code IS E'Code de l''équipement actif';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_equipement.eq_codeext IS E'Code chez un tiers ou dans une autre base de données.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_equipement.eq_etiquet IS E'Etiquette sur le terrain';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_equipement.eq_ba_code IS E'Identifiant unique de la BAIE/FERME contenant l''équipement';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_equipement.eq_prop IS E'Propriétaire de l''équipement';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_equipement.eq_rf_code IS E'Identifiant unique correspondant à la référence de l''équipement.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_equipement.eq_dateins IS E'Date de pose de l''équipement';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_equipement.eq_datemes IS E'Date de mise en service';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_equipement.eq_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_equipement.eq_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_equipement.eq_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_equipement.eq_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_equipement.eq_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_equipement.eq_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_equipement OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.t_ropt | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.t_ropt CASCADE;
CREATE TABLE gracethd_reseau_optique.t_ropt (
	rt_id bigint,
	rt_code character varying(254) NOT NULL,
	rt_code_ext character varying(254),
	rt_fo_code character varying(254) NOT NULL,
	rt_fo_ordr integer,
	rt_comment character varying(254),
	rt_creadat timestamp,
	rt_majdate timestamp,
	rt_majsrc character varying(254),
	rt_abddate timestamp,
	rt_abdsrc character varying(254),
	CONSTRAINT "t_ropt_pk " PRIMARY KEY (rt_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_reseau_optique.t_ropt IS E'Liste de routes optiques du réseau. Une route optique va d''un équipement à une autre et doit pouvoir être allumée. A distinguer des alignements de fibres modélisés par les positions.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ropt.rt_id IS E'Identifiant unique pouvant être auto-incrémenté';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ropt.rt_code IS E'Code de la route optique.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ropt.rt_code_ext IS E'Nom de la route optique dans un système d''information externe.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ropt.rt_fo_code IS E'Code de la fibre.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ropt.rt_fo_ordr IS E'Numéro d''ordre de la fibre pour la composition de la route optique.';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ropt.rt_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ropt.rt_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ropt.rt_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ropt.rt_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ropt.rt_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_reseau_optique.t_ropt.rt_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.t_ropt OWNER TO postgres;
-- ddl-end --


-- object: gracethd_reseau_optique.l_avancement | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_avancement CASCADE;
CREATE TABLE gracethd_reseau_optique.l_avancement (
	code character varying(1) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_avancement_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_avancement OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_baie_type | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_baie_type CASCADE;
CREATE TABLE gracethd_reseau_optique.l_baie_type (
	code character varying(5) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_baie_type_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_baie_type OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_bp_type_log | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_bp_type_log CASCADE;
CREATE TABLE gracethd_reseau_optique.l_bp_type_log (
	code character varying(3) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_bp_type_log_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_bp_type_log OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_bp_type_phy | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_bp_type_phy CASCADE;
CREATE TABLE gracethd_reseau_optique.l_bp_type_phy (
	code character varying(4) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_bp_type_phy_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_bp_type_phy OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_cable_type | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_cable_type CASCADE;
CREATE TABLE gracethd_reseau_optique.l_cable_type (
	code character varying(1) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_cable_type_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_cable_type OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_cassette_type | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_cassette_type CASCADE;
CREATE TABLE gracethd_reseau_optique.l_cassette_type (
	code character varying(1) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_cassette_type_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_cassette_type OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_fo_type | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_fo_type CASCADE;
CREATE TABLE gracethd_reseau_optique.l_fo_type (
	code character varying(6) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_fo_type_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_fo_type OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_implantation | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_implantation CASCADE;
CREATE TABLE gracethd_reseau_optique.l_implantation (
	code character varying(1) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_implantation_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_implantation OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_cable_chem_type_log | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_cable_chem_type_log CASCADE;
CREATE TABLE gracethd_reseau_optique.l_cable_chem_type_log (
	code character varying(2) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_cable_chem_type_log_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_cable_chem_type_log OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_nro_etat | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_nro_etat CASCADE;
CREATE TABLE gracethd_reseau_optique.l_nro_etat (
	code character varying(2) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_nro_etat_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_nro_etat OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_occupation | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_occupation CASCADE;
CREATE TABLE gracethd_reseau_optique.l_occupation (
	code character varying(3) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_occupation_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_occupation OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_position_fonction | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_position_fonction CASCADE;
CREATE TABLE gracethd_reseau_optique.l_position_fonction (
	code character varying(2) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_position_fonction_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_position_fonction OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_position_type | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_position_type CASCADE;
CREATE TABLE gracethd_reseau_optique.l_position_type (
	code character varying(3) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_position_type_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_position_type OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_ptech_nature | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_ptech_nature CASCADE;
CREATE TABLE gracethd_reseau_optique.l_ptech_nature (
	code character varying(5) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_ptech_nature_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_ptech_nature OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_ptech_type_phy | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_ptech_type_phy CASCADE;
CREATE TABLE gracethd_reseau_optique.l_ptech_type_phy (
	code character varying(1) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_ptech_type_phy_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_ptech_type_phy OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_site_type_log | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_site_type_log CASCADE;
CREATE TABLE gracethd_reseau_optique.l_site_type_log (
	code character varying(6) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_site_type_log_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_site_type_log OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_site_type_phy | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_site_type_phy CASCADE;
CREATE TABLE gracethd_reseau_optique.l_site_type_phy (
	code character varying(3) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_site_type_phy_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_site_type_phy OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_sro_etat | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_sro_etat CASCADE;
CREATE TABLE gracethd_reseau_optique.l_sro_etat (
	code character varying(2) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_sro_etat_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_sro_etat OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_statut | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_statut CASCADE;
CREATE TABLE gracethd_reseau_optique.l_statut (
	code character varying(3) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_statut_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_statut OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_tiroir_type | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_tiroir_type CASCADE;
CREATE TABLE gracethd_reseau_optique.l_tiroir_type (
	code character varying(6) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_tiroir_type_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_tiroir_type OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_local_type_log | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_local_type_log CASCADE;
CREATE TABLE gracethd_reseau_optique.l_local_type_log (
	code character varying(6) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_local_type_log_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_local_type_log OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_etat | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_etat CASCADE;
CREATE TABLE gracethd_reseau_optique.l_etat (
	code character varying(2) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_etat_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_etat OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_propriete | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_propriete CASCADE;
CREATE TABLE gracethd_reseau_optique.l_propriete (
	code character varying(3) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_propriete_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_propriete OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_geoloc_mode | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_geoloc_mode CASCADE;
CREATE TABLE gracethd_reseau_optique.l_geoloc_mode (
	code character varying(4) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_geoloc_mode_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_geoloc_mode OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_technologie | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_technologie CASCADE;
CREATE TABLE gracethd_reseau_optique.l_technologie (
	code character varying(3) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_technologie_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_technologie OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_bp_racco | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_bp_racco CASCADE;
CREATE TABLE gracethd_reseau_optique.l_bp_racco (
	code character varying(6) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_bp_racco_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_bp_racco OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_fo_color | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_fo_color CASCADE;
CREATE TABLE gracethd_reseau_optique.l_fo_color (
	code character varying(4) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_fo_color_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_fo_color OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_tube | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_tube CASCADE;
CREATE TABLE gracethd_reseau_optique.l_tube (
	code character varying(4) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_tube_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_tube OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_clim | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_clim CASCADE;
CREATE TABLE gracethd_reseau_optique.l_clim (
	code character varying(6) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_clim_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_clim OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_ptech_type_log | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_ptech_type_log CASCADE;
CREATE TABLE gracethd_reseau_optique.l_ptech_type_log (
	code character varying(1) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_ptech_type_log_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_ptech_type_log OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_nro_type | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_nro_type CASCADE;
CREATE TABLE gracethd_reseau_optique.l_nro_type (
	code character varying(7) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_nro_type_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_nro_type OWNER TO postgres;
-- ddl-end --

-- object: gracethd_reseau_optique.l_sro_emplacement | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_reseau_optique.l_sro_emplacement CASCADE;
CREATE TABLE gracethd_reseau_optique.l_sro_emplacement (
	code character varying(3) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_sro_emplacement_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_reseau_optique.l_sro_emplacement OWNER TO postgres;
-- ddl-end --

-- object: "est-rattaché-à" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ptech DROP CONSTRAINT IF EXISTS "est-rattaché-à" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ptech ADD CONSTRAINT "est-rattaché-à" FOREIGN KEY (pt_nd_code)
REFERENCES gracethd_reseau_optique.t_noeud (nd_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-rattaché-à" ON gracethd_reseau_optique.t_ptech  IS E'Un point technique a une géométrie portée par un noeud.';
-- ddl-end --


-- object: "est-situé-dans-point-technique" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ebp DROP CONSTRAINT IF EXISTS "est-situé-dans-point-technique" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ebp ADD CONSTRAINT "est-situé-dans-point-technique" FOREIGN KEY (bp_pt_code)
REFERENCES gracethd_reseau_optique.t_ptech (pt_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-situé-dans-point-technique" ON gracethd_reseau_optique.t_ebp  IS E'Un EBP peut être situé dans un local. Il peut aussi être situé dans un point technique.';
-- ddl-end --


-- object: "est-situé-dans-local" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ebp DROP CONSTRAINT IF EXISTS "est-situé-dans-local" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ebp ADD CONSTRAINT "est-situé-dans-local" FOREIGN KEY (bp_lc_code)
REFERENCES gracethd_reseau_optique.t_local (lc_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-situé-dans-local" ON gracethd_reseau_optique.t_ebp  IS E'Un EBP peut être situé dans un local. Il peut aussi être situé dans un point technique.';
-- ddl-end --


-- object: extremite1 | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cheminement DROP CONSTRAINT IF EXISTS extremite1 CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cheminement ADD CONSTRAINT extremite1 FOREIGN KEY (cm_ndcode1)
REFERENCES gracethd_reseau_optique.t_noeud (nd_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT extremite1 ON gracethd_reseau_optique.t_cheminement  IS E'Un cheminement est relié à un noeud par chacune de ses extrémités.';
-- ddl-end --


-- object: extremite2 | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cheminement DROP CONSTRAINT IF EXISTS extremite2 CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cheminement ADD CONSTRAINT extremite2 FOREIGN KEY (cm_ndcode2)
REFERENCES gracethd_reseau_optique.t_noeud (nd_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT extremite2 ON gracethd_reseau_optique.t_cheminement  IS E'Un cheminement est relié à un noeud par chacune de ses extrémités.';
-- ddl-end --


-- object: "est-rattaché-a" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_site DROP CONSTRAINT IF EXISTS "est-rattaché-a" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_site ADD CONSTRAINT "est-rattaché-a" FOREIGN KEY (st_nd_code)
REFERENCES gracethd_reseau_optique.t_noeud (nd_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-rattaché-a" ON gracethd_reseau_optique.t_site  IS E'Un site a une géométrie portée par un noeud.';
-- ddl-end --


-- object: "est-lié-à" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_site DROP CONSTRAINT IF EXISTS "est-lié-à" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_site ADD CONSTRAINT "est-lié-à" FOREIGN KEY (st_ad_code)
REFERENCES gracethd_commun.t_adresse (ad_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-lié-à" ON gracethd_reseau_optique.t_site  IS E'Un site peut être lié à une adresse.';
-- ddl-end --


-- object: "pré-affecté-à-ftth" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_local DROP CONSTRAINT IF EXISTS "pré-affecté-à-ftth" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_local ADD CONSTRAINT "pré-affecté-à-ftth" FOREIGN KEY (lc_bp_codf)
REFERENCES gracethd_reseau_optique.t_ebp (bp_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "pré-affecté-à-ftth" ON gracethd_reseau_optique.t_local  IS E'Un local peut être pré-affecté à un PBO pour un besoin FTTH.';
-- ddl-end --


-- object: "pré-affecté-à-ftte" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_local DROP CONSTRAINT IF EXISTS "pré-affecté-à-ftte" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_local ADD CONSTRAINT "pré-affecté-à-ftte" FOREIGN KEY (lc_bp_codp)
REFERENCES gracethd_reseau_optique.t_ebp (bp_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "pré-affecté-à-ftte" ON gracethd_reseau_optique.t_local  IS E'Un local peut être pré-affecté à une BPE pour un besoin FTTE.';
-- ddl-end --


-- object: "est-situé-dans" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_local DROP CONSTRAINT IF EXISTS "est-situé-dans" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_local ADD CONSTRAINT "est-situé-dans" FOREIGN KEY (lc_st_code)
REFERENCES gracethd_reseau_optique.t_site (st_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-situé-dans" ON gracethd_reseau_optique.t_local  IS E'Un local est situé dans un site.';
-- ddl-end --


-- object: "est-situé-dans" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_baie DROP CONSTRAINT IF EXISTS "est-situé-dans" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_baie ADD CONSTRAINT "est-situé-dans" FOREIGN KEY (ba_lc_code)
REFERENCES gracethd_reseau_optique.t_local (lc_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-situé-dans" ON gracethd_reseau_optique.t_baie  IS E'Une baie est située dans un local.';
-- ddl-end --


-- object: "noeud-amont" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS "noeud-amont" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT "noeud-amont" FOREIGN KEY (cb_nd1)
REFERENCES gracethd_reseau_optique.t_noeud (nd_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "noeud-amont" ON gracethd_reseau_optique.t_cable  IS E'Un câble est connecté en amont à un noeud.';
-- ddl-end --


-- object: "noeud-aval" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS "noeud-aval" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT "noeud-aval" FOREIGN KEY (cb_nd2)
REFERENCES gracethd_reseau_optique.t_noeud (nd_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "noeud-aval" ON gracethd_reseau_optique.t_cable  IS E'Un câble est connecté en aval à un noeud.';
-- ddl-end --


-- object: "bp-amont" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS "bp-amont" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT "bp-amont" FOREIGN KEY (cb_bp1)
REFERENCES gracethd_reseau_optique.t_ebp (bp_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "bp-amont" ON gracethd_reseau_optique.t_cable  IS E'Un câble peut être connecté en amont à un ebp.';
-- ddl-end --


-- object: "baie-amont" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS "baie-amont" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT "baie-amont" FOREIGN KEY (cb_ba1)
REFERENCES gracethd_reseau_optique.t_baie (ba_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "baie-amont" ON gracethd_reseau_optique.t_cable  IS E'Un câble peut être connecté en amont à une baie.';
-- ddl-end --


-- object: "bp-aval" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS "bp-aval" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT "bp-aval" FOREIGN KEY (cb_bp2)
REFERENCES gracethd_reseau_optique.t_ebp (bp_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "bp-aval" ON gracethd_reseau_optique.t_cable  IS E'Un câble peut être connecté en aval à un ebp.';
-- ddl-end --


-- object: "baie-aval" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS "baie-aval" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT "baie-aval" FOREIGN KEY (cb_ba2)
REFERENCES gracethd_reseau_optique.t_baie (ba_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "baie-aval" ON gracethd_reseau_optique.t_cable  IS E'Un câble peut être connecté en aval à une baie.';
-- ddl-end --


-- object: fk_t_cableline_cl_cb_code | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cableline DROP CONSTRAINT IF EXISTS fk_t_cableline_cl_cb_code CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cableline ADD CONSTRAINT fk_t_cableline_cl_cb_code FOREIGN KEY (cl_cb_code)
REFERENCES gracethd_reseau_optique.t_cable (cb_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT fk_t_cableline_cl_cb_code ON gracethd_reseau_optique.t_cableline  IS E'Une cableline porte la géométrie d''un câble. Un câble peut ne être lié à une cableline (câbles intrasites).';
-- ddl-end --


-- object: fk_t_cab_chem_cc_cb_code | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cab_chem DROP CONSTRAINT IF EXISTS fk_t_cab_chem_cc_cb_code CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cab_chem ADD CONSTRAINT fk_t_cab_chem_cc_cb_code FOREIGN KEY (cc_cb_code)
REFERENCES gracethd_reseau_optique.t_cable (cb_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_love_lv_cb_code | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_love DROP CONSTRAINT IF EXISTS fk_t_love_lv_cb_code CASCADE;
ALTER TABLE gracethd_reseau_optique.t_love ADD CONSTRAINT fk_t_love_lv_cb_code FOREIGN KEY (lv_cb_code)
REFERENCES gracethd_reseau_optique.t_cable (cb_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT fk_t_love_lv_cb_code ON gracethd_reseau_optique.t_love  IS E'Un love concerne un câble.';
-- ddl-end --


-- object: fk_t_love_lv_nd_code | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_love DROP CONSTRAINT IF EXISTS fk_t_love_lv_nd_code CASCADE;
ALTER TABLE gracethd_reseau_optique.t_love ADD CONSTRAINT fk_t_love_lv_nd_code FOREIGN KEY (lv_nd_code)
REFERENCES gracethd_reseau_optique.t_noeud (nd_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT fk_t_love_lv_nd_code ON gracethd_reseau_optique.t_love  IS E'Un love est situé dans un noeud.';
-- ddl-end --


-- object: "est-situé-dans" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_tiroir DROP CONSTRAINT IF EXISTS "est-situé-dans" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_tiroir ADD CONSTRAINT "est-situé-dans" FOREIGN KEY (ti_ba_code)
REFERENCES gracethd_reseau_optique.t_baie (ba_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-situé-dans" ON gracethd_reseau_optique.t_tiroir  IS E'Un tiroir est situé dans une baie.';
-- ddl-end --


-- object: "est-située-dans" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cassette DROP CONSTRAINT IF EXISTS "est-située-dans" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cassette ADD CONSTRAINT "est-située-dans" FOREIGN KEY (cs_bp_code)
REFERENCES gracethd_reseau_optique.t_ebp (bp_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-située-dans" ON gracethd_reseau_optique.t_cassette  IS E'Une cassette peut être située dans un élément de branchement passif. Elle peut aussi être située dans un tiroir (lien via la table position).';
-- ddl-end --


-- object: "fait-partie-de" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_fibre DROP CONSTRAINT IF EXISTS "fait-partie-de" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_fibre ADD CONSTRAINT "fait-partie-de" FOREIGN KEY (fo_cb_code)
REFERENCES gracethd_reseau_optique.t_cable (cb_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "fait-partie-de" ON gracethd_reseau_optique.t_fibre  IS E'Une fibre fait partie d''un câble.';
-- ddl-end --


-- object: "fibre-entrée" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_position DROP CONSTRAINT IF EXISTS "fibre-entrée" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_position ADD CONSTRAINT "fibre-entrée" FOREIGN KEY (ps_1)
REFERENCES gracethd_reseau_optique.t_fibre (fo_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "fibre-entrée" ON gracethd_reseau_optique.t_position  IS E'Une position a une fibre en entrée.';
-- ddl-end --


-- object: "fibre-sortie" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_position DROP CONSTRAINT IF EXISTS "fibre-sortie" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_position ADD CONSTRAINT "fibre-sortie" FOREIGN KEY (ps_2)
REFERENCES gracethd_reseau_optique.t_fibre (fo_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "fibre-sortie" ON gracethd_reseau_optique.t_position  IS E'Une position a une fibre en sortie.';
-- ddl-end --


-- object: "est-dans-cassette" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_position DROP CONSTRAINT IF EXISTS "est-dans-cassette" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_position ADD CONSTRAINT "est-dans-cassette" FOREIGN KEY (ps_cs_code)
REFERENCES gracethd_reseau_optique.t_cassette (cs_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-dans-cassette" ON gracethd_reseau_optique.t_position  IS E'Une position est située dans une cassette ou un module de tiroir.';
-- ddl-end --


-- object: "est-dans-tiroir" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_position DROP CONSTRAINT IF EXISTS "est-dans-tiroir" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_position ADD CONSTRAINT "est-dans-tiroir" FOREIGN KEY (ps_ti_code)
REFERENCES gracethd_reseau_optique.t_tiroir (ti_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-dans-tiroir" ON gracethd_reseau_optique.t_position  IS E'Une position peut-être située dans un tiroir.';
-- ddl-end --


-- object: "est-rattachée-à-noeud" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_znro DROP CONSTRAINT IF EXISTS "est-rattachée-à-noeud" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_znro ADD CONSTRAINT "est-rattachée-à-noeud" FOREIGN KEY (zn_nd_code)
REFERENCES gracethd_reseau_optique.t_noeud (nd_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-rattachée-à-noeud" ON gracethd_reseau_optique.t_znro  IS E'Une znro est rattachée à un noeud.';
-- ddl-end --


-- object: "est-rattachée-à-local" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_znro DROP CONSTRAINT IF EXISTS "est-rattachée-à-local" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_znro ADD CONSTRAINT "est-rattachée-à-local" FOREIGN KEY (zn_lc_code)
REFERENCES gracethd_reseau_optique.t_local (lc_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-rattachée-à-local" ON gracethd_reseau_optique.t_znro  IS E'Une ZNRO est rattachée au local où est situé son NRO.';
-- ddl-end --


-- object: "est-rattachée-à-noeud" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_zsro DROP CONSTRAINT IF EXISTS "est-rattachée-à-noeud" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_zsro ADD CONSTRAINT "est-rattachée-à-noeud" FOREIGN KEY (zs_nd_code)
REFERENCES gracethd_reseau_optique.t_noeud (nd_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-rattachée-à-noeud" ON gracethd_reseau_optique.t_zsro  IS E'Une ZSRO est rattachée à un noeud.';
-- ddl-end --


-- object: "est-rattachée-à-ZNRO" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_zsro DROP CONSTRAINT IF EXISTS "est-rattachée-à-ZNRO" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_zsro ADD CONSTRAINT "est-rattachée-à-ZNRO" FOREIGN KEY (zs_zn_code)
REFERENCES gracethd_reseau_optique.t_znro (zn_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-rattachée-à-ZNRO" ON gracethd_reseau_optique.t_zsro  IS E'une ZSRO est rattachée à une ZNRO.';
-- ddl-end --


-- object: "est-rattachée-à-local" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_zsro DROP CONSTRAINT IF EXISTS "est-rattachée-à-local" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_zsro ADD CONSTRAINT "est-rattachée-à-local" FOREIGN KEY (zs_lc_code)
REFERENCES gracethd_reseau_optique.t_local (lc_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-rattachée-à-local" ON gracethd_reseau_optique.t_zsro  IS E'Une ZSRO est rattachée au local où est situé son SRO.';
-- ddl-end --


-- object: "est-rattachée-à-noeud" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_zdep DROP CONSTRAINT IF EXISTS "est-rattachée-à-noeud" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_zdep ADD CONSTRAINT "est-rattachée-à-noeud" FOREIGN KEY (zd_nd_code)
REFERENCES gracethd_reseau_optique.t_noeud (nd_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-rattachée-à-noeud" ON gracethd_reseau_optique.t_zdep  IS E'Une zdep est rattachée à un noeud.';
-- ddl-end --


-- object: "est-rattachée-à-ZSRO" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_zdep DROP CONSTRAINT IF EXISTS "est-rattachée-à-ZSRO" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_zdep ADD CONSTRAINT "est-rattachée-à-ZSRO" FOREIGN KEY (zd_zs_code)
REFERENCES gracethd_reseau_optique.t_zsro (zs_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-rattachée-à-ZSRO" ON gracethd_reseau_optique.t_zdep  IS E'Une zdep est rattachée à une ZSRO.';
-- ddl-end --


-- object: "est-rattachée-à-noeud" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_zpbo DROP CONSTRAINT IF EXISTS "est-rattachée-à-noeud" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_zpbo ADD CONSTRAINT "est-rattachée-à-noeud" FOREIGN KEY (zp_nd_code)
REFERENCES gracethd_reseau_optique.t_noeud (nd_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-rattachée-à-noeud" ON gracethd_reseau_optique.t_zpbo  IS E'Une ZPBO est rattachée à un noeud.';
-- ddl-end --


-- object: "est-rattachée-à-ZSRO" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_zpbo DROP CONSTRAINT IF EXISTS "est-rattachée-à-ZSRO" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_zpbo ADD CONSTRAINT "est-rattachée-à-ZSRO" FOREIGN KEY (zp_zs_code)
REFERENCES gracethd_reseau_optique.t_zsro (zs_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-rattachée-à-ZSRO" ON gracethd_reseau_optique.t_zpbo  IS E'Une zpbo est rattachée à une ZSRO.';
-- ddl-end --


-- object: "est-rattachée-à" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_zcoax DROP CONSTRAINT IF EXISTS "est-rattachée-à" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_zcoax ADD CONSTRAINT "est-rattachée-à" FOREIGN KEY (zc_nd_code)
REFERENCES gracethd_reseau_optique.t_noeud (nd_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-rattachée-à" ON gracethd_reseau_optique.t_zcoax  IS E'Une Zcoax est rattachée à un noeud.';
-- ddl-end --


-- object: "est-situé-dans" | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_equipement DROP CONSTRAINT IF EXISTS "est-situé-dans" CASCADE;
ALTER TABLE gracethd_reseau_optique.t_equipement ADD CONSTRAINT "est-situé-dans" FOREIGN KEY (eq_ba_code)
REFERENCES gracethd_reseau_optique.t_baie (ba_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
COMMENT ON CONSTRAINT "est-situé-dans" ON gracethd_reseau_optique.t_equipement  IS E'Un équipement est situé dans une baie.';
-- ddl-end --

-- object: fk_t_equipement_eq_prop | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_equipement DROP CONSTRAINT IF EXISTS fk_t_equipement_eq_prop CASCADE;
ALTER TABLE gracethd_reseau_optique.t_equipement ADD CONSTRAINT fk_t_equipement_eq_prop FOREIGN KEY (eq_prop)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_equipement_eq_rf_code | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_equipement DROP CONSTRAINT IF EXISTS fk_t_equipement_eq_rf_code CASCADE;
ALTER TABLE gracethd_reseau_optique.t_equipement ADD CONSTRAINT fk_t_equipement_eq_rf_code FOREIGN KEY (eq_rf_code)
REFERENCES gracethd_commun.t_reference (rf_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_zcoax_zc_prop | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_zcoax DROP CONSTRAINT IF EXISTS fk_t_zcoax_zc_prop CASCADE;
ALTER TABLE gracethd_reseau_optique.t_zcoax ADD CONSTRAINT fk_t_zcoax_zc_prop FOREIGN KEY (zc_prop)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_zcoax_zc_gest | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_zcoax DROP CONSTRAINT IF EXISTS fk_t_zcoax_zc_gest CASCADE;
ALTER TABLE gracethd_reseau_optique.t_zcoax ADD CONSTRAINT fk_t_zcoax_zc_gest FOREIGN KEY (zc_gest)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cassette_cs_rf_code | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cassette DROP CONSTRAINT IF EXISTS fk_t_cassette_cs_rf_code CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cassette ADD CONSTRAINT fk_t_cassette_cs_rf_code FOREIGN KEY (cs_rf_code)
REFERENCES gracethd_commun.t_reference (rf_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_tiroir_ti_prop | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_tiroir DROP CONSTRAINT IF EXISTS fk_t_tiroir_ti_prop CASCADE;
ALTER TABLE gracethd_reseau_optique.t_tiroir ADD CONSTRAINT fk_t_tiroir_ti_prop FOREIGN KEY (ti_prop)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_tiroir_ti_rf_code | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_tiroir DROP CONSTRAINT IF EXISTS fk_t_tiroir_ti_rf_code CASCADE;
ALTER TABLE gracethd_reseau_optique.t_tiroir ADD CONSTRAINT fk_t_tiroir_ti_rf_code FOREIGN KEY (ti_rf_code)
REFERENCES gracethd_commun.t_reference (rf_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cable_cb_user | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS fk_t_cable_cb_user CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT fk_t_cable_cb_user FOREIGN KEY (cb_user)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cable_cb_prop | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS fk_t_cable_cb_prop CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT fk_t_cable_cb_prop FOREIGN KEY (cb_prop)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cable_cb_gest | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS fk_t_cable_cb_gest CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT fk_t_cable_cb_gest FOREIGN KEY (cb_gest)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cable_cb_rf_code | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS fk_t_cable_cb_rf_code CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT fk_t_cable_cb_rf_code FOREIGN KEY (cb_rf_code)
REFERENCES gracethd_commun.t_reference (rf_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_baie_ba_user | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_baie DROP CONSTRAINT IF EXISTS fk_t_baie_ba_user CASCADE;
ALTER TABLE gracethd_reseau_optique.t_baie ADD CONSTRAINT fk_t_baie_ba_user FOREIGN KEY (ba_user)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_baie_ba_prop | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_baie DROP CONSTRAINT IF EXISTS fk_t_baie_ba_prop CASCADE;
ALTER TABLE gracethd_reseau_optique.t_baie ADD CONSTRAINT fk_t_baie_ba_prop FOREIGN KEY (ba_prop)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_baie_ba_gest | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_baie DROP CONSTRAINT IF EXISTS fk_t_baie_ba_gest CASCADE;
ALTER TABLE gracethd_reseau_optique.t_baie ADD CONSTRAINT fk_t_baie_ba_gest FOREIGN KEY (ba_gest)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_baie_ba_rf_code | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_baie DROP CONSTRAINT IF EXISTS fk_t_baie_ba_rf_code CASCADE;
ALTER TABLE gracethd_reseau_optique.t_baie ADD CONSTRAINT fk_t_baie_ba_rf_code FOREIGN KEY (ba_rf_code)
REFERENCES gracethd_commun.t_reference (rf_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_local_lc_user | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_local DROP CONSTRAINT IF EXISTS fk_t_local_lc_user CASCADE;
ALTER TABLE gracethd_reseau_optique.t_local ADD CONSTRAINT fk_t_local_lc_user FOREIGN KEY (lc_user)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_local_lc_prop | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_local DROP CONSTRAINT IF EXISTS fk_t_local_lc_prop CASCADE;
ALTER TABLE gracethd_reseau_optique.t_local ADD CONSTRAINT fk_t_local_lc_prop FOREIGN KEY (lc_prop)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_local_lc_gest | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_local DROP CONSTRAINT IF EXISTS fk_t_local_lc_gest CASCADE;
ALTER TABLE gracethd_reseau_optique.t_local ADD CONSTRAINT fk_t_local_lc_gest FOREIGN KEY (lc_gest)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_site_st_user | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_site DROP CONSTRAINT IF EXISTS fk_t_site_st_user CASCADE;
ALTER TABLE gracethd_reseau_optique.t_site ADD CONSTRAINT fk_t_site_st_user FOREIGN KEY (st_user)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_site_st_prop | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_site DROP CONSTRAINT IF EXISTS fk_t_site_st_prop CASCADE;
ALTER TABLE gracethd_reseau_optique.t_site ADD CONSTRAINT fk_t_site_st_prop FOREIGN KEY (st_prop)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_site_st_gest | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_site DROP CONSTRAINT IF EXISTS fk_t_site_st_gest CASCADE;
ALTER TABLE gracethd_reseau_optique.t_site ADD CONSTRAINT fk_t_site_st_gest FOREIGN KEY (st_gest)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cheminement_cm_prop | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cheminement DROP CONSTRAINT IF EXISTS fk_t_cheminement_cm_prop CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cheminement ADD CONSTRAINT fk_t_cheminement_cm_prop FOREIGN KEY (cm_prop)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cheminement_cm_gest | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cheminement DROP CONSTRAINT IF EXISTS fk_t_cheminement_cm_gest CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cheminement ADD CONSTRAINT fk_t_cheminement_cm_gest FOREIGN KEY (cm_gest)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ebp_bp_user | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ebp DROP CONSTRAINT IF EXISTS fk_t_ebp_bp_user CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ebp ADD CONSTRAINT fk_t_ebp_bp_user FOREIGN KEY (bp_user)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ebp_bp_prop | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ebp DROP CONSTRAINT IF EXISTS fk_t_ebp_bp_prop CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ebp ADD CONSTRAINT fk_t_ebp_bp_prop FOREIGN KEY (bp_prop)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ebp_bp_gest | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ebp DROP CONSTRAINT IF EXISTS fk_t_ebp_bp_gest CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ebp ADD CONSTRAINT fk_t_ebp_bp_gest FOREIGN KEY (bp_gest)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ebp_bp_rf_code | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ebp DROP CONSTRAINT IF EXISTS fk_t_ebp_bp_rf_code CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ebp ADD CONSTRAINT fk_t_ebp_bp_rf_code FOREIGN KEY (bp_rf_code)
REFERENCES gracethd_commun.t_reference (rf_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ptech_pt_gest_do | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ptech DROP CONSTRAINT IF EXISTS fk_t_ptech_pt_gest_do CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ptech ADD CONSTRAINT fk_t_ptech_pt_gest_do FOREIGN KEY (pt_gest_do)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ptech_pt_prop_do | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ptech DROP CONSTRAINT IF EXISTS fk_t_ptech_pt_prop_do CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ptech ADD CONSTRAINT fk_t_ptech_pt_prop_do FOREIGN KEY (pt_prop_do)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ptech_pt_user | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ptech DROP CONSTRAINT IF EXISTS fk_t_ptech_pt_user CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ptech ADD CONSTRAINT fk_t_ptech_pt_user FOREIGN KEY (pt_user)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ptech_pt_prop | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ptech DROP CONSTRAINT IF EXISTS fk_t_ptech_pt_prop CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ptech ADD CONSTRAINT fk_t_ptech_pt_prop FOREIGN KEY (pt_prop)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ptech_pt_gest | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ptech DROP CONSTRAINT IF EXISTS fk_t_ptech_pt_gest CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ptech ADD CONSTRAINT fk_t_ptech_pt_gest FOREIGN KEY (pt_gest)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ptech_pt_rf_code | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ptech DROP CONSTRAINT IF EXISTS fk_t_ptech_pt_rf_code CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ptech ADD CONSTRAINT fk_t_ptech_pt_rf_code FOREIGN KEY (pt_rf_code)
REFERENCES gracethd_commun.t_reference (rf_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_t_baie_ba_abandon | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_baie DROP CONSTRAINT IF EXISTS fk_t_baie_ba_abandon CASCADE;
ALTER TABLE gracethd_reseau_optique.t_baie ADD CONSTRAINT fk_t_baie_ba_abandon FOREIGN KEY (ba_abandon)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cable_cb_abandon | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS fk_t_cable_cb_abandon CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT fk_t_cable_cb_abandon FOREIGN KEY (cb_abandon)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ebp_bp_abandon | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ebp DROP CONSTRAINT IF EXISTS fk_t_ebp_bp_abandon CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ebp ADD CONSTRAINT fk_t_ebp_bp_abandon FOREIGN KEY (bp_abandon)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_local_lc_abandon | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_local DROP CONSTRAINT IF EXISTS fk_t_local_lc_abandon CASCADE;
ALTER TABLE gracethd_reseau_optique.t_local ADD CONSTRAINT fk_t_local_lc_abandon FOREIGN KEY (lc_abandon)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_local_lc_elec | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_local DROP CONSTRAINT IF EXISTS fk_t_local_lc_elec CASCADE;
ALTER TABLE gracethd_reseau_optique.t_local ADD CONSTRAINT fk_t_local_lc_elec FOREIGN KEY (lc_elec)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ptech_pt_abandon | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ptech DROP CONSTRAINT IF EXISTS fk_t_ptech_pt_abandon CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ptech ADD CONSTRAINT fk_t_ptech_pt_abandon FOREIGN KEY (pt_abandon)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ptech_pt_secu | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ptech DROP CONSTRAINT IF EXISTS fk_t_ptech_pt_secu CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ptech ADD CONSTRAINT fk_t_ptech_pt_secu FOREIGN KEY (pt_secu)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_site_st_abandon | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_site DROP CONSTRAINT IF EXISTS fk_t_site_st_abandon CASCADE;
ALTER TABLE gracethd_reseau_optique.t_site ADD CONSTRAINT fk_t_site_st_abandon FOREIGN KEY (st_abandon)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_site_st_nra | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_site DROP CONSTRAINT IF EXISTS fk_t_site_st_nra CASCADE;
ALTER TABLE gracethd_reseau_optique.t_site ADD CONSTRAINT fk_t_site_st_nra FOREIGN KEY (st_nra)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_tiroir_ti_abandon | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_tiroir DROP CONSTRAINT IF EXISTS fk_t_tiroir_ti_abandon CASCADE;
ALTER TABLE gracethd_reseau_optique.t_tiroir ADD CONSTRAINT fk_t_tiroir_ti_abandon FOREIGN KEY (ti_abandon)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_zsro_zs_actif | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_zsro DROP CONSTRAINT IF EXISTS fk_t_zsro_zs_actif CASCADE;
ALTER TABLE gracethd_reseau_optique.t_zsro ADD CONSTRAINT fk_t_zsro_zs_actif FOREIGN KEY (zs_actif)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ptech_pt_statut | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ptech DROP CONSTRAINT IF EXISTS fk_t_ptech_pt_statut CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ptech ADD CONSTRAINT fk_t_ptech_pt_statut FOREIGN KEY (pt_statut)
REFERENCES gracethd_reseau_optique.l_statut (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ptech_pt_avct | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ptech DROP CONSTRAINT IF EXISTS fk_t_ptech_pt_avct CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ptech ADD CONSTRAINT fk_t_ptech_pt_avct FOREIGN KEY (pt_avct)
REFERENCES gracethd_reseau_optique.l_avancement (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ptech_pt_typephy | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ptech DROP CONSTRAINT IF EXISTS fk_t_ptech_pt_typephy CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ptech ADD CONSTRAINT fk_t_ptech_pt_typephy FOREIGN KEY (pt_typephy)
REFERENCES gracethd_reseau_optique.l_ptech_type_phy (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ptech_pt_nature | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ptech DROP CONSTRAINT IF EXISTS fk_t_ptech_pt_nature CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ptech ADD CONSTRAINT fk_t_ptech_pt_nature FOREIGN KEY (pt_nature)
REFERENCES gracethd_reseau_optique.l_ptech_nature (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ptech_pt_etat | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ptech DROP CONSTRAINT IF EXISTS fk_t_ptech_pt_etat CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ptech ADD CONSTRAINT fk_t_ptech_pt_etat FOREIGN KEY (pt_etat)
REFERENCES gracethd_reseau_optique.l_etat (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ptech_pt_typelog | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ptech DROP CONSTRAINT IF EXISTS fk_t_ptech_pt_typelog CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ptech ADD CONSTRAINT fk_t_ptech_pt_typelog FOREIGN KEY (pt_typelog)
REFERENCES gracethd_reseau_optique.l_ptech_type_log (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ptech_pt_occp | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ptech DROP CONSTRAINT IF EXISTS fk_t_ptech_pt_occp CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ptech ADD CONSTRAINT fk_t_ptech_pt_occp FOREIGN KEY (pt_occp)
REFERENCES gracethd_reseau_optique.l_occupation (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ebp_bp_proptyp | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ebp DROP CONSTRAINT IF EXISTS fk_t_ebp_bp_proptyp CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ebp ADD CONSTRAINT fk_t_ebp_bp_proptyp FOREIGN KEY (bp_proptyp)
REFERENCES gracethd_reseau_optique.l_propriete (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ebp_bp_statut | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ebp DROP CONSTRAINT IF EXISTS fk_t_ebp_bp_statut CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ebp ADD CONSTRAINT fk_t_ebp_bp_statut FOREIGN KEY (bp_statut)
REFERENCES gracethd_reseau_optique.l_statut (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ebp_bp_avct | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ebp DROP CONSTRAINT IF EXISTS fk_t_ebp_bp_avct CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ebp ADD CONSTRAINT fk_t_ebp_bp_avct FOREIGN KEY (bp_avct)
REFERENCES gracethd_reseau_optique.l_avancement (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ebp_bp_typephy | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ebp DROP CONSTRAINT IF EXISTS fk_t_ebp_bp_typephy CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ebp ADD CONSTRAINT fk_t_ebp_bp_typephy FOREIGN KEY (bp_typephy)
REFERENCES gracethd_reseau_optique.l_bp_type_phy (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ebp_bp_typelog | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ebp DROP CONSTRAINT IF EXISTS fk_t_ebp_bp_typelog CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ebp ADD CONSTRAINT fk_t_ebp_bp_typelog FOREIGN KEY (bp_typelog)
REFERENCES gracethd_reseau_optique.l_bp_type_log (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ebp_bp_etat | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ebp DROP CONSTRAINT IF EXISTS fk_t_ebp_bp_etat CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ebp ADD CONSTRAINT fk_t_ebp_bp_etat FOREIGN KEY (bp_etat)
REFERENCES gracethd_reseau_optique.l_etat (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ebp_bp_occp | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ebp DROP CONSTRAINT IF EXISTS fk_t_ebp_bp_occp CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ebp ADD CONSTRAINT fk_t_ebp_bp_occp FOREIGN KEY (bp_occp)
REFERENCES gracethd_reseau_optique.l_occupation (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_ebp_bp_racco | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_ebp DROP CONSTRAINT IF EXISTS fk_t_ebp_bp_racco CASCADE;
ALTER TABLE gracethd_reseau_optique.t_ebp ADD CONSTRAINT fk_t_ebp_bp_racco FOREIGN KEY (bp_racco)
REFERENCES gracethd_reseau_optique.l_bp_racco (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cheminement_cm_statut | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cheminement DROP CONSTRAINT IF EXISTS fk_t_cheminement_cm_statut CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cheminement ADD CONSTRAINT fk_t_cheminement_cm_statut FOREIGN KEY (cm_statut)
REFERENCES gracethd_reseau_optique.l_statut (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cheminement_cm_avct | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cheminement DROP CONSTRAINT IF EXISTS fk_t_cheminement_cm_avct CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cheminement ADD CONSTRAINT fk_t_cheminement_cm_avct FOREIGN KEY (cm_avct)
REFERENCES gracethd_reseau_optique.l_avancement (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cheminement_cm_typelog | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cheminement DROP CONSTRAINT IF EXISTS fk_t_cheminement_cm_typelog CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cheminement ADD CONSTRAINT fk_t_cheminement_cm_typelog FOREIGN KEY (cm_typelog)
REFERENCES gracethd_reseau_optique.l_cable_chem_type_log (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cheminement_cm_typ_imp | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cheminement DROP CONSTRAINT IF EXISTS fk_t_cheminement_cm_typ_imp CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cheminement ADD CONSTRAINT fk_t_cheminement_cm_typ_imp FOREIGN KEY (cm_typ_imp)
REFERENCES gracethd_reseau_optique.l_implantation (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_site_st_proptyp | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_site DROP CONSTRAINT IF EXISTS fk_t_site_st_proptyp CASCADE;
ALTER TABLE gracethd_reseau_optique.t_site ADD CONSTRAINT fk_t_site_st_proptyp FOREIGN KEY (st_proptyp)
REFERENCES gracethd_reseau_optique.l_propriete (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_site_st_statut | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_site DROP CONSTRAINT IF EXISTS fk_t_site_st_statut CASCADE;
ALTER TABLE gracethd_reseau_optique.t_site ADD CONSTRAINT fk_t_site_st_statut FOREIGN KEY (st_statut)
REFERENCES gracethd_reseau_optique.l_statut (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_site_st_avct | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_site DROP CONSTRAINT IF EXISTS fk_t_site_st_avct CASCADE;
ALTER TABLE gracethd_reseau_optique.t_site ADD CONSTRAINT fk_t_site_st_avct FOREIGN KEY (st_avct)
REFERENCES gracethd_reseau_optique.l_avancement (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_site_st_typephy | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_site DROP CONSTRAINT IF EXISTS fk_t_site_st_typephy CASCADE;
ALTER TABLE gracethd_reseau_optique.t_site ADD CONSTRAINT fk_t_site_st_typephy FOREIGN KEY (st_typephy)
REFERENCES gracethd_reseau_optique.l_site_type_phy (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_site_st_typelog | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_site DROP CONSTRAINT IF EXISTS fk_t_site_st_typelog CASCADE;
ALTER TABLE gracethd_reseau_optique.t_site ADD CONSTRAINT fk_t_site_st_typelog FOREIGN KEY (st_typelog)
REFERENCES gracethd_reseau_optique.l_site_type_log (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_site_st_etat | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_site DROP CONSTRAINT IF EXISTS fk_t_site_st_etat CASCADE;
ALTER TABLE gracethd_reseau_optique.t_site ADD CONSTRAINT fk_t_site_st_etat FOREIGN KEY (st_etat)
REFERENCES gracethd_reseau_optique.l_etat (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_t_local_lc_statut | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_local DROP CONSTRAINT IF EXISTS fk_t_local_lc_statut CASCADE;
ALTER TABLE gracethd_reseau_optique.t_local ADD CONSTRAINT fk_t_local_lc_statut FOREIGN KEY (lc_statut)
REFERENCES gracethd_reseau_optique.l_statut (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_local_lc_proptyp | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_local DROP CONSTRAINT IF EXISTS fk_t_local_lc_proptyp CASCADE;
ALTER TABLE gracethd_reseau_optique.t_local ADD CONSTRAINT fk_t_local_lc_proptyp FOREIGN KEY (lc_proptyp)
REFERENCES gracethd_reseau_optique.l_propriete (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_local_lc_avct | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_local DROP CONSTRAINT IF EXISTS fk_t_local_lc_avct CASCADE;
ALTER TABLE gracethd_reseau_optique.t_local ADD CONSTRAINT fk_t_local_lc_avct FOREIGN KEY (lc_avct)
REFERENCES gracethd_reseau_optique.l_avancement (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_local_lc_typelog | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_local DROP CONSTRAINT IF EXISTS fk_t_local_lc_typelog CASCADE;
ALTER TABLE gracethd_reseau_optique.t_local ADD CONSTRAINT fk_t_local_lc_typelog FOREIGN KEY (lc_typelog)
REFERENCES gracethd_reseau_optique.l_local_type_log (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_local_lc_etat | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_local DROP CONSTRAINT IF EXISTS fk_t_local_lc_etat CASCADE;
ALTER TABLE gracethd_reseau_optique.t_local ADD CONSTRAINT fk_t_local_lc_etat FOREIGN KEY (lc_etat)
REFERENCES gracethd_reseau_optique.l_etat (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_local_lc_clim | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_local DROP CONSTRAINT IF EXISTS fk_t_local_lc_clim CASCADE;
ALTER TABLE gracethd_reseau_optique.t_local ADD CONSTRAINT fk_t_local_lc_clim FOREIGN KEY (lc_clim)
REFERENCES gracethd_reseau_optique.l_clim (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_local_lc_occp | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_local DROP CONSTRAINT IF EXISTS fk_t_local_lc_occp CASCADE;
ALTER TABLE gracethd_reseau_optique.t_local ADD CONSTRAINT fk_t_local_lc_occp FOREIGN KEY (lc_occp)
REFERENCES gracethd_reseau_optique.l_occupation (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_t_baie_ba_proptyp | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_baie DROP CONSTRAINT IF EXISTS fk_t_baie_ba_proptyp CASCADE;
ALTER TABLE gracethd_reseau_optique.t_baie ADD CONSTRAINT fk_t_baie_ba_proptyp FOREIGN KEY (ba_proptyp)
REFERENCES gracethd_reseau_optique.l_propriete (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_baie_ba_statut | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_baie DROP CONSTRAINT IF EXISTS fk_t_baie_ba_statut CASCADE;
ALTER TABLE gracethd_reseau_optique.t_baie ADD CONSTRAINT fk_t_baie_ba_statut FOREIGN KEY (ba_statut)
REFERENCES gracethd_reseau_optique.l_statut (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_baie_ba_type | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_baie DROP CONSTRAINT IF EXISTS fk_t_baie_ba_type CASCADE;
ALTER TABLE gracethd_reseau_optique.t_baie ADD CONSTRAINT fk_t_baie_ba_type FOREIGN KEY (ba_type)
REFERENCES gracethd_reseau_optique.l_baie_type (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_baie_ba_etat | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_baie DROP CONSTRAINT IF EXISTS fk_t_baie_ba_etat CASCADE;
ALTER TABLE gracethd_reseau_optique.t_baie ADD CONSTRAINT fk_t_baie_ba_etat FOREIGN KEY (ba_etat)
REFERENCES gracethd_reseau_optique.l_etat (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_t_cable_cb_fo_type | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS fk_t_cable_cb_fo_type CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT fk_t_cable_cb_fo_type FOREIGN KEY (cb_fo_type)
REFERENCES gracethd_reseau_optique.l_fo_type (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cable_cb_proptyp | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS fk_t_cable_cb_proptyp CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT fk_t_cable_cb_proptyp FOREIGN KEY (cb_proptyp)
REFERENCES gracethd_reseau_optique.l_propriete (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cable_cb_statut | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS fk_t_cable_cb_statut CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT fk_t_cable_cb_statut FOREIGN KEY (cb_statut)
REFERENCES gracethd_reseau_optique.l_statut (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cable_cb_avct | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS fk_t_cable_cb_avct CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT fk_t_cable_cb_avct FOREIGN KEY (cb_avct)
REFERENCES gracethd_reseau_optique.l_avancement (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cable_cb_typephy | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS fk_t_cable_cb_typephy CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT fk_t_cable_cb_typephy FOREIGN KEY (cb_typephy)
REFERENCES gracethd_reseau_optique.l_cable_type (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cable_cb_typelog | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS fk_t_cable_cb_typelog CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT fk_t_cable_cb_typelog FOREIGN KEY (cb_typelog)
REFERENCES gracethd_reseau_optique.l_cable_chem_type_log (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cable_cb_etat | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS fk_t_cable_cb_etat CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT fk_t_cable_cb_etat FOREIGN KEY (cb_etat)
REFERENCES gracethd_reseau_optique.l_etat (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cable_cb_tech | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cable DROP CONSTRAINT IF EXISTS fk_t_cable_cb_tech CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cable ADD CONSTRAINT fk_t_cable_cb_tech FOREIGN KEY (cb_tech)
REFERENCES gracethd_reseau_optique.l_technologie (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cableline_cl_dtclass | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cableline DROP CONSTRAINT IF EXISTS fk_t_cableline_cl_dtclass CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cableline ADD CONSTRAINT fk_t_cableline_cl_dtclass FOREIGN KEY (cl_dtclass)
REFERENCES gracethd_reseau_optique.l_geoloc_mode (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cableline_cl_geolmod | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cableline DROP CONSTRAINT IF EXISTS fk_t_cableline_cl_geolmod CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cableline ADD CONSTRAINT fk_t_cableline_cl_geolmod FOREIGN KEY (cl_geolmod)
REFERENCES gracethd_commun.l_geoloc_classe (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_cab_chem_cc_cm_code | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cab_chem DROP CONSTRAINT IF EXISTS fk_t_cab_chem_cc_cm_code CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cab_chem ADD CONSTRAINT fk_t_cab_chem_cc_cm_code FOREIGN KEY (cc_cm_code)
REFERENCES gracethd_reseau_optique.t_cheminement (cm_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_t_tiroir_ti_type | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_tiroir DROP CONSTRAINT IF EXISTS fk_t_tiroir_ti_type CASCADE;
ALTER TABLE gracethd_reseau_optique.t_tiroir ADD CONSTRAINT fk_t_tiroir_ti_type FOREIGN KEY (ti_type)
REFERENCES gracethd_reseau_optique.l_tiroir_type (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_tiroir_ti_etat | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_tiroir DROP CONSTRAINT IF EXISTS fk_t_tiroir_ti_etat CASCADE;
ALTER TABLE gracethd_reseau_optique.t_tiroir ADD CONSTRAINT fk_t_tiroir_ti_etat FOREIGN KEY (ti_etat)
REFERENCES gracethd_reseau_optique.l_etat (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_t_cassette_cs_type | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_cassette DROP CONSTRAINT IF EXISTS fk_t_cassette_cs_type CASCADE;
ALTER TABLE gracethd_reseau_optique.t_cassette ADD CONSTRAINT fk_t_cassette_cs_type FOREIGN KEY (cs_type)
REFERENCES gracethd_reseau_optique.l_cassette_type (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_fibre_fo_etat | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_fibre DROP CONSTRAINT IF EXISTS fk_t_fibre_fo_etat CASCADE;
ALTER TABLE gracethd_reseau_optique.t_fibre ADD CONSTRAINT fk_t_fibre_fo_etat FOREIGN KEY (fo_etat)
REFERENCES gracethd_reseau_optique.l_etat (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_fibre_fo_color | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_fibre DROP CONSTRAINT IF EXISTS fk_t_fibre_fo_color CASCADE;
ALTER TABLE gracethd_reseau_optique.t_fibre ADD CONSTRAINT fk_t_fibre_fo_color FOREIGN KEY (fo_color)
REFERENCES gracethd_reseau_optique.l_fo_color (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_fibre_fo_reper | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_fibre DROP CONSTRAINT IF EXISTS fk_t_fibre_fo_reper CASCADE;
ALTER TABLE gracethd_reseau_optique.t_fibre ADD CONSTRAINT fk_t_fibre_fo_reper FOREIGN KEY (fo_reper)
REFERENCES gracethd_reseau_optique.l_tube (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_fibre_fo_proptyp | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_fibre DROP CONSTRAINT IF EXISTS fk_t_fibre_fo_proptyp CASCADE;
ALTER TABLE gracethd_reseau_optique.t_fibre ADD CONSTRAINT fk_t_fibre_fo_proptyp FOREIGN KEY (fo_proptyp)
REFERENCES gracethd_reseau_optique.l_propriete (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_position_ps_type | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_position DROP CONSTRAINT IF EXISTS fk_t_position_ps_type CASCADE;
ALTER TABLE gracethd_reseau_optique.t_position ADD CONSTRAINT fk_t_position_ps_type FOREIGN KEY (ps_type)
REFERENCES gracethd_reseau_optique.l_position_type (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_position_ps_fonct | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_position DROP CONSTRAINT IF EXISTS fk_t_position_ps_fonct CASCADE;
ALTER TABLE gracethd_reseau_optique.t_position ADD CONSTRAINT fk_t_position_ps_fonct FOREIGN KEY (ps_fonct)
REFERENCES gracethd_reseau_optique.l_position_fonction (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_position_ps_etat | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_position DROP CONSTRAINT IF EXISTS fk_t_position_ps_etat CASCADE;
ALTER TABLE gracethd_reseau_optique.t_position ADD CONSTRAINT fk_t_position_ps_etat FOREIGN KEY (ps_etat)
REFERENCES gracethd_reseau_optique.l_etat (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_t_znro_zn_etat | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_znro DROP CONSTRAINT IF EXISTS fk_t_znro_zn_etat CASCADE;
ALTER TABLE gracethd_reseau_optique.t_znro ADD CONSTRAINT fk_t_znro_zn_etat FOREIGN KEY (zn_etat)
REFERENCES gracethd_reseau_optique.l_nro_etat (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_znro_zn_nrotype | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_znro DROP CONSTRAINT IF EXISTS fk_t_znro_zn_nrotype CASCADE;
ALTER TABLE gracethd_reseau_optique.t_znro ADD CONSTRAINT fk_t_znro_zn_nrotype FOREIGN KEY (zn_nrotype)
REFERENCES gracethd_reseau_optique.l_nro_type (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_zsro_zs_etatpm | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_zsro DROP CONSTRAINT IF EXISTS fk_t_zsro_zs_etatpm CASCADE;
ALTER TABLE gracethd_reseau_optique.t_zsro ADD CONSTRAINT fk_t_zsro_zs_etatpm FOREIGN KEY (zs_etatpm)
REFERENCES gracethd_reseau_optique.l_sro_etat (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_zsro_zs_typeemp | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_zsro DROP CONSTRAINT IF EXISTS fk_t_zsro_zs_typeemp CASCADE;
ALTER TABLE gracethd_reseau_optique.t_zsro ADD CONSTRAINT fk_t_zsro_zs_typeemp FOREIGN KEY (zs_typeemp)
REFERENCES gracethd_reseau_optique.l_sro_emplacement (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_zdep_zd_statut | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_zdep DROP CONSTRAINT IF EXISTS fk_t_zdep_zd_statut CASCADE;
ALTER TABLE gracethd_reseau_optique.t_zdep ADD CONSTRAINT fk_t_zdep_zd_statut FOREIGN KEY (zd_statut)
REFERENCES gracethd_reseau_optique.l_statut (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_zcoax_zc_statut | type: CONSTRAINT --
-- ALTER TABLE gracethd_reseau_optique.t_zcoax DROP CONSTRAINT IF EXISTS fk_t_zcoax_zc_statut CASCADE;
ALTER TABLE gracethd_reseau_optique.t_zcoax ADD CONSTRAINT fk_t_zcoax_zc_statut FOREIGN KEY (zc_statut)
REFERENCES gracethd_reseau_optique.l_statut (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- -- object: public.geometry | type: TYPE --
-- -- DROP TYPE IF EXISTS public.geometry CASCADE;
-- CREATE TYPE public.geometry;
-- -- ddl-end --
-- 


-- l_avancement
INSERT INTO gracethd_reseau_optique.l_avancement
    VALUES ('E','EXISTANT','');
INSERT INTO gracethd_reseau_optique.l_avancement
    VALUES ('C','A CREER','');
INSERT INTO gracethd_reseau_optique.l_avancement
    VALUES ('T','TRAVAUX','');
INSERT INTO gracethd_reseau_optique.l_avancement
    VALUES ('S','EN SERVICE','');
INSERT INTO gracethd_reseau_optique.l_avancement
    VALUES ('H','HORS SERVICE','');
INSERT INTO gracethd_reseau_optique.l_avancement
    VALUES ('A','ABANDONNE','');

--l_baie_type
INSERT INTO gracethd_reseau_optique.l_baie_type
    VALUES ('BAIE','BAIE','');
INSERT INTO gracethd_reseau_optique.l_baie_type
    VALUES ('FERME','FERME','');

-- l_bp_type_log
INSERT INTO gracethd_reseau_optique.l_bp_type_log
    VALUES ('BPE','BOITIER PROTECTION EPISSURE','');
INSERT INTO gracethd_reseau_optique.l_bp_type_log
    VALUES ('BPI','BOITIER PIED IMMEUBLE','');
INSERT INTO gracethd_reseau_optique.l_bp_type_log
    VALUES ('PTO','POINT DE TERMINAISON OPTIQUE','');
INSERT INTO gracethd_reseau_optique.l_bp_type_log
    VALUES ('PBO','POINT DE BRANCHEMENT OPTIQUE','');
INSERT INTO gracethd_reseau_optique.l_bp_type_log
    VALUES ('DTI','DISPOSITIF DE TERMINAISON INTERIEUR OPTIQUE','PTO pose par le constructeur d immeuble.');

-- l_bp_type_phy
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('B006','BPE 6FO','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('B012','BPE 12FO','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('B024','BPE 24FO','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('B036','BPE 36FO','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('B048','BPE 48FO','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('B072','BPE 72FO','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('B096','BPE 96FO','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('B144','BPE 144FO','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('B288','BPE 288FO','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('B432','BPE 432FO','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('B576','BPE 576FO','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('B720','BPE 720FO','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('B864','BPE 864FO','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('COF','COFFRET','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('DTI1','DTIO 1FO','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('DTI2','DTIO 2FO','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('DTI4','DTIO 4FO','');
INSERT INTO gracethd_reseau_optique.l_bp_type_phy
    VALUES ('AUTR','AUTRE','');

--l_cable_type
INSERT INTO gracethd_reseau_optique.l_cable_type
    VALUES ('C','CABLE','');
INSERT INTO gracethd_reseau_optique.l_cable_type
    VALUES ('B','BREAKOUT','');
INSERT INTO gracethd_reseau_optique.l_cable_type
    VALUES ('J','JARRETIERE','');

--l_cassette_type
INSERT INTO gracethd_reseau_optique.l_cassette_type
    VALUES ('P','PLATEAU DE LOVAGE BPE','');
INSERT INTO gracethd_reseau_optique.l_cassette_type
    VALUES ('E','EPISSURE','');
INSERT INTO gracethd_reseau_optique.l_cassette_type
    VALUES ('V','VIRTUELLE','');
INSERT INTO gracethd_reseau_optique.l_cassette_type
    VALUES ('S','SPLITTER','');
INSERT INTO gracethd_reseau_optique.l_cassette_type
    VALUES ('C','CONNECTEUR','');

--l_etat
INSERT INTO gracethd_reseau_optique.l_etat
    VALUES ('HS','A CHANGER','L infrastructure doit etre changee car la moindre intervention peut etre prejudiciable a la fourniture du service');
INSERT INTO gracethd_reseau_optique.l_etat
    VALUES ('ME','MAUVAIS ETAT','Mauvais etat general de l infrastructure qui ne permet pas certaines interventions');
INSERT INTO gracethd_reseau_optique.l_etat
    VALUES ('OK','BON ETAT','Bon etat general qui permet de realiser toute operation de maintenance, d exploitation ou d evolution');
INSERT INTO gracethd_reseau_optique.l_etat
    VALUES ('NC','NON CONCERNE','');

--l_fo_type
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G651','G651','Norme ITU : Fibre multimode a gradient d indice type 50/125μm');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G652','G652','Norme ITU : Fibre monomode standard SMF pour utilisation a 1300 nm et eventuellement a 1550 nm');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G652A','G652A','Norme ITU :
    Version de base de la fibre G652, definie a 1310 nm et a 1550 nm');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G652B','G652B','Norme ITU :
    Version de la fibre G652, definie à 1625nm avec des affaiblissements ameliores a 1310nm et a 1550nm par rapport a la
    Version a, et avec une meilleure PMD.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G652C','G652C','Norme ITU :
    Version de la fibre G652, definie a 1383nm (faible pic OH) avec un affaiblissement ameliore a 1550nm par rapport à la
    Version b.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G652D','G652D','Norme ITU :
    Version de la fibre G652 la plus performante (meilleures caracteristiques des
    Versions b et c)');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G653','G653','Norme ITU : Fibre monomode a dispersion decalee DSF');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G654','G654','Norme ITU : Fibre monomode a longueur d onde de coupure decalee.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G655','G655','Norme ITU : Fibre a dispersion decalee non nulle NZ-DSF');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G656','G656','Norme ITU : Fibre monomode a dispersion non nulle pour large bande.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G657','G657','Norme ITU : Fibre monomode pour reseaux d acces FTTH.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G657A','G657A','Norme ITU : Fibre G657 compatible avec la fibre optique G652d');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G657A1','G657A1','Norme ITU : Fibre  G657  compatible  a  la  fibre  G652d  et  offrant  une  insensibilite aux courbes de plus de 10mm.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G657A2','G657A2','Norme ITU : Fibre  G657  compatible  a  la  fibre  G652d  et  offrant  une  insensibilite aux courbes de plus de 7,5mm.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G657A3','G657A3','Norme ITU : Fibre  G657  compatible  a  la  fibre  G652d  et  offrant  une  insensibilite aux courbes de plus de 5mm.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G657B','G657B','Norme ITU : Fibre  G657  non  compatible  avec  la  fibre  optique  G652  mais  avec  des  meilleures caracteristiques d insensibilite aux courbes que la
    Version a.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G657B1','G657B1','Norme ITU : Fibre  G657  non  compatible  avec  la  fibre  optique  G652  et offrant une insensibilite aux courbes de plus de 10mm.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G657B2','G657B2','Norme ITU : Fibre  G657  non  compatible  avec  la  fibre  optique  G652  et offrant une insensibilite aux courbes de plus de 7,5mm.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('G657B3','G657B3','Norme ITU : Fibre  G657  non  compatible  avec  la  fibre  optique  G652  et offrant une insensibilite aux courbes de plus de 5mm.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('OM1','OM1','Norme ISO/IEC 11801 : Caracteristique  d une  fibre  optique  multimode  avec  une  bande passante minimum de 200MHz.km a 850nm. Peut transmettre 100Mbits sur 2km et 1 Gbit sur 275m a 850nm.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('OM2','OM2','Norme ISO/IEC 11801 : Caracteristique d une fibre optique multimode avec une bande passante minimum de 500MHz.km à 850nm. Peut transmettre 100Mbits sur 5km, 1 Gbits sur 550m et 10Gbits sur 82m a 850m.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('OM3','OM3','Norme ISO/IEC 11801 : Caracteristique d une fibre optique multimode avec une bande de passante minimum de 1500MHz.km.. Peut transmettre 10 Gbits sur 330m à 850nm.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('OM4','OM4','Norme ISO/IEC 11801 : Caracteristique d une fibre optique multimode. Peut transmettre 10 Gbits sur 550m a 850nm.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('OS1','OS1','Norme ISO/EN : fibre monomode d attenuation maximum 1.0 dB par km (1310 et 1550nm). Pour des transmissions de 2km maximum.');
INSERT INTO gracethd_reseau_optique.l_fo_type
    VALUES ('OS2','OS2','Norme ISO/EN : fibre monomode d attenuation maximum 0.4 dB par km (1310 et 1550nm). Pour des transmissions superieures a 2km.');

--l_cable_chem_type_log
INSERT INTO gracethd_reseau_optique.l_cable_chem_type_log
    VALUES ('CX','COLLECTE TRANSPORT DISTRIBUTION','');
INSERT INTO gracethd_reseau_optique.l_cable_chem_type_log
    VALUES ('CO','COLLECTE','Cable/cheminement en amont d’un NRO, d un NRA ou d un POP, permettant de faire transiter les flux mutualises des abonnes
    Vers le cœur de reseau de l operateur.');
INSERT INTO gracethd_reseau_optique.l_cable_chem_type_log
    VALUES ('CT','COLLECTE TRANSPORT','');
INSERT INTO gracethd_reseau_optique.l_cable_chem_type_log
    VALUES ('CD','COLLECTE DISTRIBUTION','');
INSERT INTO gracethd_reseau_optique.l_cable_chem_type_log
    VALUES ('TD','TRANSPORT DISTRIBUTION','Mutualisation des fonctions transport et distribution');
INSERT INTO gracethd_reseau_optique.l_cable_chem_type_log
    VALUES ('TR','TRANSPORT','Cable/cheminement situee entre un noeud de raccordement (NRO, NRA, …) et les sous-repartiteurs (SRO, ...).');
INSERT INTO gracethd_reseau_optique.l_cable_chem_type_log
    VALUES ('DI','DISTRIBUTION','Cable/cheminement situee entre le sous-repartiteur (SRO, ...) et les points de branchement (PBO, ...).');
INSERT INTO gracethd_reseau_optique.l_cable_chem_type_log
    VALUES ('RA','RACCORDEMENT FINAL','Cable/cheminement  situee  entre  le  point de branchement (PBO, ...) et la prise terminale (DTIO, ...).');
INSERT INTO gracethd_reseau_optique.l_cable_chem_type_log
    VALUES ('BM','BOUCLE METROPOLITAINE','');
INSERT INTO gracethd_reseau_optique.l_cable_chem_type_log
    VALUES ('LH','LONGUE DISTANCE (LONG HAUL)','');
INSERT INTO gracethd_reseau_optique.l_cable_chem_type_log
    VALUES ('NC','NON COMMUNIQUE','');

--l_nro_etat
INSERT INTO gracethd_reseau_optique.l_nro_etat
    VALUES ('PL','PLANIFIE','');
INSERT INTO gracethd_reseau_optique.l_nro_etat
    VALUES ('EC','EN COURS DE DEPLOIEMENT','En cours d installation, sans qu une definition precise n ait ete partagee en Interop.');
INSERT INTO gracethd_reseau_optique.l_nro_etat
    VALUES ('DP','DEPLOYE','Installe. Doit alors etre mis a disposition des operateurs ayant achete le SRO.');
INSERT INTO gracethd_reseau_optique.l_nro_etat
    VALUES ('AB','ABANDONNE','Le SRO est abandonne. Cet etat doit apparaitre pendant 3 mois.');

--l_position_fonction
INSERT INTO gracethd_reseau_optique.l_position_fonction
    VALUES ('CO','CONNECTEUR','');
INSERT INTO gracethd_reseau_optique.l_position_fonction
    VALUES ('EP','EPISSURE','');
INSERT INTO gracethd_reseau_optique.l_position_fonction
    VALUES ('PI','PIGTAIL','');
INSERT INTO gracethd_reseau_optique.l_position_fonction
    VALUES ('AT','ATTENTE','Fibres optiques utiles ou disponibles en attente');
INSERT INTO gracethd_reseau_optique.l_position_fonction
    VALUES ('PA','PASSAGE','');
INSERT INTO gracethd_reseau_optique.l_position_fonction
    VALUES ('MA','MANŒUVRE','Fibres optiques en attente dans une des deux positions d une cassette réelle qui n as pas d assignation');

--l_position_type
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CEA','CONNECTEUR E2000-APC','Connecteur a Verrouillage de type push/pull avec protection poussiere. Polissage permettant d avoir une reflectance meilleure que -60dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CEU','CONNECTEUR E2000-UPC','Connecteur a Verrouillage de type push/pull avec protection poussiere. Polissage permettant d avoir une reflectance meilleure que -50dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CEP','CONNECTEUR E2000-PC','Connecteur a Verrouillage de type push/pull avec protection poussiere. Polissage permettant d avoir une reflectance meilleure que -30dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CFA','CONNECTEUR FC-APC','Connecteur a Verrouillage a Vis. Polissage permettant d avoir une reflectance meilleure que -60dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CFU','CONNECTEUR FC-UPC','Connecteur a Verrouillage a Vis. Polissage permettant d avoir une reflectance meilleure que -50dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CFP','CONNECTEUR FC-PC','Connecteur a Verrouillage a Vis. Polissage permettant d avoir une reflectance meilleure que -30dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CLA','CONNECTEUR LC-APC','Connecteur a Verrouillage de type push/pull et par languette. Polissage permettant d avoir une reflectance meilleure que -60dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CLU','CONNECTEUR LC-UPC','Connecteur a Verrouillage de type push/pull et par languette. Polissage permettant d avoir une reflectance meilleure que -50dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CLP','CONNECTEUR LC-PC','Connecteur a Verrouillage de type push/pull et par languette. Polissage permettant d avoir une reflectance meilleure que -30dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CMA','CONNECTEUR MU-APC','Connecteur a Verrouillage de type push/pull diametre 1.25mm. Polissage permettant d avoir une reflectance meilleure que -60dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CMU','CONNECTEUR MU-UPC','Connecteur a Verrouillage de type push/pull diametre 1.25mm. Polissage permettant d avoir une reflectance meilleure que -50dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CMP','CONNECTEUR MU-PC','Connecteur a Verrouillage de type push/pull diametre 1.25mm. Polissage permettant d avoir une reflectance meilleure que -30dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CSA','CONNECTEUR SC-APC','Connecteur a Verrouillage de type push/pull diametre 2.5mm. Polissage permettant d avoir une reflectance meilleure que -60dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CSU','CONNECTEUR SC-UPC','Connecteur a Verrouillage de type push/pull diametre 2.5mm. Polissage permettant d avoir une reflectance meilleure que -50dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CSP','CONNECTEUR SC-PC','Connecteur a Verrouillage de type push/pull diametre 2.5mm. Polissage permettant d avoir une reflectance meilleure que -30dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CTU','CONNECTEUR ST-UPC','Connecteur a Verrouillage de type baionnette. Polissage permettant d avoir une reflectance meilleure que -50dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CTP','CONNECTEUR ST-PC','Connecteur a Verrouillage de type baionette. Polissage permettant d avoir une reflectance meilleure que -30dB.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('CPO','CONNECTEUR MT MPO','Fiche polymère intégrant plusieurs fibres SM ou MM. MTRJ pour la Version 2 fibres.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('SFU','SOUDURE FUSION','Raccordement sous l effet d une chaleur intense avec une soudeuse.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('SME','SOUDURE MECANIQUE','Raccordement mecanique, generalement par sertissage.');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('LC','LOVE CASSETTE','Position de la cassette physique destinée à contenir les fibres optiques non soudées');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('LB','LOVE EN FOND DE BOITE','Micro modules laisées en attente dans un fond de boite');
INSERT INTO gracethd_reseau_optique.l_position_type
    VALUES ('TS','TIROIR DE STOCKAGE','Micro modules laissés en attente dans un tiroir de stockage en baie');

-- l_proriete
INSERT INTO gracethd_reseau_optique.l_propriete
    VALUES ('CST','CONSTRUCTION','');
INSERT INTO gracethd_reseau_optique.l_propriete
    VALUES ('RAC','RACHAT','');
INSERT INTO gracethd_reseau_optique.l_propriete
    VALUES ('CES','CESSION','');
INSERT INTO gracethd_reseau_optique.l_propriete
    VALUES ('IRU','IRU','');
INSERT INTO gracethd_reseau_optique.l_propriete
    VALUES ('LOC','LOCATION','');
INSERT INTO gracethd_reseau_optique.l_propriete
    VALUES ('OCC','OCCUPATION','Convention d occupation');

--l_ptech_nature
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('A1','CHAMBRE A1','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('A2','CHAMBRE A2','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('A3','CHAMBRE A3','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('A4','CHAMBRE A4','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('A10','CHAMBRE A10','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('A11','CHAMBRE A11','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('A12','CHAMBRE A12','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('A13','CHAMBRE A13','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('A14','CHAMBRE A14','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('A15','CHAMBRE A15','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('A16','CHAMBRE A16','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('A17','CHAMBRE A17','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('A18','CHAMBRE A18','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('B1','CHAMBRE B1','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('B2','CHAMBRE B2','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('B3','CHAMBRE B3','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('B4','CHAMBRE B4','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('C1','CHAMBRE C1','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('C2','CHAMBRE C2','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('C3','CHAMBRE C3','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('C4','CHAMBRE C4','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D1','CHAMBRE D1','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D1C','CHAMBRE D1C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D1T','CHAMBRE D1T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D2','CHAMBRE D2','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D2C','CHAMBRE D2C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D2T','CHAMBRE D2T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D3','CHAMBRE D3','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D3C','CHAMBRE D3C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D3T','CHAMBRE D3T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D4','CHAMBRE D4','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D4C','CHAMBRE D4C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D4T','CHAMBRE D4T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D5','CHAMBRE D5','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D5C','CHAMBRE D5C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D6','CHAMBRE D6','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D6C','CHAMBRE D6C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D11','CHAMBRE D11','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D12','CHAMBRE D12','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D13','CHAMBRE D13','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('D14','CHAMBRE D14','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('E1','CHAMBRE E1','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('E2','CHAMBRE E2','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('E3','CHAMBRE E3','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('E4','CHAMBRE E4','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('J2C','CHAMBRE J2C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('J2CR','CHAMBRE J2C REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('K1C','CHAMBRE K1C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('K1CR','CHAMBRE K1C REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('K1T','CHAMBRE K1T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('K2C','CHAMBRE K2C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('K2CR','CHAMBRE K2C REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('K2T','CHAMBRE K2T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('K3C','CHAMBRE K3C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('K3CR','CHAMBRE K3C REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('K3T','CHAMBRE K3T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L0T','CHAMBRE L0T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L0TR','CHAMBRE L0T REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L1C','CHAMBRE L1C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L1T','CHAMBRE L1T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L1TR','CHAMBRE L1T REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L2C','CHAMBRE L2C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L2T','CHAMBRE L2T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L2TR','CHAMBRE L2T REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L3C','CHAMBRE L3C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L3T','CHAMBRE L3T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L3TR','CHAMBRE L3T REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L4C','CHAMBRE L4C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L4T','CHAMBRE L4T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L4TR','CHAMBRE L4T REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L5C','CHAMBRE L5C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L5T','CHAMBRE L5T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L5TR','CHAMBRE L5T REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L6T','CHAMBRE L6T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('L6TR','CHAMBRE L6T REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('M1C','CHAMBRE M1C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('M1CR','CHAMBRE M1C REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('M2T','CHAMBRE M2T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('M2TR','CHAMBRE M2T REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('M3C','CHAMBRE M3C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('M3CR','CHAMBRE M3C REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('P1C','CHAMBRE P1C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('P1CR','CHAMBRE P1C REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('P1T','CHAMBRE P1T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('P1TR','CHAMBRE P1T REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('P2C','CHAMBRE P2C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('P2CR','CHAMBRE P2C REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('P2T','CHAMBRE P2T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('P2TR','CHAMBRE P2T REHAUSSEE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('P3C','CHAMBRE P3C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('P3T','CHAMBRE P3T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('P4C','CHAMBRE P4C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('P4T','CHAMBRE P4T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('P5C','CHAMBRE P5C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('P5T','CHAMBRE P5T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('P6C','CHAMBRE P6C','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('P6T','CHAMBRE P6T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('R1T','CHAMBRE R1T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('R2T','CHAMBRE R2T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('R3T','CHAMBRE R3T','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('S1','CHAMBRE S1','SNCF Reseau : Chambre prefabriquee aux dimensions standardisees.');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('S2','CHAMBRE S2','SNCF Reseau : Chambre prefabriquee aux dimensions standardisees.');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('S3','CHAMBRE S3','SNCF Reseau : Chambre prefabriquee aux dimensions standardisees.');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('S4','CHAMBRE S4','SNCF Reseau : Chambre prefabriquee aux dimensions standardisees.');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('S5','CHAMBRE S5','SNCF Reseau : Chambre prefabriquee aux dimensions standardisees.');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('S6','CHAMBRE S6','SNCF Reseau : Chambre prefabriquee aux dimensions standardisees.');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('S6bis','CHAMBRE S6bis','SNCF Reseau : Chambre prefabriquee aux dimensions standardisees.');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('S7','CHAMBRE S7','SNCF Reseau : Chambre prefabriquee aux dimensions standardisees.');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('TU1','CHAMBRE TU1','SNCF Reseau : chambre avec trappes unifiees.');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('TU2','CHAMBRE TU2','SNCF Reseau : chambre avec trappes unifiees.');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('TU4','CHAMBRE TU4','SNCF Reseau : chambre avec trappes unifiees.');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('TU6','CHAMBRE TU6','SNCF Reseau : chambre avec trappes unifiees.');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('TU8','CHAMBRE TU8','SNCF Reseau : chambre avec trappes unifiees.');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('TU10','CHAMBRE TU10','SNCF Reseau : chambre avec trappes unifiees.');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('OHN','OUVRAGE HORS NORMES','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('PBOI','POTEAU BOIS','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('PBET','POTEAU BETON','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('PCMP','POTEAU COMPOSITE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('PMET','POTEAU METAL','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('PIND','POTEAU INDETERMINE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('POTL','POTELET','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('BOU','BOUCHON','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('REG','REGARD 30X30','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('R40','REGARD 40X40','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('BAL','BALCON','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('CRO','CROCHET','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('FAI','FAITIERE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('STR','SOUTERRAIN','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('SSO','SOUS-SOL','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('TRA','TRAVERSE','');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('Y','SITE MANCHONNAGE Y','Fenetre ouverture sur fourreaux existants pour mise en Y');
INSERT INTO gracethd_reseau_optique.l_ptech_nature
    VALUES ('IND','INDETERMINE','');

--l_ptech_type_phy
INSERT INTO gracethd_reseau_optique.l_ptech_type_phy
    VALUES ('A','APPUI','');
INSERT INTO gracethd_reseau_optique.l_ptech_type_phy
    VALUES ('C','CHAMBRE','');
INSERT INTO gracethd_reseau_optique.l_ptech_type_phy
    VALUES ('F','ANCRAGE FACADE','');
INSERT INTO gracethd_reseau_optique.l_ptech_type_phy
    VALUES ('I','IMMEUBLE','');
INSERT INTO gracethd_reseau_optique.l_ptech_type_phy
    VALUES ('Z','AUTRE','');


--l_site_type_log
INSERT INTO gracethd_reseau_optique.l_site_type_log
    VALUES ('CLIENT','SITES HEBERGEANT DES UTILISATEURS','Un site qui contient au moins un local à raccorder est un site client');
INSERT INTO gracethd_reseau_optique.l_site_type_log
    VALUES ('RESEAU','SITE UTILISE UNIQUEMENT POUR HEBERGER UN/DES EQUIPEMENTS(S) PASSIF(S) ET/OU ACTIF(S)','Un site qui ne contient que des élements réseaux est un site réseaux. ');

--l_site_type_phy
INSERT INTO gracethd_reseau_optique.l_site_type_phy
    VALUES ('ADR','ARMOIRE DE RUE','');
INSERT INTO gracethd_reseau_optique.l_site_type_phy
    VALUES ('BAT','BATIMENT','');
INSERT INTO gracethd_reseau_optique.l_site_type_phy
    VALUES ('CHV','CHAMBRE VISITABLE','Chambre accueillant au moins une baie, donc traitee comme un site technique.');
INSERT INTO gracethd_reseau_optique.l_site_type_phy
    VALUES ('COF','COFFRET','Notamment coffrets qui peuvent etre fixes sur des appuis et qui font office d armoires.');
INSERT INTO gracethd_reseau_optique.l_site_type_phy
    VALUES ('POH','POINT HAUT','Site spécifique dédié à l émission radio. Les bâtiments utilisés comme support d antenne sont décris comme des bâtiments (BAT).');
INSERT INTO gracethd_reseau_optique.l_site_type_phy
    VALUES ('SHE','SHELTER','');
INSERT INTO gracethd_reseau_optique.l_site_type_phy
    VALUES ('STR','CONSTRUCTION SOUTERRAINE','Espace souterrain amenage et Visitable comportant un ou plusieurs locaux techniques et accueillant au moins une baie.');

-- l_sro_etat
INSERT INTO gracethd_reseau_optique.l_sro_etat
    VALUES ('PL','PLANIFIE','');
INSERT INTO gracethd_reseau_optique.l_sro_etat
    VALUES ('EC','EN COURS DE DEPLOIEMENT','En cours d installation, sans qu une definition precise n ait ete partagee en Interop.');
INSERT INTO gracethd_reseau_optique.l_sro_etat
    VALUES ('DP','DEPLOYE','Installe. Doit alors etre mis a disposition des operateurs ayant achete le SRO.');
INSERT INTO gracethd_reseau_optique.l_sro_etat
    VALUES ('AB','ABANDONNE','Le SRO est abandonne. Cet etat doit apparaitre pendant 3 mois.');

--l_statut
INSERT INTO gracethd_reseau_optique.l_statut
    VALUES ('PRE','ETUDE PRELIMINAIRE','Resultat de l etude preliminaire, au sens du decret d application de la loi MOP (n°93-1268 du 29 nov. 1993) : premiere etude de faisabilite pour la construction d ouvrages neufs');
INSERT INTO gracethd_reseau_optique.l_statut
    VALUES ('DIA','ETUDE DE DIAGNOSTIC','Resultat de l etude de diagnostic, au sens du decret d application de la loi MOP (n°93-1268 du 29 nov. 1993) : pour une operation de reutilisation ou de rehabilitation d un ouvrage existant, etat des lieux, analyse technique, etudes complementaires');
INSERT INTO gracethd_reseau_optique.l_statut
    VALUES ('AVP','AVANT-PROJET','Resultat de l etude d avant-Projet, au sens du decret d application de la loi MOP (n°93-1268 du 29 nov. 1993) : confirmation de la faisabilite, premiere implantation de l ouvrage, autorisations administratives');
INSERT INTO gracethd_reseau_optique.l_statut
    VALUES ('PRO','PROJET','Resultat de l etude de projet, au sens du decret d application de la loi MOP (n°93-1268 du 29 nov. 1993) : precise les choix techniques, fixe l implantation topographique, les caracteristiques et le dimensionnement');
INSERT INTO gracethd_reseau_optique.l_statut
    VALUES ('ACT','PASSATION DES MARCHES DE TRAVAUX','Resultat de la mission d assistance a la passation des marches de travaux, au sens du decret d application de la loi MOP (n°93-1268 du 29 nov. 1993) : mise a jour eventuelle de l etude projet');
INSERT INTO gracethd_reseau_optique.l_statut
    VALUES ('EXE','ETUDE D EXECUTION','Resultat de l etude d execution, au sens du decret d application de la loi MOP (n°93-1268 du 29 nov. 1993) : elaboration des documents a l usage du chantier. Le resultat de cette etude donne generalement lieu a un VISA du maître d oeuvre.');
INSERT INTO gracethd_reseau_optique.l_statut
    VALUES ('TVX','TRAVAUX','Resultat des missions de direction de l execution des travaux, d ordonnancement, de coordination et de pilotage, ainsi que les operations prealables a la reception des travaux, au sens du decret d application de la loi MOP (n°93-1268 du 29 nov. 1993)');
INSERT INTO gracethd_reseau_optique.l_statut
    VALUES ('REC','RECOLEMENT','Resultat de la mission d assistance a la reception des travaux, au sens du decret d application de la loi MOP (n°93-1268 du 29 nov. 1993) : inclus le recolement des ouvrages et la realisation du Dossier des Ouvrages Executes');
INSERT INTO gracethd_reseau_optique.l_statut
    VALUES ('MCO','MAINTIENT EN CONDITIONS OPERATIONNELLES','Le statut MCO permet d identifier les objets qui font l objet d une operation de maintenance, avant le passage en statut REC une fois l operation achevee et son recolement realise');

--l_tiroir_type
INSERT INTO gracethd_reseau_optique.l_tiroir_type
    VALUES ('TIROIR','TIROIR','');
INSERT INTO gracethd_reseau_optique.l_tiroir_type
    VALUES ('TETE','TETE DE CABLE','');

-- l_local_type_log
INSERT INTO gracethd_reseau_optique.l_local_type_log
    VALUES ('RES','RESIDENTIEL','');
INSERT INTO gracethd_reseau_optique.l_local_type_log
    VALUES ('TEC','TECHNIQUE','Emplacement technique dédié à un équipement passif dans un bâtiment (ex : BPE, PBO, câble … etc.)');
INSERT INTO gracethd_reseau_optique.l_local_type_log
    VALUES ('PRO','PROFESSIONNEL','');
INSERT INTO gracethd_reseau_optique.l_local_type_log
    VALUES ('ENT','ENTREPRISE','Entreprise en fibre en point-à-point sur la Boucle Locale Optique Mutualisee.');
INSERT INTO gracethd_reseau_optique.l_local_type_log
    VALUES ('PUB','LOCAUX PUBLICS','Locaux publics (ex : annexe de mairie). ');
INSERT INTO gracethd_reseau_optique.l_local_type_log
    VALUES ('OPE','OPERATEUR','Local symbolisant un besoin de fibrage spécifique aux opérateurs (Ex : Antenne, point de livraison réseau)');
INSERT INTO gracethd_reseau_optique.l_local_type_log
    VALUES ('OBJ','OBJET CONNECTE A LA FIBRE','Objet nécessitant une connexion à la fibre (ascenseur, caméra de surveillance, transformateur..etc.)');
INSERT INTO gracethd_reseau_optique.l_local_type_log
    VALUES ('NRO','NŒUD RACCORDEMENT OPTIQUE','');
INSERT INTO gracethd_reseau_optique.l_local_type_log
    VALUES ('SRO','SOUS-REPARTITEUR OPTIQUE','');


--l_bp_racco
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FCLI01','CLIENT : CONTACT ERRONE','Le client ne peut être joint, exemple son nom ou ses coordonnées téléphoniques sont erronnées Utilisé dans le cas de raccordement par l OI');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FCLI02','CLIENT : CLIENT INJOIGNABLE IMPOSSIBLE DE PRENDRE RDV','Les coordonnées ne sont pas nécessairement erronnées mais le client n est pas joignable (ne répond pas). La définition précise de ne répond pas n est pas normalisée Interop Utilisé dans le cas de raccordement par l OI');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FCLI03','CLIENT : CLIENT N HABITE PAS A L ADRESSE INDIQUEE','Le RDV a été pris, lors du déplacement le technicien constate que le client n habite pas à l adresse indiquée par l OC');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FCLI04','CLIENT : DEMANDE ANNULATION DE LA COMMANDE PAR LE CLIENT FINAL','Que ce soit en amont du RDV ou lors du RDV, le client demande à annuler sa commande Utilisé dans le cas de raccordement par l OI');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FCLI05','CLIENT : REFUS TRAVAUX CLIENT','Que ce soit en amont du RDV ou lors du RDV, le client refuse les travaux (percement, etc.) Utilisé dans le cas de raccordement par l OI');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FCLI06','CLIENT : REFUS GESTIONNAIRE IMMEUBLE','Lors du raccordement client, un passage en apparent sur le palier est nécessaire et a été refusé par le gestionnaire (par exemple car les goulottes sont saturées ou le palier a été refait)');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FCLI07','CLIENT : CLIENT ABSENT LORS DE L INTERVENTION','Lors du RDV, le client est absent. Utilisé dans le cas de raccordement par l OI');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FADR01','ADRESSE : CODE ADRESSE IMMEUBLE INEXISTANT DANS LE REFERENTIEL OI','L OC envoie des codes adresses inexistants de l OI Les informations d adresse sont contrôlées dans l ordre suivant : 1 Hexaclé 2 INSEE/RIVOLI/NUM VOIE/ COMPL VOIE 3 Triplet Hexavia/numéro de voie /complément de voie 4 coordonnées xy');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FADR02','ADRESSE : BATIMENT MANQUANT OU INEXISTANT DANS LE REFERENTIEL OI','L adresse a été reconnue mais le batiment est manquant ou inexistant dans le référentiel de l OI');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FADR03','ADRESSE : ESCALIER MANQUANT OU INEXISTANT DANS LE REFERENTIEL OI','L adresse et le batiment ont été reconnus mais l escalier est manquant ou inexistant dans le référentiel de l OI');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FADR04','ADRESSE : ETAGE MANQUANT OU INEXISTANT DANS LE REFERENTIEL OI','L adresse, le batiment et l escalier ont été reconnus mais l étage est manquant ou inexistant dans le référentiel de l OI');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP01','TRAITEMENT IMPOSSIBLE : PTO REQUISE','L OC est tenu de passer une référence PTO dans sa commande. L OI refuse la commande.');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP02','TRAITEMENT IMPOSSIBLE : PTO INEXISTANTE DANS LE REFERENTIEL OI','L OC a fourni une référence PTO dans sa commande mais elle est inconnue de l OI');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP03','TRAITEMENT IMPOSSIBLE : PTO INCONNUE A L ADRESSE','L OC a fourni une référence PTO dans sa commande, elle est connue de l OI mais est incohérente par rapport à l adresse complète (y compris batiment/escalier/étage) dans le référentiel de l OI');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP04','TRAITEMENT IMPOSSIBLE : REF PRESTATION SRO INEXISTANTE DANS LE REFERENTIEL OI','L OC a renvoyé une référence prestation SRO inconnue de l OI (exemple l OC se trompe dans la référence SRO ou l OI n a pas communiqué un changement de référence SRO)');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP05','TRAITEMENT IMPOSSIBLE : REF PRESTATION SRO ET ADRESSE INCOHERENTES','La reference prestation SRO existe mais n est pas cohérente avec l adresse communiquée');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP06','TRAITEMENT IMPOSSIBLE : TYPE DE COMMANDE IRRECEVABLE SUR CETTE REF PRESTATION SRO','La reference prestation SRO existe, elle est cohérente avec l adresse communiquée mais elle est irrecevable (par exemple le type de commande est incompatible avec le choix de cofinancement ou de location du SRO)');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP07','TRAITEMENT IMPOSSIBLE : SRO INEXISTANT DANS LE REFERENTIEL OI','L OC envoie une commande d accès sur un SRO inexistant dans le référentiel de l OI (exemple changement de reference SRO par l OI non communiqué à l OC ou erreur de l OC dans l envoi de la référence)');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP08','TRAITEMENT IMPOSSIBLE : SRO ET ADRESSE INCOHERENTS','L OC envoie une commande d accès sur un SRO connu dans le référentiel de l OI mais incohérent avec l adresse');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP09','TRAITEMENT IMPOSSIBLE : COMMANDE IRRECEVABLE SUR CE SRO','L OC n est pas adducté au SRO ou il n a pas retourné toutes les infos ou documents attendus ou l OI n a pas intégré les données retournées par l OC ou l OI rejette la commande qui est passée avant la date de MESC ARCEP');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP10','TRAITEMENT IMPOSSIBLE : COMMANDE IRRECEVABLE SUR CETTE ADRESSE','L adresse n a pas été mise à disposition à l OC (le CR MAD n a pas été emis sur cette adresse)');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP11','TRAITEMENT IMPOSSIBLE : ADRESSE INELIGIBLE TEMPORAIREMENT','Le site est temporairement ineligible par exemple en maintenance');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP12','TRAITEMENT IMPOSSIBLE : TYPE COMMANDE ERRONNE','La valeur du champ TypeCommandeDemande n est pas une des valeurs attendues');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP13','TRAITEMENT IMPOSSIBLE : IDENTIFIANT COMMANDE INTERNE OC DEJA UTILISE','L OC envoie une commande en utilisant une commande interne déjà envoyée. Il s agit potentiellement d un doublon de commande');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP14','TRAITEMENT IMPOSSIBLE : IDENTIFIANT COMMANDE INTERNE OC INCONNUE','L OC annule ou résilie une commande en utilisant un identifiant inconnu de l OI');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP15','TRAITEMENT IMPOSSIBLE : CHAMPS OBLIGATOIRES MANQUANTS','L OC envoie une commande incomplète Bonne pratique : l opérateur emetteur du flux de rejet indique dans le champ commentaire du rejet le premier champ obligatoire manquant');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP16','TRAITEMENT IMPOSSIBLE : CHAMPS INCOHERENTS','L OC envoie la commande avec une erreur de format (exemple chaine de caractère envoyée vs date attendue, champ présent non attendu...) ... (cf Interop)');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP17','TRAITEMENT IMPOSSIBLE : PTO INEXISTANTE','Lorsqu une commande a été passée avec PTO posée, qu elle n exite pas dans le logement et que le problème n a pas pu être résolu par un reprovisionning à chaud.');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP18','TRAITEMENT IMPOSSIBLE : PTO EXISTANTE','Lorsqu une commande a été passée sans PTO (construction de ligne), qu il s avère qu elle existait le logement et que le problème n a pas pu être résolu par un reprovisionning à chaud. La référence de la PTO doit alors être indiquée... (cf Interop)');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FIMP19','TRAITEMENT IMPOSSIBLE : PTO DEJA AFFECTEE A L OC','Lorsque d un OC détient déjà une ligne FTTH sur une PTO et repasse une commande d accès sur cette même PTO. L OI répond alors, s il refues ce cas de gestion, par un CR de commande KO, avec le motif PTO déjà affectée à l OC');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FINT01','ECHEC PRODUCTION : PB OU SRO SATURE','L OI signifie à l OC qu il n est pas en mesure de fournir une route optique parce que vu de son SI le PB ou le SRO est saturé');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FINT02','ECHEC PRODUCTION : SATURATION VIRTUELLE PB OU SRO','L OI signifie à l OC qu il n est pas en mesure de fournir une route optique en raison d une saturation virtuelle identifiée mais non traitée simultanément. ... (cf Interop)');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FINT03','ECHEC PRODUCTION : HOTLINE OI INJOIGNABLE','L OC n a pas réussi à joindre la hotline sur le terrain et envoi un code rejet à l OI pour passer en reprovisionning à froid.');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FINT04','ECHEC PRODUCTION : ABSENCE DE CONTINUITE OPTIQUE','L OC constate sur le terrain qu il n y a pas de continuité sur la fibre et n a pas pu obtenir une nouvelle route optique via la hotline');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FINT05','ECHEC PRODUCTION : AFFAIBLISSEMENT TROP IMPORTANT','L OC constate sur le terrain que l affaiblissement sur la fibre est hors norme et n a pas pu obtenir correction via la hotline');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FINT06','ECHEC PRODUCTION : ROUTE OPTIQUE DEJA UTILISEE','L OC constate sur le terrain que la route qui lui a été transmise est déjà soudée pour un autre raccordement et n a pas pu obtenir une route optique appropriée via la hotline');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FINT07','ECHEC PRODUCTION : INFORMATIONS ROUTE OPTIQUE ERRONEES','L OC constate sur le terrain que la route optique donnée n existe pas et n a pas pu obtenir une route optique appropriée');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FINT08','ECHEC PRODUCTION : POSITION BRASSAGE BAIE OPERATEUR INTROUVABLE','Dans le cas d un brassage par l OI, l OI signale à l OC une position de brassage introuvable');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FINT09','ECHEC PRODUCTION : POSITION BRASSAGE BAIE OPERATEUR DEJA UTILISEE','Dans le cas d un brassage par l OI, l OI signale à l OC une position de brassage déjà utilisée');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FINT10','ECHEC PRODUCTION : AUTRE PROBLEME TECHNIQUE','Autre problème technique constaté lors de l intervention de raccordement et n étant pas référencé dans les motifs de rejets');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FINT11','ECHEC PRODUCTION : INFRA TIERS INDISPONIBLE OU DELAI','Dans le cas d un raccordement necessitant l utilisation d infrastructure tiers (poteau, fourreau), ces infra ne sont pas utilisable (bouchée, cassée, …) ou le délais de mise à disposition de ces infra est très important');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FINT12','ECHEC PRODUCTION : PBO NON CONFORME','Dans le cas où le raccordement est impossible en raison d un problème lié au PBO (exemple : PBO mal fixé, fibre trop courte pour souder..)');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FINT13','ECHEC PRODUCTION : DEFAUT DE VERTICALITE','Dans le cas d un problème physique identifié sur la colonne montante (exemple colonne HS, vandalisme…). Ce code permet de qualifier les problèmes collectifs c est-à-dire pouvant impacter plusieurs fibres.');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FAUT01','AUTRE MOTIF : COMMENTAIRES LIBRES','Autre motif technique hors constatation de problème sur le terrain');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FRDV01','RDV : NOMBRE MAX DE MODIFICATIONS DE RDV DEPASSE','Dans le cas d un raccordment par l OI et d une demande de RDV manuelle, l OC a dépassé le nombre maximum de modifications de RDV autorisé contractuellement par l OI... (cf Interop)');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FRDV02','RDV : PAS DE PLAGES DE RDV DISPONIBLES SUR CES CRENEAUX','Dans le cas d un raccordement par OI, et d une demande de RDV manuelle, l OC indique des créneaux à l aveugle à l OI. Ce rejet indique que les créneaux proposés par l OC ne sont pas disponibles dans le plan de charge de l OI.... (cf Interop)');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FRDV03','RDV : PLAGE DE RDV NON RESERVEE','Dans le cas d un raccordement par l OI, l OC a dépassé le délai pour passer sa commande. La réservation du RDV n a donc pas été confirmée par l OI');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FRDV04','RDV : ETAT RDV NON
     VALIDE','Dans le cas où la commande est passée avec un rdv dont l’état n’est pas valide, par exemple annulé, terminé, …');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FRDV05','RDV : RDV SUR PRODUIT NON FTTH','Dans le cas où la commande est passée avec un rdv qui a été pris sur un produit autre que le produit accès FTTH');
INSERT INTO gracethd_reseau_optique.l_bp_racco
     VALUES ('FRDV06','RDV : RDV SUR ADRESSE DIFFERENTE','Dans le cas où la commande est passée avec un rdv qui a été pris sur une autre adresse que celle de la commande (exemple n° ou nom de rue différents de l adresse de la commande)');

-- l_implantation
INSERT INTO gracethd_reseau_optique.l_implantation
     VALUES ('0','AERIEN TELECOM','');
INSERT INTO gracethd_reseau_optique.l_implantation
     VALUES ('1','AERIEN ENERGIE','');
INSERT INTO gracethd_reseau_optique.l_implantation
     VALUES ('2','FACADE','');
INSERT INTO gracethd_reseau_optique.l_implantation
     VALUES ('3','IMMEUBLE','');
INSERT INTO gracethd_reseau_optique.l_implantation
     VALUES ('4','PLEINE TERRE','');
INSERT INTO gracethd_reseau_optique.l_implantation
     VALUES ('5','CANIVEAU','');
INSERT INTO gracethd_reseau_optique.l_implantation
     VALUES ('6','GALERIE','');
INSERT INTO gracethd_reseau_optique.l_implantation
     VALUES ('7','CONDUITE','');
INSERT INTO gracethd_reseau_optique.l_implantation
     VALUES ('8','EGOUT','');
INSERT INTO gracethd_reseau_optique.l_implantation
     VALUES ('9','SPECIFIQUE','');

--l_fo_color
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('1','ROUGE (R)','#FF0000 - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('2','BLEU (BL)','#0070C0 - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('3','VERT (VE)','#92D050 - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('4','JAUNE (J)','#FFFF00 - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('5','VIOLET (V)','#7638A3 - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('6','BLANC (B)','#FFFFFF - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('7','ORANGE (OR)','#FFC000 - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('8','GRIS (GR)','#C1C1C1 - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('9','MARRON (BR)','#993300 - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('10','NOIR (N)','#000000 - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('11','TURQUOISE (TU)','#00B0F0 - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('12','ROSE (RS)','#FF65CC - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('1.1','BLEU (BL)','#0070C0 -  FOTAG IEEE 802.8');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('1.2','ORANGE (OR)','#FFC000 -  FOTAG IEEE 802.8');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('1.3','VERT (VE)','#92D050 -  FOTAG IEEE 802.8');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('1.4','MARRON (BR)','#993300 -  FOTAG IEEE 802.8');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('1.5','GRIS (GR)','#C1C1C1 -  FOTAG IEEE 802.8');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('1.6','BLANC (B)','#FFFFFF -  FOTAG IEEE 802.8');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('1.7','ROUGE (R)','#FF0000 -  FOTAG IEEE 802.8');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('1.8','NOIR (N)','#000000 -  FOTAG IEEE 802.8');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('1.9','VIOLET (V)','#7638A3 -  FOTAG IEEE 802.8');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('1.10','JAUNE (J)','#FFFF00 -  FOTAG IEEE 802.8');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('1.11','ROSE (RS)','#FF65CC -  FOTAG IEEE 802.8');
INSERT INTO gracethd_reseau_optique.l_fo_color
     VALUES ('1.12','TURQUOISE (TU)','#00B0F0 -  FOTAG IEEE 802.8');

--l_geoloc_mode
INSERT INTO gracethd_reseau_optique.l_geoloc_mode
     VALUES ('LTRO','LEVE DURANT LA POSE','Objet positionne grace à un leve durant la phase travaux. Dans le cas de tranchee, ce leve a ete realise tranchee ouverte.');
INSERT INTO gracethd_reseau_optique.l_geoloc_mode
     VALUES ('LVIS','LEVE APRES LA POSE','Objet positionne grace a un leve. Dans le cas d une tranchee, uniquement les elements visibles ont ete leves (rustines sur le revetement, chambres encadrantes). Des cotations prises pendant la pose ont permis de completer ce lever.');
INSERT INTO gracethd_reseau_optique.l_geoloc_mode
     VALUES ('DETC','LEVE AVEC DETECTION','Un appareil de detection a ete utilise pour positionner les elements à lever.');
INSERT INTO gracethd_reseau_optique.l_geoloc_mode
     VALUES ('FDPL','COTATION PAR RAPPORT A UN LEVE DE GEOMETRE','Objet implante en reportant des cotations prises par rapport à un fond de plan precedemment leve.');
INSERT INTO gracethd_reseau_optique.l_geoloc_mode
     VALUES ('CBDU','COTATION PAR RAPPORT A UN FOND DE PLAN TIERS TYPE BDU','Objet implante en reportant des cotations prises par rapport au meilleur fond de plan actuellement disponible.');
INSERT INTO gracethd_reseau_optique.l_geoloc_mode
     VALUES ('CADA','POSITIONNEMENT SUR CADASTRE','Objet positionne par rapport aux planches cadastrales.');
INSERT INTO gracethd_reseau_optique.l_geoloc_mode
     VALUES ('ORTO','POSITIONNEMENT SUR ORTHOPHOTOGRAPHIE OU FOND DE PLAN CARTOGRAPHIQUE','Objet positionne par rapport à des orthophotos, ou des fonds cartographiques type RGE, FRANCE RASTER, OSM ou Bing');
INSERT INTO gracethd_reseau_optique.l_geoloc_mode
     VALUES ('INDT','INDETERMINE','');

--l_technologie
INSERT INTO gracethd_reseau_optique.l_technologie
     VALUES ('CUT','CUIVRE TELECOM','');
INSERT INTO gracethd_reseau_optique.l_technologie
     VALUES ('OPT','OPTIQUE','');
INSERT INTO gracethd_reseau_optique.l_technologie
     VALUES ('COA','COAXIAL','');
INSERT INTO gracethd_reseau_optique.l_technologie
     VALUES ('ECL','ECLAIRAGE','');
INSERT INTO gracethd_reseau_optique.l_technologie
     VALUES ('ELE','ELECTRICITE','');
INSERT INTO gracethd_reseau_optique.l_technologie
     VALUES ('VID','VIDEO PROTECTION','');
INSERT INTO gracethd_reseau_optique.l_technologie
     VALUES ('RAD','RADIO','');

--l_occupation
INSERT INTO gracethd_reseau_optique.l_occupation
     VALUES ('0','VIDE','Infrastructure vide');
INSERT INTO gracethd_reseau_optique.l_occupation
     VALUES ('1.1','NON VIDE EXPLOITABLE','Infrastructure non vide mais exploitable car rangee');
INSERT INTO gracethd_reseau_optique.l_occupation
     VALUES ('1.2','NON VIDE NON EXPLOITABLE','Infrastructure non vide mais non exploitable car non rangee');
INSERT INTO gracethd_reseau_optique.l_occupation
     VALUES ('2','SATUREE','Infrastructure saturee');

--l_tube
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.37','ROUGE (R) TROIS BAGUES NOIRES','#FF0000 - trois bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.38','BLEU (BL) TROIS BAGUES NOIRES','#0070C0 - trois bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.39','VERT (VE) TROIS BAGUES NOIRES','#92D050 - trois bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.40','JAUNE (J) TROIS BAGUES NOIRES','#FFFF00 - trois bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.41','VIOLET (V) TROIS BAGUES NOIRES','#7638A3 - trois bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.42','BLANC (B) TROIS BAGUES NOIRES','#FFFFFF - trois bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.43','ORANGE (OR) TROIS BAGUES NOIRES','#FFC000 - trois bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.44','GRIS (GR) TROIS BAGUES NOIRES','#C1C1C1 - trois bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.45','MARRON (BR) TROIS BAGUES NOIRES','#993300 - trois bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.46','NOIR (N) TROIS BAGUES NOIRES','#000000 - trois bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.47','TURQUOISE (TU) TROIS BAGUES NOIRES','#00B0F0 - trois bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.48','ROSE (RS) TROIS BAGUES NOIRES','#FF65CC - trois bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.49','ROUGE (R) QUATRE BAGUES NOIRES','#FF0000 - quatre bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.50','BLEU (BL) QUATRE BAGUES NOIRES','#0070C0 - quatre bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.51','VERT (VE) QUATRE BAGUES NOIRES','#92D050 - quatre bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.52','JAUNE (J) QUATRE BAGUES NOIRES','#FFFF00 - quatre bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.53','VIOLET (V) QUATRE BAGUES NOIRES','#7638A3 - quatre bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.54','BLANC (B) QUATRE BAGUES NOIRES','#FFFFFF - quatre bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.55','ORANGE (OR) QUATRE BAGUES NOIRES','#FFC000 - quatre bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.56','GRIS (GR) QUATRE BAGUES NOIRES','#C1C1C1 - quatre bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.57','MARRON (BR) QUATRE BAGUES NOIRES','#993300 - quatre bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.58','NOIR (N) QUATRE BAGUES NOIRES','#000000 - quatre bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.59','TURQUOISE (TU) QUATRE BAGUES NOIRES','#00B0F0 - quatre bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.60','ROSE (RS) QUATRE BAGUES NOIRES','#FF65CC - quatre bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.61','ROUGE (R) CINQ BAGUES NOIRES','#FF0000 - cinq bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.62','BLEU (BL) CINQ BAGUES NOIRES','#0070C0 - cinq bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.63','VERT (VE) CINQ BAGUES NOIRES','#92D050 - cinq bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.64','JAUNE (J) CINQ BAGUES NOIRES','#FFFF00 - cinq bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.65','VIOLET (V) CINQ BAGUES NOIRES','#7638A3 - cinq bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.66','BLANC (B) CINQ BAGUES NOIRES','#FFFFFF - cinq bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.67','ORANGE (OR) CINQ BAGUES NOIRES','#FFC000 - cinq bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.68','GRIS (GR) CINQ BAGUES NOIRES','#C1C1C1 - cinq bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.69','MARRON (BR) CINQ BAGUES NOIRES','#993300 - cinq bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.70','NOIR (N) CINQ BAGUES NOIRES','#000000 - cinq bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.71','TURQUOISE (TU) CINQ BAGUES NOIRES','#00B0F0 - cinq bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.72','ROSE (RS) CINQ BAGUES NOIRES','#FF65CC - cinq bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.73','ROUGE (R) SIX BAGUES NOIRES','#FF0000 - six bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.74','BLEU (BL) SIX BAGUES NOIRES','#0070C0 - six bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.75','VERT (VE) SIX BAGUES NOIRES','#92D050 - six bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.76','JASIX (J) SIX BAGUES NOIRES','#FFFF00 - six bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.77','VIOLET (V) SIX BAGUES NOIRES','#7638A3 - six bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.78','BLANC (B) SIX BAGUES NOIRES','#FFFFFF - six bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.79','ORANGE (OR) SIX BAGUES NOIRES','#FFC000 - six bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.80','GRIS (GR) SIX BAGUES NOIRES','#C1C1C1 - six bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.81','MARRON (BR) SIX BAGUES NOIRES','#993300 - six bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.82','NOIRÂ (N) SIX BAGUES NOIRES','#000000 - six bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.83','TURQUOISE (TU) SIX BAGUES NOIRES','#00B0F0 - six bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.84','ROSE (RS) SIX BAGUES NOIRES','#FF65CC - six bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.85','ROUGE (R) SEPT BAGUES NOIRES','#FF0000 - sept bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.86','BLEU (BL) SEPT BAGUES NOIRES','#0070C0 - sept bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.87','VERT (VE) SEPT BAGUES NOIRES','#92D050 - sept bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.88','JASEPT (J) SEPT BAGUES NOIRES','#FFFF00 - sept bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.89','VIOLET (V) SEPT BAGUES NOIRES','#7638A3 - sept bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.90','BLANC (B) SEPT BAGUES NOIRES','#FFFFFF - sept bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.91','ORANGE (OR) SEPT BAGUES NOIRES','#FFC000 - sept bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.92','GRIS (GR) SEPT BAGUES NOIRES','#C1C1C1 - sept bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.93','MARRON (BR) SEPT BAGUES NOIRES','#993300 - sept bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.94','NOIRÂ (N) SEPT BAGUES NOIRES','#000000 - sept bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.95','TURQUOISE (TU) SEPT BAGUES NOIRES','#00B0F0 - sept bagues noires - Standard Orange');
INSERT INTO gracethd_reseau_optique.l_tube
     VALUES ('1.96','ROSE (RS) SEPT BAGUES NOIRES','#FF65CC - sept bagues noires - Standard Orange');

--l_clim
INSERT INTO gracethd_reseau_optique.l_clim
     VALUES ('SANS','SANS','');
INSERT INTO gracethd_reseau_optique.l_clim
     VALUES ('VENTIL','VENTILLATION','');
INSERT INTO gracethd_reseau_optique.l_clim
     VALUES ('CLIM','CLIMATISATION','');

--l_ptech_type_log
INSERT INTO gracethd_reseau_optique.l_ptech_type_log
     VALUES ('T','TIRAGE','');
INSERT INTO gracethd_reseau_optique.l_ptech_type_log
     VALUES ('R','RACCORDEMENT','');
INSERT INTO gracethd_reseau_optique.l_ptech_type_log
     VALUES ('I','INDETERMINE','');

--l_nro_type
INSERT INTO gracethd_reseau_optique.l_nro_type
     VALUES ('PON','NRO-PON','');
INSERT INTO gracethd_reseau_optique.l_nro_type
     VALUES ('PTP','NRO-PTP','');
INSERT INTO gracethd_reseau_optique.l_nro_type
     VALUES ('PON-PTP','NRO-PON-PTP','');

--l_sro_emplacement
INSERT INTO gracethd_reseau_optique.l_sro_emplacement
     VALUES ('ADR','SROE-ARMOIRE DE RUE','SRO Exterieur au sens de la reglementation, contenu dans une armoire de rue.');
INSERT INTO gracethd_reseau_optique.l_sro_emplacement
     VALUES ('SHE','SROE-SHELTER','SRO Exterieur au sens de la reglementation, contenu dans un shelter');
INSERT INTO gracethd_reseau_optique.l_sro_emplacement
     VALUES ('LTE','SROE-LOCAL TECHNIQUE','SRO Exterieur au sens de la reglementation, contenu dans un local technique, par exemple NRO.');
INSERT INTO gracethd_reseau_optique.l_sro_emplacement
     VALUES ('PME','SRO-EXTERIEUR','SRO Exterieur au sens de la reglementation, dont l information du contenu n est pas disponible dans le SI de l OI.');
INSERT INTO gracethd_reseau_optique.l_sro_emplacement
     VALUES ('PMI','SRO-INTERIEUR','Situe dans une partie privative necessitant l accord d un tiers (syndic, gestionnaire) en plus de l accord de l OI.');


DROP INDEX IF EXISTS ba_lc_code_idx; CREATE INDEX  ba_lc_code_idx ON t_baie(ba_lc_code);
DROP INDEX IF EXISTS ba_prop_idx; CREATE INDEX  ba_prop_idx ON t_baie(ba_prop);
DROP INDEX IF EXISTS ba_gest_idx; CREATE INDEX  ba_gest_idx ON t_baie(ba_gest);
DROP INDEX IF EXISTS ba_user_idx; CREATE INDEX  ba_user_idx ON t_baie(ba_user);
DROP INDEX IF EXISTS ba_rf_code_idx; CREATE INDEX  ba_rf_code_idx ON t_baie(ba_rf_code);
DROP INDEX IF EXISTS cc_cb_code_idx; CREATE INDEX  cc_cb_code_idx ON t_cab_chem(cc_cb_code);
DROP INDEX IF EXISTS cc_cm_code_idx; CREATE INDEX  cc_cm_code_idx ON t_cab_chem(cc_cm_code);
DROP INDEX IF EXISTS cb_nd1_idx; CREATE INDEX  cb_nd1_idx ON t_cable(cb_nd1);
DROP INDEX IF EXISTS cb_nd2_idx; CREATE INDEX  cb_nd2_idx ON t_cable(cb_nd2);
DROP INDEX IF EXISTS cb_bp1_idx; CREATE INDEX  cb_bp1_idx ON t_cable(cb_bp1);
DROP INDEX IF EXISTS cb_ba1_idx; CREATE INDEX  cb_ba1_idx ON t_cable(cb_ba1);
DROP INDEX IF EXISTS cb_bp2_idx; CREATE INDEX  cb_bp2_idx ON t_cable(cb_bp2);
DROP INDEX IF EXISTS cb_ba2_idx; CREATE INDEX  cb_ba2_idx ON t_cable(cb_ba2);
DROP INDEX IF EXISTS cb_prop_idx; CREATE INDEX  cb_prop_idx ON t_cable(cb_prop);
DROP INDEX IF EXISTS cb_gest_idx; CREATE INDEX  cb_gest_idx ON t_cable(cb_gest);
DROP INDEX IF EXISTS cb_user_idx; CREATE INDEX  cb_user_idx ON t_cable(cb_user);
DROP INDEX IF EXISTS cb_rf_code_idx; CREATE INDEX  cb_rf_code_idx ON t_cable(cb_rf_code);
DROP INDEX IF EXISTS cl_cb_code_idx; CREATE INDEX  cl_cb_code_idx ON t_cableline(cl_cb_code);
DROP INDEX IF EXISTS cs_bp_code_idx; CREATE INDEX  cs_bp_code_idx ON t_cassette(cs_bp_code);
DROP INDEX IF EXISTS cs_rf_code_idx; CREATE INDEX  cs_rf_code_idx ON t_cassette(cs_rf_code);
DROP INDEX IF EXISTS cm_ndcode1_idx; CREATE INDEX  cm_ndcode1_idx ON t_cheminement(cm_ndcode1);
DROP INDEX IF EXISTS cm_ndcode2_idx; CREATE INDEX  cm_ndcode2_idx ON t_cheminement(cm_ndcode2);
DROP INDEX IF EXISTS cm_prop_idx; CREATE INDEX  cm_prop_idx ON t_cheminement(cm_prop);
DROP INDEX IF EXISTS cm_gest_idx; CREATE INDEX  cm_gest_idx ON t_cheminement(cm_gest);
DROP INDEX IF EXISTS bp_pt_code_idx; CREATE INDEX  bp_pt_code_idx ON t_ebp(bp_pt_code);
DROP INDEX IF EXISTS bp_lc_code_idx; CREATE INDEX  bp_lc_code_idx ON t_ebp(bp_lc_code);
DROP INDEX IF EXISTS bp_prop_idx; CREATE INDEX  bp_prop_idx ON t_ebp(bp_prop);
DROP INDEX IF EXISTS bp_gest_idx; CREATE INDEX  bp_gest_idx ON t_ebp(bp_gest);
DROP INDEX IF EXISTS bp_user_idx; CREATE INDEX  bp_user_idx ON t_ebp(bp_user);
DROP INDEX IF EXISTS bp_rf_code_idx; CREATE INDEX  bp_rf_code_idx ON t_ebp(bp_rf_code);
DROP INDEX IF EXISTS eq_ba_code_idx; CREATE INDEX  eq_ba_code_idx ON t_equipement(eq_ba_code);
DROP INDEX IF EXISTS eq_prop_idx; CREATE INDEX  eq_prop_idx ON t_equipement(eq_prop);
DROP INDEX IF EXISTS eq_rf_code_idx; CREATE INDEX  eq_rf_code_idx ON t_equipement(eq_rf_code);
DROP INDEX IF EXISTS fo_cb_code_idx; CREATE INDEX  fo_cb_code_idx ON t_fibre(fo_cb_code);
DROP INDEX IF EXISTS lc_bp_codf_idx; CREATE INDEX  lc_bp_codf_idx ON t_local(lc_bp_codf);
DROP INDEX IF EXISTS lc_bp_codp_idx; CREATE INDEX  lc_bp_codp_idx ON t_local(lc_bp_codp);
DROP INDEX IF EXISTS lc_prop_idx; CREATE INDEX  lc_prop_idx ON t_local(lc_prop);
DROP INDEX IF EXISTS lc_gest_idx; CREATE INDEX  lc_gest_idx ON t_local(lc_gest);
DROP INDEX IF EXISTS lc_st_code_idx; CREATE INDEX  lc_st_code_idx ON t_local(lc_st_code);
DROP INDEX IF EXISTS lc_user_idx; CREATE INDEX  lc_user_idx ON t_local(lc_user);
DROP INDEX IF EXISTS lv_cb_code_idx; CREATE INDEX  lv_cb_code_idx ON t_love(lv_cb_code);
DROP INDEX IF EXISTS lv_nd_code_idx; CREATE INDEX  lv_nd_code_idx ON t_love(lv_nd_code);
DROP INDEX IF EXISTS ps_1_idx; CREATE INDEX  ps_1_idx ON t_position(ps_1);
DROP INDEX IF EXISTS ps_2_idx; CREATE INDEX  ps_2_idx ON t_position(ps_2);
DROP INDEX IF EXISTS ps_cs_code_idx; CREATE INDEX  ps_cs_code_idx ON t_position(ps_cs_code);
DROP INDEX IF EXISTS ps_ti_code_idx; CREATE INDEX  ps_ti_code_idx ON t_position(ps_ti_code);
DROP INDEX IF EXISTS pt_nd_code_idx; CREATE INDEX  pt_nd_code_idx ON t_ptech(pt_nd_code);
DROP INDEX IF EXISTS pt_ad_code_idx; CREATE INDEX  pt_ad_code_idx ON t_ptech(pt_ad_code);
DROP INDEX IF EXISTS pt_gest_do_idx; CREATE INDEX  pt_gest_do_idx ON t_ptech(pt_gest_do);
DROP INDEX IF EXISTS pt_prop_do_idx; CREATE INDEX  pt_prop_do_idx ON t_ptech(pt_prop_do);
DROP INDEX IF EXISTS pt_prop_idx; CREATE INDEX  pt_prop_idx ON t_ptech(pt_prop);
DROP INDEX IF EXISTS pt_gest_idx; CREATE INDEX  pt_gest_idx ON t_ptech(pt_gest);
DROP INDEX IF EXISTS pt_user_idx; CREATE INDEX  pt_user_idx ON t_ptech(pt_user);
DROP INDEX IF EXISTS pt_rf_code_idx; CREATE INDEX  pt_rf_code_idx ON t_ptech(pt_rf_code);
DROP INDEX IF EXISTS rt_fo_code_idx; CREATE INDEX  rt_fo_code_idx ON t_ropt(rt_fo_code);
DROP INDEX IF EXISTS st_nd_code_idx; CREATE INDEX  st_nd_code_idx ON t_site(st_nd_code);
DROP INDEX IF EXISTS st_prop_idx; CREATE INDEX  st_prop_idx ON t_site(st_prop);
DROP INDEX IF EXISTS st_gest_idx; CREATE INDEX  st_gest_idx ON t_site(st_gest);
DROP INDEX IF EXISTS st_user_idx; CREATE INDEX  st_user_idx ON t_site(st_user);
DROP INDEX IF EXISTS st_ad_code_idx; CREATE INDEX  st_ad_code_idx ON t_site(st_ad_code);
DROP INDEX IF EXISTS ti_ba_code_idx; CREATE INDEX  ti_ba_code_idx ON t_tiroir(ti_ba_code);
DROP INDEX IF EXISTS ti_prop_idx; CREATE INDEX  ti_prop_idx ON t_tiroir(ti_prop);
DROP INDEX IF EXISTS ti_rf_code_idx; CREATE INDEX  ti_rf_code_idx ON t_tiroir(ti_rf_code);
DROP INDEX IF EXISTS zc_nd_code_idx; CREATE INDEX  zc_nd_code_idx ON t_zcoax(zc_nd_code);
DROP INDEX IF EXISTS zc_prop_idx; CREATE INDEX  zc_prop_idx ON t_zcoax(zc_prop);
DROP INDEX IF EXISTS zc_gest_idx; CREATE INDEX  zc_gest_idx ON t_zcoax(zc_gest);
DROP INDEX IF EXISTS zd_nd_code_idx; CREATE INDEX  zd_nd_code_idx ON t_zdep(zd_nd_code);
DROP INDEX IF EXISTS zd_zs_code_idx; CREATE INDEX  zd_zs_code_idx ON t_zdep(zd_zs_code);
DROP INDEX IF EXISTS zd_prop_idx; CREATE INDEX  zd_prop_idx ON t_zdep(zd_prop);
DROP INDEX IF EXISTS zd_gest_idx; CREATE INDEX  zd_gest_idx ON t_zdep(zd_gest);
DROP INDEX IF EXISTS zp_nd_code_idx; CREATE INDEX  zp_nd_code_idx ON t_zpbo(zp_nd_code);
DROP INDEX IF EXISTS zp_bp_code_idx; CREATE INDEX  zp_bp_code_idx ON t_zpbo(zp_bp_code);
DROP INDEX IF EXISTS zp_zs_code_idx; CREATE INDEX  zp_zs_code_idx ON t_zpbo(zp_zs_code);
DROP INDEX IF EXISTS zn_nd_code_idx; CREATE INDEX  zn_nd_code_idx ON t_znro(zn_nd_code);
DROP INDEX IF EXISTS zn_lc_code_idx; CREATE INDEX  zn_lc_code_idx ON t_znro(zn_lc_code);
DROP INDEX IF EXISTS zs_nd_code_idx; CREATE INDEX  zs_nd_code_idx ON t_zsro(zs_nd_code);
DROP INDEX IF EXISTS zs_zn_code_idx; CREATE INDEX  zs_zn_code_idx ON t_zsro(zs_zn_code);
DROP INDEX IF EXISTS zs_ad_code_idx; CREATE INDEX  zs_ad_code_idx ON t_zsro(zs_ad_code);
DROP INDEX IF EXISTS zs_lc_code_idx; CREATE INDEX  zs_lc_code_idx ON t_zsro(zs_lc_code);
