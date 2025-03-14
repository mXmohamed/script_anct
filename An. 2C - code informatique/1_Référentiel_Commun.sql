
-- Script de création de base GraceTHD V3 : référentiel <gracethd_commun>

-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io


-- object: gracethd_commun | type: SCHEMA --
-- DROP SCHEMA IF EXISTS gracethd_commun CASCADE;
CREATE SCHEMA gracethd_commun;
-- ddl-end --
-- ALTER SCHEMA gracethd_commun OWNER TO postgres;
-- ddl-end --

SET search_path TO gracethd_commun,public;
-- ddl-end --


-- -- object: public.geometry | type: TYPE --
-- -- DROP TYPE IF EXISTS public.geometry CASCADE;
-- CREATE TYPE public.geometry;
-- -- ddl-end --
-- 
-- object: gracethd_commun.t_adresse | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.t_adresse CASCADE;
CREATE TABLE gracethd_commun.t_adresse (
	ad_code character varying(254) NOT NULL,
	ad_raclong character varying(1),
	ad_datmodi timestamp,
	ad_nomvoie character varying(254),
	ad_numero integer,
	ad_rep character varying(20),
	ad_insee character varying(6),
	ad_postal character varying(20),
	ad_commune character varying(254),
	ad_hexacle character varying(254),
	ad_distinf numeric(6,2),
	ad_isole character varying(1),
	ad_prio character varying(1),
	ad_racc character varying(2),
	ad_batcode character varying(100),
	ad_codtemp character varying(254),
	ad_nombat character varying(254),
	ad_ietat character varying(2),
	ad_imneuf character varying(1),
	ad_gest character varying(254),
	ad_idatsgn timestamp,
	ad_iaccgst character varying(1),
	ad_nblres integer,
	ad_nblpro integer,
	ad_nblent integer,
	ad_nblpub integer,
	ad_nblobj integer,
	ad_nblope integer,
	ad_nbfotte integer,
	ad_nbfogfu integer,
	ad_nbfotto integer,
	ad_nbfotth integer,
	ad_nbfofon integer,
	ad_dta character varying(1),
	geom public.geometry NOT NULL,
	ad_ban_id character varying(24),
	ad_fantoir character varying(10),
	ad_alias character varying(254),
	ad_nom_ld character varying(254),
	ad_x_ban numeric,
	ad_y_ban numeric,
	ad_section character varying(5),
	ad_idpar character varying(20),
	ad_x_parc numeric,
	ad_y_parc numeric,
	ad_nat character varying(1),
	ad_rivoli character varying(254),
	ad_hexaclv character varying(254),
	ad_itypeim character varying(1),
	ad_idatimn timestamp,
	ad_prop character varying(254),
	ad_idatcab timestamp,
	ad_idatcom date,
	ad_typzone character varying(1),
	ad_comment character varying(254),
	ad_geolqlt numeric(6,2),
	ad_geolmod character varying(4),
	ad_geolsrc character varying(254),
	ad_creadat timestamp,
	ad_majdate timestamp,
	ad_majsrc character varying(254),
	ad_abddate timestamp,
	ad_abdsrc character varying(254),
	ad_sracdem character varying(1),
	CONSTRAINT "t_adresse_pk " PRIMARY KEY (ad_code),
	CONSTRAINT ad_batcode_unique UNIQUE (ad_batcode),
	CONSTRAINT ad_codtemp_unique UNIQUE (ad_codtemp)

);
-- ddl-end --
COMMENT ON TABLE gracethd_commun.t_adresse IS E'Adresses telles qu''identifiées par les opérateurs. Cette classe d''objets participe à la génération de Fichiers d''Informations Préalable (IPE), pour l''activation des services opérateurs auprès des abonnés. Peut identifier une plaque adresse ou un bâtiment.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_datmodi IS E'Date de dernière mise à jour de l''adresse (changement d''un attribut, de la géométrie, modification liée à l''adresse ex : changement de liaison adresse/EBP)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_nomvoie IS E'Nom de la voie';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_numero IS E'Numéro éventuel de l’adresse dans la voie';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_rep IS E'Indice de répétition associé au numéro (par exemple Bis, A, 1…)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_insee IS E'Identifiant INSEE de la commune fondé sur le COG en cours';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_postal IS E'Code postal du bureau de distribution de la voie';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_commune IS E'Nom officiel de la commune';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_hexacle IS E'Code HEXACLE';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_distinf IS E'Distance en mètres de raccordement selon définition dans le marché.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_isole IS E'Pour distinguer les locaux de type client considérés comme isolés (1), de ceux qui ne le sont pas (0) (distance supérieure au maximum contractuel)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_prio IS E'Le raccordement du site est-il prioritaire (1) ou non (0) ?';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_racc IS E'Type de raccordement du site';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_batcode IS E'Identifiant du bâtiment dans une base de données externe (IGN, OSM, DGFiP,opérateurs etc.).';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_codtemp IS E'Code temporaire avant création de l''ad_batcode';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_nombat IS E'Ce champ correspond au nom du batiment tel que décrit par l''opérateur d''immeuble en cohérence avec ce qu''il constate sur le terrain. Ce champ peut apparaitre après la publication de l''adresse dans l''IPE car fiabilisé au cours de la phase de piquetage terrain.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_ietat IS E'Permet d''indiquer l''avancement du déploiement. (Obligatoire IPE)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_imneuf IS E'Ce champ permet d''indiquer s''il s''agit d''un habitat en cours de construction (1) pendant le déploiement du SRO qui le dessert. (Facultatif IPE). Si ce n''est pas le cas (0).';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_gest IS E'Gestionnaire d''immeuble (entreprise ou personne) dans le référentiel des gestionnaires (Conditionnel IPE)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_idatsgn IS E'Date de la signature de la convention avec le gestionnaire de l''immeuble. (Conditionnel IPE)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_iaccgst IS E'Permet de savoir si un accord du gestionnaire d''immeuble (copropriété, syndic, etc.) est nécessaire (1) ou non (0) pour aller raccorder l''adresse. (Obligatoire IPE)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_nblres IS E'Nombre de locaux résidentiels.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_nblpro IS E'Nombre de locaux professionnels.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_nblent IS E'Nombre de locaux d’entreprises identifiés comme éligibles à une offre de raccordement spécifique (FTTE, FTTO, FON).';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_nblpub IS E'Nombre de locaux exploités par des services publics.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_nblobj IS E'Nombre de locaux de type objet connectés';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_nblope IS E'Nombre de locaux  exploités exclusivement pour des usages d’opérateurs télécoms.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_nbfotte IS E'Nombre de fibres FTTE (Fibre activée en point-à-point sur la Boucle Locale Optique Mutualisée)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_nbfogfu IS E'Nombre de fibres GFU (Groupement Ferme d''Utilisateurs tel que defini par la decision ARCEP n 05 0208)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_nbfotto IS E'Nombre de fibres FTTO (Offre Sur Mesure sans modalites de raccordement reglemente).';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_nbfotth IS E'Nombre de fibres FTTH';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_nbfofon IS E'Nombre de fibres noires.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_dta IS E'1 si un Diagnostic Technique Amiante (DTA) est obligatoire, 0 si ce n’est pas le cas.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.geom IS E'Point abstrait';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_ban_id IS E'Identifiant Base Adresse Nationale';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_fantoir IS E'Identifiant FANTOIR contenu dans le fichier des propriétés bâtis de la DGFiP';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_alias IS E'Eventuellement le nom en langue régionale ou une autre appellation différente de l’appellation officielle';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_nom_ld IS E'Nom du lieu-dit qui peut être le nom de la voie parfois';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_x_ban IS E'X en lambert 93';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_y_ban IS E'Y en lambert 93';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_section IS E'Section cadastrale pour ceux qui souhaitent utiliser les numéros de parcelles du PCI.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_idpar IS E'Identifiant de la parcelle de référence. Notion base MAJIC.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_x_parc IS E'X en lambert 93 de la parcelle identifiée comme parcelle de référence (base MAJICIII quand disponible).';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_y_parc IS E'Y en lambert 93 de la parcelle identifiée comme parcelle de référence (base MAJICIII quand disponible).';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_nat IS E'Oui si le site n''est pas une propriété privée.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_rivoli IS E'Code RIVOLI (source Orange) exploité par certains opérateurs.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_hexaclv IS E'Code HEXACLE Voie. Correspond au 0 de la voie. Est différent de l''Hexavia. La bonne pratique est de le renseigner s''il existe et particulierement en l''absence d''hexaclé';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_itypeim IS E'Type d''immeuble (Obligatoire IPE).';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_idatimn IS E'Ce champ est utilisé dans le cadre des immeubles neufs et facultatif. Il permet à l''opérateur d''immeuble d''indiquer la date prévisionnelle de livraison de l''immeuble indiquée par le constructeur de l''immeuble. Cette date constitue une tendance sans garantie de mise à jour par l''opérateur d''immeuble. (Facultatif IPE)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_prop IS E'Propriétaire de l''immeuble (entreprise ou personne)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_idatcab IS E'Date prévisionnelle ou effective du câblage de l''adresse c''est à dire de déploiement de l''adresse. Cette date correspond à la date à laquelle EtatImmeuble passera à l''état déployé et l''adresse sera raccordable. (obligatoire IPE)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_idatcom IS E'Ce champ correspond à la date à laquelle le raccordement effectif d''un client final à cet immeuble est possible du point de vue de la réglementation. Il correspond à la date d''ouverture à la commercialisation d''une ligne. (Facultatif IPE)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_typzone IS E'Type de zone de l''adresse desservie. (Obligatoire IPE)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_geolqlt IS E'Précision du positionnement de l''objet, estimée en mètres. La précision doit être déduite du mode d''implantation et du support d''implantation, en tenant compte selon les cas du cumul des imprécisions : des levés ou du fond de plan (utiliser dans ce cas la classe de précision planimétrique au sens de l''arrêté du 16 septembre 2003), de l''outil de détection, des cotations, de l''éventuel report ''à main levée'', etc.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_geolmod IS E'Mode d''implantation de l''objet.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_geolsrc IS E'Source de la géolocalisation pour préciser la source si nécessaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_adresse.ad_sracdem IS E'Adresse susceptible d''être raccordable sur demande.';
-- ddl-end --
-- ALTER TABLE gracethd_commun.t_adresse OWNER TO postgres;
-- ddl-end --



