--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-1.pgdg22.04+2)
-- Dumped by pg_dump version 17.0 (Ubuntu 17.0-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: abouts; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.abouts (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.abouts OWNER TO strapiadmin;

--
-- Name: abouts_cmps; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.abouts_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.abouts_cmps OWNER TO strapiadmin;

--
-- Name: abouts_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.abouts_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.abouts_cmps_id_seq OWNER TO strapiadmin;

--
-- Name: abouts_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.abouts_cmps_id_seq OWNED BY public.abouts_cmps.id;


--
-- Name: abouts_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.abouts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.abouts_id_seq OWNER TO strapiadmin;

--
-- Name: abouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.abouts_id_seq OWNED BY public.abouts.id;


--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_permissions OWNER TO strapiadmin;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_id_seq OWNER TO strapiadmin;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_lnk; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.admin_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


ALTER TABLE public.admin_permissions_role_lnk OWNER TO strapiadmin;

--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.admin_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNER TO strapiadmin;

--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNED BY public.admin_permissions_role_lnk.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_roles OWNER TO strapiadmin;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_roles_id_seq OWNER TO strapiadmin;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    document_id character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_users OWNER TO strapiadmin;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_id_seq OWNER TO strapiadmin;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_lnk; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.admin_users_roles_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_ord double precision,
    user_ord double precision
);


ALTER TABLE public.admin_users_roles_lnk OWNER TO strapiadmin;

--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.admin_users_roles_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNER TO strapiadmin;

--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNED BY public.admin_users_roles_lnk.id;


--
-- Name: components_shared_json_rich_texts; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.components_shared_json_rich_texts (
    id integer NOT NULL,
    text jsonb
);


ALTER TABLE public.components_shared_json_rich_texts OWNER TO strapiadmin;

--
-- Name: components_shared_json_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.components_shared_json_rich_texts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_shared_json_rich_texts_id_seq OWNER TO strapiadmin;

--
-- Name: components_shared_json_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.components_shared_json_rich_texts_id_seq OWNED BY public.components_shared_json_rich_texts.id;


--
-- Name: components_shared_media; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.components_shared_media (
    id integer NOT NULL
);


ALTER TABLE public.components_shared_media OWNER TO strapiadmin;

--
-- Name: components_shared_media_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.components_shared_media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_shared_media_id_seq OWNER TO strapiadmin;

--
-- Name: components_shared_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.components_shared_media_id_seq OWNED BY public.components_shared_media.id;


--
-- Name: components_shared_quotes; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.components_shared_quotes (
    id integer NOT NULL,
    title character varying(255),
    body text
);


ALTER TABLE public.components_shared_quotes OWNER TO strapiadmin;

--
-- Name: components_shared_quotes_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.components_shared_quotes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_shared_quotes_id_seq OWNER TO strapiadmin;

--
-- Name: components_shared_quotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.components_shared_quotes_id_seq OWNED BY public.components_shared_quotes.id;


--
-- Name: components_shared_rich_texts; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.components_shared_rich_texts (
    id integer NOT NULL,
    body text
);


ALTER TABLE public.components_shared_rich_texts OWNER TO strapiadmin;

--
-- Name: components_shared_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.components_shared_rich_texts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_shared_rich_texts_id_seq OWNER TO strapiadmin;

--
-- Name: components_shared_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.components_shared_rich_texts_id_seq OWNED BY public.components_shared_rich_texts.id;


--
-- Name: components_shared_seos; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.components_shared_seos (
    id integer NOT NULL,
    meta_title character varying(255),
    meta_description text
);


ALTER TABLE public.components_shared_seos OWNER TO strapiadmin;

--
-- Name: components_shared_seos_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.components_shared_seos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_shared_seos_id_seq OWNER TO strapiadmin;

--
-- Name: components_shared_seos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.components_shared_seos_id_seq OWNED BY public.components_shared_seos.id;


--
-- Name: components_shared_sliders; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.components_shared_sliders (
    id integer NOT NULL
);


ALTER TABLE public.components_shared_sliders OWNER TO strapiadmin;

--
-- Name: components_shared_sliders_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.components_shared_sliders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_shared_sliders_id_seq OWNER TO strapiadmin;

--
-- Name: components_shared_sliders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.components_shared_sliders_id_seq OWNED BY public.components_shared_sliders.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.files (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.files OWNER TO strapiadmin;

--
-- Name: files_folder_lnk; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.files_folder_lnk (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_ord double precision
);


ALTER TABLE public.files_folder_lnk OWNER TO strapiadmin;

--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.files_folder_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_folder_lnk_id_seq OWNER TO strapiadmin;

--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.files_folder_lnk_id_seq OWNED BY public.files_folder_lnk.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_id_seq OWNER TO strapiadmin;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_mph; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.files_related_mph (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.files_related_mph OWNER TO strapiadmin;

--
-- Name: files_related_mph_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.files_related_mph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_related_mph_id_seq OWNER TO strapiadmin;

--
-- Name: files_related_mph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.files_related_mph_id_seq OWNED BY public.files_related_mph.id;


--
-- Name: globals; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.globals (
    id integer NOT NULL,
    document_id character varying(255),
    site_name character varying(255),
    site_description text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.globals OWNER TO strapiadmin;

--
-- Name: globals_cmps; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.globals_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.globals_cmps OWNER TO strapiadmin;

--
-- Name: globals_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.globals_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.globals_cmps_id_seq OWNER TO strapiadmin;

--
-- Name: globals_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.globals_cmps_id_seq OWNED BY public.globals_cmps.id;


--
-- Name: globals_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.globals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.globals_id_seq OWNER TO strapiadmin;

--
-- Name: globals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.globals_id_seq OWNED BY public.globals.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.i18n_locale OWNER TO strapiadmin;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i18n_locale_id_seq OWNER TO strapiadmin;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: jobposts; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.jobposts (
    id integer NOT NULL,
    document_id character varying(255),
    "position" character varying(255),
    requirements text,
    contactemail character varying(255),
    date text,
    note text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    description text
);


ALTER TABLE public.jobposts OWNER TO strapiadmin;

--
-- Name: jobposts_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.jobposts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobposts_id_seq OWNER TO strapiadmin;

--
-- Name: jobposts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.jobposts_id_seq OWNED BY public.jobposts.id;


--
-- Name: landings; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.landings (
    id integer NOT NULL,
    document_id character varying(255),
    tagline character varying(255),
    videolink character varying(255),
    videocaption character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    intro jsonb
);


ALTER TABLE public.landings OWNER TO strapiadmin;

--
-- Name: landings_cmps; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.landings_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.landings_cmps OWNER TO strapiadmin;

--
-- Name: landings_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.landings_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.landings_cmps_id_seq OWNER TO strapiadmin;

--
-- Name: landings_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.landings_cmps_id_seq OWNED BY public.landings_cmps.id;


--
-- Name: landings_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.landings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.landings_id_seq OWNER TO strapiadmin;

--
-- Name: landings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.landings_id_seq OWNED BY public.landings.id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.members (
    id integer NOT NULL,
    document_id character varying(255),
    firstname character varying(255),
    lastnames character varying(255),
    github character varying(255),
    linkedin character varying(255),
    bio character varying(255),
    email character varying(255),
    "position" character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    alum boolean
);


ALTER TABLE public.members OWNER TO strapiadmin;

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_id_seq OWNER TO strapiadmin;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    about jsonb,
    videolink character varying(255),
    date date,
    tagline character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.projects OWNER TO strapiadmin;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_id_seq OWNER TO strapiadmin;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: projects_members_lnk; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.projects_members_lnk (
    id integer NOT NULL,
    project_id integer,
    member_id integer,
    member_ord double precision
);


ALTER TABLE public.projects_members_lnk OWNER TO strapiadmin;

--
-- Name: projects_members_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.projects_members_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_members_lnk_id_seq OWNER TO strapiadmin;

--
-- Name: projects_members_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.projects_members_lnk_id_seq OWNED BY public.projects_members_lnk.id;


--
-- Name: projects_publications_lnk; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.projects_publications_lnk (
    id integer NOT NULL,
    project_id integer,
    publication_id integer,
    publication_ord double precision,
    project_ord double precision
);


ALTER TABLE public.projects_publications_lnk OWNER TO strapiadmin;

--
-- Name: projects_publications_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.projects_publications_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_publications_lnk_id_seq OWNER TO strapiadmin;

--
-- Name: projects_publications_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.projects_publications_lnk_id_seq OWNED BY public.projects_publications_lnk.id;


--
-- Name: publications; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.publications (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    pdflink character varying(255),
    paperlink character varying(255),
    authors character varying(255),
    date date,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    abstract text
);


ALTER TABLE public.publications OWNER TO strapiadmin;

--
-- Name: publications_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.publications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.publications_id_seq OWNER TO strapiadmin;

--
-- Name: publications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.publications_id_seq OWNED BY public.publications.id;


--
-- Name: publications_members_lnk; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.publications_members_lnk (
    id integer NOT NULL,
    publication_id integer,
    member_id integer,
    member_ord double precision
);


ALTER TABLE public.publications_members_lnk OWNER TO strapiadmin;

--
-- Name: publications_members_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.publications_members_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.publications_members_lnk_id_seq OWNER TO strapiadmin;

--
-- Name: publications_members_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.publications_members_lnk_id_seq OWNED BY public.publications_members_lnk.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO strapiadmin;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_api_token_permissions_token_lnk (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_ord double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_lnk OWNER TO strapiadmin;

--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNED BY public.strapi_api_token_permissions_token_lnk.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_api_tokens OWNER TO strapiadmin;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO strapiadmin;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO strapiadmin;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_database_schema_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_history_versions; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_history_versions (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255),
    locale character varying(255),
    status character varying(255),
    data jsonb,
    schema jsonb,
    created_at timestamp(6) without time zone,
    created_by_id integer
);


ALTER TABLE public.strapi_history_versions OWNER TO strapiadmin;

--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_history_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_history_versions_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_history_versions_id_seq OWNED BY public.strapi_history_versions.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO strapiadmin;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_migrations_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_migrations_internal; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_migrations_internal (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations_internal OWNER TO strapiadmin;

--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_migrations_internal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNED BY public.strapi_migrations_internal.id;


--
-- Name: strapi_release_actions; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_release_actions (
    id integer NOT NULL,
    document_id character varying(255),
    type character varying(255),
    content_type character varying(255),
    entry_document_id character varying(255),
    locale character varying(255),
    is_entry_valid boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_release_actions OWNER TO strapiadmin;

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_release_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_release_actions_id_seq OWNED BY public.strapi_release_actions.id;


--
-- Name: strapi_release_actions_release_lnk; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_release_actions_release_lnk (
    id integer NOT NULL,
    release_action_id integer,
    release_id integer,
    release_action_ord double precision
);


ALTER TABLE public.strapi_release_actions_release_lnk OWNER TO strapiadmin;

--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_release_actions_release_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNED BY public.strapi_release_actions_release_lnk.id;


--
-- Name: strapi_releases; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_releases (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    released_at timestamp(6) without time zone,
    scheduled_at timestamp(6) without time zone,
    timezone character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_releases OWNER TO strapiadmin;

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_releases_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_releases_id_seq OWNED BY public.strapi_releases.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO strapiadmin;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_transfer_token_permissions_token_lnk (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_ord double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_lnk OWNER TO strapiadmin;

--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNED BY public.strapi_transfer_token_permissions_token_lnk.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO strapiadmin;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO strapiadmin;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_webhooks_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: strapi_workflows; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_workflows (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    content_types jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_workflows OWNER TO strapiadmin;

--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_workflows_id_seq OWNED BY public.strapi_workflows.id;


--
-- Name: strapi_workflows_stages; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_workflows_stages (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_workflows_stages OWNER TO strapiadmin;

--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_workflows_stages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNED BY public.strapi_workflows_stages.id;


--
-- Name: strapi_workflows_stages_permissions_lnk; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_workflows_stages_permissions_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    permission_id integer,
    permission_ord double precision
);


ALTER TABLE public.strapi_workflows_stages_permissions_lnk OWNER TO strapiadmin;

--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNED BY public.strapi_workflows_stages_permissions_lnk.id;


--
-- Name: strapi_workflows_stages_workflow_lnk; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.strapi_workflows_stages_workflow_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    workflow_id integer,
    workflow_stage_ord double precision
);


ALTER TABLE public.strapi_workflows_stages_workflow_lnk OWNER TO strapiadmin;

--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNER TO strapiadmin;

--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNED BY public.strapi_workflows_stages_workflow_lnk.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_permissions OWNER TO strapiadmin;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_id_seq OWNER TO strapiadmin;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_lnk; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.up_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


ALTER TABLE public.up_permissions_role_lnk OWNER TO strapiadmin;

--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.up_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNER TO strapiadmin;

--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNED BY public.up_permissions_role_lnk.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_roles OWNER TO strapiadmin;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_roles_id_seq OWNER TO strapiadmin;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    document_id character varying(255),
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_users OWNER TO strapiadmin;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_id_seq OWNER TO strapiadmin;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_lnk; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.up_users_role_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_ord double precision
);


ALTER TABLE public.up_users_role_lnk OWNER TO strapiadmin;

--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.up_users_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNER TO strapiadmin;

--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNED BY public.up_users_role_lnk.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.upload_folders OWNER TO strapiadmin;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_id_seq OWNER TO strapiadmin;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_lnk; Type: TABLE; Schema: public; Owner: strapiadmin
--

CREATE TABLE public.upload_folders_parent_lnk (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_ord double precision
);


ALTER TABLE public.upload_folders_parent_lnk OWNER TO strapiadmin;

--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: strapiadmin
--

CREATE SEQUENCE public.upload_folders_parent_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNER TO strapiadmin;

--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapiadmin
--

ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNED BY public.upload_folders_parent_lnk.id;


--
-- Name: abouts id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.abouts ALTER COLUMN id SET DEFAULT nextval('public.abouts_id_seq'::regclass);


--
-- Name: abouts_cmps id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.abouts_cmps ALTER COLUMN id SET DEFAULT nextval('public.abouts_cmps_id_seq'::regclass);


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_lnk_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_lnk id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_users_roles_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_lnk_id_seq'::regclass);


--
-- Name: components_shared_json_rich_texts id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.components_shared_json_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.components_shared_json_rich_texts_id_seq'::regclass);


--
-- Name: components_shared_media id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.components_shared_media ALTER COLUMN id SET DEFAULT nextval('public.components_shared_media_id_seq'::regclass);


--
-- Name: components_shared_quotes id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.components_shared_quotes ALTER COLUMN id SET DEFAULT nextval('public.components_shared_quotes_id_seq'::regclass);


--
-- Name: components_shared_rich_texts id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.components_shared_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.components_shared_rich_texts_id_seq'::regclass);


--
-- Name: components_shared_seos id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.components_shared_seos ALTER COLUMN id SET DEFAULT nextval('public.components_shared_seos_id_seq'::regclass);


--
-- Name: components_shared_sliders id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.components_shared_sliders ALTER COLUMN id SET DEFAULT nextval('public.components_shared_sliders_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_lnk id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.files_folder_lnk ALTER COLUMN id SET DEFAULT nextval('public.files_folder_lnk_id_seq'::regclass);


--
-- Name: files_related_mph id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.files_related_mph ALTER COLUMN id SET DEFAULT nextval('public.files_related_mph_id_seq'::regclass);


--
-- Name: globals id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.globals ALTER COLUMN id SET DEFAULT nextval('public.globals_id_seq'::regclass);


--
-- Name: globals_cmps id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.globals_cmps ALTER COLUMN id SET DEFAULT nextval('public.globals_cmps_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: jobposts id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.jobposts ALTER COLUMN id SET DEFAULT nextval('public.jobposts_id_seq'::regclass);


--
-- Name: landings id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.landings ALTER COLUMN id SET DEFAULT nextval('public.landings_id_seq'::regclass);


--
-- Name: landings_cmps id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.landings_cmps ALTER COLUMN id SET DEFAULT nextval('public.landings_cmps_id_seq'::regclass);


--
-- Name: members id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: projects_members_lnk id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.projects_members_lnk ALTER COLUMN id SET DEFAULT nextval('public.projects_members_lnk_id_seq'::regclass);


--
-- Name: projects_publications_lnk id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.projects_publications_lnk ALTER COLUMN id SET DEFAULT nextval('public.projects_publications_lnk_id_seq'::regclass);


--
-- Name: publications id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.publications ALTER COLUMN id SET DEFAULT nextval('public.publications_id_seq'::regclass);


--
-- Name: publications_members_lnk id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.publications_members_lnk ALTER COLUMN id SET DEFAULT nextval('public.publications_members_lnk_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_history_versions id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_history_versions ALTER COLUMN id SET DEFAULT nextval('public.strapi_history_versions_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_migrations_internal id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_migrations_internal ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_internal_id_seq'::regclass);


--
-- Name: strapi_release_actions id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_release_actions ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_id_seq'::regclass);


--
-- Name: strapi_release_actions_release_lnk id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_release_lnk_id_seq'::regclass);


--
-- Name: strapi_releases id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_releases ALTER COLUMN id SET DEFAULT nextval('public.strapi_releases_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: strapi_workflows id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_id_seq'::regclass);


--
-- Name: strapi_workflows_stages id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows_stages ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_permissions_lnk id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_permissions_lnk_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_workflow_lnk id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_workflow_lnk_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_lnk_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_lnk id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_users_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_lnk_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_lnk id; Type: DEFAULT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.upload_folders_parent_lnk ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_lnk_id_seq'::regclass);


--
-- Data for Name: abouts; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.abouts (id, document_id, title, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	td5j3ckq8m70aadea4grg5bx	\N	2024-11-16 11:31:44.684	2024-11-16 11:32:02.332	2024-11-16 11:32:02.322	1	1	\N
\.


--
-- Data for Name: abouts_cmps; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.abouts_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.admin_permissions (id, document_id, action, action_parameters, subject, properties, conditions, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	jtgyugnq4fi46pdrbp4c004d	plugin::content-manager.explorer.create	{}	api::about.about	{"fields": ["title", "blocks"]}	[]	2024-10-31 17:20:33.502	2024-10-31 17:20:33.502	2024-10-31 17:20:33.503	\N	\N	\N
2	dqsl46t6xkgehny8w2bzizzd	plugin::content-manager.explorer.create	{}	api::global.global	{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}	[]	2024-10-31 17:20:33.519	2024-10-31 17:20:33.519	2024-10-31 17:20:33.52	\N	\N	\N
5	p5fhbolr8m2e770o23ux8cwf	plugin::content-manager.explorer.create	{}	api::member.member	{"fields": ["firstname", "lastnames", "github", "linkedin", "bio", "email", "profilepic", "position"]}	[]	2024-10-31 17:20:33.534	2024-10-31 17:20:33.534	2024-10-31 17:20:33.534	\N	\N	\N
6	drg2erpi9aj19vwi9rbv3sex	plugin::content-manager.explorer.create	{}	api::project.project	{"fields": ["name", "banner", "gallery", "about", "members", "videolink", "date", "tagline", "publications"]}	[]	2024-10-31 17:20:33.543	2024-10-31 17:20:33.543	2024-10-31 17:20:33.543	\N	\N	\N
7	g9gyz98gx23nffurek3e5qva	plugin::content-manager.explorer.create	{}	api::publication.publication	{"fields": ["name", "pdflink", "paperlink", "authors", "members", "date", "projects"]}	[]	2024-10-31 17:20:33.547	2024-10-31 17:20:33.547	2024-10-31 17:20:33.547	\N	\N	\N
8	l1teyvzdb4myweirlnoky9mc	plugin::content-manager.explorer.read	{}	api::about.about	{"fields": ["title", "blocks"]}	[]	2024-10-31 17:20:33.551	2024-10-31 17:20:33.551	2024-10-31 17:20:33.551	\N	\N	\N
9	rmtllt91fxx98186f8melzy5	plugin::content-manager.explorer.read	{}	api::global.global	{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}	[]	2024-10-31 17:20:33.555	2024-10-31 17:20:33.555	2024-10-31 17:20:33.555	\N	\N	\N
12	zdbsvniyfzm3lfvobu81q50g	plugin::content-manager.explorer.read	{}	api::member.member	{"fields": ["firstname", "lastnames", "github", "linkedin", "bio", "email", "profilepic", "position"]}	[]	2024-10-31 17:20:33.571	2024-10-31 17:20:33.571	2024-10-31 17:20:33.571	\N	\N	\N
13	m50kx01ioeqa33vhu2n35j1e	plugin::content-manager.explorer.read	{}	api::project.project	{"fields": ["name", "banner", "gallery", "about", "members", "videolink", "date", "tagline", "publications"]}	[]	2024-10-31 17:20:33.575	2024-10-31 17:20:33.575	2024-10-31 17:20:33.575	\N	\N	\N
14	n540kd87o167ci1jja2dnqb5	plugin::content-manager.explorer.read	{}	api::publication.publication	{"fields": ["name", "pdflink", "paperlink", "authors", "members", "date", "projects"]}	[]	2024-10-31 17:20:33.579	2024-10-31 17:20:33.579	2024-10-31 17:20:33.579	\N	\N	\N
15	bgtxjuifzqgbqlnh4c1q0lex	plugin::content-manager.explorer.update	{}	api::about.about	{"fields": ["title", "blocks"]}	[]	2024-10-31 17:20:33.583	2024-10-31 17:20:33.583	2024-10-31 17:20:33.583	\N	\N	\N
16	n1rstolnawi5dxttsk1sssm0	plugin::content-manager.explorer.update	{}	api::global.global	{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}	[]	2024-10-31 17:20:33.587	2024-10-31 17:20:33.587	2024-10-31 17:20:33.587	\N	\N	\N
19	jrg9cvgmah2ow4g22ulyvd7a	plugin::content-manager.explorer.update	{}	api::member.member	{"fields": ["firstname", "lastnames", "github", "linkedin", "bio", "email", "profilepic", "position"]}	[]	2024-10-31 17:20:33.599	2024-10-31 17:20:33.599	2024-10-31 17:20:33.599	\N	\N	\N
20	wme63kdpu87n7zkfs1e3u5oe	plugin::content-manager.explorer.update	{}	api::project.project	{"fields": ["name", "banner", "gallery", "about", "members", "videolink", "date", "tagline", "publications"]}	[]	2024-10-31 17:20:33.603	2024-10-31 17:20:33.603	2024-10-31 17:20:33.603	\N	\N	\N
21	lbcoem0vr8wr44tzw8xue80c	plugin::content-manager.explorer.update	{}	api::publication.publication	{"fields": ["name", "pdflink", "paperlink", "authors", "members", "date", "projects"]}	[]	2024-10-31 17:20:33.608	2024-10-31 17:20:33.608	2024-10-31 17:20:33.608	\N	\N	\N
22	jx0frr3kdmmoc3wgra6h6lru	plugin::content-manager.explorer.delete	{}	api::about.about	{}	[]	2024-10-31 17:20:33.612	2024-10-31 17:20:33.612	2024-10-31 17:20:33.612	\N	\N	\N
23	cppghgr4p10pfr2aog5r942m	plugin::content-manager.explorer.delete	{}	api::global.global	{}	[]	2024-10-31 17:20:33.616	2024-10-31 17:20:33.616	2024-10-31 17:20:33.616	\N	\N	\N
24	dhxs574rebot5u6r1mj0ermv	plugin::content-manager.explorer.delete	{}	api::jobpost.jobpost	{}	[]	2024-10-31 17:20:33.62	2024-10-31 17:20:33.62	2024-10-31 17:20:33.62	\N	\N	\N
25	k7lqasa0lqpp0re4yxgttb0m	plugin::content-manager.explorer.delete	{}	api::landing.landing	{}	[]	2024-10-31 17:20:33.625	2024-10-31 17:20:33.625	2024-10-31 17:20:33.625	\N	\N	\N
26	hltn48nqsr7cpua4qmjjnwvb	plugin::content-manager.explorer.delete	{}	api::member.member	{}	[]	2024-10-31 17:20:33.629	2024-10-31 17:20:33.629	2024-10-31 17:20:33.629	\N	\N	\N
27	cdk6qkw3rwzosj0kmwidj1el	plugin::content-manager.explorer.delete	{}	api::project.project	{}	[]	2024-10-31 17:20:33.633	2024-10-31 17:20:33.633	2024-10-31 17:20:33.633	\N	\N	\N
28	d2gsadiwfddzrhzfg0cptwqe	plugin::content-manager.explorer.delete	{}	api::publication.publication	{}	[]	2024-10-31 17:20:33.636	2024-10-31 17:20:33.636	2024-10-31 17:20:33.636	\N	\N	\N
29	eqbw8z51348cnfier7okrpoa	plugin::content-manager.explorer.publish	{}	api::about.about	{}	[]	2024-10-31 17:20:33.64	2024-10-31 17:20:33.64	2024-10-31 17:20:33.64	\N	\N	\N
30	urkpoi8higf053z7a0xtck29	plugin::content-manager.explorer.publish	{}	api::global.global	{}	[]	2024-10-31 17:20:33.644	2024-10-31 17:20:33.644	2024-10-31 17:20:33.644	\N	\N	\N
31	mwg2de7i5ex3nn76b4mojjxn	plugin::content-manager.explorer.publish	{}	api::jobpost.jobpost	{}	[]	2024-10-31 17:20:33.647	2024-10-31 17:20:33.647	2024-10-31 17:20:33.647	\N	\N	\N
32	a4kiney2rygtuzs7s5ury1jm	plugin::content-manager.explorer.publish	{}	api::landing.landing	{}	[]	2024-10-31 17:20:33.651	2024-10-31 17:20:33.651	2024-10-31 17:20:33.651	\N	\N	\N
33	otfrcuzefs3epgg2p3ysvdkb	plugin::content-manager.explorer.publish	{}	api::member.member	{}	[]	2024-10-31 17:20:33.654	2024-10-31 17:20:33.654	2024-10-31 17:20:33.654	\N	\N	\N
34	gk5dgpnvq6m12kiobtihfl4i	plugin::content-manager.explorer.publish	{}	api::project.project	{}	[]	2024-10-31 17:20:33.658	2024-10-31 17:20:33.658	2024-10-31 17:20:33.658	\N	\N	\N
35	ch9qgbc5ruxv2jjq41jclfsn	plugin::content-manager.explorer.publish	{}	api::publication.publication	{}	[]	2024-10-31 17:20:33.661	2024-10-31 17:20:33.661	2024-10-31 17:20:33.661	\N	\N	\N
18	lhz9wn0vgjmmi0ui150cmscz	plugin::content-manager.explorer.update	{}	api::landing.landing	{"fields": ["tagline", "videolink", "customarea", "banner", "videocaption"]}	[]	2024-10-31 17:20:33.595	2024-11-14 00:37:02.944	2024-10-31 17:20:33.595	\N	\N	\N
11	exs66dnmodkr3pmfp5p1y1fg	plugin::content-manager.explorer.read	{}	api::landing.landing	{"fields": ["tagline", "videolink", "customarea", "banner", "videocaption"]}	[]	2024-10-31 17:20:33.562	2024-11-14 00:37:02.944	2024-10-31 17:20:33.562	\N	\N	\N
3	wzp9bry7qq765bfsqs0ixa19	plugin::content-manager.explorer.create	{}	api::jobpost.jobpost	{"fields": ["position", "contactemail", "date", "note", "requirements"]}	[]	2024-10-31 17:20:33.525	2024-11-14 01:51:24.025	2024-10-31 17:20:33.525	\N	\N	\N
10	x9wl733dq1y135v2av2l19ay	plugin::content-manager.explorer.read	{}	api::jobpost.jobpost	{"fields": ["position", "contactemail", "date", "note", "requirements"]}	[]	2024-10-31 17:20:33.559	2024-11-14 01:51:24.025	2024-10-31 17:20:33.559	\N	\N	\N
36	o5q6vvd7kncai2enzahqzneu	plugin::upload.read	{}	\N	{}	[]	2024-10-31 17:20:33.665	2024-10-31 17:20:33.665	2024-10-31 17:20:33.665	\N	\N	\N
37	ui61bm75egsr015kqvwdcwp8	plugin::upload.configure-view	{}	\N	{}	[]	2024-10-31 17:20:33.668	2024-10-31 17:20:33.668	2024-10-31 17:20:33.668	\N	\N	\N
38	m42ih5xulqeq578qmwbjorvp	plugin::upload.assets.create	{}	\N	{}	[]	2024-10-31 17:20:33.672	2024-10-31 17:20:33.672	2024-10-31 17:20:33.672	\N	\N	\N
39	dntr2mhl5e9ekkvr12dhswee	plugin::upload.assets.update	{}	\N	{}	[]	2024-10-31 17:20:33.676	2024-10-31 17:20:33.676	2024-10-31 17:20:33.676	\N	\N	\N
40	s7rj1ekssgnnoveets0iyi3v	plugin::upload.assets.download	{}	\N	{}	[]	2024-10-31 17:20:33.68	2024-10-31 17:20:33.68	2024-10-31 17:20:33.68	\N	\N	\N
41	on9j9wch45ch4xewxyjgm2f6	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-10-31 17:20:33.683	2024-10-31 17:20:33.683	2024-10-31 17:20:33.683	\N	\N	\N
42	v2itjuprgmybovjo0b7bhlcd	plugin::content-manager.explorer.create	{}	api::about.about	{"fields": ["title", "blocks"]}	["admin::is-creator"]	2024-10-31 17:20:33.69	2024-10-31 17:20:33.69	2024-10-31 17:20:33.69	\N	\N	\N
43	yniy20232lzcw230q0dbynze	plugin::content-manager.explorer.create	{}	api::global.global	{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}	["admin::is-creator"]	2024-10-31 17:20:33.693	2024-10-31 17:20:33.693	2024-10-31 17:20:33.693	\N	\N	\N
46	nfv67yhmz7sd1ngjfi2pskqs	plugin::content-manager.explorer.create	{}	api::member.member	{"fields": ["firstname", "lastnames", "github", "linkedin", "bio", "email", "profilepic", "position"]}	["admin::is-creator"]	2024-10-31 17:20:33.704	2024-10-31 17:20:33.704	2024-10-31 17:20:33.705	\N	\N	\N
47	jir5m1faosds7jp3julrsfzw	plugin::content-manager.explorer.create	{}	api::project.project	{"fields": ["name", "banner", "gallery", "about", "members", "videolink", "date", "tagline", "publications"]}	["admin::is-creator"]	2024-10-31 17:20:33.708	2024-10-31 17:20:33.708	2024-10-31 17:20:33.708	\N	\N	\N
48	n6i996mrhxwwo34qrccpnt23	plugin::content-manager.explorer.create	{}	api::publication.publication	{"fields": ["name", "pdflink", "paperlink", "authors", "members", "date", "projects"]}	["admin::is-creator"]	2024-10-31 17:20:33.711	2024-10-31 17:20:33.711	2024-10-31 17:20:33.711	\N	\N	\N
49	w3hqo0cz8xin7wx7ot4pmogs	plugin::content-manager.explorer.read	{}	api::about.about	{"fields": ["title", "blocks"]}	["admin::is-creator"]	2024-10-31 17:20:33.715	2024-10-31 17:20:33.715	2024-10-31 17:20:33.715	\N	\N	\N
50	mvdqcat81ma45nm2rjpojtbk	plugin::content-manager.explorer.read	{}	api::global.global	{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}	["admin::is-creator"]	2024-10-31 17:20:33.719	2024-10-31 17:20:33.719	2024-10-31 17:20:33.719	\N	\N	\N
53	ohg0xu1pnukr21bjqw1cncxa	plugin::content-manager.explorer.read	{}	api::member.member	{"fields": ["firstname", "lastnames", "github", "linkedin", "bio", "email", "profilepic", "position"]}	["admin::is-creator"]	2024-10-31 17:20:33.73	2024-10-31 17:20:33.73	2024-10-31 17:20:33.73	\N	\N	\N
54	s4hq5tzb7hi1mmhoa4ymeo2m	plugin::content-manager.explorer.read	{}	api::project.project	{"fields": ["name", "banner", "gallery", "about", "members", "videolink", "date", "tagline", "publications"]}	["admin::is-creator"]	2024-10-31 17:20:33.734	2024-10-31 17:20:33.734	2024-10-31 17:20:33.734	\N	\N	\N
55	n5xybwxuy4z67xy1g02jyk8f	plugin::content-manager.explorer.read	{}	api::publication.publication	{"fields": ["name", "pdflink", "paperlink", "authors", "members", "date", "projects"]}	["admin::is-creator"]	2024-10-31 17:20:33.737	2024-10-31 17:20:33.737	2024-10-31 17:20:33.737	\N	\N	\N
56	knay9185pse1otsfn72d7avy	plugin::content-manager.explorer.update	{}	api::about.about	{"fields": ["title", "blocks"]}	["admin::is-creator"]	2024-10-31 17:20:33.74	2024-10-31 17:20:33.74	2024-10-31 17:20:33.74	\N	\N	\N
57	d6geoom4ahtlp1go8oxwnp3g	plugin::content-manager.explorer.update	{}	api::global.global	{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}	["admin::is-creator"]	2024-10-31 17:20:33.743	2024-10-31 17:20:33.743	2024-10-31 17:20:33.743	\N	\N	\N
60	yk1v7u5v9jxmt18pzui3v6uq	plugin::content-manager.explorer.update	{}	api::member.member	{"fields": ["firstname", "lastnames", "github", "linkedin", "bio", "email", "profilepic", "position"]}	["admin::is-creator"]	2024-10-31 17:20:33.753	2024-10-31 17:20:33.753	2024-10-31 17:20:33.753	\N	\N	\N
61	iog7w2ekc8c61v67ssjb2i5x	plugin::content-manager.explorer.update	{}	api::project.project	{"fields": ["name", "banner", "gallery", "about", "members", "videolink", "date", "tagline", "publications"]}	["admin::is-creator"]	2024-10-31 17:20:33.757	2024-10-31 17:20:33.757	2024-10-31 17:20:33.757	\N	\N	\N
62	n96wmtjwabonldiugya23xvf	plugin::content-manager.explorer.update	{}	api::publication.publication	{"fields": ["name", "pdflink", "paperlink", "authors", "members", "date", "projects"]}	["admin::is-creator"]	2024-10-31 17:20:33.76	2024-10-31 17:20:33.76	2024-10-31 17:20:33.76	\N	\N	\N
63	woiva00klgqcx1le9yo2ghaz	plugin::content-manager.explorer.delete	{}	api::about.about	{}	["admin::is-creator"]	2024-10-31 17:20:33.763	2024-10-31 17:20:33.763	2024-10-31 17:20:33.763	\N	\N	\N
64	ex7ejc0p5sn0ia6nf85dz6vl	plugin::content-manager.explorer.delete	{}	api::global.global	{}	["admin::is-creator"]	2024-10-31 17:20:33.767	2024-10-31 17:20:33.767	2024-10-31 17:20:33.767	\N	\N	\N
65	h29k09ti0tmt8bxadayk803m	plugin::content-manager.explorer.delete	{}	api::jobpost.jobpost	{}	["admin::is-creator"]	2024-10-31 17:20:33.77	2024-10-31 17:20:33.77	2024-10-31 17:20:33.77	\N	\N	\N
66	a0hxdnax8y9wznpv6k042k0h	plugin::content-manager.explorer.delete	{}	api::landing.landing	{}	["admin::is-creator"]	2024-10-31 17:20:33.773	2024-10-31 17:20:33.773	2024-10-31 17:20:33.773	\N	\N	\N
67	bszx4wvw4olq9bfer6zcsaoj	plugin::content-manager.explorer.delete	{}	api::member.member	{}	["admin::is-creator"]	2024-10-31 17:20:33.776	2024-10-31 17:20:33.776	2024-10-31 17:20:33.776	\N	\N	\N
68	drxwhb5ncnfxg3xe43cig4jn	plugin::content-manager.explorer.delete	{}	api::project.project	{}	["admin::is-creator"]	2024-10-31 17:20:33.78	2024-10-31 17:20:33.78	2024-10-31 17:20:33.78	\N	\N	\N
45	p30sdgjccbho0jbk9c33rkz7	plugin::content-manager.explorer.create	{}	api::landing.landing	{"fields": ["tagline", "videolink", "customarea", "banner", "videocaption"]}	["admin::is-creator"]	2024-10-31 17:20:33.701	2024-11-14 00:37:02.944	2024-10-31 17:20:33.701	\N	\N	\N
59	cpq318jstvbugamm5wo5qonc	plugin::content-manager.explorer.update	{}	api::landing.landing	{"fields": ["tagline", "videolink", "customarea", "banner", "videocaption"]}	["admin::is-creator"]	2024-10-31 17:20:33.75	2024-11-14 00:37:02.944	2024-10-31 17:20:33.75	\N	\N	\N
44	l90s34awktayil5w2owpuy9c	plugin::content-manager.explorer.create	{}	api::jobpost.jobpost	{"fields": ["position", "contactemail", "date", "note", "requirements"]}	["admin::is-creator"]	2024-10-31 17:20:33.698	2024-11-14 01:51:24.025	2024-10-31 17:20:33.698	\N	\N	\N
51	ivi3ev238m4bm0xgo2q67gvr	plugin::content-manager.explorer.read	{}	api::jobpost.jobpost	{"fields": ["position", "contactemail", "date", "note", "requirements"]}	["admin::is-creator"]	2024-10-31 17:20:33.723	2024-11-14 01:51:24.025	2024-10-31 17:20:33.723	\N	\N	\N
69	g9da7nf2wr65tsz15dj38sny	plugin::content-manager.explorer.delete	{}	api::publication.publication	{}	["admin::is-creator"]	2024-10-31 17:20:33.783	2024-10-31 17:20:33.783	2024-10-31 17:20:33.783	\N	\N	\N
70	ekgkpk1rr6hwmvywn67shdh8	plugin::upload.read	{}	\N	{}	["admin::is-creator"]	2024-10-31 17:20:33.787	2024-10-31 17:20:33.787	2024-10-31 17:20:33.787	\N	\N	\N
71	s6yktavm8jzdc61ch95xjikr	plugin::upload.configure-view	{}	\N	{}	[]	2024-10-31 17:20:33.79	2024-10-31 17:20:33.79	2024-10-31 17:20:33.79	\N	\N	\N
72	wer2agi06h25cmkr6cqkek66	plugin::upload.assets.create	{}	\N	{}	[]	2024-10-31 17:20:33.794	2024-10-31 17:20:33.794	2024-10-31 17:20:33.794	\N	\N	\N
73	a6q0u26v7ldm1zbyfpm3a8tm	plugin::upload.assets.update	{}	\N	{}	["admin::is-creator"]	2024-10-31 17:20:33.797	2024-10-31 17:20:33.797	2024-10-31 17:20:33.797	\N	\N	\N
74	loqvnewa2tp911uo3atuov28	plugin::upload.assets.download	{}	\N	{}	[]	2024-10-31 17:20:33.801	2024-10-31 17:20:33.801	2024-10-31 17:20:33.801	\N	\N	\N
75	zgviusd57z3vt8ptgmbowvy2	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-10-31 17:20:33.804	2024-10-31 17:20:33.804	2024-10-31 17:20:33.804	\N	\N	\N
76	oenwa141bwt5a6xo6lm3kwy8	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2024-10-31 17:20:33.83	2024-10-31 17:20:33.83	2024-10-31 17:20:33.83	\N	\N	\N
77	ygrn0n76bj04aqnjkgqze6wl	plugin::content-manager.explorer.create	{}	api::about.about	{"fields": ["title", "blocks"]}	[]	2024-10-31 17:20:33.838	2024-10-31 17:20:33.838	2024-10-31 17:20:33.838	\N	\N	\N
78	cyaqpfbzx77rdfm5pn0gu00e	plugin::content-manager.explorer.create	{}	api::global.global	{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}	[]	2024-10-31 17:20:33.841	2024-10-31 17:20:33.841	2024-10-31 17:20:33.841	\N	\N	\N
82	v7xt37c9vqyvsbf5sd04mo63	plugin::content-manager.explorer.create	{}	api::project.project	{"fields": ["name", "banner", "gallery", "about", "members", "videolink", "date", "tagline", "publications"]}	[]	2024-10-31 17:20:33.854	2024-10-31 17:20:33.854	2024-10-31 17:20:33.854	\N	\N	\N
84	zmysd0mw4ljgowwgg8hjdofg	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2024-10-31 17:20:33.861	2024-10-31 17:20:33.861	2024-10-31 17:20:33.861	\N	\N	\N
85	nd429tfcxoe7pcvywv9vl8eb	plugin::content-manager.explorer.read	{}	api::about.about	{"fields": ["title", "blocks"]}	[]	2024-10-31 17:20:33.864	2024-10-31 17:20:33.864	2024-10-31 17:20:33.864	\N	\N	\N
86	xu11sdf6pr3kbnyzowzc83jm	plugin::content-manager.explorer.read	{}	api::global.global	{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}	[]	2024-10-31 17:20:33.867	2024-10-31 17:20:33.867	2024-10-31 17:20:33.867	\N	\N	\N
90	zpou7ejedi1izvcbjwtygqny	plugin::content-manager.explorer.read	{}	api::project.project	{"fields": ["name", "banner", "gallery", "about", "members", "videolink", "date", "tagline", "publications"]}	[]	2024-10-31 17:20:33.88	2024-10-31 17:20:33.88	2024-10-31 17:20:33.88	\N	\N	\N
92	mkm1044vtgon7duswh9j60ge	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2024-10-31 17:20:33.887	2024-10-31 17:20:33.887	2024-10-31 17:20:33.887	\N	\N	\N
93	ph6mruci835a1ybnnikxbw01	plugin::content-manager.explorer.update	{}	api::about.about	{"fields": ["title", "blocks"]}	[]	2024-10-31 17:20:33.89	2024-10-31 17:20:33.89	2024-10-31 17:20:33.89	\N	\N	\N
94	lskqavyy2cqcnnjtleb5hnlx	plugin::content-manager.explorer.update	{}	api::global.global	{"fields": ["siteName", "favicon", "siteDescription", "defaultSeo.metaTitle", "defaultSeo.metaDescription", "defaultSeo.shareImage"]}	[]	2024-10-31 17:20:33.894	2024-10-31 17:20:33.894	2024-10-31 17:20:33.894	\N	\N	\N
98	rbh8pgfw7p7c7zpr2hcfabll	plugin::content-manager.explorer.update	{}	api::project.project	{"fields": ["name", "banner", "gallery", "about", "members", "videolink", "date", "tagline", "publications"]}	[]	2024-10-31 17:20:33.907	2024-10-31 17:20:33.907	2024-10-31 17:20:33.907	\N	\N	\N
100	zaoxgjm5wdjucfosa2dr9vcr	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2024-10-31 17:20:33.913	2024-10-31 17:20:33.913	2024-10-31 17:20:33.913	\N	\N	\N
101	zrbhkuizph2ghvdlm8fwggv5	plugin::content-manager.explorer.delete	{}	api::about.about	{}	[]	2024-10-31 17:20:33.917	2024-10-31 17:20:33.917	2024-10-31 17:20:33.917	\N	\N	\N
102	ll13x1ezrp4jftqnph17vtn3	plugin::content-manager.explorer.delete	{}	api::global.global	{}	[]	2024-10-31 17:20:33.92	2024-10-31 17:20:33.92	2024-10-31 17:20:33.92	\N	\N	\N
103	rgrwgk3gr7iexue6y6kvuxbr	plugin::content-manager.explorer.delete	{}	api::jobpost.jobpost	{}	[]	2024-10-31 17:20:33.923	2024-10-31 17:20:33.923	2024-10-31 17:20:33.923	\N	\N	\N
104	nemsac6qdlgh9e9pcwldbyn3	plugin::content-manager.explorer.delete	{}	api::landing.landing	{}	[]	2024-10-31 17:20:33.927	2024-10-31 17:20:33.927	2024-10-31 17:20:33.927	\N	\N	\N
105	xf8tyfqu8w4a04eowbgmpc90	plugin::content-manager.explorer.delete	{}	api::member.member	{}	[]	2024-10-31 17:20:33.93	2024-10-31 17:20:33.93	2024-10-31 17:20:33.93	\N	\N	\N
106	w6sa62qef0nsdxsidr5ox49z	plugin::content-manager.explorer.delete	{}	api::project.project	{}	[]	2024-10-31 17:20:33.933	2024-10-31 17:20:33.933	2024-10-31 17:20:33.933	\N	\N	\N
107	vq1f824ynv19bn22n230ikid	plugin::content-manager.explorer.delete	{}	api::publication.publication	{}	[]	2024-10-31 17:20:33.936	2024-10-31 17:20:33.936	2024-10-31 17:20:33.937	\N	\N	\N
108	hs34yvrmvlj0jpzfpw2vkp8q	plugin::content-manager.explorer.publish	{}	plugin::users-permissions.user	{}	[]	2024-10-31 17:20:33.94	2024-10-31 17:20:33.94	2024-10-31 17:20:33.94	\N	\N	\N
109	xg6q6wxhm22dszkr1rcs2vnn	plugin::content-manager.explorer.publish	{}	api::about.about	{}	[]	2024-10-31 17:20:33.943	2024-10-31 17:20:33.943	2024-10-31 17:20:33.943	\N	\N	\N
110	ennw00s0x5vv9fdysm5frc8i	plugin::content-manager.explorer.publish	{}	api::global.global	{}	[]	2024-10-31 17:20:33.947	2024-10-31 17:20:33.947	2024-10-31 17:20:33.947	\N	\N	\N
111	ruuacdumkngtqu6off4lv7na	plugin::content-manager.explorer.publish	{}	api::jobpost.jobpost	{}	[]	2024-10-31 17:20:33.95	2024-10-31 17:20:33.95	2024-10-31 17:20:33.95	\N	\N	\N
112	bbmt7whn55viba6kfia1ln79	plugin::content-manager.explorer.publish	{}	api::landing.landing	{}	[]	2024-10-31 17:20:33.953	2024-10-31 17:20:33.953	2024-10-31 17:20:33.953	\N	\N	\N
113	k171mt9h7zn7ryeca5f1dghi	plugin::content-manager.explorer.publish	{}	api::member.member	{}	[]	2024-10-31 17:20:33.956	2024-10-31 17:20:33.956	2024-10-31 17:20:33.956	\N	\N	\N
114	ek7o1d8bufesoh767hbgrkls	plugin::content-manager.explorer.publish	{}	api::project.project	{}	[]	2024-10-31 17:20:33.96	2024-10-31 17:20:33.96	2024-10-31 17:20:33.96	\N	\N	\N
115	fg5xc8x41nwr8y2qppjjpedi	plugin::content-manager.explorer.publish	{}	api::publication.publication	{}	[]	2024-10-31 17:20:33.963	2024-10-31 17:20:33.963	2024-10-31 17:20:33.963	\N	\N	\N
116	uxbn2p6bs88jl30cnri776xn	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2024-10-31 17:20:33.967	2024-10-31 17:20:33.967	2024-10-31 17:20:33.967	\N	\N	\N
117	c7tlaqy9fang8ap9o9nnclwq	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2024-10-31 17:20:33.97	2024-10-31 17:20:33.97	2024-10-31 17:20:33.97	\N	\N	\N
118	ao5szigog7u5t6yl7jljaz2l	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2024-10-31 17:20:33.973	2024-10-31 17:20:33.973	2024-10-31 17:20:33.973	\N	\N	\N
119	hv8q9tn73tdc1fibmx90btoh	plugin::content-type-builder.read	{}	\N	{}	[]	2024-10-31 17:20:33.976	2024-10-31 17:20:33.976	2024-10-31 17:20:33.976	\N	\N	\N
120	j3t4zai6ah4v2yu78fao5v0w	plugin::email.settings.read	{}	\N	{}	[]	2024-10-31 17:20:33.98	2024-10-31 17:20:33.98	2024-10-31 17:20:33.98	\N	\N	\N
121	y7hvdwzqprlm22gvbbnfdu3p	plugin::upload.read	{}	\N	{}	[]	2024-10-31 17:20:33.983	2024-10-31 17:20:33.983	2024-10-31 17:20:33.983	\N	\N	\N
122	ncaxj8xmcs2gr7yzyy67oxkj	plugin::upload.assets.create	{}	\N	{}	[]	2024-10-31 17:20:33.986	2024-10-31 17:20:33.986	2024-10-31 17:20:33.986	\N	\N	\N
123	j9oe3sbqu9o9mwn3xs3pjtef	plugin::upload.assets.update	{}	\N	{}	[]	2024-10-31 17:20:33.989	2024-10-31 17:20:33.989	2024-10-31 17:20:33.989	\N	\N	\N
124	b0cvkwrnn2apydr4opf7b0vr	plugin::upload.assets.download	{}	\N	{}	[]	2024-10-31 17:20:33.992	2024-10-31 17:20:33.992	2024-10-31 17:20:33.992	\N	\N	\N
125	bqxbng4gqe0ofgq7xbm5kaag	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-10-31 17:20:33.996	2024-10-31 17:20:33.996	2024-10-31 17:20:33.996	\N	\N	\N
126	mwe6p4zu1a33eh5hjuhbz61y	plugin::upload.configure-view	{}	\N	{}	[]	2024-10-31 17:20:33.999	2024-10-31 17:20:33.999	2024-10-31 17:20:33.999	\N	\N	\N
127	ezr1d7nlc46tjbls7l2413wg	plugin::upload.settings.read	{}	\N	{}	[]	2024-10-31 17:20:34.002	2024-10-31 17:20:34.002	2024-10-31 17:20:34.002	\N	\N	\N
128	hcqvh9hy7vcweyjlqtp163wn	plugin::i18n.locale.create	{}	\N	{}	[]	2024-10-31 17:20:34.005	2024-10-31 17:20:34.005	2024-10-31 17:20:34.005	\N	\N	\N
129	tcw84n6fdkoaptb8vhiuln1j	plugin::i18n.locale.read	{}	\N	{}	[]	2024-10-31 17:20:34.008	2024-10-31 17:20:34.008	2024-10-31 17:20:34.008	\N	\N	\N
130	fk18siuek9ju0uu13quskgli	plugin::i18n.locale.update	{}	\N	{}	[]	2024-10-31 17:20:34.012	2024-10-31 17:20:34.012	2024-10-31 17:20:34.012	\N	\N	\N
131	ok1xgrr90n809r56xex0g54k	plugin::i18n.locale.delete	{}	\N	{}	[]	2024-10-31 17:20:34.014	2024-10-31 17:20:34.014	2024-10-31 17:20:34.015	\N	\N	\N
132	zudrczusl35kmgox3y65bwu8	plugin::users-permissions.roles.create	{}	\N	{}	[]	2024-10-31 17:20:34.018	2024-10-31 17:20:34.018	2024-10-31 17:20:34.018	\N	\N	\N
133	sl3q773ckrkzqmrt0skgvcpn	plugin::users-permissions.roles.read	{}	\N	{}	[]	2024-10-31 17:20:34.021	2024-10-31 17:20:34.021	2024-10-31 17:20:34.021	\N	\N	\N
134	xj6rhtimoby0g98f1vp3kqrc	plugin::users-permissions.roles.update	{}	\N	{}	[]	2024-10-31 17:20:34.023	2024-10-31 17:20:34.023	2024-10-31 17:20:34.024	\N	\N	\N
135	r4u1cy45c5rfymscqa4lxj3t	plugin::users-permissions.roles.delete	{}	\N	{}	[]	2024-10-31 17:20:34.026	2024-10-31 17:20:34.026	2024-10-31 17:20:34.026	\N	\N	\N
136	leozxilo3s65rlv6kiwdtx5y	plugin::users-permissions.providers.read	{}	\N	{}	[]	2024-10-31 17:20:34.029	2024-10-31 17:20:34.029	2024-10-31 17:20:34.029	\N	\N	\N
137	znz25dlmwhp8g5rnkxjmpqcl	plugin::users-permissions.providers.update	{}	\N	{}	[]	2024-10-31 17:20:34.032	2024-10-31 17:20:34.032	2024-10-31 17:20:34.033	\N	\N	\N
138	jtjtl2u8hpyewwqwtu0gscxc	plugin::users-permissions.email-templates.read	{}	\N	{}	[]	2024-10-31 17:20:34.036	2024-10-31 17:20:34.036	2024-10-31 17:20:34.036	\N	\N	\N
139	crtskj4arr2rj15zn8feergg	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2024-10-31 17:20:34.039	2024-10-31 17:20:34.039	2024-10-31 17:20:34.039	\N	\N	\N
140	lnhyrcoeyaojc3yiie65feuz	plugin::users-permissions.advanced-settings.read	{}	\N	{}	[]	2024-10-31 17:20:34.042	2024-10-31 17:20:34.042	2024-10-31 17:20:34.042	\N	\N	\N
141	cjsv22drged5wgl5kplpcu16	plugin::users-permissions.advanced-settings.update	{}	\N	{}	[]	2024-10-31 17:20:34.046	2024-10-31 17:20:34.046	2024-10-31 17:20:34.046	\N	\N	\N
142	hr2dkwj7azj81xbswd0ler9r	admin::marketplace.read	{}	\N	{}	[]	2024-10-31 17:20:34.049	2024-10-31 17:20:34.049	2024-10-31 17:20:34.049	\N	\N	\N
143	ggpmn3cqhv6acp6o9w8p9iq3	admin::webhooks.create	{}	\N	{}	[]	2024-10-31 17:20:34.053	2024-10-31 17:20:34.053	2024-10-31 17:20:34.053	\N	\N	\N
144	tp0uz6o5c61c53f9zz9t1bo9	admin::webhooks.read	{}	\N	{}	[]	2024-10-31 17:20:34.056	2024-10-31 17:20:34.056	2024-10-31 17:20:34.056	\N	\N	\N
145	dagta85s3fvqrpguo8q4yaqw	admin::webhooks.update	{}	\N	{}	[]	2024-10-31 17:20:34.06	2024-10-31 17:20:34.06	2024-10-31 17:20:34.06	\N	\N	\N
146	zi33or5jgjdecsch0w6a0n3u	admin::webhooks.delete	{}	\N	{}	[]	2024-10-31 17:20:34.063	2024-10-31 17:20:34.063	2024-10-31 17:20:34.063	\N	\N	\N
147	eslew0875n2cink74t5dc1i7	admin::users.create	{}	\N	{}	[]	2024-10-31 17:20:34.067	2024-10-31 17:20:34.067	2024-10-31 17:20:34.067	\N	\N	\N
148	j2ebr2gc8iha9ju7xzgtsxmt	admin::users.read	{}	\N	{}	[]	2024-10-31 17:20:34.07	2024-10-31 17:20:34.07	2024-10-31 17:20:34.07	\N	\N	\N
149	ddr5uhy49e4sj3amxx31uxc1	admin::users.update	{}	\N	{}	[]	2024-10-31 17:20:34.073	2024-10-31 17:20:34.073	2024-10-31 17:20:34.073	\N	\N	\N
150	qo4o1pk3afwdtsgyb9sralbl	admin::users.delete	{}	\N	{}	[]	2024-10-31 17:20:34.076	2024-10-31 17:20:34.076	2024-10-31 17:20:34.077	\N	\N	\N
151	jnxauzabmmhh9hun62kj6ags	admin::roles.create	{}	\N	{}	[]	2024-10-31 17:20:34.08	2024-10-31 17:20:34.08	2024-10-31 17:20:34.08	\N	\N	\N
152	rg7hxcj8rjadh1fqpr7il84t	admin::roles.read	{}	\N	{}	[]	2024-10-31 17:20:34.083	2024-10-31 17:20:34.083	2024-10-31 17:20:34.083	\N	\N	\N
153	jjf5w9f7m4yy2kpp5bq1ds1u	admin::roles.update	{}	\N	{}	[]	2024-10-31 17:20:34.087	2024-10-31 17:20:34.087	2024-10-31 17:20:34.087	\N	\N	\N
154	ud3my4pptc4nplw53rtp58kg	admin::roles.delete	{}	\N	{}	[]	2024-10-31 17:20:34.091	2024-10-31 17:20:34.091	2024-10-31 17:20:34.091	\N	\N	\N
155	wc6gu8v0bdzbvpm6gandy6rz	admin::api-tokens.access	{}	\N	{}	[]	2024-10-31 17:20:34.095	2024-10-31 17:20:34.095	2024-10-31 17:20:34.095	\N	\N	\N
156	blonntcln2sqf1yb4yon5v5a	admin::api-tokens.create	{}	\N	{}	[]	2024-10-31 17:20:34.098	2024-10-31 17:20:34.098	2024-10-31 17:20:34.098	\N	\N	\N
157	hvwem0u2mvh8ld3s73n9n5aw	admin::api-tokens.read	{}	\N	{}	[]	2024-10-31 17:20:34.101	2024-10-31 17:20:34.101	2024-10-31 17:20:34.101	\N	\N	\N
158	bfhgxkcyvl0tffyayfx2kpl7	admin::api-tokens.update	{}	\N	{}	[]	2024-10-31 17:20:34.105	2024-10-31 17:20:34.105	2024-10-31 17:20:34.105	\N	\N	\N
159	jaikxlc65vgwoij79l52mcoo	admin::api-tokens.regenerate	{}	\N	{}	[]	2024-10-31 17:20:34.108	2024-10-31 17:20:34.108	2024-10-31 17:20:34.108	\N	\N	\N
160	x9jr881twguokau4cx8tfsx0	admin::api-tokens.delete	{}	\N	{}	[]	2024-10-31 17:20:34.111	2024-10-31 17:20:34.111	2024-10-31 17:20:34.112	\N	\N	\N
161	q90l6x43ywn4il96hfo9dqvd	admin::project-settings.update	{}	\N	{}	[]	2024-10-31 17:20:34.115	2024-10-31 17:20:34.115	2024-10-31 17:20:34.115	\N	\N	\N
162	tmubbhu8vw69tvksffky2rei	admin::project-settings.read	{}	\N	{}	[]	2024-10-31 17:20:34.118	2024-10-31 17:20:34.118	2024-10-31 17:20:34.118	\N	\N	\N
163	dn5dj0codncmkblo1ywaehmh	admin::transfer.tokens.access	{}	\N	{}	[]	2024-10-31 17:20:34.122	2024-10-31 17:20:34.122	2024-10-31 17:20:34.122	\N	\N	\N
164	uehyud3mvkyzgcmpiy24g1xp	admin::transfer.tokens.create	{}	\N	{}	[]	2024-10-31 17:20:34.125	2024-10-31 17:20:34.125	2024-10-31 17:20:34.125	\N	\N	\N
165	mztc19tmg0c1aec00jv28ifb	admin::transfer.tokens.read	{}	\N	{}	[]	2024-10-31 17:20:34.128	2024-10-31 17:20:34.128	2024-10-31 17:20:34.128	\N	\N	\N
166	vjif1uvo7p3mwgxo34cx07a8	admin::transfer.tokens.update	{}	\N	{}	[]	2024-10-31 17:20:34.131	2024-10-31 17:20:34.131	2024-10-31 17:20:34.131	\N	\N	\N
167	n1ql2o52s701htq5bvrj4qzl	admin::transfer.tokens.regenerate	{}	\N	{}	[]	2024-10-31 17:20:34.135	2024-10-31 17:20:34.135	2024-10-31 17:20:34.135	\N	\N	\N
168	aaybr21c6fmumw7qypqjlbkc	admin::transfer.tokens.delete	{}	\N	{}	[]	2024-10-31 17:20:34.138	2024-10-31 17:20:34.138	2024-10-31 17:20:34.138	\N	\N	\N
169	bvxra8n2n2ua40tz0kmcnoae	plugin::content-manager.explorer.create	{}	api::member.member	{"fields": ["firstname", "lastnames", "github", "linkedin", "bio", "email", "profilepic", "position", "alum"]}	[]	2024-11-14 00:28:46.346	2024-11-14 00:28:46.346	2024-11-14 00:28:46.347	\N	\N	\N
170	b2fkzdul2fbv7u6udisaoy4x	plugin::content-manager.explorer.read	{}	api::member.member	{"fields": ["firstname", "lastnames", "github", "linkedin", "bio", "email", "profilepic", "position", "alum"]}	[]	2024-11-14 00:28:46.356	2024-11-14 00:28:46.356	2024-11-14 00:28:46.356	\N	\N	\N
171	y4rvajuqwzfo3vwpajhlhdiq	plugin::content-manager.explorer.update	{}	api::member.member	{"fields": ["firstname", "lastnames", "github", "linkedin", "bio", "email", "profilepic", "position", "alum"]}	[]	2024-11-14 00:28:46.362	2024-11-14 00:28:46.362	2024-11-14 00:28:46.362	\N	\N	\N
172	egs2fwvb7n0bom8gjlgjk4ud	plugin::content-manager.explorer.create	{}	api::landing.landing	{"fields": ["tagline", "videolink", "customarea", "banner", "videocaption", "Intro"]}	[]	2024-11-14 00:37:02.854	2024-11-14 00:37:02.854	2024-11-14 00:37:02.855	\N	\N	\N
173	y8g2ug7vm6fpzoc7e20agh30	plugin::content-manager.explorer.read	{}	api::landing.landing	{"fields": ["tagline", "videolink", "customarea", "banner", "videocaption", "Intro"]}	[]	2024-11-14 00:37:02.864	2024-11-14 00:37:02.864	2024-11-14 00:37:02.865	\N	\N	\N
174	t78rwuqrn3b3y2hgo37ddyyz	plugin::content-manager.explorer.update	{}	api::landing.landing	{"fields": ["tagline", "videolink", "customarea", "banner", "videocaption", "Intro"]}	[]	2024-11-14 00:37:02.871	2024-11-14 00:37:02.871	2024-11-14 00:37:02.871	\N	\N	\N
4	ax3wm8jf5uhws5ppaif5n6gs	plugin::content-manager.explorer.create	{}	api::landing.landing	{"fields": ["tagline", "videolink", "customarea", "banner", "videocaption"]}	[]	2024-10-31 17:20:33.53	2024-11-14 00:37:02.944	2024-10-31 17:20:33.53	\N	\N	\N
52	f39er1q0cy4lysziaqs74s61	plugin::content-manager.explorer.read	{}	api::landing.landing	{"fields": ["tagline", "videolink", "customarea", "banner", "videocaption"]}	["admin::is-creator"]	2024-10-31 17:20:33.726	2024-11-14 00:37:02.944	2024-10-31 17:20:33.727	\N	\N	\N
175	llfobnvvdh1a91lncdsvfa3l	plugin::content-manager.explorer.create	{}	api::publication.publication	{"fields": ["name", "pdflink", "paperlink", "authors", "members", "date", "projects", "abstract"]}	[]	2024-11-14 01:34:26.213	2024-11-14 01:34:26.213	2024-11-14 01:34:26.214	\N	\N	\N
176	egc34tdnn07sh6dr5mweiak5	plugin::content-manager.explorer.read	{}	api::publication.publication	{"fields": ["name", "pdflink", "paperlink", "authors", "members", "date", "projects", "abstract"]}	[]	2024-11-14 01:34:26.222	2024-11-14 01:34:26.222	2024-11-14 01:34:26.224	\N	\N	\N
177	xs1t1lgb6rqyl0iz8usyxv75	plugin::content-manager.explorer.update	{}	api::publication.publication	{"fields": ["name", "pdflink", "paperlink", "authors", "members", "date", "projects", "abstract"]}	[]	2024-11-14 01:34:26.23	2024-11-14 01:34:26.23	2024-11-14 01:34:26.23	\N	\N	\N
178	m10jf1y75wyhqk7o4gqu07tr	plugin::content-manager.explorer.create	{}	api::jobpost.jobpost	{"fields": ["position", "contactemail", "date", "note", "description", "requirements"]}	[]	2024-11-14 01:51:23.936	2024-11-14 01:51:23.936	2024-11-14 01:51:23.937	\N	\N	\N
179	iuo8pq3kzw9nvgyfoexf2wm1	plugin::content-manager.explorer.read	{}	api::jobpost.jobpost	{"fields": ["position", "contactemail", "date", "note", "description", "requirements"]}	[]	2024-11-14 01:51:23.946	2024-11-14 01:51:23.946	2024-11-14 01:51:23.946	\N	\N	\N
180	g1s3es877tsw99z17zuywnis	plugin::content-manager.explorer.update	{}	api::jobpost.jobpost	{"fields": ["position", "contactemail", "date", "note", "description", "requirements"]}	[]	2024-11-14 01:51:23.955	2024-11-14 01:51:23.955	2024-11-14 01:51:23.955	\N	\N	\N
17	o4qoog06v17j8rovxzs3hahj	plugin::content-manager.explorer.update	{}	api::jobpost.jobpost	{"fields": ["position", "contactemail", "date", "note", "requirements"]}	[]	2024-10-31 17:20:33.59	2024-11-14 01:51:24.025	2024-10-31 17:20:33.591	\N	\N	\N
58	a3z2raobg50zrev9fqlbvskq	plugin::content-manager.explorer.update	{}	api::jobpost.jobpost	{"fields": ["position", "contactemail", "date", "note", "requirements"]}	["admin::is-creator"]	2024-10-31 17:20:33.747	2024-11-14 01:51:24.025	2024-10-31 17:20:33.747	\N	\N	\N
\.


--
-- Data for Name: admin_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.admin_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	1	2	1
2	2	2	2
3	3	2	3
4	4	2	4
5	5	2	5
6	6	2	6
7	7	2	7
8	8	2	8
9	9	2	9
10	10	2	10
11	11	2	11
12	12	2	12
13	13	2	13
14	14	2	14
15	15	2	15
16	16	2	16
17	17	2	17
18	18	2	18
19	19	2	19
20	20	2	20
21	21	2	21
22	22	2	22
23	23	2	23
24	24	2	24
25	25	2	25
26	26	2	26
27	27	2	27
28	28	2	28
29	29	2	29
30	30	2	30
31	31	2	31
32	32	2	32
33	33	2	33
34	34	2	34
35	35	2	35
36	36	2	36
37	37	2	37
38	38	2	38
39	39	2	39
40	40	2	40
41	41	2	41
42	42	3	1
43	43	3	2
44	44	3	3
45	45	3	4
46	46	3	5
47	47	3	6
48	48	3	7
49	49	3	8
50	50	3	9
51	51	3	10
52	52	3	11
53	53	3	12
54	54	3	13
55	55	3	14
56	56	3	15
57	57	3	16
58	58	3	17
59	59	3	18
60	60	3	19
61	61	3	20
62	62	3	21
63	63	3	22
64	64	3	23
65	65	3	24
66	66	3	25
67	67	3	26
68	68	3	27
69	69	3	28
70	70	3	29
71	71	3	30
72	72	3	31
73	73	3	32
74	74	3	33
75	75	3	34
76	76	1	1
77	77	1	2
78	78	1	3
82	82	1	7
84	84	1	9
85	85	1	10
86	86	1	11
90	90	1	15
92	92	1	17
93	93	1	18
94	94	1	19
98	98	1	23
100	100	1	25
101	101	1	26
102	102	1	27
103	103	1	28
104	104	1	29
105	105	1	30
106	106	1	31
107	107	1	32
108	108	1	33
109	109	1	34
110	110	1	35
111	111	1	36
112	112	1	37
113	113	1	38
114	114	1	39
115	115	1	40
116	116	1	41
117	117	1	42
118	118	1	43
119	119	1	44
120	120	1	45
121	121	1	46
122	122	1	47
123	123	1	48
124	124	1	49
125	125	1	50
126	126	1	51
127	127	1	52
128	128	1	53
129	129	1	54
130	130	1	55
131	131	1	56
132	132	1	57
133	133	1	58
134	134	1	59
135	135	1	60
136	136	1	61
137	137	1	62
138	138	1	63
139	139	1	64
140	140	1	65
141	141	1	66
142	142	1	67
143	143	1	68
144	144	1	69
145	145	1	70
146	146	1	71
147	147	1	72
148	148	1	73
149	149	1	74
150	150	1	75
151	151	1	76
152	152	1	77
153	153	1	78
154	154	1	79
155	155	1	80
156	156	1	81
157	157	1	82
158	158	1	83
159	159	1	84
160	160	1	85
161	161	1	86
162	162	1	87
163	163	1	88
164	164	1	89
165	165	1	90
166	166	1	91
167	167	1	92
168	168	1	93
169	169	1	94
170	170	1	95
171	171	1	96
172	172	1	97
173	173	1	98
174	174	1	99
175	175	1	100
176	176	1	101
177	177	1	102
178	178	1	103
179	179	1	104
180	180	1	105
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.admin_roles (id, document_id, name, code, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	j59ywz12goau5qmdq4w3vi71	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2024-10-31 17:20:33.485	2024-10-31 17:20:33.485	2024-10-31 17:20:33.485	\N	\N	\N
2	giv0vwynpx3507icefh28d81	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2024-10-31 17:20:33.49	2024-10-31 17:20:33.49	2024-10-31 17:20:33.49	\N	\N	\N
3	gshwejfwhxbcb8muc400yy83	Author	strapi-author	Authors can manage the content they have created.	2024-10-31 17:20:33.493	2024-10-31 17:20:33.493	2024-10-31 17:20:33.493	\N	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.admin_users (id, document_id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	atl1lco0gnpsvin4ees3fr9p	Eduardo	Castelló Ferrer	\N	eduardo.castello@ie.edu	$2a$10$VdGHp395OYO8r7thYuHeBO5Q5BKIKK7ZoGIZ5v3oLKn1NvRmXkHk.	\N	\N	t	f	\N	2024-10-31 19:25:15.381	2024-10-31 19:25:15.381	2024-10-31 19:25:15.381	\N	\N	\N
2	q37tvf67bajbfh447weqhq10	Zaid	Alsaheb	\N	zalsaheb.ieu2022@student.ie.edu	$2a$10$uK0BqquoV99IDOZmYipE1OZDaPjO/jPahDCJwX3kUnm2.jOKmDlca	\N	e15f9620a0995e7c5c61bddae513cb7f1f7a0f8f	t	f	\N	2024-10-31 19:32:05.645	2024-10-31 19:32:41.485	2024-10-31 19:32:05.646	\N	\N	\N
4	te2e84og9hn8l74g2o1drk3o	Luis	Gomez-Acebo	\N	lgomezacebo.ieu2022@student.ie.edu	$2a$10$6WvMZHFoTCManCK0REj5Cet3JBclKpO2miYpH4Csk01Wb/pip01UG	\N	d99690013ab8845174792d0bb7afeba29e764227	t	f	\N	2024-11-05 10:32:43.581	2024-11-05 10:33:30.182	2024-11-05 10:32:43.581	\N	\N	\N
7	m8qfeormpltac78llopanhty	Gregorio	Orlando	\N	gorlando.ieu2022@student.ie.edu	$2a$10$x0Tva7DC2qCGF1lRxAafa.rHg6obneZErSRxxlMCF43WMnVFos9VO	\N	ccb2a070d9ed887b7b737c22cb685f8e8d1b50de	t	f	\N	2024-11-08 15:06:09.1	2024-11-08 15:06:29.422	2024-11-08 15:06:09.101	\N	\N	\N
5	l3nosc67mwrorj7wq43ez2kw	Francisco	Heshiki de las Casas	fheshiki	fheshiki.ieu2020@student.ie.edu	$2a$10$/hl2lp8Nq7o6Cwk2dgoQle2IBXY5xQdoxD1UMltVIRjMwVEI9FgCq	\N	66e5b6eb374c2077736dabcffe403fe28e6a9a07	t	f	\N	2024-11-08 14:59:23.334	2024-11-08 15:08:09.481	2024-11-08 14:59:23.335	\N	\N	\N
8	pi2asamrus0cptk5uwcg2ys4	Daniel	Rosel	\N	drosel.ieu2022@student.ie.edu	$2a$10$dgLDc6gaGyQWwwRz5B07nuggwLdUI2pJA4.KMW51VM0eUHGkRdPLq	\N	99d8e4d4d1d4849fb13caa65082900ba7fa316be	t	f	\N	2024-11-08 15:08:11.484	2024-11-08 15:08:23.85	2024-11-08 15:08:11.484	\N	\N	\N
10	pjt9nyu5rlzii5g14dtt3buh	Farah	Orfaly	\N	forfaly.ieu2022@student.ie.edu	$2a$10$7t.tWqwAs04p7KfUSuyn/epbeM3kcgWJcu7X.NH9x7uRIjUNd6cOm	\N	e31147e8949e31182c7b11432db81755f3b70700	t	f	en	2024-11-08 15:13:36.273	2024-11-08 15:52:58.286	2024-11-08 15:13:36.273	\N	\N	\N
6	iqtpo9ogopvqqwd5puzmgsoq	Carlos	Gómez	\N	carlos.gomez@ie.edu	$2a$10$Geund.ob5yjuWgTeSE.tU.oFz2R1iUc5g6fH1DbL7vy7UsQKORfTu	\N	f9ad4b3a949f4f6f328be88edd00ae1654f7b461	t	f	\N	2024-11-08 15:01:17.802	2024-11-15 11:39:30.691	2024-11-08 15:01:17.802	\N	\N	\N
9	nocawk326ugxb0mjsxqdak20	Suzan	Awinat	\N	suzan.awinat@ie.edu	$2a$10$VATytfmR4aWyhEXrEACpzODAt23CK0FwE3eOQsZXFjQuhLMUvElxq	\N	6fcfc3d50afd611bada3701506af8970061e0845	t	f	\N	2024-11-08 15:09:49.421	2024-11-15 11:43:39.926	2024-11-08 15:09:49.421	\N	\N	\N
\.


--
-- Data for Name: admin_users_roles_lnk; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.admin_users_roles_lnk (id, user_id, role_id, role_ord, user_ord) FROM stdin;
1	1	1	1	1
2	2	1	1	2
5	4	1	1	3
11	7	1	1	6
7	5	1	1	4
14	8	1	1	7
18	10	1	1	8
9	6	1	1	5
25	9	1	1	9
\.


--
-- Data for Name: components_shared_json_rich_texts; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.components_shared_json_rich_texts (id, text) FROM stdin;
1	[{"type": "heading", "level": 1, "children": [{"text": "Mission", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Our mission is to advance understanding and innovation in the field of cyber-physical systems by leveraging the synergies between digital and physical entities. We explore the fundamental units of life—from cells and atoms to stimuli and bits—to design and engineer systems that enhance human life and society. Ethical considerations are at the core of our work, ensuring that our innovations contribute positively to both individuals and the collective.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "This holistic approach encompasses the future of an increasingly digital and interconnected world. Through collaborative efforts, we aim to pioneer new technologies and methodologies that push the boundaries of what is possible in cyber-physical interactions, robotics, automation, human-computer interaction, and artificial intelligence.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}]
51	[{"type": "heading", "level": 1, "children": [{"text": "Mission", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Our mission is to advance understanding and innovation in the field of cyber-physical systems by leveraging the synergies between digital and physical entities. We explore the fundamental units of life—from cells and atoms to stimuli and bits—to design and engineer systems that enhance human life and society. Ethical considerations are at the core of our work, ensuring that our innovations contribute positively to both individuals and the collective.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "This holistic approach encompasses the future of an increasingly digital and interconnected world. Through collaborative efforts, we aim to pioneer new technologies and methodologies that push the boundaries of what is possible in cyber-physical interactions, robotics, automation, human-computer interaction, and artificial intelligence.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}]
\.


--
-- Data for Name: components_shared_media; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.components_shared_media (id) FROM stdin;
1
49
\.


--
-- Data for Name: components_shared_quotes; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.components_shared_quotes (id, title, body) FROM stdin;
\.


--
-- Data for Name: components_shared_rich_texts; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.components_shared_rich_texts (id, body) FROM stdin;
\.


--
-- Data for Name: components_shared_seos; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.components_shared_seos (id, meta_title, meta_description) FROM stdin;
\.


--
-- Data for Name: components_shared_sliders; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.components_shared_sliders (id) FROM stdin;
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.files (id, document_id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
2	r1m9x69kbj05757rk1i2bp2v	eduardo.jpg	\N	\N	800	800	{"small": {"ext": ".jpg", "url": "/uploads/small_eduardo_b8d72be3d9.jpg", "hash": "small_eduardo_b8d72be3d9", "mime": "image/jpeg", "name": "small_eduardo.jpg", "path": null, "size": 31.23, "width": 500, "height": 500, "sizeInBytes": 31234}, "medium": {"ext": ".jpg", "url": "/uploads/medium_eduardo_b8d72be3d9.jpg", "hash": "medium_eduardo_b8d72be3d9", "mime": "image/jpeg", "name": "medium_eduardo.jpg", "path": null, "size": 58.49, "width": 750, "height": 750, "sizeInBytes": 58486}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_eduardo_b8d72be3d9.jpg", "hash": "thumbnail_eduardo_b8d72be3d9", "mime": "image/jpeg", "name": "thumbnail_eduardo.jpg", "path": null, "size": 5.53, "width": 156, "height": 156, "sizeInBytes": 5525}}	eduardo_b8d72be3d9	.jpg	image/jpeg	66.01	/uploads/eduardo_b8d72be3d9.jpg	\N	local	\N	/	2024-11-04 00:07:01.016	2024-11-04 00:07:01.016	2024-11-04 00:07:01.017	2	2	\N
3	p4g3tfkt4vp5h8j8azpkavrl	myphoto.jpeg	\N	\N	744	742	{"small": {"ext": ".jpeg", "url": "/uploads/small_myphoto_d796405fcd.jpeg", "hash": "small_myphoto_d796405fcd", "mime": "image/jpeg", "name": "small_myphoto.jpeg", "path": null, "size": 35.97, "width": 500, "height": 499, "sizeInBytes": 35968}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_myphoto_d796405fcd.jpeg", "hash": "thumbnail_myphoto_d796405fcd", "mime": "image/jpeg", "name": "thumbnail_myphoto.jpeg", "path": null, "size": 6.16, "width": 156, "height": 156, "sizeInBytes": 6159}}	myphoto_d796405fcd	.jpeg	image/jpeg	67.21	/uploads/myphoto_d796405fcd.jpeg	\N	local	\N	/	2024-11-04 00:11:27.497	2024-11-04 00:11:27.497	2024-11-04 00:11:27.497	2	2	\N
4	txy9fx74w7d0uvf1ct96f819	luis.jpg	\N	\N	800	800	{"small": {"ext": ".jpg", "url": "/uploads/small_luis_0cb70a19d2.jpg", "hash": "small_luis_0cb70a19d2", "mime": "image/jpeg", "name": "small_luis.jpg", "path": null, "size": 27.26, "width": 500, "height": 500, "sizeInBytes": 27255}, "medium": {"ext": ".jpg", "url": "/uploads/medium_luis_0cb70a19d2.jpg", "hash": "medium_luis_0cb70a19d2", "mime": "image/jpeg", "name": "medium_luis.jpg", "path": null, "size": 58.39, "width": 750, "height": 750, "sizeInBytes": 58391}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_luis_0cb70a19d2.jpg", "hash": "thumbnail_luis_0cb70a19d2", "mime": "image/jpeg", "name": "thumbnail_luis.jpg", "path": null, "size": 3.81, "width": 156, "height": 156, "sizeInBytes": 3807}}	luis_0cb70a19d2	.jpg	image/jpeg	67.53	/uploads/luis_0cb70a19d2.jpg	\N	local	\N	/	2024-11-04 00:12:51.692	2024-11-04 00:12:51.692	2024-11-04 00:12:51.693	2	2	\N
5	o9bdp7qk0ciayb80or0ppepe	medium_paco_1bebcb54ba.jpg	\N	\N	750	750	{"small": {"ext": ".jpg", "url": "/uploads/small_medium_paco_1bebcb54ba_c00038b192.jpg", "hash": "small_medium_paco_1bebcb54ba_c00038b192", "mime": "image/jpeg", "name": "small_medium_paco_1bebcb54ba.jpg", "path": null, "size": 28.95, "width": 500, "height": 500, "sizeInBytes": 28954}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_medium_paco_1bebcb54ba_c00038b192.jpg", "hash": "thumbnail_medium_paco_1bebcb54ba_c00038b192", "mime": "image/jpeg", "name": "thumbnail_medium_paco_1bebcb54ba.jpg", "path": null, "size": 5.26, "width": 156, "height": 156, "sizeInBytes": 5262}}	medium_paco_1bebcb54ba_c00038b192	.jpg	image/jpeg	57.65	/uploads/medium_paco_1bebcb54ba_c00038b192.jpg	\N	local	\N	/	2024-11-04 00:18:12.685	2024-11-04 00:18:12.685	2024-11-04 00:18:12.685	2	2	\N
6	iibyix6tg79g2ka364joo5bl	CleanShot 2024-11-04 at 00.24.58@2x.png	\N	\N	1246	674	{"large": {"ext": ".png", "url": "/uploads/large_Clean_Shot_2024_11_04_at_00_24_58_2x_0d7e18611a.png", "hash": "large_Clean_Shot_2024_11_04_at_00_24_58_2x_0d7e18611a", "mime": "image/png", "name": "large_CleanShot 2024-11-04 at 00.24.58@2x.png", "path": null, "size": 639.5, "width": 1000, "height": 541, "sizeInBytes": 639500}, "small": {"ext": ".png", "url": "/uploads/small_Clean_Shot_2024_11_04_at_00_24_58_2x_0d7e18611a.png", "hash": "small_Clean_Shot_2024_11_04_at_00_24_58_2x_0d7e18611a", "mime": "image/png", "name": "small_CleanShot 2024-11-04 at 00.24.58@2x.png", "path": null, "size": 154.32, "width": 500, "height": 270, "sizeInBytes": 154315}, "medium": {"ext": ".png", "url": "/uploads/medium_Clean_Shot_2024_11_04_at_00_24_58_2x_0d7e18611a.png", "hash": "medium_Clean_Shot_2024_11_04_at_00_24_58_2x_0d7e18611a", "mime": "image/png", "name": "medium_CleanShot 2024-11-04 at 00.24.58@2x.png", "path": null, "size": 350.36, "width": 750, "height": 406, "sizeInBytes": 350360}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Clean_Shot_2024_11_04_at_00_24_58_2x_0d7e18611a.png", "hash": "thumbnail_Clean_Shot_2024_11_04_at_00_24_58_2x_0d7e18611a", "mime": "image/png", "name": "thumbnail_CleanShot 2024-11-04 at 00.24.58@2x.png", "path": null, "size": 46.01, "width": 245, "height": 133, "sizeInBytes": 46008}}	Clean_Shot_2024_11_04_at_00_24_58_2x_0d7e18611a	.png	image/png	206.01	/uploads/Clean_Shot_2024_11_04_at_00_24_58_2x_0d7e18611a.png	\N	local	\N	/	2024-11-04 00:26:57.961	2024-11-04 00:26:57.961	2024-11-04 00:26:57.961	2	2	\N
42	gy7ns6z3fcsxl3vamkyz3j9x	iTrash.gif	\N	\N	600	338	{"small": {"ext": ".gif", "url": "/uploads/small_i_Trash_1d8dd8c0ad.gif", "hash": "small_i_Trash_1d8dd8c0ad", "mime": "image/gif", "name": "small_iTrash.gif", "path": null, "size": 72.74, "width": 500, "height": 282, "sizeInBytes": 72735}, "thumbnail": {"ext": ".gif", "url": "/uploads/thumbnail_i_Trash_1d8dd8c0ad.gif", "hash": "thumbnail_i_Trash_1d8dd8c0ad", "mime": "image/gif", "name": "thumbnail_iTrash.gif", "path": null, "size": 18.26, "width": 245, "height": 138, "sizeInBytes": 18258}}	i_Trash_1d8dd8c0ad	.gif	image/gif	5519.45	/uploads/i_Trash_1d8dd8c0ad.gif	\N	local	\N	/	2024-11-20 17:20:39.922	2024-11-20 17:20:39.922	2024-11-20 17:20:39.922	1	1	\N
9	jad5xt7bw3dnhpy3w48r80r1	CleanShot 2024-11-04 at 00.25.57@2x.png	\N	\N	1516	818	{"large": {"ext": ".png", "url": "/uploads/large_Clean_Shot_2024_11_04_at_00_25_57_2x_5b5852b2ee.png", "hash": "large_Clean_Shot_2024_11_04_at_00_25_57_2x_5b5852b2ee", "mime": "image/png", "name": "large_CleanShot 2024-11-04 at 00.25.57@2x.png", "path": null, "size": 500.64, "width": 1000, "height": 540, "sizeInBytes": 500642}, "small": {"ext": ".png", "url": "/uploads/small_Clean_Shot_2024_11_04_at_00_25_57_2x_5b5852b2ee.png", "hash": "small_Clean_Shot_2024_11_04_at_00_25_57_2x_5b5852b2ee", "mime": "image/png", "name": "small_CleanShot 2024-11-04 at 00.25.57@2x.png", "path": null, "size": 135.12, "width": 500, "height": 270, "sizeInBytes": 135120}, "medium": {"ext": ".png", "url": "/uploads/medium_Clean_Shot_2024_11_04_at_00_25_57_2x_5b5852b2ee.png", "hash": "medium_Clean_Shot_2024_11_04_at_00_25_57_2x_5b5852b2ee", "mime": "image/png", "name": "medium_CleanShot 2024-11-04 at 00.25.57@2x.png", "path": null, "size": 280.49, "width": 750, "height": 405, "sizeInBytes": 280486}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Clean_Shot_2024_11_04_at_00_25_57_2x_5b5852b2ee.png", "hash": "thumbnail_Clean_Shot_2024_11_04_at_00_25_57_2x_5b5852b2ee", "mime": "image/png", "name": "thumbnail_CleanShot 2024-11-04 at 00.25.57@2x.png", "path": null, "size": 43.5, "width": 245, "height": 132, "sizeInBytes": 43496}}	Clean_Shot_2024_11_04_at_00_25_57_2x_5b5852b2ee	.png	image/png	258.57	/uploads/Clean_Shot_2024_11_04_at_00_25_57_2x_5b5852b2ee.png	\N	local	\N	/	2024-11-04 00:27:05.273	2024-11-04 00:43:42.288	2024-11-04 00:27:05.273	2	2	\N
7	yrpumb1fy057hds1qryxx72a	CleanShot 2024-11-04 at 00.22.57@2x.png	\N	\N	778	798	{"small": {"ext": ".png", "url": "/uploads/small_Clean_Shot_2024_11_04_at_00_22_57_2x_e09a74828d.png", "hash": "small_Clean_Shot_2024_11_04_at_00_22_57_2x_e09a74828d", "mime": "image/png", "name": "small_CleanShot 2024-11-04 at 00.22.57@2x.png", "path": null, "size": 334.64, "width": 487, "height": 500, "sizeInBytes": 334639}, "medium": {"ext": ".png", "url": "/uploads/medium_Clean_Shot_2024_11_04_at_00_22_57_2x_e09a74828d.png", "hash": "medium_Clean_Shot_2024_11_04_at_00_22_57_2x_e09a74828d", "mime": "image/png", "name": "medium_CleanShot 2024-11-04 at 00.22.57@2x.png", "path": null, "size": 697.34, "width": 731, "height": 750, "sizeInBytes": 697337}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Clean_Shot_2024_11_04_at_00_22_57_2x_e09a74828d.png", "hash": "thumbnail_Clean_Shot_2024_11_04_at_00_22_57_2x_e09a74828d", "mime": "image/png", "name": "thumbnail_CleanShot 2024-11-04 at 00.22.57@2x.png", "path": null, "size": 44.59, "width": 152, "height": 156, "sizeInBytes": 44589}}	Clean_Shot_2024_11_04_at_00_22_57_2x_e09a74828d	.png	image/png	162.00	/uploads/Clean_Shot_2024_11_04_at_00_22_57_2x_e09a74828d.png	\N	local	\N	/	2024-11-04 00:27:01.026	2024-11-04 00:48:13.849	2024-11-04 00:27:01.026	2	2	\N
10	sf7kij0097mwowig7ysw3352	labimage1_86131b2ae3.png	\N	\N	956	956	{"small": {"ext": ".png", "url": "/uploads/small_labimage1_86131b2ae3_c49c3e6e22.png", "hash": "small_labimage1_86131b2ae3_c49c3e6e22", "mime": "image/png", "name": "small_labimage1_86131b2ae3.png", "path": null, "size": 141.49, "width": 500, "height": 500, "sizeInBytes": 141486}, "medium": {"ext": ".png", "url": "/uploads/medium_labimage1_86131b2ae3_c49c3e6e22.png", "hash": "medium_labimage1_86131b2ae3_c49c3e6e22", "mime": "image/png", "name": "medium_labimage1_86131b2ae3.png", "path": null, "size": 275.49, "width": 750, "height": 750, "sizeInBytes": 275485}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_labimage1_86131b2ae3_c49c3e6e22.png", "hash": "thumbnail_labimage1_86131b2ae3_c49c3e6e22", "mime": "image/png", "name": "thumbnail_labimage1_86131b2ae3.png", "path": null, "size": 25.79, "width": 156, "height": 156, "sizeInBytes": 25787}}	labimage1_86131b2ae3_c49c3e6e22	.png	image/png	79.67	/uploads/labimage1_86131b2ae3_c49c3e6e22.png	\N	local	\N	/	2024-11-04 00:32:07.357	2024-11-04 13:57:10.894	2024-11-04 00:32:07.357	2	2	\N
11	ss3f0fobmhe0r50so6cd7oi4	CleanShot 2024-11-04 at 00.23.52@2x.png	\N	\N	1450	766	{"large": {"ext": ".png", "url": "/uploads/large_Clean_Shot_2024_11_04_at_00_23_52_2x_651f8f2844.png", "hash": "large_Clean_Shot_2024_11_04_at_00_23_52_2x_651f8f2844", "mime": "image/png", "name": "large_CleanShot 2024-11-04 at 00.23.52@2x.png", "path": null, "size": 380.92, "width": 1000, "height": 528, "sizeInBytes": 380924}, "small": {"ext": ".png", "url": "/uploads/small_Clean_Shot_2024_11_04_at_00_23_52_2x_651f8f2844.png", "hash": "small_Clean_Shot_2024_11_04_at_00_23_52_2x_651f8f2844", "mime": "image/png", "name": "small_CleanShot 2024-11-04 at 00.23.52@2x.png", "path": null, "size": 110.22, "width": 500, "height": 264, "sizeInBytes": 110222}, "medium": {"ext": ".png", "url": "/uploads/medium_Clean_Shot_2024_11_04_at_00_23_52_2x_651f8f2844.png", "hash": "medium_Clean_Shot_2024_11_04_at_00_23_52_2x_651f8f2844", "mime": "image/png", "name": "medium_CleanShot 2024-11-04 at 00.23.52@2x.png", "path": null, "size": 225.43, "width": 750, "height": 396, "sizeInBytes": 225430}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Clean_Shot_2024_11_04_at_00_23_52_2x_651f8f2844.png", "hash": "thumbnail_Clean_Shot_2024_11_04_at_00_23_52_2x_651f8f2844", "mime": "image/png", "name": "thumbnail_CleanShot 2024-11-04 at 00.23.52@2x.png", "path": null, "size": 35.07, "width": 245, "height": 129, "sizeInBytes": 35071}}	Clean_Shot_2024_11_04_at_00_23_52_2x_651f8f2844	.png	image/png	145.94	/uploads/Clean_Shot_2024_11_04_at_00_23_52_2x_651f8f2844.png	\N	local	\N	/	2024-11-04 00:45:18.44	2024-11-04 00:45:18.44	2024-11-04 00:45:18.44	2	2	\N
12	evyrzfa7jhuhv24fin1sosdy	Picture 1.png	\N	\N	956	956	{"small": {"ext": ".png", "url": "/uploads/small_Picture_1_570affaa71.png", "hash": "small_Picture_1_570affaa71", "mime": "image/png", "name": "small_Picture 1.png", "path": null, "size": 141.49, "width": 500, "height": 500, "sizeInBytes": 141486}, "medium": {"ext": ".png", "url": "/uploads/medium_Picture_1_570affaa71.png", "hash": "medium_Picture_1_570affaa71", "mime": "image/png", "name": "medium_Picture 1.png", "path": null, "size": 275.49, "width": 750, "height": 750, "sizeInBytes": 275485}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Picture_1_570affaa71.png", "hash": "thumbnail_Picture_1_570affaa71", "mime": "image/png", "name": "thumbnail_Picture 1.png", "path": null, "size": 25.79, "width": 156, "height": 156, "sizeInBytes": 25787}}	Picture_1_570affaa71	.png	image/png	79.67	/uploads/Picture_1_570affaa71.png	\N	local	\N	/	2024-11-04 13:57:56.737	2024-11-04 13:57:56.737	2024-11-04 13:57:56.737	2	2	\N
13	uk5c600wljn7lx9tyq0t15my	CPL_cycle.png	\N	\N	1024	1024	{"large": {"ext": ".png", "url": "/uploads/large_CPL_cycle_a4b7ab709d.png", "hash": "large_CPL_cycle_a4b7ab709d", "mime": "image/png", "name": "large_CPL_cycle.png", "path": null, "size": 413.42, "width": 1000, "height": 1000, "sizeInBytes": 413415}, "small": {"ext": ".png", "url": "/uploads/small_CPL_cycle_a4b7ab709d.png", "hash": "small_CPL_cycle_a4b7ab709d", "mime": "image/png", "name": "small_CPL_cycle.png", "path": null, "size": 150.15, "width": 500, "height": 500, "sizeInBytes": 150147}, "medium": {"ext": ".png", "url": "/uploads/medium_CPL_cycle_a4b7ab709d.png", "hash": "medium_CPL_cycle_a4b7ab709d", "mime": "image/png", "name": "medium_CPL_cycle.png", "path": null, "size": 265.37, "width": 750, "height": 750, "sizeInBytes": 265367}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_CPL_cycle_a4b7ab709d.png", "hash": "thumbnail_CPL_cycle_a4b7ab709d", "mime": "image/png", "name": "thumbnail_CPL_cycle.png", "path": null, "size": 30.2, "width": 156, "height": 156, "sizeInBytes": 30202}}	CPL_cycle_a4b7ab709d	.png	image/png	67.27	/uploads/CPL_cycle_a4b7ab709d.png	\N	local	\N	/	2024-11-05 10:11:34.75	2024-11-05 10:11:34.75	2024-11-05 10:11:34.75	1	1	\N
14	wny8i193u7xi6ixplm20iqcs	gringo.jpg	\N	\N	800	800	{"small": {"ext": ".jpg", "url": "/uploads/small_gringo_7df271baeb.jpg", "hash": "small_gringo_7df271baeb", "mime": "image/jpeg", "name": "small_gringo.jpg", "path": null, "size": 24.75, "width": 500, "height": 500, "sizeInBytes": 24751}, "medium": {"ext": ".jpg", "url": "/uploads/medium_gringo_7df271baeb.jpg", "hash": "medium_gringo_7df271baeb", "mime": "image/jpeg", "name": "medium_gringo.jpg", "path": null, "size": 44.83, "width": 750, "height": 750, "sizeInBytes": 44825}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_gringo_7df271baeb.jpg", "hash": "thumbnail_gringo_7df271baeb", "mime": "image/jpeg", "name": "thumbnail_gringo.jpg", "path": null, "size": 4.79, "width": 156, "height": 156, "sizeInBytes": 4789}}	gringo_7df271baeb	.jpg	image/jpeg	51.10	/uploads/gringo_7df271baeb.jpg	\N	local	\N	/	2024-11-14 13:43:12.576	2024-11-14 14:18:09.317	2024-11-14 13:43:12.577	7	7	\N
15	kyctcydekjkcgexfzausxjhx	carl.png	\N	\N	512	512	{"small": {"ext": ".png", "url": "/uploads/small_carl_d87807767f.png", "hash": "small_carl_d87807767f", "mime": "image/png", "name": "small_carl.png", "path": null, "size": 21.33, "width": 500, "height": 500, "sizeInBytes": 21334}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_carl_d87807767f.png", "hash": "thumbnail_carl_d87807767f", "mime": "image/png", "name": "thumbnail_carl.png", "path": null, "size": 4.02, "width": 156, "height": 156, "sizeInBytes": 4017}}	carl_d87807767f	.png	image/png	22.12	/uploads/carl_d87807767f.png	\N	local	\N	/	2024-11-15 12:13:24.024	2024-11-15 12:13:24.024	2024-11-15 12:13:24.025	6	6	\N
39	df8qshika1en19uv1hdcwian	SPICE.gif	\N	\N	720	405	{"small": {"ext": ".gif", "url": "/uploads/small_SPICE_4c2663bd03.gif", "hash": "small_SPICE_4c2663bd03", "mime": "image/gif", "name": "small_SPICE.gif", "path": null, "size": 62.35, "width": 500, "height": 281, "sizeInBytes": 62350}, "thumbnail": {"ext": ".gif", "url": "/uploads/thumbnail_SPICE_4c2663bd03.gif", "hash": "thumbnail_SPICE_4c2663bd03", "mime": "image/gif", "name": "thumbnail_SPICE.gif", "path": null, "size": 17.35, "width": 245, "height": 138, "sizeInBytes": 17347}}	SPICE_4c2663bd03	.gif	image/gif	3667.14	/uploads/SPICE_4c2663bd03.gif	\N	local	\N	/2	2024-11-18 22:29:06.419	2024-11-18 22:29:06.419	2024-11-18 22:29:06.419	1	1	\N
44	ya04y8um8jnc904fnlwbuwgv	GAME.gif	\N	\N	640	360	{"small": {"ext": ".gif", "url": "/uploads/small_GAME_short_4fb4a28d96.gif", "hash": "small_GAME_short_4fb4a28d96", "mime": "image/gif", "name": "small_GAME_short.gif", "path": null, "size": 131.9, "width": 500, "height": 281, "sizeInBytes": 131898}, "thumbnail": {"ext": ".gif", "url": "/uploads/thumbnail_GAME_short_4fb4a28d96.gif", "hash": "thumbnail_GAME_short_4fb4a28d96", "mime": "image/gif", "name": "thumbnail_GAME_short.gif", "path": null, "size": 26.85, "width": 245, "height": 138, "sizeInBytes": 26849}}	GAME_short_4fb4a28d96	.gif	image/gif	4127.07	/uploads/GAME_short_4fb4a28d96.gif	\N	local	\N	/	2024-11-20 18:40:08.977	2024-11-20 18:43:06.764	2024-11-20 18:40:08.978	1	1	\N
46	fraizk9lpapisj85hfshln11	IMG_20241029_090151-removebg-preview.png	\N	\N	502	497	{"small": {"ext": ".png", "url": "/uploads/small_IMG_20241029_090151_removebg_preview_c4e019fb22.png", "hash": "small_IMG_20241029_090151_removebg_preview_c4e019fb22", "mime": "image/png", "name": "small_IMG_20241029_090151-removebg-preview.png", "path": null, "size": 168.83, "width": 500, "height": 495, "sizeInBytes": 168828}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_IMG_20241029_090151_removebg_preview_c4e019fb22.png", "hash": "thumbnail_IMG_20241029_090151_removebg_preview_c4e019fb22", "mime": "image/png", "name": "thumbnail_IMG_20241029_090151-removebg-preview.png", "path": null, "size": 23.46, "width": 158, "height": 156, "sizeInBytes": 23455}}	IMG_20241029_090151_removebg_preview_c4e019fb22	.png	image/png	45.83	/uploads/IMG_20241029_090151_removebg_preview_c4e019fb22.png	\N	local	\N	/	2024-11-22 16:36:40.274	2024-11-22 16:36:40.274	2024-11-22 16:36:40.274	9	9	\N
19	kkhmee60xka2pwkv1td2jy1z	PabloOrtega.png	\N	\N	540	360	{"small": {"ext": ".png", "url": "/uploads/small_Pablo_Ortega_0bc112c39f.png", "hash": "small_Pablo_Ortega_0bc112c39f", "mime": "image/png", "name": "small_PabloOrtega.png", "path": null, "size": 244.96, "width": 500, "height": 333, "sizeInBytes": 244960}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Pablo_Ortega_0bc112c39f.png", "hash": "thumbnail_Pablo_Ortega_0bc112c39f", "mime": "image/png", "name": "thumbnail_PabloOrtega.png", "path": null, "size": 68.92, "width": 234, "height": 156, "sizeInBytes": 68919}}	Pablo_Ortega_0bc112c39f	.png	image/png	72.82	/uploads/Pablo_Ortega_0bc112c39f.png	\N	local	\N	/	2024-11-17 11:53:52.045	2024-11-17 11:53:52.045	2024-11-17 11:53:52.045	1	1	\N
40	up1t08uzros1nx844f07ctic	SPICE_squared.gif	\N	\N	500	500	{"thumbnail": {"ext": ".gif", "url": "/uploads/thumbnail_SPICE_squared_512c3960bc.gif", "hash": "thumbnail_SPICE_squared_512c3960bc", "mime": "image/gif", "name": "thumbnail_SPICE_squared.gif", "path": null, "size": 12.22, "width": 156, "height": 156, "sizeInBytes": 12219}}	SPICE_squared_512c3960bc	.gif	image/gif	2970.62	/uploads/SPICE_squared_512c3960bc.gif	\N	local	\N	/	2024-11-18 22:46:55.202	2024-11-18 22:46:55.202	2024-11-18 22:46:55.202	1	1	\N
48	ekxk6r2v8mgfdl9j5pjk9lwe	vera.jpg	\N	\N	362	429	{"thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_vera_e9ab18b0c9.jpg", "hash": "thumbnail_vera_e9ab18b0c9", "mime": "image/jpeg", "name": "thumbnail_vera.jpg", "path": null, "size": 4.25, "width": 132, "height": 156, "sizeInBytes": 4246}}	vera_e9ab18b0c9	.jpg	image/jpeg	18.11	/uploads/vera_e9ab18b0c9.jpg	\N	local	\N	/5	2024-11-25 14:36:29.47	2024-11-25 14:36:29.47	2024-11-25 14:36:29.47	1	1	\N
41	n46a0qqyu1glv37q6t48oghf	SuzanPh-removebg-preview.png	\N	\N	533	468	{"small": {"ext": ".png", "url": "/uploads/small_Suzan_Ph_removebg_preview_ef75fc9d86.png", "hash": "small_Suzan_Ph_removebg_preview_ef75fc9d86", "mime": "image/png", "name": "small_SuzanPh-removebg-preview.png", "path": null, "size": 313.43, "width": 500, "height": 439, "sizeInBytes": 313428}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Suzan_Ph_removebg_preview_ef75fc9d86.png", "hash": "thumbnail_Suzan_Ph_removebg_preview_ef75fc9d86", "mime": "image/png", "name": "thumbnail_SuzanPh-removebg-preview.png", "path": null, "size": 52.98, "width": 178, "height": 156, "sizeInBytes": 52981}}	Suzan_Ph_removebg_preview_ef75fc9d86	.png	image/png	88.56	/uploads/Suzan_Ph_removebg_preview_ef75fc9d86.png	\N	local	\N	/	2024-11-19 15:44:15.071	2024-11-19 15:44:15.071	2024-11-19 15:44:15.071	9	9	\N
45	zjyszzrs3zgvgvhe23gxyrir	MM.png	\N	\N	1524	541	{"large": {"ext": ".png", "url": "/uploads/large_MM_0c09e96f41.png", "hash": "large_MM_0c09e96f41", "mime": "image/png", "name": "large_MM.png", "path": null, "size": 89.01, "width": 1000, "height": 355, "sizeInBytes": 89013}, "small": {"ext": ".png", "url": "/uploads/small_MM_0c09e96f41.png", "hash": "small_MM_0c09e96f41", "mime": "image/png", "name": "small_MM.png", "path": null, "size": 37.86, "width": 500, "height": 177, "sizeInBytes": 37856}, "medium": {"ext": ".png", "url": "/uploads/medium_MM_0c09e96f41.png", "hash": "medium_MM_0c09e96f41", "mime": "image/png", "name": "medium_MM.png", "path": null, "size": 61.51, "width": 750, "height": 266, "sizeInBytes": 61505}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_MM_0c09e96f41.png", "hash": "thumbnail_MM_0c09e96f41", "mime": "image/png", "name": "thumbnail_MM.png", "path": null, "size": 14.73, "width": 245, "height": 87, "sizeInBytes": 14732}}	MM_0c09e96f41	.png	image/png	41.18	/uploads/MM_0c09e96f41.png	\N	local	\N	/4	2024-11-22 15:52:03.257	2024-11-22 15:56:58.547	2024-11-22 15:52:03.257	9	9	\N
49	jhqrdunek83sxnm69asqte8v	MM.png	\N	\N	1524	541	{"large": {"ext": ".png", "url": "/uploads/large_MM_adcabfe902.png", "hash": "large_MM_adcabfe902", "mime": "image/png", "name": "large_MM.png", "path": null, "size": 95.96, "width": 1000, "height": 355, "sizeInBytes": 95955}, "small": {"ext": ".png", "url": "/uploads/small_MM_adcabfe902.png", "hash": "small_MM_adcabfe902", "mime": "image/png", "name": "small_MM.png", "path": null, "size": 37.9, "width": 500, "height": 177, "sizeInBytes": 37903}, "medium": {"ext": ".png", "url": "/uploads/medium_MM_adcabfe902.png", "hash": "medium_MM_adcabfe902", "mime": "image/png", "name": "medium_MM.png", "path": null, "size": 63.86, "width": 750, "height": 266, "sizeInBytes": 63863}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_MM_adcabfe902.png", "hash": "thumbnail_MM_adcabfe902", "mime": "image/png", "name": "thumbnail_MM.png", "path": null, "size": 14.45, "width": 245, "height": 87, "sizeInBytes": 14445}}	MM_adcabfe902	.png	image/png	62.66	/uploads/MM_adcabfe902.png	\N	local	\N	/6	2024-11-26 15:01:10.09	2024-11-26 15:01:10.09	2024-11-26 15:01:10.09	1	1	\N
30	z3uytrvbafmmxtrynrzcxisu	P8370006.00_14_42_16.Still026.jpg	\N	\N	800	450	{"small": {"ext": ".jpg", "url": "/uploads/small_P8370006_00_14_42_16_Still026_7b7556c1d2.jpg", "hash": "small_P8370006_00_14_42_16_Still026_7b7556c1d2", "mime": "image/jpeg", "name": "small_P8370006.00_14_42_16.Still026.jpg", "path": null, "size": 12.98, "width": 500, "height": 281, "sizeInBytes": 12975}, "medium": {"ext": ".jpg", "url": "/uploads/medium_P8370006_00_14_42_16_Still026_7b7556c1d2.jpg", "hash": "medium_P8370006_00_14_42_16_Still026_7b7556c1d2", "mime": "image/jpeg", "name": "medium_P8370006.00_14_42_16.Still026.jpg", "path": null, "size": 21.38, "width": 750, "height": 422, "sizeInBytes": 21380}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_P8370006_00_14_42_16_Still026_7b7556c1d2.jpg", "hash": "thumbnail_P8370006_00_14_42_16_Still026_7b7556c1d2", "mime": "image/jpeg", "name": "thumbnail_P8370006.00_14_42_16.Still026.jpg", "path": null, "size": 5.12, "width": 245, "height": 138, "sizeInBytes": 5124}}	P8370006_00_14_42_16_Still026_7b7556c1d2	.jpg	image/jpeg	23.19	/uploads/P8370006_00_14_42_16_Still026_7b7556c1d2.jpg	\N	local	\N	/1	2024-11-17 19:18:48.167	2024-11-17 19:18:48.167	2024-11-17 19:18:48.167	1	1	\N
31	dlc1k7vtpclauawnkv43bx95	P8370006.00_13_27_03.Still023.jpg	\N	\N	800	450	{"small": {"ext": ".jpg", "url": "/uploads/small_P8370006_00_13_27_03_Still023_f1944b29cc.jpg", "hash": "small_P8370006_00_13_27_03_Still023_f1944b29cc", "mime": "image/jpeg", "name": "small_P8370006.00_13_27_03.Still023.jpg", "path": null, "size": 19.97, "width": 500, "height": 281, "sizeInBytes": 19968}, "medium": {"ext": ".jpg", "url": "/uploads/medium_P8370006_00_13_27_03_Still023_f1944b29cc.jpg", "hash": "medium_P8370006_00_13_27_03_Still023_f1944b29cc", "mime": "image/jpeg", "name": "medium_P8370006.00_13_27_03.Still023.jpg", "path": null, "size": 35.18, "width": 750, "height": 422, "sizeInBytes": 35182}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_P8370006_00_13_27_03_Still023_f1944b29cc.jpg", "hash": "thumbnail_P8370006_00_13_27_03_Still023_f1944b29cc", "mime": "image/jpeg", "name": "thumbnail_P8370006.00_13_27_03.Still023.jpg", "path": null, "size": 7.07, "width": 245, "height": 138, "sizeInBytes": 7072}}	P8370006_00_13_27_03_Still023_f1944b29cc	.jpg	image/jpeg	38.67	/uploads/P8370006_00_13_27_03_Still023_f1944b29cc.jpg	\N	local	\N	/1	2024-11-17 19:18:49.593	2024-11-17 19:18:49.593	2024-11-17 19:18:49.593	1	1	\N
32	ofmst8a48x5dpyx3vknl0dne	P8370006.00_03_25_16.Still001.jpg	\N	\N	800	450	{"small": {"ext": ".jpg", "url": "/uploads/small_P8370006_00_03_25_16_Still001_a6f4c0a48b.jpg", "hash": "small_P8370006_00_03_25_16_Still001_a6f4c0a48b", "mime": "image/jpeg", "name": "small_P8370006.00_03_25_16.Still001.jpg", "path": null, "size": 25.12, "width": 500, "height": 281, "sizeInBytes": 25115}, "medium": {"ext": ".jpg", "url": "/uploads/medium_P8370006_00_03_25_16_Still001_a6f4c0a48b.jpg", "hash": "medium_P8370006_00_03_25_16_Still001_a6f4c0a48b", "mime": "image/jpeg", "name": "medium_P8370006.00_03_25_16.Still001.jpg", "path": null, "size": 45.5, "width": 750, "height": 422, "sizeInBytes": 45499}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_P8370006_00_03_25_16_Still001_a6f4c0a48b.jpg", "hash": "thumbnail_P8370006_00_03_25_16_Still001_a6f4c0a48b", "mime": "image/jpeg", "name": "thumbnail_P8370006.00_03_25_16.Still001.jpg", "path": null, "size": 8.54, "width": 245, "height": 138, "sizeInBytes": 8544}}	P8370006_00_03_25_16_Still001_a6f4c0a48b	.jpg	image/jpeg	50.96	/uploads/P8370006_00_03_25_16_Still001_a6f4c0a48b.jpg	\N	local	\N	/1	2024-11-17 19:18:50.694	2024-11-17 19:18:50.694	2024-11-17 19:18:50.694	1	1	\N
33	vqknbfmj2bv12qe593dehtcb	drawing-room.png	\N	\N	800	451	{"small": {"ext": ".png", "url": "/uploads/small_drawing_room_d9ed04f0fb.png", "hash": "small_drawing_room_d9ed04f0fb", "mime": "image/png", "name": "small_drawing-room.png", "path": null, "size": 264.89, "width": 500, "height": 282, "sizeInBytes": 264887}, "medium": {"ext": ".png", "url": "/uploads/medium_drawing_room_d9ed04f0fb.png", "hash": "medium_drawing_room_d9ed04f0fb", "mime": "image/png", "name": "medium_drawing-room.png", "path": null, "size": 542.01, "width": 750, "height": 423, "sizeInBytes": 542005}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_drawing_room_d9ed04f0fb.png", "hash": "thumbnail_drawing_room_d9ed04f0fb", "mime": "image/png", "name": "thumbnail_drawing-room.png", "path": null, "size": 71.75, "width": 245, "height": 138, "sizeInBytes": 71754}}	drawing_room_d9ed04f0fb	.png	image/png	155.32	/uploads/drawing_room_d9ed04f0fb.png	\N	local	\N	/1	2024-11-17 19:18:56.288	2024-11-17 19:18:56.288	2024-11-17 19:18:56.289	1	1	\N
34	itmm91le6yrjjrujjytzi5cu	P8370006.00_11_10_04.Still019.jpg	\N	\N	800	450	{"small": {"ext": ".jpg", "url": "/uploads/small_P8370006_00_11_10_04_Still019_fddcead9a5.jpg", "hash": "small_P8370006_00_11_10_04_Still019_fddcead9a5", "mime": "image/jpeg", "name": "small_P8370006.00_11_10_04.Still019.jpg", "path": null, "size": 17.97, "width": 500, "height": 281, "sizeInBytes": 17974}, "medium": {"ext": ".jpg", "url": "/uploads/medium_P8370006_00_11_10_04_Still019_fddcead9a5.jpg", "hash": "medium_P8370006_00_11_10_04_Still019_fddcead9a5", "mime": "image/jpeg", "name": "medium_P8370006.00_11_10_04.Still019.jpg", "path": null, "size": 31.35, "width": 750, "height": 422, "sizeInBytes": 31348}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_P8370006_00_11_10_04_Still019_fddcead9a5.jpg", "hash": "thumbnail_P8370006_00_11_10_04_Still019_fddcead9a5", "mime": "image/jpeg", "name": "thumbnail_P8370006.00_11_10_04.Still019.jpg", "path": null, "size": 6.64, "width": 245, "height": 138, "sizeInBytes": 6642}}	P8370006_00_11_10_04_Still019_fddcead9a5	.jpg	image/jpeg	34.19	/uploads/P8370006_00_11_10_04_Still019_fddcead9a5.jpg	\N	local	\N	/1	2024-11-17 19:18:57.355	2024-11-17 19:18:57.355	2024-11-17 19:18:57.355	1	1	\N
35	r5y2tu8hfbxq1sjzyrx4b5c1	ROBOPRENEUR.gif	\N	\N	560	482	{"small": {"ext": ".gif", "url": "/uploads/small_ROBOPRENEUR_d8c7e4cf81.gif", "hash": "small_ROBOPRENEUR_d8c7e4cf81", "mime": "image/gif", "name": "small_ROBOPRENEUR.gif", "path": null, "size": 42.42, "width": 500, "height": 430, "sizeInBytes": 42420}, "thumbnail": {"ext": ".gif", "url": "/uploads/thumbnail_ROBOPRENEUR_d8c7e4cf81.gif", "hash": "thumbnail_ROBOPRENEUR_d8c7e4cf81", "mime": "image/gif", "name": "thumbnail_ROBOPRENEUR.gif", "path": null, "size": 7.46, "width": 181, "height": 156, "sizeInBytes": 7464}}	ROBOPRENEUR_d8c7e4cf81	.gif	image/gif	4036.14	/uploads/ROBOPRENEUR_d8c7e4cf81.gif	\N	local	\N	/1	2024-11-17 19:29:58.4	2024-11-17 19:29:58.4	2024-11-17 19:29:58.4	1	1	\N
47	x6wkeirdx5ky5ig81lbb23r7	Screenshot 2024-11-23 at 3.51.55 PM (2).png	\N	\N	230	261	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_Screenshot_2024_11_23_at_3_51_55_PM_2_2d136f5e0e.png", "hash": "thumbnail_Screenshot_2024_11_23_at_3_51_55_PM_2_2d136f5e0e", "mime": "image/png", "name": "thumbnail_Screenshot 2024-11-23 at 3.51.55 PM (2).png", "path": null, "size": 55.28, "width": 137, "height": 156, "sizeInBytes": 55278}}	Screenshot_2024_11_23_at_3_51_55_PM_2_2d136f5e0e	.png	image/png	33.70	/uploads/Screenshot_2024_11_23_at_3_51_55_PM_2_2d136f5e0e.png	\N	local	\N	/	2024-11-23 15:56:02.222	2024-11-23 15:56:02.222	2024-11-23 15:56:02.222	10	10	\N
\.


--
-- Data for Name: files_folder_lnk; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.files_folder_lnk (id, file_id, folder_id, file_ord) FROM stdin;
11	30	1	1
12	31	1	2
13	32	1	3
14	33	1	4
15	34	1	5
16	35	1	6
20	39	2	4
21	45	4	1
24	48	5	1
25	49	6	1
\.


--
-- Data for Name: files_related_mph; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.files_related_mph (id, file_id, related_id, related_type, field, "order") FROM stdin;
720	47	11	api::member.member	profilepic	1
721	47	43	api::member.member	profilepic	1
5	3	3	api::member.member	profilepic	1
6	3	4	api::member.member	profilepic	1
290	2	1	api::member.member	profilepic	1
793	49	43	api::project.project	banner	1
794	49	43	api::project.project	gallery	1
795	49	51	api::project.project	banner	1
796	49	51	api::project.project	gallery	1
291	2	16	api::member.member	profilepic	1
292	14	13	api::member.member	profilepic	1
293	14	17	api::member.member	profilepic	1
294	4	5	api::member.member	profilepic	1
295	4	18	api::member.member	profilepic	1
306	15	20	api::member.member	profilepic	1
307	15	27	api::member.member	profilepic	1
669	44	1	api::project.project	banner	1
670	11	1	api::project.project	gallery	1
310	5	7	api::member.member	profilepic	1
311	5	29	api::member.member	profilepic	1
671	44	40	api::project.project	banner	1
672	11	40	api::project.project	gallery	1
683	41	23	api::member.member	profilepic	1
684	41	38	api::member.member	profilepic	1
691	39	3	api::project.project	banner	1
692	9	3	api::project.project	gallery	1
693	39	42	api::project.project	banner	1
694	9	42	api::project.project	gallery	1
533	35	31	api::project.project	banner	1
534	34	31	api::project.project	gallery	1
535	33	31	api::project.project	gallery	2
536	32	31	api::project.project	gallery	3
537	31	31	api::project.project	gallery	4
538	30	31	api::project.project	gallery	5
539	35	36	api::project.project	banner	1
540	34	36	api::project.project	gallery	1
541	33	36	api::project.project	gallery	2
542	32	36	api::project.project	gallery	3
756	48	30	api::member.member	profilepic	1
757	48	44	api::member.member	profilepic	1
543	31	36	api::project.project	gallery	4
544	30	36	api::project.project	gallery	5
406	19	33	api::member.member	profilepic	1
407	19	37	api::member.member	profilepic	1
633	42	8	api::project.project	banner	1
634	7	8	api::project.project	gallery	1
635	42	38	api::project.project	banner	1
636	7	38	api::project.project	gallery	1
768	13	1	shared.media	file	1
769	42	1	api::landing.landing	banner	1
770	40	1	api::landing.landing	banner	2
771	35	1	api::landing.landing	banner	3
772	44	1	api::landing.landing	banner	4
773	13	49	shared.media	file	1
774	42	49	api::landing.landing	banner	1
775	40	49	api::landing.landing	banner	2
776	35	49	api::landing.landing	banner	3
777	44	49	api::landing.landing	banner	4
779	46	39	api::member.member	profilepic	1
780	46	45	api::member.member	profilepic	1
\.


--
-- Data for Name: globals; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.globals (id, document_id, site_name, site_description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	o1vv1aucmrtstqgoendqbdud	CyPhy Life 	CyPhy Life Research Group	2024-11-16 11:32:14.006	2024-11-16 11:33:20.746	2024-11-16 11:33:20.739	1	1	\N
\.


--
-- Data for Name: globals_cmps; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.globals_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.i18n_locale (id, document_id, name, code, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	g4vngzicbtnkcs18wugh4lum	English (en)	en	2024-10-31 17:20:33.4	2024-10-31 17:20:33.4	2024-10-31 17:20:33.4	\N	\N	\N
\.


--
-- Data for Name: jobposts; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.jobposts (id, document_id, "position", requirements, contactemail, date, note, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, description) FROM stdin;
1	g2tr56w4f6vzeqsorjs56p2c	Postdoctoral Research Associate	- Ph.D. in Robotics, Artificial Intelligence, Computer Science, or a related field.\n- Strong background in blockchain-based technology.\n- Proven track record of high-quality research publications in relevant fields.\n- Excellent communication, organizational, and leadership skills.\n- Ability to work independently and as part of a collaborative team.	eduardo.castello@ie.edu	Application Period: 1/11/2024 - 1/1/2025	\N	2024-11-04 15:59:22.482	2024-11-16 11:35:02.461	\N	2	1	\N	- **Research and Development**: Lead and contribute to the ongoing development of the **ROBOPRENEUR** project, including enhancements to its autonomous decision-making, AI-driven creative processes, and blockchain-based economic transactions.\n\n- **Robotics Integration**: Design and implement advanced algorithms that enable robots to autonomously generate, market, and sell their own labor. Refine the integration of robotics with blockchain technology to ensure secure and efficient economic autonomy.\n\n- **Collaboration and Mentorship**: Collaborate with faculty, graduate students, and other researchers in the department to advance the project’s objectives. Provide mentorship and guidance to graduate students involved in related research.\n\n- **Publication and Dissemination**: Produce high-quality research publications and present findings at international conferences. Contribute to the dissemination of the project’s outcomes through academic and industry channels.
23	g2tr56w4f6vzeqsorjs56p2c	Postdoctoral Research Associate	- Ph.D. in Robotics, Artificial Intelligence, Computer Science, or a related field.\n- Strong background in blockchain-based technology.\n- Proven track record of high-quality research publications in relevant fields.\n- Excellent communication, organizational, and leadership skills.\n- Ability to work independently and as part of a collaborative team.	eduardo.castello@ie.edu	Application Period: 1/11/2024 - 1/1/2025	\N	2024-11-04 15:59:22.482	2024-11-16 11:35:02.461	2024-11-16 11:35:02.467	2	1	\N	- **Research and Development**: Lead and contribute to the ongoing development of the **ROBOPRENEUR** project, including enhancements to its autonomous decision-making, AI-driven creative processes, and blockchain-based economic transactions.\n\n- **Robotics Integration**: Design and implement advanced algorithms that enable robots to autonomously generate, market, and sell their own labor. Refine the integration of robotics with blockchain technology to ensure secure and efficient economic autonomy.\n\n- **Collaboration and Mentorship**: Collaborate with faculty, graduate students, and other researchers in the department to advance the project’s objectives. Provide mentorship and guidance to graduate students involved in related research.\n\n- **Publication and Dissemination**: Produce high-quality research publications and present findings at international conferences. Contribute to the dissemination of the project’s outcomes through academic and industry channels.
24	idk4xwskuwwkkoz15x54kpku	Graduate Visiting Student	- BSc. in Robotics, Artificial Intelligence, Computer Science, or a related field.\n- Familiarity with blockchain-based technology.\n- Ability to work independently and as part of a collaborative team.	eduardo.castello@ie.edu	Application Period: 1/11/2024 - 1/1/2025	\N	2024-11-16 11:53:11.835	2024-11-16 11:53:54.767	\N	1	1	\N	- **Research**: Contribute to the ongoing development of the **ROBOPRENEUR** project conducting research on autonomous decision-making, AI-driven creative processes, and blockchain-based economic transactions.\n\n- **Robotic Systrems Development**: Conduct research on advanced algorithms that enable robots to autonomously generate, market, and sell their own labor. Refine the integration of robotics with blockchain technology to ensure secure and efficient economic autonomy.\n\n- **Publication and Dissemination**: Produce high-quality research publications and present findings at international conferences. Contribute to the dissemination of the project’s outcomes through academic and industry channels.
26	idk4xwskuwwkkoz15x54kpku	Graduate Visiting Student	- BSc. in Robotics, Artificial Intelligence, Computer Science, or a related field.\n- Familiarity with blockchain-based technology.\n- Ability to work independently and as part of a collaborative team.	eduardo.castello@ie.edu	Application Period: 1/11/2024 - 1/1/2025	\N	2024-11-16 11:53:11.835	2024-11-16 11:53:54.767	2024-11-16 11:53:54.774	1	1	\N	- **Research**: Contribute to the ongoing development of the **ROBOPRENEUR** project conducting research on autonomous decision-making, AI-driven creative processes, and blockchain-based economic transactions.\n\n- **Robotic Systrems Development**: Conduct research on advanced algorithms that enable robots to autonomously generate, market, and sell their own labor. Refine the integration of robotics with blockchain technology to ensure secure and efficient economic autonomy.\n\n- **Publication and Dissemination**: Produce high-quality research publications and present findings at international conferences. Contribute to the dissemination of the project’s outcomes through academic and industry channels.
\.


--
-- Data for Name: landings; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.landings (id, document_id, tagline, videolink, videocaption, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, intro) FROM stdin;
1	vwixqloyci3nhyk9s2czmwhj	CyPhy /ˈsaɪˌfaɪ/ Life	https://www.youtube.com/embed/N7nioCLMKKQ	Introduction to CyPhy Life	2024-10-31 19:35:53.353	2024-11-26 13:25:35.89	\N	2	1	\N	[{"type": "heading", "level": 1, "children": [{"text": "About", "type": "text"}]}, {"type": "paragraph", "children": [{"bold": true, "text": "The Cyber-Physical Life (CyPhy Life) Research Group", "type": "text"}, {"text": " works at the forefront of interdisciplinary research, integrating diverse domains across science, engineering, design, and ethics. Our work is centered around the exploration and development", "type": "text"}, {"text": " ", "type": "text", "underline": true}, {"text": "of artificial intelligence, automation, robotics, and human-computer interaction projects. The group's research is guided by a comprehensive framework that spans from the physical to psychological dimensions, enabling us to address complex systems at the intersection of mind, body, and technology.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "We are especially interested in research in the following topics:", "type": "text"}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"text": "The ", "type": "text"}, {"text": "intersection of the digital and physical", "type": "text", "underline": true}, {"text": " as a way to enhance experiences on either side", "type": "text"}]}, {"type": "list-item", "children": [{"text": "Robotic systems that can interface with humans", "type": "text", "underline": true}, {"text": " individually, collectively, and institutionally", "type": "text"}]}, {"type": "list-item", "children": [{"text": "Decentralized technologies that can ", "type": "text"}, {"text": "create and build new cyber-physical institutions", "type": "text", "underline": true}]}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}]
49	vwixqloyci3nhyk9s2czmwhj	CyPhy /ˈsaɪˌfaɪ/ Life	https://www.youtube.com/embed/N7nioCLMKKQ	Introduction to CyPhy Life	2024-10-31 19:35:53.353	2024-11-26 13:25:35.89	2024-11-26 13:25:35.91	2	1	\N	[{"type": "heading", "level": 1, "children": [{"text": "About", "type": "text"}]}, {"type": "paragraph", "children": [{"bold": true, "text": "The Cyber-Physical Life (CyPhy Life) Research Group", "type": "text"}, {"text": " works at the forefront of interdisciplinary research, integrating diverse domains across science, engineering, design, and ethics. Our work is centered around the exploration and development", "type": "text"}, {"text": " ", "type": "text", "underline": true}, {"text": "of artificial intelligence, automation, robotics, and human-computer interaction projects. The group's research is guided by a comprehensive framework that spans from the physical to psychological dimensions, enabling us to address complex systems at the intersection of mind, body, and technology.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "We are especially interested in research in the following topics:", "type": "text"}]}, {"type": "list", "format": "unordered", "children": [{"type": "list-item", "children": [{"text": "The ", "type": "text"}, {"text": "intersection of the digital and physical", "type": "text", "underline": true}, {"text": " as a way to enhance experiences on either side", "type": "text"}]}, {"type": "list-item", "children": [{"text": "Robotic systems that can interface with humans", "type": "text", "underline": true}, {"text": " individually, collectively, and institutionally", "type": "text"}]}, {"type": "list-item", "children": [{"text": "Decentralized technologies that can ", "type": "text"}, {"text": "create and build new cyber-physical institutions", "type": "text", "underline": true}]}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}]
\.


--
-- Data for Name: landings_cmps; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.landings_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
195	1	1	shared.json-rich-text	customarea	1
196	1	1	shared.media	customarea	2
197	49	51	shared.json-rich-text	customarea	1
198	49	49	shared.media	customarea	2
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.members (id, document_id, firstname, lastnames, github, linkedin, bio, email, "position", created_at, updated_at, published_at, created_by_id, updated_by_id, locale, alum) FROM stdin;
3	obvim1ois431y8wihdw1jwom	Zaid	Alsaheb	https://github.com/haxybaxy	https://www.linkedin.com/in/zaid-saheb/	I am zaid	zalsaheb.ieu2022@student.ie.edu	Research Assistant	2024-11-04 00:11:35.907	2024-11-04 00:11:35.907	\N	2	2	\N	\N
4	obvim1ois431y8wihdw1jwom	Zaid	Alsaheb	https://github.com/haxybaxy	https://www.linkedin.com/in/zaid-saheb/	I am zaid	zalsaheb.ieu2022@student.ie.edu	Research Assistant	2024-11-04 00:11:35.907	2024-11-04 00:11:35.907	2024-11-04 00:11:35.915	2	2	\N	\N
44	bdjnai5vytyib1974twcvzrs	Vera	Prohaska	https://github.com/vtwoptwo	https://www.linkedin.com/in/vprohaska/	\N	vera.prohaska@gmail.com	Research Assistant	2024-11-16 11:39:33.036	2024-11-25 14:36:34.783	2024-11-25 14:36:34.796	1	1	\N	t
27	b1zi1apf03c9631o6xbh9d2t	Carlos 	Gomez	https://github.com/Carlos-biru	https://es.linkedin.com/in/carlosgomezsp	Tenchnicin in the Robotics Lab at IE Tower. Previously Researcher in Human-Robot Interaction, you can find some of my work here : https://www.researchgate.net/profile/Carlos-Cubero-2	carlos.gomez@ie.edu	Lab Technician	2024-11-15 12:20:00.274	2024-11-15 17:45:10.202	2024-11-15 17:45:10.212	6	1	\N	\N
1	zkfkyvkzrqiy2l5fifi1yrh2	Eduardo	Castelló Ferrer	https://www.github.com/edcafenet	https://www.linkedin.com/in/eduardocastelloferrer/	\N	eduardo.castello@ie.edu	Assistant Professor - School of Science & Technology	2024-11-04 00:07:07.258	2024-11-15 11:25:18.47	\N	2	1	\N	\N
16	zkfkyvkzrqiy2l5fifi1yrh2	Eduardo	Castelló Ferrer	https://www.github.com/edcafenet	https://www.linkedin.com/in/eduardocastelloferrer/	\N	eduardo.castello@ie.edu	Assistant Professor - School of Science & Technology	2024-11-04 00:07:07.258	2024-11-15 11:25:18.47	2024-11-15 11:25:18.483	2	1	\N	\N
13	toly2i7t4emgpcuz3segr9sh	Gregorio	Orlando	https://github.com/GRINGOLOCO7	www.linkedin.com/in/gregorio-orlando-a482b8295	\N	gorlando.ieu2022@student.ie.edu	Research Assistant	2024-11-14 14:24:19.542	2024-11-15 11:26:30.742	\N	7	1	\N	f
17	toly2i7t4emgpcuz3segr9sh	Gregorio	Orlando	https://github.com/GRINGOLOCO7	www.linkedin.com/in/gregorio-orlando-a482b8295	\N	gorlando.ieu2022@student.ie.edu	Research Assistant	2024-11-14 14:24:19.542	2024-11-15 11:26:30.742	2024-11-15 11:26:30.756	7	1	\N	f
5	ruqsfu5qly2klgydb1dfw35d	Luis	Gomez-Acebo	https://github.com/Fruitkeeper	https://www.linkedin.com/in/luis-gomez-acebo-martin-retortillo/	Computer science student with a passion for sports and gaming. Known for my competitive spirit.	lgomezacebo.ieu2022@student.ie.edu	Research Assistant	2024-11-04 00:12:56.561	2024-11-15 11:26:53.053	\N	2	1	\N	f
18	ruqsfu5qly2klgydb1dfw35d	Luis	Gomez-Acebo	https://github.com/Fruitkeeper	https://www.linkedin.com/in/luis-gomez-acebo-martin-retortillo/	Computer science student with a passion for sports and gaming. Known for my competitive spirit.	lgomezacebo.ieu2022@student.ie.edu	Research Assistant	2024-11-04 00:12:56.561	2024-11-15 11:26:53.053	2024-11-15 11:26:53.067	2	1	\N	f
20	b1zi1apf03c9631o6xbh9d2t	Carlos 	Gomez	https://github.com/Carlos-biru	https://es.linkedin.com/in/carlosgomezsp	Tenchnicin in the Robotics Lab at IE Tower. Previously Researcher in Human-Robot Interaction, you can find some of my work here : https://www.researchgate.net/profile/Carlos-Cubero-2	carlos.gomez@ie.edu	Lab Technician	2024-11-15 12:20:00.274	2024-11-15 17:45:10.202	\N	6	1	\N	\N
7	fysv04vtteoa5y10xfrxzmq1	Francisco	Heshiki de las Casas	https://github.com/paches00	https://www.linkedin.com/in/fheshiki/	i am paco	fheshiki.ieu2020@student.ie.edu	Graduate Research Assistant	2024-11-04 00:18:17.738	2024-11-15 17:49:06.13	\N	2	1	\N	\N
29	fysv04vtteoa5y10xfrxzmq1	Francisco	Heshiki de las Casas	https://github.com/paches00	https://www.linkedin.com/in/fheshiki/	i am paco	fheshiki.ieu2020@student.ie.edu	Graduate Research Assistant	2024-11-04 00:18:17.738	2024-11-15 17:49:06.13	2024-11-15 17:49:06.14	2	1	\N	\N
33	kk2nf2tnlj09cowzenydxarf	Pablo 	Ortega	https://github.com/pabloortegaa	https://www.linkedin.com/in/pabloortegagayo/	\N	portega704@gmail.com	Research Assistant	2024-11-16 11:45:23.605	2024-11-17 17:35:59.593	\N	1	1	\N	t
37	kk2nf2tnlj09cowzenydxarf	Pablo 	Ortega	https://github.com/pabloortegaa	https://www.linkedin.com/in/pabloortegagayo/	\N	portega704@gmail.com	Research Assistant	2024-11-16 11:45:23.605	2024-11-17 17:35:59.593	2024-11-17 17:35:59.609	1	1	\N	t
23	nzgdhi7py6q7fjhm5hl8zzvc	Suzan	Awinat	https://github.com/NNNaWRaSSS	https://www.linkedin.com/in/suzan-t-s-awinat-04448242/	\N	suzan.awinat@ie.edu	Lab Manager	2024-11-15 17:40:47.054	2024-11-20 18:43:56.161	\N	9	1	\N	\N
38	nzgdhi7py6q7fjhm5hl8zzvc	Suzan	Awinat	https://github.com/NNNaWRaSSS	https://www.linkedin.com/in/suzan-t-s-awinat-04448242/	\N	suzan.awinat@ie.edu	Lab Manager	2024-11-15 17:40:47.054	2024-11-20 18:43:56.161	2024-11-20 18:43:56.168	9	1	\N	\N
39	pum01uiv8cinj50x4hdqtqmr	Antonio	Fernandez	https://github.com/Ferno22	https://www.linkedin.com/in/afernandez2024/	\N	afernandez.ieu2020@student.ie.edu	Research Assistant	2024-11-22 16:37:42.672	2024-11-26 14:54:13.718	\N	9	1	\N	t
11	q39x6m1xw8wja655a0dkpqwy	Farah	Orfaly	https://github.com/farahorfaly04	https://www.linkedin.com/in/farah-orfaly/	\N	forfaly.ieu2022@student.ie.edu	Research Assistant	2024-11-08 15:54:14.016	2024-11-23 15:56:14.365	\N	10	10	\N	\N
43	q39x6m1xw8wja655a0dkpqwy	Farah	Orfaly	https://github.com/farahorfaly04	https://www.linkedin.com/in/farah-orfaly/	\N	forfaly.ieu2022@student.ie.edu	Research Assistant	2024-11-08 15:54:14.016	2024-11-23 15:56:14.365	2024-11-23 15:56:14.374	10	10	\N	\N
30	bdjnai5vytyib1974twcvzrs	Vera	Prohaska	https://github.com/vtwoptwo	https://www.linkedin.com/in/vprohaska/	\N	vera.prohaska@gmail.com	Research Assistant	2024-11-16 11:39:33.036	2024-11-25 14:36:34.783	\N	1	1	\N	t
45	pum01uiv8cinj50x4hdqtqmr	Antonio	Fernandez	https://github.com/Ferno22	https://www.linkedin.com/in/afernandez2024/	\N	afernandez.ieu2020@student.ie.edu	Research Assistant	2024-11-22 16:37:42.672	2024-11-26 14:54:13.718	2024-11-26 14:54:13.73	9	1	\N	t
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.projects (id, document_id, name, about, videolink, date, tagline, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
8	k2ldpe04lpthbopgwginza1m	iTrash: Incentivized Token Rewards for Automated Sorting and Handling	[{"type": "heading", "level": 1, "children": [{"text": "iTrash: Incentivized Token Rewards for Automated Sorting and Handling", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", "type": "text"}]}]	https://www.youtube.com/embed/sdrd5JMhjsk	2024-11-03	Research Project	2024-11-04 00:49:40.063	2024-11-20 17:21:12.649	\N	2	1	\N
1	keagrrwzsk9dsp2051bla780	GAME: GrAspable Media Entertainment	[{"type": "heading", "level": 1, "children": [{"text": "GAME: GrAspable Media Entertainment ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "This research explores the development of a Tangible User Interface (TUI) designed for gaming purposes. GAME (GrAspable Media Entertainment) is an innovative project that enables users to physically interact with digital gaming elements, bridging the gap between the physical and virtual worlds. This is achieved through the integration of multiple technologies, including a motion capture system (Optitrack), a short-throw projector (Optoma UHD35STx), and an agent-based simulation software (GAMA).", "type": "text"}]}]	https://www.youtube.com/embed/o1hVKjgDzAk	2024-11-03	Research Project	2024-11-04 00:39:16.908	2024-11-20 18:41:55.346	\N	2	1	\N
16	dpfeel35hla7x3p4q7lwb2o5	AIfrend: Clever lamp for your desk	[{"type": "paragraph", "children": [{"text": "Combine state of the art technology to help users with personal work. ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "The project is made possible thanks to robot arm of 6DoF from trossenrobotics. The wx250s. With a maximum payload of 200g was challenging to find the best projector sutisfiyng the requironments. A kodak mini projector is attached to the wx250s end-effector to project usefull content relative to the user current working topics. Using a Optitrack system, we track a marker on the table. With some small tf/ transformations the digital world is unifide with real world, and the robot arm project and point on top of the marker. ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Then using a webcam pointing on the user working station, we capture what user is doing or studing. With computer vision we derive usefull links for YouTube or Wikipidia and project them on the table in real time.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Future devellopment: Test diffrent Computer Vision APIs and Use a microphone to capture user customized requests", "type": "text"}]}]	\N	\N	\N	2024-11-14 14:09:44.113	2024-11-14 20:00:27.934	\N	7	2	\N
31	aq3ldhyje95lvsibti87fuda	ROBOPRENEUR	[{"type": "paragraph", "children": [{"text": "The physical autonomy of robots is well understood both theoretically and practically, but there is almost no research exploring their potential economic autonomy. ROBOPRENEUR is a broad research line exploring the concept of economically autonomous robots -- autonomous systems that able to produce marketable goods while having full control over the use of its generated income by using blockchain-based technology. The ROBOPRENEUR research line encompasses several past and ongoing projects.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}]	https://www.youtube.com/embed/l7NIBH861Uk?si=8tNy52vCpsQM0juP	2024-09-01	Research Line	2024-11-17 18:30:43.596	2024-11-17 19:43:50.265	\N	1	1	\N
36	aq3ldhyje95lvsibti87fuda	ROBOPRENEUR	[{"type": "paragraph", "children": [{"text": "The physical autonomy of robots is well understood both theoretically and practically, but there is almost no research exploring their potential economic autonomy. ROBOPRENEUR is a broad research line exploring the concept of economically autonomous robots -- autonomous systems that able to produce marketable goods while having full control over the use of its generated income by using blockchain-based technology. The ROBOPRENEUR research line encompasses several past and ongoing projects.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}]	https://www.youtube.com/embed/l7NIBH861Uk?si=8tNy52vCpsQM0juP	2024-09-01	Research Line	2024-11-17 18:30:43.596	2024-11-17 19:43:50.265	2024-11-17 19:43:50.284	1	1	\N
51	g4ootlaei0cpevixu38wibl4	Multimodal Sentiment Analysis based on Video and Audio Inputs	[{"type": "paragraph", "children": [{"text": "The main objective of this project is to prove the usability of emotion recognition models that take video and audio inputs. Fine-tuned models (e.g., Facebook wav2vec2 and Google vivit) have been used for averaging the decision-making framework. After disparity in the results, if one of the models gets much higher accuracy, another test framework is created. The methods used are the Weighted Average method, the Confidence Level Threshold method, the Dynamic Weighting Based on Confidence method, and the Rule-Based Logic method. This approach gives encouraging results that make future research into these methods viable.", "type": "text"}]}]	\N	2024-10-28	Research Project	2024-11-22 15:53:48.905	2024-11-26 15:05:56.096	2024-11-26 15:05:56.112	9	1	\N
38	k2ldpe04lpthbopgwginza1m	iTrash: Incentivized Token Rewards for Automated Sorting and Handling	[{"type": "heading", "level": 1, "children": [{"text": "iTrash: Incentivized Token Rewards for Automated Sorting and Handling", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", "type": "text"}]}]	https://www.youtube.com/embed/sdrd5JMhjsk	2024-11-03	Research Project	2024-11-04 00:49:40.063	2024-11-20 17:21:12.649	2024-11-20 17:21:12.659	2	1	\N
40	keagrrwzsk9dsp2051bla780	GAME: GrAspable Media Entertainment	[{"type": "heading", "level": 1, "children": [{"text": "GAME: GrAspable Media Entertainment ", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "This research explores the development of a Tangible User Interface (TUI) designed for gaming purposes. GAME (GrAspable Media Entertainment) is an innovative project that enables users to physically interact with digital gaming elements, bridging the gap between the physical and virtual worlds. This is achieved through the integration of multiple technologies, including a motion capture system (Optitrack), a short-throw projector (Optoma UHD35STx), and an agent-based simulation software (GAMA).", "type": "text"}]}]	https://www.youtube.com/embed/o1hVKjgDzAk	2024-11-03	Research Project	2024-11-04 00:39:16.908	2024-11-20 18:41:55.346	2024-11-20 18:41:55.358	2	1	\N
3	wq5ud3qfl3pw0qrxnvzx39d2	SPICE: Smart Projection Interface for Cooking Enhancement	[{"type": "heading", "level": 1, "children": [{"text": "SPICE: Smart Projection Interface for Cooking Enhancement", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Tangible User Interfaces (TUI) provide the user with physical representations of digital information with the aim to overcome the limitations of screen-based interfaces. Although many compelling demonstrations of TUIs exist in the literature, there is a lack of research on TUIs intended for daily two-handed tasks and processes, such as cooking. In response to this gap, we propose SPICE (Smart Projection Interface for Cooking Enhancement). SPICE investigates TUIs in a kitchen setting, aiming to transform the recipe following experience from simply text-based to tangibly interactive. SPICE includes a tracking system, an agent-based software, and vision large language models to create and interpret a kitchen environment where recipe information is projected directly onto the cooking surface.", "type": "text"}]}]	https://www.youtube.com/embed/BouEhriwqQ0	2024-11-03	Research Project	2024-11-04 00:39:16.908	2024-11-21 15:23:55.596	\N	2	1	\N
42	wq5ud3qfl3pw0qrxnvzx39d2	SPICE: Smart Projection Interface for Cooking Enhancement	[{"type": "heading", "level": 1, "children": [{"text": "SPICE: Smart Projection Interface for Cooking Enhancement", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "Tangible User Interfaces (TUI) provide the user with physical representations of digital information with the aim to overcome the limitations of screen-based interfaces. Although many compelling demonstrations of TUIs exist in the literature, there is a lack of research on TUIs intended for daily two-handed tasks and processes, such as cooking. In response to this gap, we propose SPICE (Smart Projection Interface for Cooking Enhancement). SPICE investigates TUIs in a kitchen setting, aiming to transform the recipe following experience from simply text-based to tangibly interactive. SPICE includes a tracking system, an agent-based software, and vision large language models to create and interpret a kitchen environment where recipe information is projected directly onto the cooking surface.", "type": "text"}]}]	https://www.youtube.com/embed/BouEhriwqQ0	2024-11-03	Research Project	2024-11-04 00:39:16.908	2024-11-21 15:23:55.596	2024-11-21 15:23:55.625	2	1	\N
43	g4ootlaei0cpevixu38wibl4	Multimodal Sentiment Analysis based on Video and Audio Inputs	[{"type": "paragraph", "children": [{"text": "The main objective of this project is to prove the usability of emotion recognition models that take video and audio inputs. Fine-tuned models (e.g., Facebook wav2vec2 and Google vivit) have been used for averaging the decision-making framework. After disparity in the results, if one of the models gets much higher accuracy, another test framework is created. The methods used are the Weighted Average method, the Confidence Level Threshold method, the Dynamic Weighting Based on Confidence method, and the Rule-Based Logic method. This approach gives encouraging results that make future research into these methods viable.", "type": "text"}]}]	\N	2024-10-28	Research Project	2024-11-22 15:53:48.905	2024-11-26 15:05:56.096	\N	9	1	\N
\.


--
-- Data for Name: projects_members_lnk; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.projects_members_lnk (id, project_id, member_id, member_ord) FROM stdin;
49	31	1	1
54	36	16	1
57	38	16	1
58	38	37	2
61	40	16	1
62	40	29	2
65	42	16	1
1	1	1	1
2	1	7	2
23	16	13	1
67	43	23	1
71	43	39	2
66	42	44	2
7	3	1	1
25	3	30	2
80	51	38	1
81	51	45	2
33	8	1	1
34	8	33	2
\.


--
-- Data for Name: projects_publications_lnk; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.projects_publications_lnk (id, project_id, publication_id, publication_ord, project_ord) FROM stdin;
10	31	1	1	1
19	43	12	1	0
26	36	16	1	1
30	51	15	1	1
\.


--
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.publications (id, document_id, name, pdflink, paperlink, authors, date, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, abstract) FROM stdin;
1	am18xm6uz8l5bu9rt7mf9s60	Gaka-Chu: A Self-Employed Autonomous Robot Artist	https://arxiv.org/abs/2203.03411	https://ieeexplore.ieee.org/document/10160866	Eduardo Castelló Ferrer, Ivan Berman, Aleksandr Kapitonov, Vadim Manaenko, Makar Chernyaev, Pavel Tarasov	2023-05-01	2024-11-04 15:49:00.982	2024-11-24 11:43:03.498	\N	2	1	\N	In this paper, we present the first economically autonomous robot -- a robot able to produce marketable goods while having full control over the use of its generated income. Gaka-chu ("painter" in Japanese) is a 6-axis robot arm that creates paintings of Japanese characters from an autoselected keyword. By using a blockchain-based smart contract, Gaka-chu can autonomously list a painting it made for sale in an online auction. In this transaction, the robot interacts with the human bidders as a peer not as a tool.
12	b1bufph4cblwrlskovp8h6aa	Multimodal Sentiment Analysis based on Video and Audio Inputs	https://iebs-my.sharepoint.com/personal/eduardo_castello_ie_edu/Documents/ROBOTICS%20LAB/Papers/Multimodal%20Sentiment%20Analysis%20based%20on%20Video%20and%20Audio%20Inputs%20-%20EUSPN%202024/EUSPN_9.pdf	https://iebs-my.sharepoint.com/personal/eduardo_castello_ie_edu/Documents/ROBOTICS%20LAB/Papers/Multimodal%20Sentiment%20Analysis%20based%20on%20Video%20and%20Audio%20Inputs%20-%20EUSPN%202024/EUSPN_9.pdf	Antonio Fernandez, Suzan Awinat	2024-10-28	2024-11-22 15:57:42.116	2024-11-22 16:46:01.374	\N	9	9	\N	Despite the abundance of current research working on the sentiment analysis from videos and audios, finding the best model that gives the highest accuracy rate is still considered a challenge for researchers in this field.\nThe main objective of this paper is to prove the usability of emotion recognition models that take video and audio inputs. The datasets used to train the models are the CREMA-D dataset for audio and the RAVDESS dataset for video. The fine-tuned models that been used are: Facebook/wav2vec2-large for audio and the Google/vivit-b-16x2-kinetics400 for video. The average of the probabilities for each emotion generated by the two previous models is utilized in the decision-making framework. After disparity in the results, if one of the models gets much higher accuracy, another test framework is created. The methods used are the Weighted Average method, the Confidence Level Threshold method, the Dynamic Weighting Based on Confidence method, and the Rule-Based Logic method. This limited approach gives encouraging results that make future research into these methods viable.\n\n
15	b1bufph4cblwrlskovp8h6aa	Multimodal Sentiment Analysis based on Video and Audio Inputs	https://iebs-my.sharepoint.com/personal/eduardo_castello_ie_edu/Documents/ROBOTICS%20LAB/Papers/Multimodal%20Sentiment%20Analysis%20based%20on%20Video%20and%20Audio%20Inputs%20-%20EUSPN%202024/EUSPN_9.pdf	https://iebs-my.sharepoint.com/personal/eduardo_castello_ie_edu/Documents/ROBOTICS%20LAB/Papers/Multimodal%20Sentiment%20Analysis%20based%20on%20Video%20and%20Audio%20Inputs%20-%20EUSPN%202024/EUSPN_9.pdf	Antonio Fernandez, Suzan Awinat	2024-10-28	2024-11-22 15:57:42.116	2024-11-22 16:46:01.374	2024-11-22 16:46:01.394	9	9	\N	Despite the abundance of current research working on the sentiment analysis from videos and audios, finding the best model that gives the highest accuracy rate is still considered a challenge for researchers in this field.\nThe main objective of this paper is to prove the usability of emotion recognition models that take video and audio inputs. The datasets used to train the models are the CREMA-D dataset for audio and the RAVDESS dataset for video. The fine-tuned models that been used are: Facebook/wav2vec2-large for audio and the Google/vivit-b-16x2-kinetics400 for video. The average of the probabilities for each emotion generated by the two previous models is utilized in the decision-making framework. After disparity in the results, if one of the models gets much higher accuracy, another test framework is created. The methods used are the Weighted Average method, the Confidence Level Threshold method, the Dynamic Weighting Based on Confidence method, and the Rule-Based Logic method. This limited approach gives encouraging results that make future research into these methods viable.\n\n
16	am18xm6uz8l5bu9rt7mf9s60	Gaka-Chu: A Self-Employed Autonomous Robot Artist	https://arxiv.org/abs/2203.03411	https://ieeexplore.ieee.org/document/10160866	Eduardo Castelló Ferrer, Ivan Berman, Aleksandr Kapitonov, Vadim Manaenko, Makar Chernyaev, Pavel Tarasov	2023-05-01	2024-11-04 15:49:00.982	2024-11-24 11:43:03.498	2024-11-24 11:43:03.51	2	1	\N	In this paper, we present the first economically autonomous robot -- a robot able to produce marketable goods while having full control over the use of its generated income. Gaka-chu ("painter" in Japanese) is a 6-axis robot arm that creates paintings of Japanese characters from an autoselected keyword. By using a blockchain-based smart contract, Gaka-chu can autonomously list a painting it made for sale in an online auction. In this transaction, the robot interacts with the human bidders as a peer not as a tool.
\.


--
-- Data for Name: publications_members_lnk; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.publications_members_lnk (id, publication_id, member_id, member_ord) FROM stdin;
2	1	1	1
15	12	23	1
18	12	39	2
19	15	38	1
21	16	16	1
20	15	45	2
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_api_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_api_token_permissions_token_lnk (id, api_token_permission_id, api_token_id, api_token_permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_api_tokens (id, document_id, name, description, type, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	tuaop1xh557scqf8awv5gnvp	firstoken		full-access	e7496c5e570f54ec09add22bc8dfa2b87b2b0fcc60b72da55802cdde52a2ff9163884e6814fe99c7e14a5803d930e2ea6028bc8b12a29ab860ddda0dc7754db7	\N	\N	\N	2024-10-31 19:33:10.204	2024-10-31 19:33:28.114	2024-10-31 19:33:10.205	\N	\N	\N
2	txmsql55yc738v8hoe40dv7d	secondtoken		full-access	1e7c371fce5b709016e3b3a9f5532f693a223b67150458dca0c8fee6e565f1b558632e966c9671415228f679eccb2ac3fbf66acb436328c22664e96e93537e63	\N	\N	\N	2024-11-04 02:13:28.057	2024-11-04 02:14:31.927	2024-11-04 02:13:28.057	\N	\N	\N
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
8	plugin_content_manager_configuration_content_types::plugin::upload.file	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]},"uid":"plugin::upload.file"}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]},"uid":"plugin::upload.folder"}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::content-releases.release-action	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"contentType","defaultSortBy":"contentType","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"contentType":{"edit":{"label":"contentType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentType","searchable":true,"sortable":true}},"entryDocumentId":{"edit":{"label":"entryDocumentId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"entryDocumentId","searchable":true,"sortable":true}},"release":{"edit":{"label":"release","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"release","searchable":true,"sortable":true}},"isEntryValid":{"edit":{"label":"isEntryValid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEntryValid","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","contentType","entryDocumentId"],"edit":[[{"name":"type","size":6},{"name":"contentType","size":6}],[{"name":"entryDocumentId","size":6},{"name":"release","size":6}],[{"name":"isEntryValid","size":4}]]},"uid":"plugin::content-releases.release-action"}	object	\N	\N
14	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]},"uid":"plugin::users-permissions.role"}	object	\N	\N
20	plugin_content_manager_configuration_content_types::plugin::content-releases.release	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"releasedAt":{"edit":{"label":"releasedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"releasedAt","searchable":true,"sortable":true}},"scheduledAt":{"edit":{"label":"scheduledAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"scheduledAt","searchable":true,"sortable":true}},"timezone":{"edit":{"label":"timezone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"timezone","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"actions":{"edit":{"label":"actions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"contentType"},"list":{"label":"actions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","releasedAt","scheduledAt"],"edit":[[{"name":"name","size":6},{"name":"releasedAt","size":6}],[{"name":"scheduledAt","size":6},{"name":"timezone","size":6}],[{"name":"status","size":6},{"name":"actions","size":6}]]},"uid":"plugin::content-releases.release"}	object	\N	\N
6	plugin_content_manager_configuration_components::shared.media	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"file":{"edit":{"label":"file","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"file","searchable":false,"sortable":false}}},"layouts":{"list":["id","file"],"edit":[[{"name":"file","size":6}]]},"uid":"shared.media","isComponent":true}	object	\N	\N
5	plugin_content_manager_configuration_components::shared.quote	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"body":{"edit":{"label":"body","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"body","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","body"],"edit":[[{"name":"title","size":6},{"name":"body","size":6}]]},"uid":"shared.quote","isComponent":true}	object	\N	\N
7	plugin_content_manager_configuration_components::shared.json-rich-text	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"text":{"edit":{"label":"text","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"text","searchable":false,"sortable":false}}},"layouts":{"list":["id"],"edit":[[{"name":"text","size":12}]]},"uid":"shared.json-rich-text","isComponent":true}	object	\N	\N
1	strapi_content_types_schema	{"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"files"}}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"plugin":"upload","globalId":"UploadFile","uid":"plugin::upload.file","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelName":"file"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"upload_folders"}}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"plugin":"upload","globalId":"UploadFolder","uid":"plugin::upload.folder","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true}},"kind":"collectionType"},"modelName":"folder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::i18n.locale","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"i18n_locale"}}},"plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale","uid":"plugin::i18n.locale","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"i18n_locale","info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelName":"locale"},"plugin::content-releases.release":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_releases"}}},"plugin":"content-releases","globalId":"ContentReleasesRelease","uid":"plugin::content-releases.release","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"}},"kind":"collectionType"},"modelName":"release"},"plugin::content-releases.release-action":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_release_actions"}}},"plugin":"content-releases","globalId":"ContentReleasesReleaseAction","uid":"plugin::content-releases.release-action","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"}},"kind":"collectionType"},"modelName":"release-action"},"plugin::review-workflows.workflow":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"contentTypes":{"type":"json","required":true,"default":"[]"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflow","uid":"plugin::review-workflows.workflow","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"contentTypes":{"type":"json","required":true,"default":"[]"}},"kind":"collectionType"},"modelName":"workflow"},"plugin::review-workflows.workflow-stage":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0","draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow-stage","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows_stages"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflowStage","uid":"plugin::review-workflows.workflow-stage","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false}},"kind":"collectionType"},"modelName":"workflow-stage"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_permissions"}}},"plugin":"users-permissions","globalId":"UsersPermissionsPermission","uid":"plugin::users-permissions.permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelName":"permission","options":{"draftAndPublish":false}},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_roles"}}},"plugin":"users-permissions","globalId":"UsersPermissionsRole","uid":"plugin::users-permissions.role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelName":"role","options":{"draftAndPublish":false}},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true,"draftAndPublish":false},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"plugin":"users-permissions","globalId":"UsersPermissionsUser","uid":"plugin::users-permissions.user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelName":"user"},"api::about.about":{"kind":"singleType","collectionName":"abouts","info":{"singularName":"about","pluralName":"abouts","displayName":"About","description":"Write about yourself and the content you create"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"title":{"type":"string"},"blocks":{"type":"dynamiczone","components":["shared.media","shared.quote","shared.rich-text","shared.slider"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::about.about","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"abouts"}}},"apiName":"about","globalId":"About","uid":"api::about.about","modelType":"contentType","__schema__":{"collectionName":"abouts","info":{"singularName":"about","pluralName":"abouts","displayName":"About","description":"Write about yourself and the content you create"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"title":{"type":"string"},"blocks":{"type":"dynamiczone","components":["shared.media","shared.quote","shared.rich-text","shared.slider"]}},"kind":"singleType"},"modelName":"about","actions":{},"lifecycles":{}},"api::global.global":{"kind":"singleType","collectionName":"globals","info":{"singularName":"global","pluralName":"globals","displayName":"Global","description":"Define global settings"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"siteName":{"type":"string","required":true},"favicon":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos"]},"siteDescription":{"type":"text","required":true},"defaultSeo":{"type":"component","repeatable":false,"component":"shared.seo"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::global.global","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"globals"}}},"apiName":"global","globalId":"Global","uid":"api::global.global","modelType":"contentType","__schema__":{"collectionName":"globals","info":{"singularName":"global","pluralName":"globals","displayName":"Global","description":"Define global settings"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"siteName":{"type":"string","required":true},"favicon":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos"]},"siteDescription":{"type":"text","required":true},"defaultSeo":{"type":"component","repeatable":false,"component":"shared.seo"}},"kind":"singleType"},"modelName":"global","actions":{},"lifecycles":{}},"api::jobpost.jobpost":{"kind":"collectionType","collectionName":"jobposts","info":{"singularName":"jobpost","pluralName":"jobposts","displayName":"Jobpost","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"position":{"type":"string"},"contactemail":{"type":"string"},"date":{"type":"text"},"note":{"type":"text"},"description":{"type":"richtext"},"requirements":{"type":"richtext"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::jobpost.jobpost","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"jobposts"}}},"apiName":"jobpost","globalId":"Jobpost","uid":"api::jobpost.jobpost","modelType":"contentType","__schema__":{"collectionName":"jobposts","info":{"singularName":"jobpost","pluralName":"jobposts","displayName":"Jobpost","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"position":{"type":"string"},"contactemail":{"type":"string"},"date":{"type":"text"},"note":{"type":"text"},"description":{"type":"richtext"},"requirements":{"type":"richtext"}},"kind":"collectionType"},"modelName":"jobpost","actions":{},"lifecycles":{}},"api::landing.landing":{"kind":"singleType","collectionName":"landings","info":{"singularName":"landing","pluralName":"landings","displayName":"Landing","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"tagline":{"type":"string"},"videolink":{"type":"string"},"customarea":{"type":"dynamiczone","components":["shared.media","shared.json-rich-text"]},"banner":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"]},"videocaption":{"type":"string"},"Intro":{"type":"blocks"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::landing.landing","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"landings"}}},"apiName":"landing","globalId":"Landing","uid":"api::landing.landing","modelType":"contentType","__schema__":{"collectionName":"landings","info":{"singularName":"landing","pluralName":"landings","displayName":"Landing","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"tagline":{"type":"string"},"videolink":{"type":"string"},"customarea":{"type":"dynamiczone","components":["shared.media","shared.json-rich-text"]},"banner":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"]},"videocaption":{"type":"string"},"Intro":{"type":"blocks"}},"kind":"singleType"},"modelName":"landing","actions":{},"lifecycles":{}},"api::member.member":{"kind":"collectionType","collectionName":"members","info":{"singularName":"member","pluralName":"members","displayName":"member","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"firstname":{"type":"string"},"lastnames":{"type":"string"},"github":{"type":"string"},"linkedin":{"type":"string"},"bio":{"type":"string"},"email":{"type":"email"},"profilepic":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"position":{"type":"string"},"alum":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::member.member","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"members"}}},"apiName":"member","globalId":"Member","uid":"api::member.member","modelType":"contentType","__schema__":{"collectionName":"members","info":{"singularName":"member","pluralName":"members","displayName":"member","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"firstname":{"type":"string"},"lastnames":{"type":"string"},"github":{"type":"string"},"linkedin":{"type":"string"},"bio":{"type":"string"},"email":{"type":"email"},"profilepic":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"position":{"type":"string"},"alum":{"type":"boolean"}},"kind":"collectionType"},"modelName":"member","actions":{},"lifecycles":{}},"api::project.project":{"kind":"collectionType","collectionName":"projects","info":{"singularName":"project","pluralName":"projects","displayName":"Project","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"banner":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"gallery":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"]},"about":{"type":"blocks"},"members":{"type":"relation","relation":"oneToMany","target":"api::member.member"},"videolink":{"type":"string"},"date":{"type":"date"},"tagline":{"type":"string"},"publications":{"type":"relation","relation":"manyToMany","target":"api::publication.publication","inversedBy":"projects"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::project.project","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"projects"}}},"apiName":"project","globalId":"Project","uid":"api::project.project","modelType":"contentType","__schema__":{"collectionName":"projects","info":{"singularName":"project","pluralName":"projects","displayName":"Project","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"banner":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"gallery":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"]},"about":{"type":"blocks"},"members":{"type":"relation","relation":"oneToMany","target":"api::member.member"},"videolink":{"type":"string"},"date":{"type":"date"},"tagline":{"type":"string"},"publications":{"type":"relation","relation":"manyToMany","target":"api::publication.publication","inversedBy":"projects"}},"kind":"collectionType"},"modelName":"project","actions":{},"lifecycles":{}},"api::publication.publication":{"kind":"collectionType","collectionName":"publications","info":{"singularName":"publication","pluralName":"publications","displayName":"Publication","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"pdflink":{"type":"string"},"paperlink":{"type":"string"},"authors":{"type":"string"},"members":{"type":"relation","relation":"oneToMany","target":"api::member.member"},"date":{"type":"date"},"projects":{"type":"relation","relation":"manyToMany","target":"api::project.project","mappedBy":"publications"},"abstract":{"type":"text"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::publication.publication","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"publications"}}},"apiName":"publication","globalId":"Publication","uid":"api::publication.publication","modelType":"contentType","__schema__":{"collectionName":"publications","info":{"singularName":"publication","pluralName":"publications","displayName":"Publication","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"pdflink":{"type":"string"},"paperlink":{"type":"string"},"authors":{"type":"string"},"members":{"type":"relation","relation":"oneToMany","target":"api::member.member"},"date":{"type":"date"},"projects":{"type":"relation","relation":"manyToMany","target":"api::project.project","mappedBy":"publications"},"abstract":{"type":"text"}},"kind":"collectionType"},"modelName":"publication","actions":{},"lifecycles":{}},"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_permissions"}}},"plugin":"admin","globalId":"AdminPermission","uid":"admin::permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelName":"permission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"plugin":"admin","globalId":"AdminUser","uid":"admin::user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelName":"user","options":{"draftAndPublish":false}},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_roles"}}},"plugin":"admin","globalId":"AdminRole","uid":"admin::role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelName":"role"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_tokens"}}},"plugin":"admin","globalId":"AdminApiToken","uid":"admin::api-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"api-token"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_token_permissions"}}},"plugin":"admin","globalId":"AdminApiTokenPermission","uid":"admin::api-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelName":"api-token-permission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_tokens"}}},"plugin":"admin","globalId":"AdminTransferToken","uid":"admin::transfer-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"transfer-token"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_token_permissions"}}},"plugin":"admin","globalId":"AdminTransferTokenPermission","uid":"admin::transfer-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelName":"transfer-token-permission"}}	object	\N	\N
11	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]},"uid":"plugin::i18n.locale"}	object	\N	\N
12	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow-stage	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"color":{"edit":{"label":"color","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"color","searchable":true,"sortable":true}},"workflow":{"edit":{"label":"workflow","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"workflow","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","color","workflow"],"edit":[[{"name":"name","size":6},{"name":"color","size":6}],[{"name":"workflow","size":6},{"name":"permissions","size":6}]]},"uid":"plugin::review-workflows.workflow-stage"}	object	\N	\N
17	plugin_content_manager_configuration_content_types::api::global.global	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"siteName","defaultSortBy":"siteName","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"siteName":{"edit":{"label":"siteName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"siteName","searchable":true,"sortable":true}},"favicon":{"edit":{"label":"favicon","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"favicon","searchable":false,"sortable":false}},"siteDescription":{"edit":{"label":"siteDescription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"siteDescription","searchable":true,"sortable":true}},"defaultSeo":{"edit":{"label":"defaultSeo","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"defaultSeo","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","siteName","favicon","siteDescription"],"edit":[[{"name":"siteName","size":6},{"name":"favicon","size":6}],[{"name":"siteDescription","size":6}],[{"name":"defaultSeo","size":12}]]},"uid":"api::global.global"}	object	\N	\N
23	plugin_content_manager_configuration_content_types::api::project.project	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"banner":{"edit":{"label":"banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"gallery":{"edit":{"label":"gallery","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"gallery","searchable":false,"sortable":false}},"about":{"edit":{"label":"about","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"about","searchable":false,"sortable":false}},"members":{"edit":{"label":"members","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"members","searchable":false,"sortable":false}},"videolink":{"edit":{"label":"videolink","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"videolink","searchable":true,"sortable":true}},"date":{"edit":{"label":"date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"date","searchable":true,"sortable":true}},"tagline":{"edit":{"label":"tagline","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"tagline","searchable":true,"sortable":true}},"publications":{"edit":{"label":"publications","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"publications","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","banner","gallery"],"edit":[[{"name":"name","size":6},{"name":"banner","size":6}],[{"name":"gallery","size":6}],[{"name":"about","size":12}],[{"name":"members","size":6},{"name":"videolink","size":6}],[{"name":"date","size":4},{"name":"tagline","size":6}],[{"name":"publications","size":6}]]},"uid":"api::project.project"}	object	\N	\N
24	plugin_content_manager_configuration_content_types::api::publication.publication	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pdflink":{"edit":{"label":"pdflink","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pdflink","searchable":true,"sortable":true}},"paperlink":{"edit":{"label":"paperlink","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"paperlink","searchable":true,"sortable":true}},"authors":{"edit":{"label":"authors","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"authors","searchable":true,"sortable":true}},"members":{"edit":{"label":"members","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"members","searchable":false,"sortable":false}},"date":{"edit":{"label":"date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"date","searchable":true,"sortable":true}},"projects":{"edit":{"label":"projects","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"projects","searchable":false,"sortable":false}},"abstract":{"edit":{"label":"abstract","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"abstract","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pdflink","paperlink"],"edit":[[{"name":"name","size":6},{"name":"pdflink","size":6}],[{"name":"paperlink","size":6},{"name":"authors","size":6}],[{"name":"members","size":6},{"name":"date","size":4}],[{"name":"projects","size":6},{"name":"abstract","size":6}]]},"uid":"api::publication.publication"}	object	\N	\N
13	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.permission"}	object	\N	\N
27	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::api-token-permission"}	object	\N	\N
19	plugin_content_manager_configuration_content_types::api::landing.landing	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"tagline","defaultSortBy":"tagline","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"tagline":{"edit":{"label":"tagline","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"tagline","searchable":true,"sortable":true}},"videolink":{"edit":{"label":"videolink","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"videolink","searchable":true,"sortable":true}},"customarea":{"edit":{"label":"customarea","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"customarea","searchable":false,"sortable":false}},"banner":{"edit":{"label":"banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"videocaption":{"edit":{"label":"videocaption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"videocaption","searchable":true,"sortable":true}},"Intro":{"edit":{"label":"Intro","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Intro","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"tagline","size":6}],[{"name":"banner","size":6}],[{"name":"Intro","size":12}],[{"name":"videolink","size":6}],[{"name":"videocaption","size":6}],[{"name":"customarea","size":12}]],"list":["id","tagline","videolink","banner"]},"uid":"api::landing.landing"}	object	\N	\N
15	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"stages":{"edit":{"label":"stages","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stages","searchable":false,"sortable":false}},"contentTypes":{"edit":{"label":"contentTypes","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentTypes","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","stages","createdAt"],"edit":[[{"name":"name","size":6},{"name":"stages","size":6}],[{"name":"contentTypes","size":12}]]},"uid":"plugin::review-workflows.workflow"}	object	\N	\N
31	plugin_content_manager_configuration_content_types::admin::api-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]},"uid":"admin::api-token"}	object	\N	\N
21	plugin_content_manager_configuration_content_types::api::member.member	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastnames":{"edit":{"label":"lastnames","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastnames","searchable":true,"sortable":true}},"github":{"edit":{"label":"github","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"github","searchable":true,"sortable":true}},"linkedin":{"edit":{"label":"linkedin","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"linkedin","searchable":true,"sortable":true}},"bio":{"edit":{"label":"bio","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"bio","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"profilepic":{"edit":{"label":"profilepic","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"profilepic","searchable":false,"sortable":false}},"position":{"edit":{"label":"position","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"position","searchable":true,"sortable":true}},"alum":{"edit":{"label":"alum","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alum","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastnames","github"],"edit":[[{"name":"firstname","size":6},{"name":"lastnames","size":6}],[{"name":"github","size":6},{"name":"linkedin","size":6}],[{"name":"bio","size":6},{"name":"email","size":6}],[{"name":"profilepic","size":6},{"name":"position","size":6}],[{"name":"alum","size":4}]]},"uid":"api::member.member"}	object	\N	\N
16	plugin_content_manager_configuration_content_types::api::about.about	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"blocks":{"edit":{"label":"blocks","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocks","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","createdAt","updatedAt"],"edit":[[{"name":"title","size":6}],[{"name":"blocks","size":12}]]},"uid":"api::about.about"}	object	\N	\N
22	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.user"}	object	\N	\N
25	plugin_content_manager_configuration_content_types::admin::permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]},"uid":"admin::permission"}	object	\N	\N
26	plugin_content_manager_configuration_content_types::admin::role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]},"uid":"admin::role"}	object	\N	\N
28	plugin_content_manager_configuration_content_types::admin::transfer-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::transfer-token"}	object	\N	\N
29	plugin_content_manager_configuration_content_types::admin::user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]},"uid":"admin::user"}	object	\N	\N
30	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::transfer-token-permission"}	object	\N	\N
32	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}	object	\N	\N
35	plugin_i18n_default_locale	"en"	string	\N	\N
36	plugin_users-permissions_grant	{"email":{"icon":"envelope","enabled":true},"discord":{"icon":"discord","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"icon":"facebook-square","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/facebook/callback","scope":["email"]},"google":{"icon":"google","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/google/callback","scope":["email"]},"github":{"icon":"github","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"icon":"windows","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"icon":"twitter","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitter/callback"},"instagram":{"icon":"instagram","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"icon":"vk","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/vk/callback","scope":["email"]},"twitch":{"icon":"twitch","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"icon":"linkedin","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"icon":"aws","enabled":false,"key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"icon":"reddit","enabled":false,"key":"","secret":"","callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"icon":"book","enabled":false,"key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"icon":"","enabled":false,"key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]},"keycloak":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"myKeycloakProvider.com/realms/myrealm","callback":"api/auth/keycloak/callback","scope":["openid","email","profile"]}}	object	\N	\N
33	plugin_upload_view_configuration	{"pageSize":20,"sort":"createdAt:DESC"}	object	\N	\N
34	plugin_upload_metrics	{"weeklySchedule":"10 26 19 * * 4","lastWeeklyUpdate":1732213570014}	object	\N	\N
37	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
38	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
2	plugin_content_manager_configuration_components::shared.rich-text	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"body":{"edit":{"label":"body","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"body","searchable":false,"sortable":false}}},"layouts":{"list":["id"],"edit":[[{"name":"body","size":12}]]},"uid":"shared.rich-text","isComponent":true}	object	\N	\N
3	plugin_content_manager_configuration_components::shared.slider	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"files","searchable":false,"sortable":false}}},"layouts":{"list":["id","files"],"edit":[[{"name":"files","size":6}]]},"uid":"shared.slider","isComponent":true}	object	\N	\N
4	plugin_content_manager_configuration_components::shared.seo	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"metaTitle","defaultSortBy":"metaTitle","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"metaTitle":{"edit":{"label":"metaTitle","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaTitle","searchable":true,"sortable":true}},"metaDescription":{"edit":{"label":"metaDescription","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"metaDescription","searchable":true,"sortable":true}},"shareImage":{"edit":{"label":"shareImage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"shareImage","searchable":false,"sortable":false}}},"layouts":{"list":["id","metaTitle","metaDescription","shareImage"],"edit":[[{"name":"metaTitle","size":6},{"name":"metaDescription","size":6}],[{"name":"shareImage","size":6}]]},"uid":"shared.seo","isComponent":true}	object	\N	\N
18	plugin_content_manager_configuration_content_types::api::jobpost.jobpost	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"position","defaultSortBy":"position","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"position":{"edit":{"label":"position","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"position","searchable":true,"sortable":true}},"contactemail":{"edit":{"label":"contactemail","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contactemail","searchable":true,"sortable":true}},"date":{"edit":{"label":"date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"date","searchable":true,"sortable":true}},"note":{"edit":{"label":"note","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"note","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":false,"sortable":false}},"requirements":{"edit":{"label":"requirements","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"requirements","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"position","size":6}],[{"name":"contactemail","size":6}],[{"name":"date","size":6}],[{"name":"description","size":12}],[{"name":"requirements","size":12}],[{"name":"note","size":6}]],"list":["id","position"]},"uid":"api::jobpost.jobpost"}	object	\N	\N
39	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
5	{"tables":[{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_documents_idx","columns":["document_id","locale","published_at"]},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_documents_idx","columns":["document_id","locale","published_at"]},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_documents_idx","columns":["document_id","locale","published_at"]},{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_releases","indexes":[{"name":"strapi_releases_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"released_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"scheduled_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"timezone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_release_actions","indexes":[{"name":"strapi_release_actions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"entry_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_entry_valid","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows","indexes":[{"name":"strapi_workflows_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_types","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_workflows_stages","indexes":[{"name":"strapi_workflows_stages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_roles","indexes":[{"name":"up_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_users","indexes":[{"name":"up_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"abouts_cmps","indexes":[{"name":"abouts_field_idx","columns":["field"]},{"name":"abouts_component_type_idx","columns":["component_type"]},{"name":"abouts_entity_fk","columns":["entity_id"]},{"name":"abouts_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"abouts_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"abouts","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"abouts","indexes":[{"name":"abouts_documents_idx","columns":["document_id","locale","published_at"]},{"name":"abouts_created_by_id_fk","columns":["created_by_id"]},{"name":"abouts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"abouts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"abouts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"globals_cmps","indexes":[{"name":"globals_field_idx","columns":["field"]},{"name":"globals_component_type_idx","columns":["component_type"]},{"name":"globals_entity_fk","columns":["entity_id"]},{"name":"globals_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"globals_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"globals","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"globals","indexes":[{"name":"globals_documents_idx","columns":["document_id","locale","published_at"]},{"name":"globals_created_by_id_fk","columns":["created_by_id"]},{"name":"globals_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"globals_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"globals_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"site_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"site_description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"jobposts","indexes":[{"name":"jobposts_documents_idx","columns":["document_id","locale","published_at"]},{"name":"jobposts_created_by_id_fk","columns":["created_by_id"]},{"name":"jobposts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"jobposts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"jobposts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"position","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"contactemail","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"date","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"note","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"requirements","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"landings_cmps","indexes":[{"name":"landings_field_idx","columns":["field"]},{"name":"landings_component_type_idx","columns":["component_type"]},{"name":"landings_entity_fk","columns":["entity_id"]},{"name":"landings_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"landings_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"landings","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"landings","indexes":[{"name":"landings_documents_idx","columns":["document_id","locale","published_at"]},{"name":"landings_created_by_id_fk","columns":["created_by_id"]},{"name":"landings_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"landings_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"landings_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tagline","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"videolink","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"videocaption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"intro","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"members","indexes":[{"name":"members_documents_idx","columns":["document_id","locale","published_at"]},{"name":"members_created_by_id_fk","columns":["created_by_id"]},{"name":"members_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"members_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"members_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastnames","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"github","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"linkedin","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"bio","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"position","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alum","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"projects","indexes":[{"name":"projects_documents_idx","columns":["document_id","locale","published_at"]},{"name":"projects_created_by_id_fk","columns":["created_by_id"]},{"name":"projects_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"projects_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"projects_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"about","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"videolink","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"date","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tagline","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"publications","indexes":[{"name":"publications_documents_idx","columns":["document_id","locale","published_at"]},{"name":"publications_created_by_id_fk","columns":["created_by_id"]},{"name":"publications_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"publications_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"publications_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"pdflink","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"paperlink","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"authors","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"date","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"abstract","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_users","indexes":[{"name":"admin_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_shared_sliders","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false}]},{"name":"components_shared_seos","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"meta_title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_shared_rich_texts","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"body","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_shared_quotes","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"body","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_shared_media","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false}]},{"name":"components_shared_json_rich_texts","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"text","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_history_versions","indexes":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"]}],"foreignKeys":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"schema","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_mph","indexes":[{"name":"files_related_mph_fk","columns":["file_id"]},{"name":"files_related_mph_oidx","columns":["order"]},{"name":"files_related_mph_idix","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_mph_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_lnk","indexes":[{"name":"files_folder_lnk_fk","columns":["file_id"]},{"name":"files_folder_lnk_ifk","columns":["folder_id"]},{"name":"files_folder_lnk_uq","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_lnk_oifk","columns":["file_ord"]}],"foreignKeys":[{"name":"files_folder_lnk_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_lnk_ifk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_lnk","indexes":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"]},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_lnk_uq","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_lnk_oifk","columns":["folder_ord"]}],"foreignKeys":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions_release_lnk","indexes":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"]},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"]},{"name":"strapi_release_actions_release_lnk_uq","columns":["release_action_id","release_id"],"type":"unique"},{"name":"strapi_release_actions_release_lnk_oifk","columns":["release_action_ord"]}],"foreignKeys":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"],"referencedColumns":["id"],"referencedTable":"strapi_release_actions","onDelete":"CASCADE"},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"],"referencedColumns":["id"],"referencedTable":"strapi_releases","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"release_action_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_action_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_workflow_lnk","indexes":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"]},{"name":"strapi_workflows_stages_workflow_lnk_uq","columns":["workflow_stage_id","workflow_id"],"type":"unique"},{"name":"strapi_workflows_stages_workflow_lnk_oifk","columns":["workflow_stage_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_permissions_lnk","indexes":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"]},{"name":"strapi_workflows_stages_permissions_lnk_uq","columns":["workflow_stage_id","permission_id"],"type":"unique"},{"name":"strapi_workflows_stages_permissions_lnk_ofk","columns":["permission_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_lnk","indexes":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"up_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_lnk","indexes":[{"name":"up_users_role_lnk_fk","columns":["user_id"]},{"name":"up_users_role_lnk_ifk","columns":["role_id"]},{"name":"up_users_role_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"up_users_role_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"projects_members_lnk","indexes":[{"name":"projects_members_lnk_fk","columns":["project_id"]},{"name":"projects_members_lnk_ifk","columns":["member_id"]},{"name":"projects_members_lnk_uq","columns":["project_id","member_id"],"type":"unique"},{"name":"projects_members_lnk_ofk","columns":["member_ord"]}],"foreignKeys":[{"name":"projects_members_lnk_fk","columns":["project_id"],"referencedColumns":["id"],"referencedTable":"projects","onDelete":"CASCADE"},{"name":"projects_members_lnk_ifk","columns":["member_id"],"referencedColumns":["id"],"referencedTable":"members","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"project_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"member_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"member_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"projects_publications_lnk","indexes":[{"name":"projects_publications_lnk_fk","columns":["project_id"]},{"name":"projects_publications_lnk_ifk","columns":["publication_id"]},{"name":"projects_publications_lnk_uq","columns":["project_id","publication_id"],"type":"unique"},{"name":"projects_publications_lnk_ofk","columns":["publication_ord"]},{"name":"projects_publications_lnk_oifk","columns":["project_ord"]}],"foreignKeys":[{"name":"projects_publications_lnk_fk","columns":["project_id"],"referencedColumns":["id"],"referencedTable":"projects","onDelete":"CASCADE"},{"name":"projects_publications_lnk_ifk","columns":["publication_id"],"referencedColumns":["id"],"referencedTable":"publications","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"project_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"publication_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"publication_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"project_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"publications_members_lnk","indexes":[{"name":"publications_members_lnk_fk","columns":["publication_id"]},{"name":"publications_members_lnk_ifk","columns":["member_id"]},{"name":"publications_members_lnk_uq","columns":["publication_id","member_id"],"type":"unique"},{"name":"publications_members_lnk_ofk","columns":["member_ord"]}],"foreignKeys":[{"name":"publications_members_lnk_fk","columns":["publication_id"],"referencedColumns":["id"],"referencedTable":"publications","onDelete":"CASCADE"},{"name":"publications_members_lnk_ifk","columns":["member_id"],"referencedColumns":["id"],"referencedTable":"members","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"publication_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"member_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"member_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_lnk","indexes":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"admin_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_lnk","indexes":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"]},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"]},{"name":"admin_users_roles_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_lnk_ofk","columns":["role_ord"]},{"name":"admin_users_roles_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_lnk","indexes":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_lnk_uq","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_lnk_oifk","columns":["api_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_lnk","indexes":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_uq","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_lnk_oifk","columns":["transfer_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2024-11-14 01:51:23.365	bd821fdf0bc99f0f09bb6cc766baad0c
\.


--
-- Data for Name: strapi_history_versions; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_history_versions (id, content_type, related_document_id, locale, status, data, schema, created_at, created_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_migrations_internal; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_migrations_internal (id, name, "time") FROM stdin;
1	5.0.0-rename-identifiers-longer-than-max-length	2024-10-31 17:20:32.569
2	5.0.0-02-created-document-id	2024-10-31 17:20:32.601
3	5.0.0-03-created-locale	2024-10-31 17:20:32.632
4	5.0.0-04-created-published-at	2024-10-31 17:20:32.66
5	5.0.0-05-drop-slug-fields-index	2024-10-31 17:20:32.688
6	core::5.0.0-discard-drafts	2024-10-31 17:20:32.715
\.


--
-- Data for Name: strapi_release_actions; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_release_actions (id, document_id, type, content_type, entry_document_id, locale, is_entry_valid, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_release_actions_release_lnk; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_release_actions_release_lnk (id, release_action_id, release_id, release_action_ord) FROM stdin;
\.


--
-- Data for Name: strapi_releases; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_releases (id, document_id, name, released_at, scheduled_at, timezone, status, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_transfer_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_transfer_token_permissions_token_lnk (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_transfer_tokens (id, document_id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: strapi_workflows; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_workflows (id, document_id, name, content_types, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_workflows_stages (id, document_id, name, color, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages_permissions_lnk; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_workflows_stages_permissions_lnk (id, workflow_stage_id, permission_id, permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages_workflow_lnk; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.strapi_workflows_stages_workflow_lnk (id, workflow_stage_id, workflow_id, workflow_stage_ord) FROM stdin;
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.up_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	n23elqv2z1nbyyfiqe8ex4td	plugin::users-permissions.user.me	2024-10-31 17:20:33.449	2024-10-31 17:20:33.449	2024-10-31 17:20:33.449	\N	\N	\N
2	tx51xr4ou49wqtjuuk6h7smy	plugin::users-permissions.auth.changePassword	2024-10-31 17:20:33.449	2024-10-31 17:20:33.449	2024-10-31 17:20:33.45	\N	\N	\N
3	xadeha0j33fgxlndpir9mkbg	plugin::users-permissions.auth.callback	2024-10-31 17:20:33.457	2024-10-31 17:20:33.457	2024-10-31 17:20:33.457	\N	\N	\N
4	f8qie1tz25u8lb4orevcawsb	plugin::users-permissions.auth.connect	2024-10-31 17:20:33.457	2024-10-31 17:20:33.457	2024-10-31 17:20:33.457	\N	\N	\N
5	mjzc5k3bx408rcs2rpawklhu	plugin::users-permissions.auth.forgotPassword	2024-10-31 17:20:33.457	2024-10-31 17:20:33.457	2024-10-31 17:20:33.457	\N	\N	\N
6	gddprid0cj2990da0hmxh1hf	plugin::users-permissions.auth.resetPassword	2024-10-31 17:20:33.457	2024-10-31 17:20:33.457	2024-10-31 17:20:33.457	\N	\N	\N
8	x5vfd7fzqjhylywvhfyyjlf0	plugin::users-permissions.auth.emailConfirmation	2024-10-31 17:20:33.457	2024-10-31 17:20:33.457	2024-10-31 17:20:33.457	\N	\N	\N
7	bon18ww5tnf97d1fniimtmyq	plugin::users-permissions.auth.register	2024-10-31 17:20:33.457	2024-10-31 17:20:33.457	2024-10-31 17:20:33.457	\N	\N	\N
9	y9okdr1i6rhma9uhjja19i68	plugin::users-permissions.auth.sendEmailConfirmation	2024-10-31 17:20:33.457	2024-10-31 17:20:33.457	2024-10-31 17:20:33.458	\N	\N	\N
\.


--
-- Data for Name: up_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.up_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	2	1	1
2	1	1	1
3	3	2	1
4	5	2	1
5	4	2	1
6	6	2	1
7	7	2	2
8	8	2	2
9	9	2	2
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.up_roles (id, document_id, name, description, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	bkv94qhypox79mgqydcp8gsp	Authenticated	Default role given to authenticated user.	authenticated	2024-10-31 17:20:33.441	2024-10-31 17:20:33.441	2024-10-31 17:20:33.442	\N	\N	\N
2	ax5zv1chs1dmigzxp0lx6do7	Public	Default role given to unauthenticated user.	public	2024-10-31 17:20:33.444	2024-10-31 17:20:33.444	2024-10-31 17:20:33.445	\N	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.up_users (id, document_id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: up_users_role_lnk; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.up_users_role_lnk (id, user_id, role_id, user_ord) FROM stdin;
\.


--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.upload_folders (id, document_id, name, path_id, path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	wfovpiwesleaaox96r6ro8bg	ROBOPRENEUR Pictures	1	/1	2024-11-17 18:43:12.503	2024-11-17 18:43:12.503	2024-11-17 18:43:12.503	1	1	\N
2	j9n4eklzont7l15a2w6eo86m	SPICE	2	/2	2024-11-18 22:20:13.928	2024-11-18 22:20:13.928	2024-11-18 22:20:13.928	1	1	\N
3	o5zz58s1ui8qlf8jvuz2bv7l	GAME	3	/3	2024-11-21 15:20:07.453	2024-11-21 15:21:23.781	2024-11-21 15:20:07.453	1	1	\N
4	twtudvae14sbtiibu471v0g5	Multimodal Sentiment Analysis based on Video and Audio Inputs	4	/4	2024-11-22 15:41:18.871	2024-11-22 15:41:18.871	2024-11-22 15:41:18.871	9	9	\N
5	fp7sh6z5bzvh896ikaft92vf	Profile Pics	5	/5	2024-11-25 14:35:39	2024-11-25 14:35:39	2024-11-25 14:35:39	1	1	\N
6	i5d75enkmikdcj3bbexj39eb	MM	6	/6	2024-11-26 15:00:58.155	2024-11-26 15:00:58.155	2024-11-26 15:00:58.155	1	1	\N
\.


--
-- Data for Name: upload_folders_parent_lnk; Type: TABLE DATA; Schema: public; Owner: strapiadmin
--

COPY public.upload_folders_parent_lnk (id, folder_id, inv_folder_id, folder_ord) FROM stdin;
\.


--
-- Name: abouts_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.abouts_cmps_id_seq', 1, false);


--
-- Name: abouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.abouts_id_seq', 1, true);


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 180, true);


--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.admin_permissions_role_lnk_id_seq', 180, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 10, true);


--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.admin_users_roles_lnk_id_seq', 25, true);


--
-- Name: components_shared_json_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.components_shared_json_rich_texts_id_seq', 51, true);


--
-- Name: components_shared_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.components_shared_media_id_seq', 49, true);


--
-- Name: components_shared_quotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.components_shared_quotes_id_seq', 1, false);


--
-- Name: components_shared_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.components_shared_rich_texts_id_seq', 1, false);


--
-- Name: components_shared_seos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.components_shared_seos_id_seq', 1, false);


--
-- Name: components_shared_sliders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.components_shared_sliders_id_seq', 1, false);


--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.files_folder_lnk_id_seq', 25, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.files_id_seq', 49, true);


--
-- Name: files_related_mph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.files_related_mph_id_seq', 796, true);


--
-- Name: globals_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.globals_cmps_id_seq', 1, false);


--
-- Name: globals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.globals_id_seq', 1, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- Name: jobposts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.jobposts_id_seq', 26, true);


--
-- Name: landings_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.landings_cmps_id_seq', 198, true);


--
-- Name: landings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.landings_id_seq', 49, true);


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.members_id_seq', 45, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.projects_id_seq', 51, true);


--
-- Name: projects_members_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.projects_members_lnk_id_seq', 81, true);


--
-- Name: projects_publications_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.projects_publications_lnk_id_seq', 30, true);


--
-- Name: publications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.publications_id_seq', 16, true);


--
-- Name: publications_members_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.publications_members_lnk_id_seq', 21, true);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 2, true);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 39, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 5, true);


--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_history_versions_id_seq', 1, false);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_migrations_internal_id_seq', 6, true);


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_release_actions_id_seq', 1, false);


--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_release_actions_release_lnk_id_seq', 1, false);


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_releases_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_workflows_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_permissions_lnk_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_workflow_lnk_id_seq', 1, false);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 9, true);


--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.up_permissions_role_lnk_id_seq', 9, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.up_users_id_seq', 1, false);


--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.up_users_role_lnk_id_seq', 1, false);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 6, true);


--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapiadmin
--

SELECT pg_catalog.setval('public.upload_folders_parent_lnk_id_seq', 1, false);


--
-- Name: abouts_cmps abouts_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.abouts_cmps
    ADD CONSTRAINT abouts_cmps_pkey PRIMARY KEY (id);


--
-- Name: abouts abouts_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.abouts
    ADD CONSTRAINT abouts_pkey PRIMARY KEY (id);


--
-- Name: abouts_cmps abouts_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.abouts_cmps
    ADD CONSTRAINT abouts_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: components_shared_json_rich_texts components_shared_json_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.components_shared_json_rich_texts
    ADD CONSTRAINT components_shared_json_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: components_shared_media components_shared_media_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.components_shared_media
    ADD CONSTRAINT components_shared_media_pkey PRIMARY KEY (id);


--
-- Name: components_shared_quotes components_shared_quotes_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.components_shared_quotes
    ADD CONSTRAINT components_shared_quotes_pkey PRIMARY KEY (id);


--
-- Name: components_shared_rich_texts components_shared_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.components_shared_rich_texts
    ADD CONSTRAINT components_shared_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: components_shared_seos components_shared_seos_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.components_shared_seos
    ADD CONSTRAINT components_shared_seos_pkey PRIMARY KEY (id);


--
-- Name: components_shared_sliders components_shared_sliders_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.components_shared_sliders
    ADD CONSTRAINT components_shared_sliders_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_uq UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_mph files_related_mph_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_pkey PRIMARY KEY (id);


--
-- Name: globals_cmps globals_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.globals_cmps
    ADD CONSTRAINT globals_cmps_pkey PRIMARY KEY (id);


--
-- Name: globals globals_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.globals
    ADD CONSTRAINT globals_pkey PRIMARY KEY (id);


--
-- Name: globals_cmps globals_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.globals_cmps
    ADD CONSTRAINT globals_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: jobposts jobposts_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.jobposts
    ADD CONSTRAINT jobposts_pkey PRIMARY KEY (id);


--
-- Name: landings_cmps landings_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.landings_cmps
    ADD CONSTRAINT landings_cmps_pkey PRIMARY KEY (id);


--
-- Name: landings landings_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.landings
    ADD CONSTRAINT landings_pkey PRIMARY KEY (id);


--
-- Name: landings_cmps landings_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.landings_cmps
    ADD CONSTRAINT landings_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: projects_members_lnk projects_members_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.projects_members_lnk
    ADD CONSTRAINT projects_members_lnk_pkey PRIMARY KEY (id);


--
-- Name: projects_members_lnk projects_members_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.projects_members_lnk
    ADD CONSTRAINT projects_members_lnk_uq UNIQUE (project_id, member_id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: projects_publications_lnk projects_publications_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.projects_publications_lnk
    ADD CONSTRAINT projects_publications_lnk_pkey PRIMARY KEY (id);


--
-- Name: projects_publications_lnk projects_publications_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.projects_publications_lnk
    ADD CONSTRAINT projects_publications_lnk_uq UNIQUE (project_id, publication_id);


--
-- Name: publications_members_lnk publications_members_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.publications_members_lnk
    ADD CONSTRAINT publications_members_lnk_pkey PRIMARY KEY (id);


--
-- Name: publications_members_lnk publications_members_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.publications_members_lnk
    ADD CONSTRAINT publications_members_lnk_uq UNIQUE (publication_id, member_id);


--
-- Name: publications publications_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_uq UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_history_versions strapi_history_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations_internal strapi_migrations_internal_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_migrations_internal
    ADD CONSTRAINT strapi_migrations_internal_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions strapi_release_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_uq UNIQUE (release_action_id, release_id);


--
-- Name: strapi_releases strapi_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_uq UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows strapi_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_uq UNIQUE (workflow_stage_id, permission_id);


--
-- Name: strapi_workflows_stages strapi_workflows_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_uq UNIQUE (workflow_stage_id, workflow_id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_uq UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: abouts_component_type_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX abouts_component_type_idx ON public.abouts_cmps USING btree (component_type);


--
-- Name: abouts_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX abouts_created_by_id_fk ON public.abouts USING btree (created_by_id);


--
-- Name: abouts_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX abouts_documents_idx ON public.abouts USING btree (document_id, locale, published_at);


--
-- Name: abouts_entity_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX abouts_entity_fk ON public.abouts_cmps USING btree (entity_id);


--
-- Name: abouts_field_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX abouts_field_idx ON public.abouts_cmps USING btree (field);


--
-- Name: abouts_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX abouts_updated_by_id_fk ON public.abouts USING btree (updated_by_id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX admin_permissions_documents_idx ON public.admin_permissions USING btree (document_id, locale, published_at);


--
-- Name: admin_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX admin_permissions_role_lnk_fk ON public.admin_permissions_role_lnk USING btree (permission_id);


--
-- Name: admin_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX admin_permissions_role_lnk_ifk ON public.admin_permissions_role_lnk USING btree (role_id);


--
-- Name: admin_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX admin_permissions_role_lnk_oifk ON public.admin_permissions_role_lnk USING btree (permission_ord);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX admin_roles_documents_idx ON public.admin_roles USING btree (document_id, locale, published_at);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX admin_users_documents_idx ON public.admin_users USING btree (document_id, locale, published_at);


--
-- Name: admin_users_roles_lnk_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX admin_users_roles_lnk_fk ON public.admin_users_roles_lnk USING btree (user_id);


--
-- Name: admin_users_roles_lnk_ifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX admin_users_roles_lnk_ifk ON public.admin_users_roles_lnk USING btree (role_id);


--
-- Name: admin_users_roles_lnk_ofk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX admin_users_roles_lnk_ofk ON public.admin_users_roles_lnk USING btree (role_ord);


--
-- Name: admin_users_roles_lnk_oifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX admin_users_roles_lnk_oifk ON public.admin_users_roles_lnk USING btree (user_ord);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX files_documents_idx ON public.files USING btree (document_id, locale, published_at);


--
-- Name: files_folder_lnk_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX files_folder_lnk_fk ON public.files_folder_lnk USING btree (file_id);


--
-- Name: files_folder_lnk_ifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX files_folder_lnk_ifk ON public.files_folder_lnk USING btree (folder_id);


--
-- Name: files_folder_lnk_oifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX files_folder_lnk_oifk ON public.files_folder_lnk USING btree (file_ord);


--
-- Name: files_related_mph_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX files_related_mph_fk ON public.files_related_mph USING btree (file_id);


--
-- Name: files_related_mph_idix; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX files_related_mph_idix ON public.files_related_mph USING btree (related_id);


--
-- Name: files_related_mph_oidx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX files_related_mph_oidx ON public.files_related_mph USING btree ("order");


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: globals_component_type_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX globals_component_type_idx ON public.globals_cmps USING btree (component_type);


--
-- Name: globals_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX globals_created_by_id_fk ON public.globals USING btree (created_by_id);


--
-- Name: globals_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX globals_documents_idx ON public.globals USING btree (document_id, locale, published_at);


--
-- Name: globals_entity_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX globals_entity_fk ON public.globals_cmps USING btree (entity_id);


--
-- Name: globals_field_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX globals_field_idx ON public.globals_cmps USING btree (field);


--
-- Name: globals_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX globals_updated_by_id_fk ON public.globals USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX i18n_locale_documents_idx ON public.i18n_locale USING btree (document_id, locale, published_at);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: jobposts_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX jobposts_created_by_id_fk ON public.jobposts USING btree (created_by_id);


--
-- Name: jobposts_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX jobposts_documents_idx ON public.jobposts USING btree (document_id, locale, published_at);


--
-- Name: jobposts_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX jobposts_updated_by_id_fk ON public.jobposts USING btree (updated_by_id);


--
-- Name: landings_component_type_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX landings_component_type_idx ON public.landings_cmps USING btree (component_type);


--
-- Name: landings_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX landings_created_by_id_fk ON public.landings USING btree (created_by_id);


--
-- Name: landings_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX landings_documents_idx ON public.landings USING btree (document_id, locale, published_at);


--
-- Name: landings_entity_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX landings_entity_fk ON public.landings_cmps USING btree (entity_id);


--
-- Name: landings_field_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX landings_field_idx ON public.landings_cmps USING btree (field);


--
-- Name: landings_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX landings_updated_by_id_fk ON public.landings USING btree (updated_by_id);


--
-- Name: members_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX members_created_by_id_fk ON public.members USING btree (created_by_id);


--
-- Name: members_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX members_documents_idx ON public.members USING btree (document_id, locale, published_at);


--
-- Name: members_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX members_updated_by_id_fk ON public.members USING btree (updated_by_id);


--
-- Name: projects_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX projects_created_by_id_fk ON public.projects USING btree (created_by_id);


--
-- Name: projects_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX projects_documents_idx ON public.projects USING btree (document_id, locale, published_at);


--
-- Name: projects_members_lnk_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX projects_members_lnk_fk ON public.projects_members_lnk USING btree (project_id);


--
-- Name: projects_members_lnk_ifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX projects_members_lnk_ifk ON public.projects_members_lnk USING btree (member_id);


--
-- Name: projects_members_lnk_ofk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX projects_members_lnk_ofk ON public.projects_members_lnk USING btree (member_ord);


--
-- Name: projects_publications_lnk_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX projects_publications_lnk_fk ON public.projects_publications_lnk USING btree (project_id);


--
-- Name: projects_publications_lnk_ifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX projects_publications_lnk_ifk ON public.projects_publications_lnk USING btree (publication_id);


--
-- Name: projects_publications_lnk_ofk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX projects_publications_lnk_ofk ON public.projects_publications_lnk USING btree (publication_ord);


--
-- Name: projects_publications_lnk_oifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX projects_publications_lnk_oifk ON public.projects_publications_lnk USING btree (project_ord);


--
-- Name: projects_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX projects_updated_by_id_fk ON public.projects USING btree (updated_by_id);


--
-- Name: publications_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX publications_created_by_id_fk ON public.publications USING btree (created_by_id);


--
-- Name: publications_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX publications_documents_idx ON public.publications USING btree (document_id, locale, published_at);


--
-- Name: publications_members_lnk_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX publications_members_lnk_fk ON public.publications_members_lnk USING btree (publication_id);


--
-- Name: publications_members_lnk_ifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX publications_members_lnk_ifk ON public.publications_members_lnk USING btree (member_id);


--
-- Name: publications_members_lnk_ofk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX publications_members_lnk_ofk ON public.publications_members_lnk USING btree (member_ord);


--
-- Name: publications_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX publications_updated_by_id_fk ON public.publications USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_api_token_permissions_documents_idx ON public.strapi_api_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_api_token_permissions_token_lnk_fk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_api_token_permissions_token_lnk_ifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_api_token_permissions_token_lnk_oifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_ord);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_api_tokens_documents_idx ON public.strapi_api_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_history_versions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_history_versions_created_by_id_fk ON public.strapi_history_versions USING btree (created_by_id);


--
-- Name: strapi_release_actions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);


--
-- Name: strapi_release_actions_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_release_actions_documents_idx ON public.strapi_release_actions USING btree (document_id, locale, published_at);


--
-- Name: strapi_release_actions_release_lnk_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_release_actions_release_lnk_fk ON public.strapi_release_actions_release_lnk USING btree (release_action_id);


--
-- Name: strapi_release_actions_release_lnk_ifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_release_actions_release_lnk_ifk ON public.strapi_release_actions_release_lnk USING btree (release_id);


--
-- Name: strapi_release_actions_release_lnk_oifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_release_actions_release_lnk_oifk ON public.strapi_release_actions_release_lnk USING btree (release_action_ord);


--
-- Name: strapi_release_actions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);


--
-- Name: strapi_releases_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);


--
-- Name: strapi_releases_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_releases_documents_idx ON public.strapi_releases USING btree (document_id, locale, published_at);


--
-- Name: strapi_releases_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_transfer_token_permissions_documents_idx ON public.strapi_transfer_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_fk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_ifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_oifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_ord);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_transfer_tokens_documents_idx ON public.strapi_transfer_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: strapi_workflows_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_workflows_created_by_id_fk ON public.strapi_workflows USING btree (created_by_id);


--
-- Name: strapi_workflows_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_workflows_documents_idx ON public.strapi_workflows USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stages_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_workflows_stages_created_by_id_fk ON public.strapi_workflows_stages USING btree (created_by_id);


--
-- Name: strapi_workflows_stages_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_workflows_stages_documents_idx ON public.strapi_workflows_stages USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stages_permissions_lnk_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_fk ON public.strapi_workflows_stages_permissions_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ifk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ofk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ofk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_ord);


--
-- Name: strapi_workflows_stages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_workflows_stages_updated_by_id_fk ON public.strapi_workflows_stages USING btree (updated_by_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_fk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_ifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_ifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_oifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_oifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_ord);


--
-- Name: strapi_workflows_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX strapi_workflows_updated_by_id_fk ON public.strapi_workflows USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX up_permissions_documents_idx ON public.up_permissions USING btree (document_id, locale, published_at);


--
-- Name: up_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX up_permissions_role_lnk_fk ON public.up_permissions_role_lnk USING btree (permission_id);


--
-- Name: up_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX up_permissions_role_lnk_ifk ON public.up_permissions_role_lnk USING btree (role_id);


--
-- Name: up_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX up_permissions_role_lnk_oifk ON public.up_permissions_role_lnk USING btree (permission_ord);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX up_roles_documents_idx ON public.up_roles USING btree (document_id, locale, published_at);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX up_users_documents_idx ON public.up_users USING btree (document_id, locale, published_at);


--
-- Name: up_users_role_lnk_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX up_users_role_lnk_fk ON public.up_users_role_lnk USING btree (user_id);


--
-- Name: up_users_role_lnk_ifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX up_users_role_lnk_ifk ON public.up_users_role_lnk USING btree (role_id);


--
-- Name: up_users_role_lnk_oifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX up_users_role_lnk_oifk ON public.up_users_role_lnk USING btree (user_ord);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_documents_idx; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX upload_folders_documents_idx ON public.upload_folders USING btree (document_id, locale, published_at);


--
-- Name: upload_folders_parent_lnk_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX upload_folders_parent_lnk_fk ON public.upload_folders_parent_lnk USING btree (folder_id);


--
-- Name: upload_folders_parent_lnk_ifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX upload_folders_parent_lnk_ifk ON public.upload_folders_parent_lnk USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_lnk_oifk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX upload_folders_parent_lnk_oifk ON public.upload_folders_parent_lnk USING btree (folder_ord);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: strapiadmin
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: abouts abouts_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.abouts
    ADD CONSTRAINT abouts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: abouts_cmps abouts_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.abouts_cmps
    ADD CONSTRAINT abouts_entity_fk FOREIGN KEY (entity_id) REFERENCES public.abouts(id) ON DELETE CASCADE;


--
-- Name: abouts abouts_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.abouts
    ADD CONSTRAINT abouts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_lnk files_folder_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_lnk files_folder_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_ifk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_mph files_related_mph_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: globals globals_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.globals
    ADD CONSTRAINT globals_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: globals_cmps globals_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.globals_cmps
    ADD CONSTRAINT globals_entity_fk FOREIGN KEY (entity_id) REFERENCES public.globals(id) ON DELETE CASCADE;


--
-- Name: globals globals_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.globals
    ADD CONSTRAINT globals_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: jobposts jobposts_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.jobposts
    ADD CONSTRAINT jobposts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: jobposts jobposts_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.jobposts
    ADD CONSTRAINT jobposts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: landings landings_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.landings
    ADD CONSTRAINT landings_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: landings_cmps landings_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.landings_cmps
    ADD CONSTRAINT landings_entity_fk FOREIGN KEY (entity_id) REFERENCES public.landings(id) ON DELETE CASCADE;


--
-- Name: landings landings_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.landings
    ADD CONSTRAINT landings_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: members members_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: members members_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: projects projects_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: projects_members_lnk projects_members_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.projects_members_lnk
    ADD CONSTRAINT projects_members_lnk_fk FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: projects_members_lnk projects_members_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.projects_members_lnk
    ADD CONSTRAINT projects_members_lnk_ifk FOREIGN KEY (member_id) REFERENCES public.members(id) ON DELETE CASCADE;


--
-- Name: projects_publications_lnk projects_publications_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.projects_publications_lnk
    ADD CONSTRAINT projects_publications_lnk_fk FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: projects_publications_lnk projects_publications_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.projects_publications_lnk
    ADD CONSTRAINT projects_publications_lnk_ifk FOREIGN KEY (publication_id) REFERENCES public.publications(id) ON DELETE CASCADE;


--
-- Name: projects projects_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: publications publications_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: publications_members_lnk publications_members_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.publications_members_lnk
    ADD CONSTRAINT publications_members_lnk_fk FOREIGN KEY (publication_id) REFERENCES public.publications(id) ON DELETE CASCADE;


--
-- Name: publications_members_lnk publications_members_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.publications_members_lnk
    ADD CONSTRAINT publications_members_lnk_ifk FOREIGN KEY (member_id) REFERENCES public.members(id) ON DELETE CASCADE;


--
-- Name: publications publications_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_ifk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_history_versions strapi_history_versions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions strapi_release_actions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_fk FOREIGN KEY (release_action_id) REFERENCES public.strapi_release_actions(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_ifk FOREIGN KEY (release_id) REFERENCES public.strapi_releases(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions strapi_release_actions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_ifk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows strapi_workflows_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_ifk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_ifk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows strapi_workflows_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_lnk up_users_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_lnk up_users_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_ifk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapiadmin
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO strapiadmin;


--
-- PostgreSQL database dump complete
--