-- object: gracethd_commun.t_organisme | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.t_organisme CASCADE;
CREATE TABLE gracethd_commun.t_organisme (
	or_code character varying(20) NOT NULL,
	or_nom character varying(254),
	or_type character varying(254),
	or_siret character varying(14),
	or_nomvoie character varying(254),
	or_numero integer,
	or_rep character varying(20),
	or_local character varying(254),
	or_postal character varying(20),
	or_commune character varying(254),
	or_siren character varying(9),
	or_activ character varying(254),
	or_l331 character varying(254),
	or_nometab character varying(254),
	or_ad_code character varying(254),
	or_telfixe character varying(20),
	or_mail character varying(254),
	or_comment character varying(254),
	or_creadat timestamp,
	or_majdate timestamp,
	or_majsrc character varying(254),
	or_abddate timestamp,
	or_abdsrc character varying(254),
	CONSTRAINT "t_organisme_pk " PRIMARY KEY (or_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_commun.t_organisme IS E'Coordonnées et identification d''organismes publics et privés';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_code IS E'Code de l''organisme';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_nom IS E'Nom de l''opérateur, de la collectivité, de l''entreprise, etc-';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_type IS E'Classification juridique-  Littéral ou nomenclature INSEE-';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_siret IS E'Numéro SIRET dans le cas d''un établissement (sens INSEE, base SIRENE)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_nomvoie IS E'Nom de la voie';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_numero IS E'Numéro  éventuel  de  l’adresse  dans  la voie';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_rep IS E'Indice de répétition associé au numéro (par exemple Bis, A, 1…)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_local IS E'Complément d''adresse pour identifier le local-';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_postal IS E'Code  postal  du  bureau  de  distribution de la voie';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_commune IS E'Nom officiel de la commune';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_siren IS E'Numéro SIREN de l''opérateur, de la collectivité, …';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_activ IS E'Activité principale exercée-  Littéral ou Code NAF-';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_l331 IS E'Code court selon liste opérateurs L33-1 (téléchargeable sur le site de l''ARCEP)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_nometab IS E'Nom de l''établissement, de l''agence (sens INSEE, base SIRENE)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_ad_code IS E'Identifiant de l''adresse dans la table t_adresse';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_telfixe IS E'Téléphone fixe';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_mail IS E'Mail de contact générique';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_organisme.or_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_commun.t_organisme OWNER TO postgres;
-- ddl-end --

-- object: gracethd_commun.t_document | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.t_document CASCADE;
CREATE TABLE gracethd_commun.t_document (
	do_code character varying(254) NOT NULL,
	do_ref character varying(254),
	do_reftier character varying(254),
	do_r1_code character varying(100),
	do_r2_code character varying(100),
	do_r3_code character varying(100),
	do_r4_code character varying(100),
	do_type character varying(3),
	do_indice character varying(3),
	do_date timestamp,
	do_classe character varying(2),
	do_url1 character varying(254),
	do_url2 character varying(254),
	do_comment character varying(254),
	do_creadat timestamp,
	do_majdate timestamp,
	do_majsrc character varying(254),
	do_abddate timestamp,
	do_abdsrc character varying(254),
	CONSTRAINT "t_document_pk " PRIMARY KEY (do_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_commun.t_document IS E'Liste des documents concernant le réseau.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_code IS E'Code unique pouvant être auto-incrémenté (selon plages d''identifiants). Peut-être une valeur';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_ref IS E'Référence du document';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_reftier IS E'Référence du document chez un tiers ou dans une autre base de données.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_r1_code IS E'Code d''un référencement du réseau 1 (plaque, dsp, BM, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_r2_code IS E'Code d''un référencement du réseau 2 (poche, tronçon, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_r3_code IS E'Code d''un référencement du réseau 3 (secteur, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_r4_code IS E'Code d''un référencement du réseau 4';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_type IS E'Type de document';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_indice IS E'Indice du document';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_date IS E'Date de l''indice du document';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_classe IS E'Classe de précision cartographique (pour les documents cartographiques soumis au décret DT-DICT).';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_url1 IS E'URL du fichier éditable';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_url2 IS E'URL du fichier publiable (PDF, etc.)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_comment IS E'Commentaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_document.do_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_commun.t_document OWNER TO postgres;
-- ddl-end --

-- object: gracethd_commun.t_docobj | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.t_docobj CASCADE;
CREATE TABLE gracethd_commun.t_docobj (
	od_id bigint NOT NULL,
	od_do_code character varying(254) NOT NULL,
	od_tbltype character varying(2),
	od_codeobj character varying(254) NOT NULL,
	od_creadat timestamp,
	od_majdate timestamp,
	od_majsrc character varying(254),
	od_abddate timestamp,
	od_abdsrc character varying(254),
	CONSTRAINT "t_docobj_pk " PRIMARY KEY (od_id)

);
-- ddl-end --
COMMENT ON TABLE gracethd_commun.t_docobj IS E'Relations entre les objets et la liste des documents concernant le réseau.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_docobj.od_id IS E'Identifiant unique pouvant être auto-incrémenté (selon plages d''identifiants)';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_docobj.od_do_code IS E'Code du document';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_docobj.od_tbltype IS E'Code du type d''objets auxquels sont rattachés des documents.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_docobj.od_codeobj IS E'Identifiant faisant référence aux identifiants des objets Cable,Point techniques, …etc.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_docobj.od_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_docobj.od_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_docobj.od_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_docobj.od_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_docobj.od_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_commun.t_docobj OWNER TO postgres;
-- ddl-end --

-- object: gracethd_commun.t_empreinte | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.t_empreinte CASCADE;
CREATE TABLE gracethd_commun.t_empreinte (
	em_code character varying(254) NOT NULL,
	em_do_code character varying(254) NOT NULL,
	em_geolsrc character varying(254),
	em_creadat timestamp,
	em_majdate timestamp,
	em_majsrc character varying(254),
	em_abddate timestamp,
	em_abdsrc character varying(254),
	geom public.geometry NOT NULL,
	CONSTRAINT "t_empreinte_pk " PRIMARY KEY (em_code),
	CONSTRAINT em_do_code_unique UNIQUE (em_do_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_commun.t_empreinte IS E'Empreinte des documents couvrant une emprise spatiale.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_empreinte.em_code IS E'Code unique pour une empreinte de document.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_empreinte.em_do_code IS E'Code d''un document.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_empreinte.em_geolsrc IS E'Source de la géolocalisation pour préciser la source si nécessaire';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_empreinte.em_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_empreinte.em_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_empreinte.em_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_empreinte.em_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_empreinte.em_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_empreinte.geom IS E'Polygone d''empreinte du document';
-- ddl-end --
-- ALTER TABLE gracethd_commun.t_empreinte OWNER TO postgres;
-- ddl-end --

-- object: gracethd_commun.t_reference | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.t_reference CASCADE;
CREATE TABLE gracethd_commun.t_reference (
	rf_code character varying(254) NOT NULL,
	rf_type character varying(2),
	rf_design character varying(254),
	rf_fabric character varying(20),
	rf_etat character varying(1),
	rf_comment character varying(254),
	rf_creadat timestamp,
	rf_majdate timestamp,
	rf_majsrc character varying(254),
	rf_abddate timestamp,
	rf_abdsrc character varying(254),
	CONSTRAINT "t_reference_pk " PRIMARY KEY (rf_code)

);
-- ddl-end --
COMMENT ON TABLE gracethd_commun.t_reference IS E'Référence de matériel ou de coupe type.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_reference.rf_code IS E'Code permettant d''identifier la référence d''un matériel dans la base.';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_reference.rf_type IS E'Type de matériel';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_reference.rf_design IS E'Design';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_reference.rf_fabric IS E'Fabricant';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_reference.rf_etat IS E'Disponibilité de la référence';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_reference.rf_comment IS E'Commentaires';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_reference.rf_creadat IS E'Date de création de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_reference.rf_majdate IS E'Date de la mise à jour de l''objet en base';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_reference.rf_majsrc IS E'Source utilisée pour la mise à jour';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_reference.rf_abddate IS E'Date d''abandon de l''objet';
-- ddl-end --
COMMENT ON COLUMN gracethd_commun.t_reference.rf_abdsrc IS E'Cause de l''abandon de l''objet';
-- ddl-end --
-- ALTER TABLE gracethd_commun.t_reference OWNER TO postgres;
-- ddl-end --


-- object: gracethd_commun.l_adresse_etat | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.l_adresse_etat CASCADE;
CREATE TABLE gracethd_commun.l_adresse_etat (
	code character varying(2) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_adresse_etat_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_commun.l_adresse_etat OWNER TO postgres;
-- ddl-end --

-- object: gracethd_commun.l_implantation | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.l_implantation CASCADE;
CREATE TABLE gracethd_commun.l_implantation (
	code character varying(1) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_implantation_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_commun.l_implantation OWNER TO postgres;
-- ddl-end --

-- object: gracethd_commun.l_geoloc_classe | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.l_geoloc_classe CASCADE;
CREATE TABLE gracethd_commun.l_geoloc_classe (
	code character varying(2) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_geoloc_classe_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_commun.l_geoloc_classe OWNER TO postgres;
-- ddl-end --

-- object: gracethd_commun.l_doc_tab | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.l_doc_tab CASCADE;
CREATE TABLE gracethd_commun.l_doc_tab (
	code character varying(2) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_doc_tab_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_commun.l_doc_tab OWNER TO postgres;
-- ddl-end --

-- object: gracethd_commun.l_doc_type | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.l_doc_type CASCADE;
CREATE TABLE gracethd_commun.l_doc_type (
	code character varying(3) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_doc_type_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_commun.l_doc_type OWNER TO postgres;
-- ddl-end --

-- object: gracethd_commun.l_geoloc_mode | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.l_geoloc_mode CASCADE;
CREATE TABLE gracethd_commun.l_geoloc_mode (
	code character varying(4) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_geoloc_mode_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_commun.l_geoloc_mode OWNER TO postgres;
-- ddl-end --

-- object: gracethd_commun.l_reference_etat | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.l_reference_etat CASCADE;
CREATE TABLE gracethd_commun.l_reference_etat (
	code character varying(1) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_reference_etat_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_commun.l_reference_etat OWNER TO postgres;
-- ddl-end --

-- object: gracethd_commun.l_reference_type | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.l_reference_type CASCADE;
CREATE TABLE gracethd_commun.l_reference_type (
	code character varying(2) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_reference_type_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_commun.l_reference_type OWNER TO postgres;
-- ddl-end --

-- object: gracethd_commun.l_immeuble | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.l_immeuble CASCADE;
CREATE TABLE gracethd_commun.l_immeuble (
	code character varying(2) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_immeuble_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_commun.l_immeuble OWNER TO postgres;
-- ddl-end --

-- object: gracethd_commun.l_zone_densite | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.l_zone_densite CASCADE;
CREATE TABLE gracethd_commun.l_zone_densite (
	code character varying(1) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_zone_densite_pk PRIMARY KEY (code)

);
-- ddl-end --
-- ALTER TABLE gracethd_commun.l_zone_densite OWNER TO postgres;
-- ddl-end --

-- object: gracethd_commun.l_bool | type: TABLE --
-- DROP TABLE IF EXISTS gracethd_commun.l_bool CASCADE;
CREATE TABLE gracethd_commun.l_bool (
	code character varying(2) NOT NULL,
	libelle character varying(254),
	definition character varying(254),
	CONSTRAINT l_bool_pk PRIMARY KEY (code)

);

-- object: fk_t_adresse_ad_prop | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_adresse DROP CONSTRAINT IF EXISTS fk_t_adresse_ad_prop CASCADE;
ALTER TABLE gracethd_commun.t_adresse ADD CONSTRAINT fk_t_adresse_ad_prop FOREIGN KEY (ad_prop)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_adresse_ad_gest | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_adresse DROP CONSTRAINT IF EXISTS fk_t_adresse_ad_gest CASCADE;
ALTER TABLE gracethd_commun.t_adresse ADD CONSTRAINT fk_t_adresse_ad_gest FOREIGN KEY (ad_gest)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_adresse_ad_typzone | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_adresse DROP CONSTRAINT IF EXISTS fk_t_adresse_ad_typzone CASCADE;
ALTER TABLE gracethd_commun.t_adresse ADD CONSTRAINT fk_t_adresse_ad_typzone FOREIGN KEY (ad_typzone)
REFERENCES gracethd_commun.l_zone_densite (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_adresse_ad_prio | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_adresse DROP CONSTRAINT IF EXISTS fk_t_adresse_ad_prio CASCADE;
ALTER TABLE gracethd_commun.t_adresse ADD CONSTRAINT fk_t_adresse_ad_prio FOREIGN KEY (ad_prio)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_adresse_ad_imneuf | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_adresse DROP CONSTRAINT IF EXISTS fk_t_adresse_ad_imneuf CASCADE;
ALTER TABLE gracethd_commun.t_adresse ADD CONSTRAINT fk_t_adresse_ad_imneuf FOREIGN KEY (ad_imneuf)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_adresse_ad_iaccgst | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_adresse DROP CONSTRAINT IF EXISTS fk_t_adresse_ad_iaccgst CASCADE;
ALTER TABLE gracethd_commun.t_adresse ADD CONSTRAINT fk_t_adresse_ad_iaccgst FOREIGN KEY (ad_iaccgst)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_adresse_ad_dta | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_adresse DROP CONSTRAINT IF EXISTS fk_t_adresse_ad_dta CASCADE;
ALTER TABLE gracethd_commun.t_adresse ADD CONSTRAINT fk_t_adresse_ad_dta FOREIGN KEY (ad_dta)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_adresse_ad_raclong | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_adresse DROP CONSTRAINT IF EXISTS fk_t_adresse_ad_raclong CASCADE;
ALTER TABLE gracethd_commun.t_adresse ADD CONSTRAINT fk_t_adresse_ad_raclong FOREIGN KEY (ad_raclong)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_adresse_ad_isole | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_adresse DROP CONSTRAINT IF EXISTS fk_t_adresse_ad_isole CASCADE;
ALTER TABLE gracethd_commun.t_adresse ADD CONSTRAINT fk_t_adresse_ad_isole FOREIGN KEY (ad_isole)
REFERENCES gracethd_commun.l_bool (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_t_docobj_od_do_code | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_docobj DROP CONSTRAINT IF EXISTS fk_t_docobj_od_do_code CASCADE;
ALTER TABLE gracethd_commun.t_docobj ADD CONSTRAINT fk_t_docobj_od_do_code FOREIGN KEY (od_do_code)
REFERENCES gracethd_commun.t_document (do_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_empreinte_em_do_code | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_empreinte DROP CONSTRAINT IF EXISTS fk_t_empreinte_em_do_code CASCADE;
ALTER TABLE gracethd_commun.t_empreinte ADD CONSTRAINT fk_t_empreinte_em_do_code FOREIGN KEY (em_do_code)
REFERENCES gracethd_commun.t_document (do_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_reference_rf_fabric | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_reference DROP CONSTRAINT IF EXISTS fk_t_reference_rf_fabric CASCADE;
ALTER TABLE gracethd_commun.t_reference ADD CONSTRAINT fk_t_reference_rf_fabric FOREIGN KEY (rf_fabric)
REFERENCES gracethd_commun.t_organisme (or_code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_document_do_type | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_document DROP CONSTRAINT IF EXISTS fk_t_document_do_type CASCADE;
ALTER TABLE gracethd_commun.t_document ADD CONSTRAINT fk_t_document_do_type FOREIGN KEY (do_type)
REFERENCES gracethd_commun.l_doc_type (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_docobj_od_tbltype | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_docobj DROP CONSTRAINT IF EXISTS fk_t_docobj_od_tbltype CASCADE;
ALTER TABLE gracethd_commun.t_docobj ADD CONSTRAINT fk_t_docobj_od_tbltype FOREIGN KEY (od_tbltype)
REFERENCES gracethd_commun.l_doc_tab (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_reference_rf_etat | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_reference DROP CONSTRAINT IF EXISTS fk_t_reference_rf_etat CASCADE;
ALTER TABLE gracethd_commun.t_reference ADD CONSTRAINT fk_t_reference_rf_etat FOREIGN KEY (rf_etat)
REFERENCES gracethd_commun.l_reference_etat (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_reference_rf_etat | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_reference DROP CONSTRAINT IF EXISTS fk_t_reference_rf_etat CASCADE;
ALTER TABLE gracethd_commun.t_reference ADD CONSTRAINT fk_t_reference_rf_type FOREIGN KEY (rf_type)
REFERENCES gracethd_commun.l_reference_type (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_adresse_ad_racc | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_adresse DROP CONSTRAINT IF EXISTS fk_t_adresse_ad_racc CASCADE;
ALTER TABLE gracethd_commun.t_adresse ADD CONSTRAINT fk_t_adresse_ad_racc FOREIGN KEY (ad_racc)
REFERENCES gracethd_commun.l_implantation (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_adresse_ad_ietat | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_adresse DROP CONSTRAINT IF EXISTS fk_t_adresse_ad_ietat CASCADE;
ALTER TABLE gracethd_commun.t_adresse ADD CONSTRAINT fk_t_adresse_ad_ietat FOREIGN KEY (ad_ietat)
REFERENCES gracethd_commun.l_adresse_etat (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_t_adresse_ad_itypeim | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_adresse DROP CONSTRAINT IF EXISTS fk_t_adresse_ad_itypeim CASCADE;
ALTER TABLE gracethd_commun.t_adresse ADD CONSTRAINT fk_t_adresse_ad_itypeim FOREIGN KEY (ad_itypeim)
REFERENCES gracethd_commun.l_immeuble (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_t_adresse_ad_geolmod | type: CONSTRAINT --
-- ALTER TABLE gracethd_commun.t_adresse DROP CONSTRAINT IF EXISTS fk_t_adresse_ad_geolmod CASCADE;
ALTER TABLE gracethd_commun.t_adresse ADD CONSTRAINT fk_t_adresse_ad_geolmod FOREIGN KEY (ad_geolmod)
REFERENCES gracethd_commun.l_geoloc_mode (code) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- -- object: public.geometry | type: TYPE --
-- -- DROP TYPE IF EXISTS public.geometry CASCADE;
-- CREATE TYPE public.geometry;
-- -- ddl-end --
-- 

--l_geoloc_classe
INSERT INTO gracethd_commun.l_geoloc_classe
    VALUES ('A','CLASSE DE PRECISION A','Décret du 15 février 2012 : un ouvrage ou tronçon d ouvrage est rangé dans la classe A si l incertitude maximale de localisation indiquée par son exploitant est inférieure ou égale à 40 cm et s il est rigide, ou à 50 cm s il est flexible.');
INSERT INTO gracethd_commun.l_geoloc_classe
    VALUES ('AP','CLASSE DE PRECISION A, EN PLANIMETRIE UNIQUEMENT','Idem classe A, mais uniquement pour les
    Valeurs x et y (hors z)');
INSERT INTO gracethd_commun.l_geoloc_classe
    VALUES ('B','CLASSE DE PRECISION B','Décret du 15 février 2012 : un ouvrage ou tronçon d ouvrage est rangé dans la classe B si l incertitude maximale de localisation indiquée par son exploitant est supérieure à celle relative à la classe A et inférieure ou égale à 1,5 mètre.');
INSERT INTO gracethd_commun.l_geoloc_classe
    VALUES ('C','CLASSE DE PRECISION C','Décret du 15 février 2012 : un ouvrage ou tronçon d ouvrage est rangé dans la classe C si l incertitude maximale de localisation indiquée par son exploitant est supérieure à 1,5 mètre, ou si son exploitant n est pas en mesure de fournir la localisation.');

--l_adresse_etat
INSERT INTO gracethd_commun.l_adresse_etat
    VALUES ('CI','CIBLE','L adresse se situe dans la zone arriere d un SRO deploye ou en cours de deploiement ou ayant fait l objet d une consultation (Interop:EtatImmeuble)');
INSERT INTO gracethd_commun.l_adresse_etat
    VALUES ('RD','RACCORDABLE DEMANDE','Notion reglementaire de raccordable a la demande. Signifie que la pose du PBO peut se faire sur demande d un OC et selon les conditions specifiques definies par l OI dans son contrat  (Interop:EtatImmeuble)');
INSERT INTO gracethd_commun.l_adresse_etat
    VALUES ('RC','RAD EN COURS DE DEPLOIEMENT','RAD en cours de deploiement : signifie qu une commande de PB a ete transmise par un OC sur une adresse raccordable a la demande. Toutes les adresses connues de la zone arriere du PB passent a cet etat.  (Interop:EtatImmeuble)');
INSERT INTO gracethd_commun.l_adresse_etat
    VALUES ('SI','SIGNE','Une convention a ete signee avec le gestionnaire de l adresse. (Interop:EtatImmeuble)');
INSERT INTO gracethd_commun.l_adresse_etat
    VALUES ('EC','EN COURS DE DEPLOIEMENT','L adresse est en cours de deploiement, sans qu une definition precise de ce terme n ait ete partagee en Interop (Interop:EtatImmeuble)');
INSERT INTO gracethd_commun.l_adresse_etat
    VALUES ('DE','DEPLOYE','Signifie que l adresse est techniquement raccordable en fibre, que le PB est pose et que l adresse est mise a disposition aux operateurs commerciaux. Cet etat correspond a un etat "raccordable" au sens de la réglementation (Interop:EtatImmeuble)');
INSERT INTO gracethd_commun.l_adresse_etat
    VALUES ('AB','ABANDONNE','La commercialisation de l adresse est annulee par l operateur d immeuble, quelqu en soit le motif (deconventionnement, insecurite installateur, fiabilisation des adresses, destruction de l immeuble …). (Interop:EtatImmeuble)');


--l_reference_etat
INSERT INTO gracethd_commun.l_reference_etat
    VALUES ('A','ACTIVE','');
INSERT INTO gracethd_commun.l_reference_etat
    VALUES ('N','NON DISPONIBLE','');


--l_reference_type
INSERT INTO gracethd_commun.l_reference_type
    VALUES ('BA','BAIE','');
INSERT INTO gracethd_commun.l_reference_type
    VALUES ('BP','ELEMENT DE BRANCHEMENT PASSIF','');
INSERT INTO gracethd_commun.l_reference_type
    VALUES ('CA','CABLE','');
INSERT INTO gracethd_commun.l_reference_type
    VALUES ('CS','CASSETTE','');
INSERT INTO gracethd_commun.l_reference_type
    VALUES ('CT','COUPE TYPE','');
INSERT INTO gracethd_commun.l_reference_type
    VALUES ('EQ','EQUIPEMENT','');
INSERT INTO gracethd_commun.l_reference_type
    VALUES ('PT','POINT TECHNIQUE','');
INSERT INTO gracethd_commun.l_reference_type
    VALUES ('ST','SITE','');
INSERT INTO gracethd_commun.l_reference_type
    VALUES ('TI','TIROIR','');

--l_doc_type
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DIG','DOSSIER D INGENIERIE : REGLES D INGENIERIE UTILISEES','Ensemble des regles d ingenierie etablies par la collectivite pour le deploiement du reseau. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('ETU','RAPPORT D ETUDE','Rapport de l etude. Le rapport pourra contenir notamment l index des documents produits dans le cadre de l etude. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('PSI','PLAN DE SITUATION, SYNOPTIQUE GEOGRAPHIQUE','Vue globale du projet, ou d une partie du projet de deploiement. Fond de carte, trace du projet, eventuellement, reperage des plans du projet ou d autres elements selon besoin. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('PPH','PLAN DE PHASAGE','Phasage prevu des deploiements. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('PCB','PLAN DE CABLAGE','Vue d ensemble de l infrastrcuture d accueil et du cablage : fond de carte avec noms et numeros de rues, zone de desserte, cables, points techniques, ebp, … Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('PMQ','PLAN DE MASQUE OU FICHE FOA','Plan des masques de la chambre, position des alveoles, fourreaux et eventuellement câbles');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DPO','DOSSIER APPUIS AERIENS','Documents relatifs a l utilisation d un appui aerien : fiche descriptive, etude de charge, documents pour redressement, renforcement ou remplacement d appui. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('FOT','PHOTO','Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('PGC','PLAN DE GENIE CIVIL','Detail du genie civil, et plus particulierement : fond de plan topographique, cheminement des conduites telecoms, affleurants, cotations, points de mesure, habillage, … Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DLV','DOSSIER DE LEVE OU D INVESTIGATIONS COMPLEMENTAIRES','Documents et fichiers fournis dans le cadre d une prestation de releve topographique, avec ou sans detection (investigations complementaires et/ou releves autres). Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('SGC','DETAIL OU SCHEMA DE GENIE CIVIL','Complement de detail au plan de genie civil. Le plan ou schema de detail est generalement necessaire dans le cas d un forage dirige, d un encorbellement, d une pose en ovoïde… Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DPI','DOSSIER DE PIQUETAGE','Dossier contenant l ensemble des documents relatifs aux operations de piquetage d une infrastructure : rapport, annotations terrain, photos, mesures… Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DBL','DOSSIER DE RELEVE BOITES AUX LETTRES','Dossier contenant l ensemble des documents produits dans le cadre d un releve de boîtes aux lettres. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('KRV','REGLEMENT DE VOIRIE','Copie du règlement de voirie en application au moment du projet. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('CPV','PERMISSION OU AUTORISATION DE VOIRIE','Copie du PLU existant au moment du projet. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DTT','DT EMISES DANS LE CADRE DU PROJET DE DEPLOIEMENT','Modalites techniques de l execution des travaux, autorisation d occuper le domaine public, definition de la redevance annuelle a adresser au gestionnaire de la voirie, zone concernee et duree de validite fixee. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DIT','DICT EMISES DANS LE CADRE DU PROJET DE DEPLOIEMENT','DT emises sous la responsabilite de la MOA (sauf si delegation MOE) : formulaire Cerfa envoye aux differents exploitants de reseaux dans la zone des travaux, compilation des reponses et suivi. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DAM','DIAGNOSTIC AMIANTE ENROBE','DICT emises sous la responsabilite de l entreprise de travaux :  formulaire Cerfa envoye aux differents exploitants de reseaux dans la zone des travaux, compilation des reponses et suivi. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('CIN','CONTRAT OU CONVENTION DE LOCATION/CESSION/ACHAT/OCCUPATION D INFRASTRUCTURE','Localisation des points de sondage, resultat des carottages et analyses. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('CMU','CONTRAT OU CONVENTION DE CO-CONSTRUCTION OU MUTUALISATION DE TRAVAUX','Diagnostic Technique Amiante pour un immeuble. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DIP','DOSSIER D IMPLANTATION (SRO, NRO, BPI…)','Conditions, redevance eventuelle, zone concernee, description des infrastrutures concernees, duree de validite… Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('SOP','SYNOPTIQUE OPTIQUE','Dossier contenant l ensemble des documents relatifs a la commande (fichiers de commande, suivi des echanges, bon de reception, etc .). Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('SBP','PLAN DE BOITE, OU AUTRE ELEMENT DE BRANCHEMENT PASSIF','Mutualisation de travaux dans le cadre de la L49 (loi Pintat). Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('SRA','SCHEMA DE RACCORDEMENT (BAIE, ARMOIRE, REPARTITEUR…)','Dossier contenant toutes les informations techniques relatives a la construction, a l adduction et au cablage d un site (zone privative y compris l eventuel deploiement d infrastructures intra-site et les BPE attenantes). Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('KEQ','DOCUMENTATION TECHNIQUE D EQUIPEMENT','Dossier contenant toutes les informations techniques relatives  au deploiement, a l adduction et au cablage d un site (zone privative y compris l eventuel deploiement d infrastructures intra-site et les BPE attenantes). Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('CIM','CONVENTION THD IMMEUBLE','Contient toutes les informations techniques, plans d amenagement, schemas, PV et consuel, photos… relatifs  a l implantation du site (voie publique). Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('CIS','CONVENTION CADRE BAILLEUR SOCIAL','Vue logique des aligements de fibres. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('CDS','REGLEMENT DE SERVICE','Organisation de la boîte, des arrivees de câbles, des loves, des cassettes et de la connectique. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('COC','AUTRE CONVENTION D OCCUPATION EMPRISE PRIVEE','Organisation de la connectique a l interieur d une baie, d une armoire ou d un repartiteur. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('MRF','MESURE DE REFLECTOMETRIE','Fiche technique et specifications techniques d un equipement. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('MFX','TEST D ETANCHEITE DE FOURREAUX ET/OU TESTS DE MANDRINAGE, AIGUILLAGE','Voir modele propose par l ARCEP. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('RGC','PV DE RECEPTION GENIE CIVIL','Voir modele propose par l ARCEP. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DIF','DOSSIER INFRASTRUCTURE D ACCUEIL','Reglement signe par les occupants d un immeuble raccorde au FTTH, pour clarifier les regles de bon usage visant la non degradation des equipements poses par la collectivite. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DCB','DOSSIER DE CABLAGE','Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DOP','DOSSIER OPTIQUE','Courbes et donnees brutes. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DPR','DOSSIER DE PROJET','Fiches de tests. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DLG','DOSSIER DE LIVRABLES GRACETHD','Proces verbal de reception pour les travaux de genie civil. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DCI','DOSSIER DE COMMANDE POUR LOCATION/OCCUPATION D INFRASTRUCTURE','Proces verbal de reception de voirie delivre par le gestionnaire de la voirie, vaut acceptation des travaux par le gestionnaire. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DCS','DOSSIER DE CREATION DE SITE','Fiche de recette pour la reception de travaux quels qu ils soient. La fiche de recette peut inclure des resultats de tests, des fichiers ou des informations complementaires. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DRS','DOSSIER DE RACCORDEMENT DE SITE','Dossier contenant un ensemble de documents relatifs a une infrastructure d accueil. Ce dossier n est pas un type de document a proprement parler, mais un conteneur d une multiplicite de documents. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('KPL','PLAN LOCAL D URBANISME','Dossier contenant un ensemble de documents relatifs au câblage d une infrastructure. Ce dossier n est pas un type de document a proprement parler, mais un conteneur d une multiplicite de documents. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('RFR','FICHE DE RECETTE','Dossier contenant un ensemble de documents relatifs au raccordement d une infrastructure. Ce dossier n est pas un type de document a proprement parler, mais un conteneur d une multiplicite de documents. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('RVR','PV DE RECEPTION DE VOIRIE','Dossier contenant un ensemble de documents relatifs au projet de deploiement. Ce dossier n est pas un type de document a proprement parler, mais un conteneur d une multiplicite de documents. Voir GraceTHD-MOD.');
INSERT INTO gracethd_commun.l_doc_type
     VALUES ('DTA','DIAGNOSTIC TECHNIQUE AMIANTE POUR UN IMMEUBLE','Dossier contenant un ensemble de livrables GraceTHD. Les livrables doivent eux-meme etre nommes et crees selon les exigences du Geostandard ANT. Voir GraceTHD-MOD.');

--l_doc_tab
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('CB','CABLE','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('CD','CONDUITE','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('BP','ELEMENT BRANCHEMENT PASSIF','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('MQ','MASQUE','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('ND','NOEUD','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('PT','POINT TECHNIQUE','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('ST','SITE TECHNIQUE','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('SF','SITE UTILISATEUR FINAL','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('LT','LOCAL TECHNIQUE','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('AD','ADRESSE','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('BA','BAIE','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('CS','CASSETTE','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('EQ','EQUIPEMENT','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('TI','TIROIR','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('OR','ORGANISME','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('ZN','ZONE DE NRO','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('ZD','ZONE DE DEPLOIEMENT','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('ZS','ZONE DE SRO','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('RF','REFERENCE','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('RT','ROUTE OPTIQUE','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('CM','CHEMINEMENT','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('FO','FIBRE','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('PS','POSITION','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('SE','SITE EMISSION','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('LV','LOVE','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('ZP','ZONE ARRIERE DE PBO','');
INSERT INTO gracethd_commun.l_doc_tab
     VALUES ('ZC','ZONE COAX','');


-- l_implantation
INSERT INTO gracethd_commun.l_implantation
     VALUES ('0','AERIEN TELECOM','');
INSERT INTO gracethd_commun.l_implantation
     VALUES ('1','AERIEN ENERGIE','');
INSERT INTO gracethd_commun.l_implantation
     VALUES ('2','FACADE','');
INSERT INTO gracethd_commun.l_implantation
     VALUES ('3','IMMEUBLE','');
INSERT INTO gracethd_commun.l_implantation
     VALUES ('4','PLEINE TERRE','');
INSERT INTO gracethd_commun.l_implantation
     VALUES ('5','CANIVEAU','');
INSERT INTO gracethd_commun.l_implantation
     VALUES ('6','GALERIE','');
INSERT INTO gracethd_commun.l_implantation
     VALUES ('7','CONDUITE','');
INSERT INTO gracethd_commun.l_implantation
     VALUES ('8','EGOUT','');
INSERT INTO gracethd_commun.l_implantation
     VALUES ('9','SPECIFIQUE','');


-- l_immeuble
INSERT INTO gracethd_commun.l_immeuble
     VALUES ('P','PAVILLON','');
INSERT INTO gracethd_commun.l_immeuble
     VALUES ('I','IMMEUBLE','');


--l_zone_densite
INSERT INTO gracethd_commun.l_zone_densite
     VALUES ('1','ZTD HAUTE DENSITE','(Interop:TypeZone)');
INSERT INTO gracethd_commun.l_zone_densite
     VALUES ('2','ZTD BASSE DENSITE','(Interop:TypeZone)');
INSERT INTO gracethd_commun.l_zone_densite
     VALUES ('3','ZMD','(Interop:TypeZone)');

--l_geoloc_mode
INSERT INTO gracethd_commun.l_geoloc_mode
     VALUES ('LTRO','LEVE DURANT LA POSE','Objet positionne grace à un leve durant la phase travaux. Dans le cas de tranchee, ce leve a ete realise tranchee ouverte.');
INSERT INTO gracethd_commun.l_geoloc_mode
     VALUES ('LVIS','LEVE APRES LA POSE','Objet positionne grace a un leve. Dans le cas d une tranchee, uniquement les elements visibles ont ete leves (rustines sur le revetement, chambres encadrantes). Des cotations prises pendant la pose ont permis de completer ce lever.');
INSERT INTO gracethd_commun.l_geoloc_mode
     VALUES ('DETC','LEVE AVEC DETECTION','Un appareil de detection a ete utilise pour positionner les elements à lever.');
INSERT INTO gracethd_commun.l_geoloc_mode
     VALUES ('FDPL','COTATION PAR RAPPORT A UN LEVE DE GEOMETRE','Objet implante en reportant des cotations prises par rapport à un fond de plan precedemment leve.');
INSERT INTO gracethd_commun.l_geoloc_mode
     VALUES ('CBDU','COTATION PAR RAPPORT A UN FOND DE PLAN TIERS TYPE BDU','Objet implante en reportant des cotations prises par rapport au meilleur fond de plan actuellement disponible.');
INSERT INTO gracethd_commun.l_geoloc_mode
     VALUES ('CADA','POSITIONNEMENT SUR CADASTRE','Objet positionne par rapport aux planches cadastrales.');
INSERT INTO gracethd_commun.l_geoloc_mode
     VALUES ('ORTO','POSITIONNEMENT SUR ORTHOPHOTOGRAPHIE OU FOND DE PLAN CARTOGRAPHIQUE','Objet positionne par rapport à des orthophotos, ou des fonds cartographiques type RGE, FRANCE RASTER, OSM ou Bing');
INSERT INTO gracethd_commun.l_geoloc_mode
     VALUES ('INDT','INDETERMINE','');

-- l_bool
INSERT INTO gracethd_commun.l_bool
     VALUES ('0','FAUX','');
INSERT INTO gracethd_commun.l_bool
     VALUES ('1','VRAI','');


DROP INDEX IF EXISTS od_do_code_idx; CREATE INDEX  od_do_code_idx ON t_docobj(od_do_code);
DROP INDEX IF EXISTS em_do_code_idx; CREATE INDEX  em_do_code_idx ON t_empreinte(em_do_code);
DROP INDEX IF EXISTS or_ad_code_idx; CREATE INDEX  or_ad_code_idx ON t_organisme(or_ad_code);
DROP INDEX IF EXISTS ad_prop_idx; CREATE INDEX  ad_prop_idx ON t_adresse(ad_prop);
DROP INDEX IF EXISTS rf_fabric_idx; CREATE INDEX  rf_fabric_idx ON t_reference(rf_fabric);
DROP INDEX IF EXISTS ad_gest_idx; CREATE INDEX  ad_gest_idx ON t_adresse(ad_gest);


