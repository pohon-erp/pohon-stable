--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: employee; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA employee;


ALTER SCHEMA employee OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = employee, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ref_annual_types; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_annual_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_annual_types OWNER TO postgres;

--
-- Name: ref_annual_types_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_annual_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_annual_types_id_seq OWNER TO postgres;

--
-- Name: ref_annual_types_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_annual_types_id_seq OWNED BY ref_annual_types.id;


--
-- Name: ref_blood_types; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_blood_types (
    id bigint NOT NULL,
    name character varying(255),
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE ref_blood_types OWNER TO postgres;

--
-- Name: ref_blood_types_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_blood_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_blood_types_id_seq OWNER TO postgres;

--
-- Name: ref_blood_types_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_blood_types_id_seq OWNED BY ref_blood_types.id;


--
-- Name: ref_card_types; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_card_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_card_types OWNER TO postgres;

--
-- Name: ref_card_types_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_card_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_card_types_id_seq OWNER TO postgres;

--
-- Name: ref_card_types_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_card_types_id_seq OWNED BY ref_card_types.id;


--
-- Name: ref_educations; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_educations (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    alias character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_educations OWNER TO postgres;

--
-- Name: ref_educations_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_educations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_educations_id_seq OWNER TO postgres;

--
-- Name: ref_educations_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_educations_id_seq OWNED BY ref_educations.id;


--
-- Name: ref_employee_card_numbers; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_employee_card_numbers (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    number character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_employee_card_numbers OWNER TO postgres;

--
-- Name: ref_employee_card_numbers_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_employee_card_numbers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_employee_card_numbers_id_seq OWNER TO postgres;

--
-- Name: ref_employee_card_numbers_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_employee_card_numbers_id_seq OWNED BY ref_employee_card_numbers.id;


--
-- Name: ref_employee_childs; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_employee_childs (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    country_id bigint,
    village_id bigint,
    job_id bigint,
    relation_id bigint,
    education_id bigint,
    gender integer,
    birth_place character varying(255) DEFAULT NULL::character varying,
    birth_date date,
    block_address character varying(255) DEFAULT NULL::character varying,
    street_address text,
    notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_employee_childs OWNER TO postgres;

--
-- Name: ref_employee_childs_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_employee_childs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_employee_childs_id_seq OWNER TO postgres;

--
-- Name: ref_employee_childs_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_employee_childs_id_seq OWNED BY ref_employee_childs.id;


--
-- Name: ref_employee_division; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_employee_division (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_employee_division OWNER TO postgres;

--
-- Name: ref_employee_division_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_employee_division_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_employee_division_id_seq OWNER TO postgres;

--
-- Name: ref_employee_division_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_employee_division_id_seq OWNED BY ref_employee_division.id;


--
-- Name: ref_employee_education; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_employee_education (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    education_id bigint,
    school_name character varying(255) DEFAULT NULL::character varying,
    location character varying(255) DEFAULT NULL::character varying,
    major character varying(255) DEFAULT NULL::character varying,
    legal_number character varying(255) DEFAULT NULL::character varying,
    legal_date date,
    start_date date,
    end_date date,
    notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_employee_education OWNER TO postgres;

--
-- Name: ref_employee_education_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_employee_education_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_employee_education_id_seq OWNER TO postgres;

--
-- Name: ref_employee_education_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_employee_education_id_seq OWNED BY ref_employee_education.id;


--
-- Name: ref_employee_languages; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_employee_languages (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    language_id bigint NOT NULL,
    speak integer DEFAULT 0,
    write integer DEFAULT 0,
    listen integer DEFAULT 0,
    notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_employee_languages OWNER TO postgres;

--
-- Name: ref_employee_languages_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_employee_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_employee_languages_id_seq OWNER TO postgres;

--
-- Name: ref_employee_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_employee_languages_id_seq OWNED BY ref_employee_languages.id;


--
-- Name: ref_employee_parents; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_employee_parents (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    country_id bigint,
    village_id bigint,
    job_id bigint,
    relation_id bigint,
    education_id bigint,
    gender integer,
    birth_place character varying(255) DEFAULT NULL::character varying,
    birth_date date,
    block_address character varying(255) DEFAULT NULL::character varying,
    street_address text,
    notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_employee_parents OWNER TO postgres;

--
-- Name: ref_employee_parents_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_employee_parents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_employee_parents_id_seq OWNER TO postgres;

--
-- Name: ref_employee_parents_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_employee_parents_id_seq OWNED BY ref_employee_parents.id;


--
-- Name: ref_employee_position; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_employee_position (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_employee_position OWNER TO postgres;

--
-- Name: ref_employee_position_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_employee_position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_employee_position_id_seq OWNER TO postgres;

--
-- Name: ref_employee_position_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_employee_position_id_seq OWNED BY ref_employee_position.id;


--
-- Name: ref_employee_punishments; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_employee_punishments (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    punishment_id bigint NOT NULL,
    creator_id bigint,
    approval_id bigint,
    legal_number character varying(255) DEFAULT NULL::character varying,
    legal_date date,
    approval_number character varying(255) DEFAULT NULL::character varying,
    approval_date date,
    notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_employee_punishments OWNER TO postgres;

--
-- Name: ref_employee_punishments_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_employee_punishments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_employee_punishments_id_seq OWNER TO postgres;

--
-- Name: ref_employee_punishments_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_employee_punishments_id_seq OWNED BY ref_employee_punishments.id;


--
-- Name: ref_employee_relation; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_employee_relation (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    country_id bigint,
    village_id bigint,
    job_id bigint,
    relation_id bigint,
    education_id bigint,
    birth_place character varying(255) DEFAULT NULL::character varying,
    birth_date date,
    block_address character varying(255) DEFAULT NULL::character varying,
    street_address text,
    notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_employee_relation OWNER TO postgres;

--
-- Name: ref_employee_relation_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_employee_relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_employee_relation_id_seq OWNER TO postgres;

--
-- Name: ref_employee_relation_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_employee_relation_id_seq OWNED BY ref_employee_relation.id;


--
-- Name: ref_employee_status; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_employee_status (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_employee_status OWNER TO postgres;

--
-- Name: ref_employee_status_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_employee_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_employee_status_id_seq OWNER TO postgres;

--
-- Name: ref_employee_status_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_employee_status_id_seq OWNED BY ref_employee_status.id;


--
-- Name: ref_employee_types; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_employee_types (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_employee_types OWNER TO postgres;

--
-- Name: ref_employee_types_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_employee_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_employee_types_id_seq OWNER TO postgres;

--
-- Name: ref_employee_types_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_employee_types_id_seq OWNED BY ref_employee_types.id;


--
-- Name: ref_employees; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_employees (
    id bigint NOT NULL,
    user_id bigint,
    emp_number character varying(255),
    identity_type_id bigint,
    identity_number character varying(255),
    fullname character varying(255),
    first_title character varying(255),
    last_title character varying(255),
    gender smallint,
    religous_id bigint,
    blood_id bigint,
    status_id bigint,
    country_id bigint,
    village_id bigint,
    birth_province_id bigint,
    birth_regency_id bigint,
    birth_date date,
    wight double precision,
    height double precision,
    hair_id bigint,
    face_id bigint,
    skin_id bigint,
    street_address text,
    block_address character varying(255),
    zip_code character varying(255),
    phone1 character varying(255),
    phone2 character varying(255),
    phone3 character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE ref_employees OWNER TO postgres;

--
-- Name: COLUMN ref_employees.block_address; Type: COMMENT; Schema: employee; Owner: postgres
--

COMMENT ON COLUMN ref_employees.block_address IS 'RT / RW';


--
-- Name: ref_employees_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_employees_id_seq OWNER TO postgres;

--
-- Name: ref_employees_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_employees_id_seq OWNED BY ref_employees.id;


--
-- Name: ref_face_type; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_face_type (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_face_type OWNER TO postgres;

--
-- Name: ref_face_type_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_face_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_face_type_id_seq OWNER TO postgres;

--
-- Name: ref_face_type_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_face_type_id_seq OWNED BY ref_face_type.id;


--
-- Name: ref_hair_type; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_hair_type (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_hair_type OWNER TO postgres;

--
-- Name: ref_hair_type_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_hair_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_hair_type_id_seq OWNER TO postgres;

--
-- Name: ref_hair_type_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_hair_type_id_seq OWNED BY ref_hair_type.id;


--
-- Name: ref_identity_type; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_identity_type (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_identity_type OWNER TO postgres;

--
-- Name: ref_identity_type_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_identity_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_identity_type_id_seq OWNER TO postgres;

--
-- Name: ref_identity_type_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_identity_type_id_seq OWNED BY ref_identity_type.id;


--
-- Name: ref_jobs; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_jobs (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    alias character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_jobs OWNER TO postgres;

--
-- Name: ref_jobs_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_jobs_id_seq OWNER TO postgres;

--
-- Name: ref_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_jobs_id_seq OWNED BY ref_jobs.id;


--
-- Name: ref_languages; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_languages (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_languages OWNER TO postgres;

--
-- Name: ref_languages_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_languages_id_seq OWNER TO postgres;

--
-- Name: ref_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_languages_id_seq OWNED BY ref_languages.id;


--
-- Name: ref_level_types; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_level_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_level_types OWNER TO postgres;

--
-- Name: ref_level_types_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_level_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_level_types_id_seq OWNER TO postgres;

--
-- Name: ref_level_types_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_level_types_id_seq OWNED BY ref_level_types.id;


--
-- Name: ref_mutation_types; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_mutation_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_mutation_types OWNER TO postgres;

--
-- Name: ref_mutation_types_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_mutation_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_mutation_types_id_seq OWNER TO postgres;

--
-- Name: ref_mutation_types_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_mutation_types_id_seq OWNED BY ref_mutation_types.id;


--
-- Name: ref_personal_status; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_personal_status (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_personal_status OWNER TO postgres;

--
-- Name: ref_personal_status_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_personal_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_personal_status_id_seq OWNER TO postgres;

--
-- Name: ref_personal_status_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_personal_status_id_seq OWNED BY ref_personal_status.id;


--
-- Name: ref_punishment_types; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_punishment_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_punishment_types OWNER TO postgres;

--
-- Name: ref_punishment_types_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_punishment_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_punishment_types_id_seq OWNER TO postgres;

--
-- Name: ref_punishment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_punishment_types_id_seq OWNED BY ref_punishment_types.id;


--
-- Name: ref_relations; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_relations (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_relations OWNER TO postgres;

--
-- Name: ref_relations_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_relations_id_seq OWNER TO postgres;

--
-- Name: ref_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_relations_id_seq OWNED BY ref_relations.id;


--
-- Name: ref_religious; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_religious (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_religious OWNER TO postgres;

--
-- Name: ref_religious_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_religious_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_religious_id_seq OWNER TO postgres;

--
-- Name: ref_religious_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_religious_id_seq OWNED BY ref_religious.id;


--
-- Name: ref_skin_types; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE ref_skin_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE ref_skin_types OWNER TO postgres;

--
-- Name: ref_skin_types_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE ref_skin_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_skin_types_id_seq OWNER TO postgres;

--
-- Name: ref_skin_types_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE ref_skin_types_id_seq OWNED BY ref_skin_types.id;


--
-- Name: req_employee_annuals; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE req_employee_annuals (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    approval_id bigint NOT NULL,
    type_id bigint NOT NULL,
    legal_number character varying(255) DEFAULT NULL::character varying,
    legal_date date,
    start_date date,
    end_date date,
    notes text,
    status integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE req_employee_annuals OWNER TO postgres;

--
-- Name: req_employee_annuals_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE req_employee_annuals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE req_employee_annuals_id_seq OWNER TO postgres;

--
-- Name: req_employee_annuals_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE req_employee_annuals_id_seq OWNED BY req_employee_annuals.id;


--
-- Name: req_employee_divisions; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE req_employee_divisions (
    id bigint NOT NULL,
    employee_id bigint,
    division_id bigint,
    legal_number character varying(255),
    legal_date date,
    supervisor_id bigint,
    expired_date date,
    description character varying(255),
    notes text,
    status smallint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    mutation_id bigint
);


ALTER TABLE req_employee_divisions OWNER TO postgres;

--
-- Name: req_employee_divisions_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE req_employee_divisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE req_employee_divisions_id_seq OWNER TO postgres;

--
-- Name: req_employee_divisions_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE req_employee_divisions_id_seq OWNED BY req_employee_divisions.id;


--
-- Name: req_employee_positions; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE req_employee_positions (
    id bigint NOT NULL,
    employee_id bigint,
    level_id bigint,
    position_id bigint,
    legal_number character varying(255),
    legal_date date,
    supervisor_id bigint,
    expired_date date,
    description character varying(255),
    notes text,
    status smallint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE req_employee_positions OWNER TO postgres;

--
-- Name: req_employee_positions_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE req_employee_positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE req_employee_positions_id_seq OWNER TO postgres;

--
-- Name: req_employee_positions_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE req_employee_positions_id_seq OWNED BY req_employee_positions.id;


--
-- Name: req_employee_travels; Type: TABLE; Schema: employee; Owner: postgres
--

CREATE TABLE req_employee_travels (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    approval_id bigint NOT NULL,
    country_id bigint,
    regency_id bigint,
    ticket_number character varying(255) DEFAULT NULL::character varying,
    ticket_date date,
    legal_number character varying(255) DEFAULT NULL::character varying,
    legal_date date,
    start_date date,
    end_date date,
    description text,
    notes text,
    status integer DEFAULT 0,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE req_employee_travels OWNER TO postgres;

--
-- Name: req_employee_travels_id_seq; Type: SEQUENCE; Schema: employee; Owner: postgres
--

CREATE SEQUENCE req_employee_travels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE req_employee_travels_id_seq OWNER TO postgres;

--
-- Name: req_employee_travels_id_seq; Type: SEQUENCE OWNED BY; Schema: employee; Owner: postgres
--

ALTER SEQUENCE req_employee_travels_id_seq OWNED BY req_employee_travels.id;


SET search_path = public, pg_catalog;

--
-- Name: area_countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE area_countries (
    id bigint NOT NULL,
    code character varying(255),
    name character varying(255)
);


ALTER TABLE area_countries OWNER TO postgres;

--
-- Name: area_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE area_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE area_countries_id_seq OWNER TO postgres;

--
-- Name: area_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE area_countries_id_seq OWNED BY area_countries.id;


--
-- Name: area_districts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE area_districts (
    id bigint NOT NULL,
    regency_id bigint,
    code character varying(255),
    name character varying(255)
);


ALTER TABLE area_districts OWNER TO postgres;

--
-- Name: area_districts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE area_districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE area_districts_id_seq OWNER TO postgres;

--
-- Name: area_districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE area_districts_id_seq OWNED BY area_districts.id;


--
-- Name: area_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE area_locations (
    id bigint NOT NULL,
    schema_name character varying(255),
    table_name character varying(255),
    table_id bigint,
    country_id bigint,
    province_id bigint,
    regency_id bigint,
    district_id bigint,
    village_id bigint,
    latitude numeric,
    longitude numeric,
    street_address text,
    arrived_at timestamp(0) without time zone,
    arrived_by bigint
);


ALTER TABLE area_locations OWNER TO postgres;

--
-- Name: area_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE area_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE area_locations_id_seq OWNER TO postgres;

--
-- Name: area_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE area_locations_id_seq OWNED BY area_locations.id;


--
-- Name: area_provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE area_provinces (
    id bigint NOT NULL,
    code character varying(255),
    name character varying(255)
);


ALTER TABLE area_provinces OWNER TO postgres;

--
-- Name: area_provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE area_provinces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE area_provinces_id_seq OWNER TO postgres;

--
-- Name: area_provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE area_provinces_id_seq OWNED BY area_provinces.id;


--
-- Name: area_regencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE area_regencies (
    id bigint NOT NULL,
    province_id bigint,
    code character varying(255),
    name character varying(255)
);


ALTER TABLE area_regencies OWNER TO postgres;

--
-- Name: area_regencies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE area_regencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE area_regencies_id_seq OWNER TO postgres;

--
-- Name: area_regencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE area_regencies_id_seq OWNED BY area_regencies.id;


--
-- Name: area_villages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE area_villages (
    id bigint NOT NULL,
    district_id bigint,
    code character varying(255),
    name character varying(255),
    status smallint
);


ALTER TABLE area_villages OWNER TO postgres;

--
-- Name: area_villages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE area_villages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE area_villages_id_seq OWNER TO postgres;

--
-- Name: area_villages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE area_villages_id_seq OWNED BY area_villages.id;


--
-- Name: auth_audits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_audits (
    id bigint NOT NULL,
    user_id bigint,
    event character varying(255),
    auditable_type character varying(255),
    auditable_name character varying(255),
    old_values text,
    new_values text,
    url character varying(255),
    ip_address character varying(255),
    user_agent text,
    tags text,
    locations text,
    created_at timestamp(0) without time zone
);


ALTER TABLE auth_audits OWNER TO postgres;

--
-- Name: auth_audits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_audits_id_seq OWNER TO postgres;

--
-- Name: auth_audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_audits_id_seq OWNED BY auth_audits.id;


--
-- Name: auth_login_attempts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_login_attempts (
    id bigint NOT NULL,
    ip_address character varying(45),
    login character varying(100) NOT NULL,
    "time" integer,
    CONSTRAINT check_id CHECK ((id >= 0))
);


ALTER TABLE auth_login_attempts OWNER TO postgres;

--
-- Name: auth_login_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_login_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_login_attempts_id_seq OWNER TO postgres;

--
-- Name: auth_login_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_login_attempts_id_seq OWNED BY auth_login_attempts.id;


--
-- Name: auth_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permissions (
    id bigint NOT NULL,
    role_id bigint,
    route_id bigint,
    can_view integer,
    can_create integer,
    can_edit integer,
    can_delete integer
);


ALTER TABLE auth_permissions OWNER TO postgres;

--
-- Name: auth_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permissions_id_seq OWNED BY auth_permissions.id;


--
-- Name: auth_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_roles (
    id bigint NOT NULL,
    name character varying(191) NOT NULL,
    description text,
    CONSTRAINT check_id CHECK ((id >= 0))
);


ALTER TABLE auth_roles OWNER TO postgres;

--
-- Name: auth_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_roles_id_seq OWNER TO postgres;

--
-- Name: auth_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_roles_id_seq OWNED BY auth_roles.id;


--
-- Name: auth_routes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_routes (
    id bigint NOT NULL,
    parent_id bigint,
    name character varying(255),
    icon character varying(255),
    url character varying(255),
    sort smallint
);


ALTER TABLE auth_routes OWNER TO postgres;

--
-- Name: auth_routes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_routes_id_seq OWNER TO postgres;

--
-- Name: auth_routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_routes_id_seq OWNED BY auth_routes.id;


--
-- Name: auth_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_sessions (
    id character varying(128) NOT NULL,
    ip_address character varying(45) NOT NULL,
    "timestamp" bigint DEFAULT 0 NOT NULL,
    data text DEFAULT ''::text NOT NULL
);


ALTER TABLE auth_sessions OWNER TO postgres;

--
-- Name: auth_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_users (
    id bigint NOT NULL,
    ip_address character varying(45),
    username character varying(100),
    password character varying(255) NOT NULL,
    email character varying(254) NOT NULL,
    phone character varying(20),
    activation_selector character varying(255),
    activation_code character varying(255),
    forgotten_password_selector character varying(255),
    forgotten_password_code character varying(255),
    forgotten_password_time integer,
    remember_selector character varying(255),
    remember_code character varying(255),
    created_on integer NOT NULL,
    last_login integer,
    active integer,
    CONSTRAINT check_active CHECK ((active >= 0)),
    CONSTRAINT check_id CHECK ((id >= 0))
);


ALTER TABLE auth_users OWNER TO postgres;

--
-- Name: auth_users_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_users_roles (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    role_id bigint NOT NULL,
    CONSTRAINT users_groups_check_group_id CHECK ((role_id >= 0)),
    CONSTRAINT users_groups_check_id CHECK ((id >= 0)),
    CONSTRAINT users_groups_check_user_id CHECK ((user_id >= 0))
);


ALTER TABLE auth_users_roles OWNER TO postgres;

--
-- Name: auth_users_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_users_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_users_groups_id_seq OWNER TO postgres;

--
-- Name: auth_users_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_users_groups_id_seq OWNED BY auth_users_roles.id;


--
-- Name: auth_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_users_id_seq OWNER TO postgres;

--
-- Name: auth_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_users_id_seq OWNED BY auth_users.id;


--
-- Name: auth_users_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_users_notifications (
    id bigint NOT NULL,
    notification_id bigint,
    user_id bigint,
    is_sender smallint,
    is_recevier smallint,
    readed_at timestamp(0) without time zone
);


ALTER TABLE auth_users_notifications OWNER TO postgres;

--
-- Name: auth_users_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_users_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_users_notifications_id_seq OWNER TO postgres;

--
-- Name: auth_users_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_users_notifications_id_seq OWNED BY auth_users_notifications.id;


--
-- Name: core_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE core_attachments (
    id bigint NOT NULL,
    schema_name character varying(255),
    table_name character varying(255),
    table_id bigint,
    file_name character varying(255),
    size double precision,
    type character varying(255),
    path character varying(255),
    uploaded_by bigint,
    uploaded_at timestamp(0) without time zone
);


ALTER TABLE core_attachments OWNER TO postgres;

--
-- Name: core_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_attachments_id_seq OWNER TO postgres;

--
-- Name: core_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_attachments_id_seq OWNED BY core_attachments.id;


--
-- Name: core_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE core_notifications (
    id bigint NOT NULL,
    subject character varying(255),
    body text,
    status integer,
    created_at timestamp(0) without time zone
);


ALTER TABLE core_notifications OWNER TO postgres;

--
-- Name: core_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_notifications_id_seq OWNER TO postgres;

--
-- Name: core_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_notifications_id_seq OWNED BY core_notifications.id;


--
-- Name: core_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE core_settings (
    id bigint NOT NULL,
    name character varying(255),
    slug character varying(255),
    type integer,
    sort integer,
    body text
);


ALTER TABLE core_settings OWNER TO postgres;

--
-- Name: core_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_settings_id_seq OWNER TO postgres;

--
-- Name: core_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_settings_id_seq OWNED BY core_settings.id;


--
-- Name: ref_currencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ref_currencies (
    id bigint NOT NULL,
    country_id bigint,
    code character varying(255),
    name character varying(255),
    description text
);


ALTER TABLE ref_currencies OWNER TO postgres;

--
-- Name: ref_currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ref_currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_currencies_id_seq OWNER TO postgres;

--
-- Name: ref_currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ref_currencies_id_seq OWNED BY ref_currencies.id;


--
-- Name: ref_social_media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ref_social_media (
    id bigint NOT NULL,
    name character varying(255),
    icon character varying(255),
    url character varying(255)
);


ALTER TABLE ref_social_media OWNER TO postgres;

--
-- Name: ref_social_media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ref_social_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ref_social_media_id_seq OWNER TO postgres;

--
-- Name: ref_social_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ref_social_media_id_seq OWNED BY ref_social_media.id;


SET search_path = employee, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_annual_types ALTER COLUMN id SET DEFAULT nextval('ref_annual_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_blood_types ALTER COLUMN id SET DEFAULT nextval('ref_blood_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_card_types ALTER COLUMN id SET DEFAULT nextval('ref_card_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_educations ALTER COLUMN id SET DEFAULT nextval('ref_educations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_card_numbers ALTER COLUMN id SET DEFAULT nextval('ref_employee_card_numbers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_childs ALTER COLUMN id SET DEFAULT nextval('ref_employee_childs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_division ALTER COLUMN id SET DEFAULT nextval('ref_employee_division_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_education ALTER COLUMN id SET DEFAULT nextval('ref_employee_education_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_languages ALTER COLUMN id SET DEFAULT nextval('ref_employee_languages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_parents ALTER COLUMN id SET DEFAULT nextval('ref_employee_parents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_position ALTER COLUMN id SET DEFAULT nextval('ref_employee_position_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_punishments ALTER COLUMN id SET DEFAULT nextval('ref_employee_punishments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_relation ALTER COLUMN id SET DEFAULT nextval('ref_employee_relation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_status ALTER COLUMN id SET DEFAULT nextval('ref_employee_status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_types ALTER COLUMN id SET DEFAULT nextval('ref_employee_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employees ALTER COLUMN id SET DEFAULT nextval('ref_employees_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_face_type ALTER COLUMN id SET DEFAULT nextval('ref_face_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_hair_type ALTER COLUMN id SET DEFAULT nextval('ref_hair_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_identity_type ALTER COLUMN id SET DEFAULT nextval('ref_identity_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_jobs ALTER COLUMN id SET DEFAULT nextval('ref_jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_languages ALTER COLUMN id SET DEFAULT nextval('ref_languages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_level_types ALTER COLUMN id SET DEFAULT nextval('ref_level_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_mutation_types ALTER COLUMN id SET DEFAULT nextval('ref_mutation_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_personal_status ALTER COLUMN id SET DEFAULT nextval('ref_personal_status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_punishment_types ALTER COLUMN id SET DEFAULT nextval('ref_punishment_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_relations ALTER COLUMN id SET DEFAULT nextval('ref_relations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_religious ALTER COLUMN id SET DEFAULT nextval('ref_religious_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_skin_types ALTER COLUMN id SET DEFAULT nextval('ref_skin_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY req_employee_annuals ALTER COLUMN id SET DEFAULT nextval('req_employee_annuals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY req_employee_divisions ALTER COLUMN id SET DEFAULT nextval('req_employee_divisions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY req_employee_positions ALTER COLUMN id SET DEFAULT nextval('req_employee_positions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY req_employee_travels ALTER COLUMN id SET DEFAULT nextval('req_employee_travels_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY area_countries ALTER COLUMN id SET DEFAULT nextval('area_countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY area_districts ALTER COLUMN id SET DEFAULT nextval('area_districts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY area_locations ALTER COLUMN id SET DEFAULT nextval('area_locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY area_provinces ALTER COLUMN id SET DEFAULT nextval('area_provinces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY area_regencies ALTER COLUMN id SET DEFAULT nextval('area_regencies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY area_villages ALTER COLUMN id SET DEFAULT nextval('area_villages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_audits ALTER COLUMN id SET DEFAULT nextval('auth_audits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_login_attempts ALTER COLUMN id SET DEFAULT nextval('auth_login_attempts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permissions ALTER COLUMN id SET DEFAULT nextval('auth_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_roles ALTER COLUMN id SET DEFAULT nextval('auth_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_routes ALTER COLUMN id SET DEFAULT nextval('auth_routes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_users ALTER COLUMN id SET DEFAULT nextval('auth_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_users_notifications ALTER COLUMN id SET DEFAULT nextval('auth_users_notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_users_roles ALTER COLUMN id SET DEFAULT nextval('auth_users_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_attachments ALTER COLUMN id SET DEFAULT nextval('core_attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_notifications ALTER COLUMN id SET DEFAULT nextval('core_notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_settings ALTER COLUMN id SET DEFAULT nextval('core_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ref_currencies ALTER COLUMN id SET DEFAULT nextval('ref_currencies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ref_social_media ALTER COLUMN id SET DEFAULT nextval('ref_social_media_id_seq'::regclass);


SET search_path = employee, pg_catalog;

--
-- Name: ref_annual_types_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_annual_types
    ADD CONSTRAINT ref_annual_types_pkey PRIMARY KEY (id);


--
-- Name: ref_blood_types_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_blood_types
    ADD CONSTRAINT ref_blood_types_pkey PRIMARY KEY (id);


--
-- Name: ref_card_types_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_card_types
    ADD CONSTRAINT ref_card_types_pkey PRIMARY KEY (id);


--
-- Name: ref_educations_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_educations
    ADD CONSTRAINT ref_educations_pkey PRIMARY KEY (id);


--
-- Name: ref_employee_card_numbers_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_card_numbers
    ADD CONSTRAINT ref_employee_card_numbers_pkey PRIMARY KEY (id);


--
-- Name: ref_employee_childs_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_childs
    ADD CONSTRAINT ref_employee_childs_pkey PRIMARY KEY (id);


--
-- Name: ref_employee_division_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_division
    ADD CONSTRAINT ref_employee_division_pkey PRIMARY KEY (id);


--
-- Name: ref_employee_education_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_education
    ADD CONSTRAINT ref_employee_education_pkey PRIMARY KEY (id);


--
-- Name: ref_employee_languages_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_languages
    ADD CONSTRAINT ref_employee_languages_pkey PRIMARY KEY (id);


--
-- Name: ref_employee_parents_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_parents
    ADD CONSTRAINT ref_employee_parents_pkey PRIMARY KEY (id);


--
-- Name: ref_employee_position_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_position
    ADD CONSTRAINT ref_employee_position_pkey PRIMARY KEY (id);


--
-- Name: ref_employee_punishments_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_punishments
    ADD CONSTRAINT ref_employee_punishments_pkey PRIMARY KEY (id);


--
-- Name: ref_employee_relation_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_relation
    ADD CONSTRAINT ref_employee_relation_pkey PRIMARY KEY (id);


--
-- Name: ref_employee_status_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_status
    ADD CONSTRAINT ref_employee_status_pkey PRIMARY KEY (id);


--
-- Name: ref_employee_types_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employee_types
    ADD CONSTRAINT ref_employee_types_pkey PRIMARY KEY (id);


--
-- Name: ref_employees_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_employees
    ADD CONSTRAINT ref_employees_pkey PRIMARY KEY (id);


--
-- Name: ref_face_type_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_face_type
    ADD CONSTRAINT ref_face_type_pkey PRIMARY KEY (id);


--
-- Name: ref_hair_type_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_hair_type
    ADD CONSTRAINT ref_hair_type_pkey PRIMARY KEY (id);


--
-- Name: ref_identity_type_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_identity_type
    ADD CONSTRAINT ref_identity_type_pkey PRIMARY KEY (id);


--
-- Name: ref_jobs_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_jobs
    ADD CONSTRAINT ref_jobs_pkey PRIMARY KEY (id);


--
-- Name: ref_languages_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_languages
    ADD CONSTRAINT ref_languages_pkey PRIMARY KEY (id);


--
-- Name: ref_level_types_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_level_types
    ADD CONSTRAINT ref_level_types_pkey PRIMARY KEY (id);


--
-- Name: ref_mutation_types_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_mutation_types
    ADD CONSTRAINT ref_mutation_types_pkey PRIMARY KEY (id);


--
-- Name: ref_personal_status_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_personal_status
    ADD CONSTRAINT ref_personal_status_pkey PRIMARY KEY (id);


--
-- Name: ref_punishment_types_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_punishment_types
    ADD CONSTRAINT ref_punishment_types_pkey PRIMARY KEY (id);


--
-- Name: ref_relations_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_relations
    ADD CONSTRAINT ref_relations_pkey PRIMARY KEY (id);


--
-- Name: ref_religious_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_religious
    ADD CONSTRAINT ref_religious_pkey PRIMARY KEY (id);


--
-- Name: ref_skin_types_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY ref_skin_types
    ADD CONSTRAINT ref_skin_types_pkey PRIMARY KEY (id);


--
-- Name: req_employee_annuals_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY req_employee_annuals
    ADD CONSTRAINT req_employee_annuals_pkey PRIMARY KEY (id);


--
-- Name: req_employee_divisions_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY req_employee_divisions
    ADD CONSTRAINT req_employee_divisions_pkey PRIMARY KEY (id);


--
-- Name: req_employee_positions_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY req_employee_positions
    ADD CONSTRAINT req_employee_positions_pkey PRIMARY KEY (id);


--
-- Name: req_employee_travels_pkey; Type: CONSTRAINT; Schema: employee; Owner: postgres
--

ALTER TABLE ONLY req_employee_travels
    ADD CONSTRAINT req_employee_travels_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- Name: area_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY area_countries
    ADD CONSTRAINT area_countries_pkey PRIMARY KEY (id);


--
-- Name: area_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY area_locations
    ADD CONSTRAINT area_locations_pkey PRIMARY KEY (id);


--
-- Name: area_provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY area_provinces
    ADD CONSTRAINT area_provinces_pkey PRIMARY KEY (id);


--
-- Name: area_regencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY area_regencies
    ADD CONSTRAINT area_regencies_pkey PRIMARY KEY (id);


--
-- Name: area_villages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY area_villages
    ADD CONSTRAINT area_villages_pkey PRIMARY KEY (id);


--
-- Name: ref_currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ref_currencies
    ADD CONSTRAINT ref_currencies_pkey PRIMARY KEY (id);


--
-- Name: ref_social_media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ref_social_media
    ADD CONSTRAINT ref_social_media_pkey PRIMARY KEY (id);


SET search_path = employee, pg_catalog;

--
-- Name: employee_ref_annual_types_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_annual_types_description_idx ON ref_annual_types USING btree (description);


--
-- Name: employee_ref_annual_types_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_annual_types_name_idx ON ref_annual_types USING btree (name);


--
-- Name: employee_ref_blood_types_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_blood_types_description_idx ON ref_blood_types USING btree (description);


--
-- Name: employee_ref_blood_types_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_blood_types_name_idx ON ref_blood_types USING btree (name);


--
-- Name: employee_ref_card_types_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_card_types_description_idx ON ref_card_types USING btree (description);


--
-- Name: employee_ref_card_types_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_card_types_name_idx ON ref_card_types USING btree (name);


--
-- Name: employee_ref_educations_alias_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_educations_alias_idx ON ref_educations USING btree (alias);


--
-- Name: employee_ref_educations_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_educations_description_idx ON ref_educations USING btree (description);


--
-- Name: employee_ref_educations_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_educations_name_idx ON ref_educations USING btree (name);


--
-- Name: employee_ref_employee_card_numbers_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_card_numbers_description_idx ON ref_employee_card_numbers USING btree (description);


--
-- Name: employee_ref_employee_card_numbers_employee_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_card_numbers_employee_id_idx ON ref_employee_card_numbers USING btree (employee_id);


--
-- Name: employee_ref_employee_card_numbers_number_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_card_numbers_number_idx ON ref_employee_card_numbers USING btree (number);


--
-- Name: employee_ref_employee_childs_birth_place_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_childs_birth_place_idx ON ref_employee_childs USING btree (birth_place);


--
-- Name: employee_ref_employee_childs_block_address_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_childs_block_address_idx ON ref_employee_childs USING btree (block_address);


--
-- Name: employee_ref_employee_childs_country_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_childs_country_id_idx ON ref_employee_childs USING btree (country_id);


--
-- Name: employee_ref_employee_childs_education_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_childs_education_id_idx ON ref_employee_childs USING btree (education_id);


--
-- Name: employee_ref_employee_childs_employee_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_childs_employee_id_idx ON ref_employee_childs USING btree (employee_id);


--
-- Name: employee_ref_employee_childs_gender_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_childs_gender_idx ON ref_employee_childs USING btree (gender);


--
-- Name: employee_ref_employee_childs_job_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_childs_job_id_idx ON ref_employee_childs USING btree (job_id);


--
-- Name: employee_ref_employee_childs_notes_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_childs_notes_idx ON ref_employee_childs USING btree (notes);


--
-- Name: employee_ref_employee_childs_relation_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_childs_relation_id_idx ON ref_employee_childs USING btree (relation_id);


--
-- Name: employee_ref_employee_childs_street_address_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_childs_street_address_idx ON ref_employee_childs USING btree (street_address);


--
-- Name: employee_ref_employee_childs_village_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_childs_village_id_idx ON ref_employee_childs USING btree (village_id);


--
-- Name: employee_ref_employee_division_code_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_division_code_idx ON ref_employee_division USING btree (code);


--
-- Name: employee_ref_employee_division_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_division_description_idx ON ref_employee_division USING btree (description);


--
-- Name: employee_ref_employee_division_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_division_name_idx ON ref_employee_division USING btree (name);


--
-- Name: employee_ref_employee_education_education_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_education_education_id_idx ON ref_employee_education USING btree (education_id);


--
-- Name: employee_ref_employee_education_employee_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_education_employee_id_idx ON ref_employee_education USING btree (employee_id);


--
-- Name: employee_ref_employee_education_legal_number_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_education_legal_number_idx ON ref_employee_education USING btree (legal_number);


--
-- Name: employee_ref_employee_education_location_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_education_location_idx ON ref_employee_education USING btree (location);


--
-- Name: employee_ref_employee_education_major_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_education_major_idx ON ref_employee_education USING btree (major);


--
-- Name: employee_ref_employee_education_notes_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_education_notes_idx ON ref_employee_education USING btree (notes);


--
-- Name: employee_ref_employee_education_school_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_education_school_name_idx ON ref_employee_education USING btree (school_name);


--
-- Name: employee_ref_employee_languages_employee_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_languages_employee_id_idx ON ref_employee_languages USING btree (employee_id);


--
-- Name: employee_ref_employee_languages_language_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_languages_language_id_idx ON ref_employee_languages USING btree (language_id);


--
-- Name: employee_ref_employee_languages_listen_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_languages_listen_idx ON ref_employee_languages USING btree (listen);


--
-- Name: employee_ref_employee_languages_notes_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_languages_notes_idx ON ref_employee_languages USING btree (notes);


--
-- Name: employee_ref_employee_languages_speak_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_languages_speak_idx ON ref_employee_languages USING btree (speak);


--
-- Name: employee_ref_employee_languages_write_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_languages_write_idx ON ref_employee_languages USING btree (write);


--
-- Name: employee_ref_employee_parents_birth_place_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_parents_birth_place_idx ON ref_employee_parents USING btree (birth_place);


--
-- Name: employee_ref_employee_parents_block_address_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_parents_block_address_idx ON ref_employee_parents USING btree (block_address);


--
-- Name: employee_ref_employee_parents_country_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_parents_country_id_idx ON ref_employee_parents USING btree (country_id);


--
-- Name: employee_ref_employee_parents_education_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_parents_education_id_idx ON ref_employee_parents USING btree (education_id);


--
-- Name: employee_ref_employee_parents_employee_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_parents_employee_id_idx ON ref_employee_parents USING btree (employee_id);


--
-- Name: employee_ref_employee_parents_gender_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_parents_gender_idx ON ref_employee_parents USING btree (gender);


--
-- Name: employee_ref_employee_parents_job_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_parents_job_id_idx ON ref_employee_parents USING btree (job_id);


--
-- Name: employee_ref_employee_parents_notes_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_parents_notes_idx ON ref_employee_parents USING btree (notes);


--
-- Name: employee_ref_employee_parents_relation_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_parents_relation_id_idx ON ref_employee_parents USING btree (relation_id);


--
-- Name: employee_ref_employee_parents_street_address_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_parents_street_address_idx ON ref_employee_parents USING btree (street_address);


--
-- Name: employee_ref_employee_parents_village_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_parents_village_id_idx ON ref_employee_parents USING btree (village_id);


--
-- Name: employee_ref_employee_position_code_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_position_code_idx ON ref_employee_position USING btree (code);


--
-- Name: employee_ref_employee_position_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_position_description_idx ON ref_employee_position USING btree (description);


--
-- Name: employee_ref_employee_position_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_position_name_idx ON ref_employee_position USING btree (name);


--
-- Name: employee_ref_employee_punishments_approval_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_punishments_approval_id_idx ON ref_employee_punishments USING btree (approval_id);


--
-- Name: employee_ref_employee_punishments_approval_number_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_punishments_approval_number_idx ON ref_employee_punishments USING btree (approval_number);


--
-- Name: employee_ref_employee_punishments_creator_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_punishments_creator_id_idx ON ref_employee_punishments USING btree (creator_id);


--
-- Name: employee_ref_employee_punishments_employee_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_punishments_employee_id_idx ON ref_employee_punishments USING btree (employee_id);


--
-- Name: employee_ref_employee_punishments_legal_number_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_punishments_legal_number_idx ON ref_employee_punishments USING btree (legal_number);


--
-- Name: employee_ref_employee_punishments_notes_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_punishments_notes_idx ON ref_employee_punishments USING btree (notes);


--
-- Name: employee_ref_employee_punishments_punishment_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_punishments_punishment_id_idx ON ref_employee_punishments USING btree (punishment_id);


--
-- Name: employee_ref_employee_relation_birth_place_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_relation_birth_place_idx ON ref_employee_relation USING btree (birth_place);


--
-- Name: employee_ref_employee_relation_block_address_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_relation_block_address_idx ON ref_employee_relation USING btree (block_address);


--
-- Name: employee_ref_employee_relation_country_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_relation_country_id_idx ON ref_employee_relation USING btree (country_id);


--
-- Name: employee_ref_employee_relation_education_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_relation_education_id_idx ON ref_employee_relation USING btree (education_id);


--
-- Name: employee_ref_employee_relation_employee_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_relation_employee_id_idx ON ref_employee_relation USING btree (employee_id);


--
-- Name: employee_ref_employee_relation_job_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_relation_job_id_idx ON ref_employee_relation USING btree (job_id);


--
-- Name: employee_ref_employee_relation_notes_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_relation_notes_idx ON ref_employee_relation USING btree (notes);


--
-- Name: employee_ref_employee_relation_relation_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_relation_relation_id_idx ON ref_employee_relation USING btree (relation_id);


--
-- Name: employee_ref_employee_relation_street_address_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_relation_street_address_idx ON ref_employee_relation USING btree (street_address);


--
-- Name: employee_ref_employee_relation_village_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_relation_village_id_idx ON ref_employee_relation USING btree (village_id);


--
-- Name: employee_ref_employee_status_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_status_description_idx ON ref_employee_status USING btree (description);


--
-- Name: employee_ref_employee_status_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_status_name_idx ON ref_employee_status USING btree (name);


--
-- Name: employee_ref_employee_types_code_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_types_code_idx ON ref_employee_types USING btree (code);


--
-- Name: employee_ref_employee_types_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_types_description_idx ON ref_employee_types USING btree (description);


--
-- Name: employee_ref_employee_types_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employee_types_name_idx ON ref_employee_types USING btree (name);


--
-- Name: employee_ref_employees_birth_province_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_birth_province_id_idx ON ref_employees USING btree (birth_province_id);


--
-- Name: employee_ref_employees_birth_regency_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_birth_regency_id_idx ON ref_employees USING btree (birth_regency_id);


--
-- Name: employee_ref_employees_block_address_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_block_address_idx ON ref_employees USING btree (block_address);


--
-- Name: employee_ref_employees_blood_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_blood_id_idx ON ref_employees USING btree (blood_id);


--
-- Name: employee_ref_employees_country_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_country_id_idx ON ref_employees USING btree (country_id);


--
-- Name: employee_ref_employees_emp_number_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_emp_number_idx ON ref_employees USING btree (emp_number);


--
-- Name: employee_ref_employees_face_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_face_id_idx ON ref_employees USING btree (face_id);


--
-- Name: employee_ref_employees_first_title_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_first_title_idx ON ref_employees USING btree (first_title);


--
-- Name: employee_ref_employees_fullname_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_fullname_idx ON ref_employees USING btree (fullname);


--
-- Name: employee_ref_employees_hair_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_hair_id_idx ON ref_employees USING btree (hair_id);


--
-- Name: employee_ref_employees_identity_number_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_identity_number_idx ON ref_employees USING btree (identity_number);


--
-- Name: employee_ref_employees_identity_type_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_identity_type_id_idx ON ref_employees USING btree (identity_type_id);


--
-- Name: employee_ref_employees_last_title_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_last_title_idx ON ref_employees USING btree (last_title);


--
-- Name: employee_ref_employees_phone1_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_phone1_idx ON ref_employees USING btree (phone1);


--
-- Name: employee_ref_employees_phone2_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_phone2_idx ON ref_employees USING btree (phone2);


--
-- Name: employee_ref_employees_phone3_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_phone3_idx ON ref_employees USING btree (phone3);


--
-- Name: employee_ref_employees_religous_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_religous_id_idx ON ref_employees USING btree (religous_id);


--
-- Name: employee_ref_employees_skin_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_skin_id_idx ON ref_employees USING btree (skin_id);


--
-- Name: employee_ref_employees_status_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_status_id_idx ON ref_employees USING btree (status_id);


--
-- Name: employee_ref_employees_street_address_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_street_address_idx ON ref_employees USING btree (street_address);


--
-- Name: employee_ref_employees_user_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_user_id_idx ON ref_employees USING btree (user_id);


--
-- Name: employee_ref_employees_village_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_village_id_idx ON ref_employees USING btree (village_id);


--
-- Name: employee_ref_employees_zip_code_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_employees_zip_code_idx ON ref_employees USING btree (zip_code);


--
-- Name: employee_ref_face_type_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_face_type_description_idx ON ref_face_type USING btree (description);


--
-- Name: employee_ref_face_type_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_face_type_name_idx ON ref_face_type USING btree (name);


--
-- Name: employee_ref_hair_type_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_hair_type_description_idx ON ref_hair_type USING btree (description);


--
-- Name: employee_ref_hair_type_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_hair_type_name_idx ON ref_hair_type USING btree (name);


--
-- Name: employee_ref_identity_type_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_identity_type_description_idx ON ref_identity_type USING btree (description);


--
-- Name: employee_ref_identity_type_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_identity_type_name_idx ON ref_identity_type USING btree (name);


--
-- Name: employee_ref_jobs_alias_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_jobs_alias_idx ON ref_jobs USING btree (alias);


--
-- Name: employee_ref_jobs_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_jobs_description_idx ON ref_jobs USING btree (description);


--
-- Name: employee_ref_jobs_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_jobs_name_idx ON ref_jobs USING btree (name);


--
-- Name: employee_ref_languages_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_languages_description_idx ON ref_languages USING btree (description);


--
-- Name: employee_ref_languages_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_languages_name_idx ON ref_languages USING btree (name);


--
-- Name: employee_ref_level_types_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_level_types_description_idx ON ref_level_types USING btree (description);


--
-- Name: employee_ref_level_types_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_level_types_name_idx ON ref_level_types USING btree (name);


--
-- Name: employee_ref_mutation_types_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_mutation_types_description_idx ON ref_mutation_types USING btree (description);


--
-- Name: employee_ref_mutation_types_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_mutation_types_name_idx ON ref_mutation_types USING btree (name);


--
-- Name: employee_ref_personal_status_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_personal_status_description_idx ON ref_personal_status USING btree (description);


--
-- Name: employee_ref_personal_status_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_personal_status_name_idx ON ref_personal_status USING btree (name);


--
-- Name: employee_ref_punishment_types_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_punishment_types_description_idx ON ref_punishment_types USING btree (description);


--
-- Name: employee_ref_punishment_types_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_punishment_types_name_idx ON ref_punishment_types USING btree (name);


--
-- Name: employee_ref_relations_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_relations_description_idx ON ref_relations USING btree (description);


--
-- Name: employee_ref_relations_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_relations_name_idx ON ref_relations USING btree (name);


--
-- Name: employee_ref_religious_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_religious_description_idx ON ref_religious USING btree (description);


--
-- Name: employee_ref_religious_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_religious_name_idx ON ref_religious USING btree (name);


--
-- Name: employee_ref_skin_types_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_skin_types_description_idx ON ref_skin_types USING btree (description);


--
-- Name: employee_ref_skin_types_name_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_ref_skin_types_name_idx ON ref_skin_types USING btree (name);


--
-- Name: employee_req_employee_annuals_approval_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_annuals_approval_id_idx ON req_employee_annuals USING btree (approval_id);


--
-- Name: employee_req_employee_annuals_employee_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_annuals_employee_id_idx ON req_employee_annuals USING btree (employee_id);


--
-- Name: employee_req_employee_annuals_legal_number_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_annuals_legal_number_idx ON req_employee_annuals USING btree (legal_number);


--
-- Name: employee_req_employee_annuals_notes_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_annuals_notes_idx ON req_employee_annuals USING btree (notes);


--
-- Name: employee_req_employee_annuals_status_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_annuals_status_idx ON req_employee_annuals USING btree (status);


--
-- Name: employee_req_employee_annuals_type_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_annuals_type_id_idx ON req_employee_annuals USING btree (type_id);


--
-- Name: employee_req_employee_divisions_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_divisions_description_idx ON req_employee_divisions USING btree (description);


--
-- Name: employee_req_employee_divisions_division_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_divisions_division_id_idx ON req_employee_divisions USING btree (division_id);


--
-- Name: employee_req_employee_divisions_employee_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_divisions_employee_id_idx ON req_employee_divisions USING btree (employee_id);


--
-- Name: employee_req_employee_divisions_legal_number_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_divisions_legal_number_idx ON req_employee_divisions USING btree (legal_number);


--
-- Name: employee_req_employee_divisions_mutation_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_divisions_mutation_id_idx ON req_employee_divisions USING btree (mutation_id);


--
-- Name: employee_req_employee_divisions_notes_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_divisions_notes_idx ON req_employee_divisions USING btree (notes);


--
-- Name: employee_req_employee_divisions_supervisor_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_divisions_supervisor_id_idx ON req_employee_divisions USING btree (supervisor_id);


--
-- Name: employee_req_employee_positions_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_positions_description_idx ON req_employee_positions USING btree (description);


--
-- Name: employee_req_employee_positions_employee_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_positions_employee_id_idx ON req_employee_positions USING btree (employee_id);


--
-- Name: employee_req_employee_positions_legal_number_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_positions_legal_number_idx ON req_employee_positions USING btree (legal_number);


--
-- Name: employee_req_employee_positions_level_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_positions_level_id_idx ON req_employee_positions USING btree (level_id);


--
-- Name: employee_req_employee_positions_notes_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_positions_notes_idx ON req_employee_positions USING btree (notes);


--
-- Name: employee_req_employee_positions_position_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_positions_position_id_idx ON req_employee_positions USING btree (position_id);


--
-- Name: employee_req_employee_positions_supervisor_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_positions_supervisor_id_idx ON req_employee_positions USING btree (supervisor_id);


--
-- Name: employee_req_employee_travels_approval_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_travels_approval_id_idx ON req_employee_travels USING btree (approval_id);


--
-- Name: employee_req_employee_travels_country_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_travels_country_id_idx ON req_employee_travels USING btree (country_id);


--
-- Name: employee_req_employee_travels_description_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_travels_description_idx ON req_employee_travels USING btree (description);


--
-- Name: employee_req_employee_travels_employee_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_travels_employee_id_idx ON req_employee_travels USING btree (employee_id);


--
-- Name: employee_req_employee_travels_legal_number_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_travels_legal_number_idx ON req_employee_travels USING btree (legal_number);


--
-- Name: employee_req_employee_travels_notes_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_travels_notes_idx ON req_employee_travels USING btree (notes);


--
-- Name: employee_req_employee_travels_regency_id_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_travels_regency_id_idx ON req_employee_travels USING btree (regency_id);


--
-- Name: employee_req_employee_travels_status_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_travels_status_idx ON req_employee_travels USING btree (status);


--
-- Name: employee_req_employee_travels_ticket_number_idx; Type: INDEX; Schema: employee; Owner: postgres
--

CREATE INDEX employee_req_employee_travels_ticket_number_idx ON req_employee_travels USING btree (ticket_number);


SET search_path = public, pg_catalog;

--
-- Name: public_area_countries_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_countries_code_idx ON area_countries USING btree (code);


--
-- Name: public_area_countries_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_countries_name_idx ON area_countries USING btree (name);


--
-- Name: public_area_districts_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_districts_code_idx ON area_districts USING btree (code);


--
-- Name: public_area_districts_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_districts_name_idx ON area_districts USING btree (name);


--
-- Name: public_area_districts_regency_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_districts_regency_id_idx ON area_districts USING btree (regency_id);


--
-- Name: public_area_locations_arrived_by_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_locations_arrived_by_idx ON area_locations USING btree (arrived_by);


--
-- Name: public_area_locations_country_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_locations_country_id_idx ON area_locations USING btree (country_id);


--
-- Name: public_area_locations_district_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_locations_district_id_idx ON area_locations USING btree (district_id);


--
-- Name: public_area_locations_province_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_locations_province_id_idx ON area_locations USING btree (province_id);


--
-- Name: public_area_locations_regency_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_locations_regency_id_idx ON area_locations USING btree (regency_id);


--
-- Name: public_area_locations_schema_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_locations_schema_name_idx ON area_locations USING btree (schema_name);


--
-- Name: public_area_locations_street_address_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_locations_street_address_idx ON area_locations USING btree (street_address);


--
-- Name: public_area_locations_table_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_locations_table_id_idx ON area_locations USING btree (table_id);


--
-- Name: public_area_locations_table_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_locations_table_name_idx ON area_locations USING btree (table_name);


--
-- Name: public_area_locations_village_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_locations_village_id_idx ON area_locations USING btree (village_id);


--
-- Name: public_area_provinces_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_provinces_code_idx ON area_provinces USING btree (code);


--
-- Name: public_area_provinces_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_provinces_name_idx ON area_provinces USING btree (name);


--
-- Name: public_area_regencies_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_regencies_code_idx ON area_regencies USING btree (code);


--
-- Name: public_area_regencies_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_regencies_name_idx ON area_regencies USING btree (name);


--
-- Name: public_area_regencies_province_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_regencies_province_id_idx ON area_regencies USING btree (province_id);


--
-- Name: public_area_villages_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_villages_code_idx ON area_villages USING btree (code);


--
-- Name: public_area_villages_district_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_villages_district_id_idx ON area_villages USING btree (district_id);


--
-- Name: public_area_villages_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_area_villages_name_idx ON area_villages USING btree (name);


--
-- Name: public_auth_audits_auditable_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_audits_auditable_name_idx ON auth_audits USING btree (auditable_name);


--
-- Name: public_auth_audits_auditable_type_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_audits_auditable_type_idx ON auth_audits USING btree (auditable_type);


--
-- Name: public_auth_audits_event_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_audits_event_idx ON auth_audits USING btree (event);


--
-- Name: public_auth_audits_ip_address_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_audits_ip_address_idx ON auth_audits USING btree (ip_address);


--
-- Name: public_auth_audits_locations_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_audits_locations_idx ON auth_audits USING btree (locations);


--
-- Name: public_auth_audits_new_values_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_audits_new_values_idx ON auth_audits USING btree (new_values);


--
-- Name: public_auth_audits_old_values_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_audits_old_values_idx ON auth_audits USING btree (old_values);


--
-- Name: public_auth_audits_tags_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_audits_tags_idx ON auth_audits USING btree (tags);


--
-- Name: public_auth_audits_url_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_audits_url_idx ON auth_audits USING btree (url);


--
-- Name: public_auth_audits_user_agent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_audits_user_agent_idx ON auth_audits USING btree (user_agent);


--
-- Name: public_auth_audits_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_audits_user_id_idx ON auth_audits USING btree (user_id);


--
-- Name: public_auth_login_attempts_ip_address_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_login_attempts_ip_address_idx ON auth_login_attempts USING btree (ip_address);


--
-- Name: public_auth_login_attempts_login_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_login_attempts_login_idx ON auth_login_attempts USING btree (login);


--
-- Name: public_auth_login_attempts_time_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_login_attempts_time_idx ON auth_login_attempts USING btree ("time");


--
-- Name: public_auth_permissions_can_create_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_permissions_can_create_idx ON auth_permissions USING btree (can_create);


--
-- Name: public_auth_permissions_can_delete_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_permissions_can_delete_idx ON auth_permissions USING btree (can_delete);


--
-- Name: public_auth_permissions_can_edit_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_permissions_can_edit_idx ON auth_permissions USING btree (can_edit);


--
-- Name: public_auth_permissions_can_view_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_permissions_can_view_idx ON auth_permissions USING btree (can_view);


--
-- Name: public_auth_permissions_role_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_permissions_role_id_idx ON auth_permissions USING btree (role_id);


--
-- Name: public_auth_permissions_route_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_permissions_route_id_idx ON auth_permissions USING btree (route_id);


--
-- Name: public_auth_roles_description_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_roles_description_idx ON auth_roles USING btree (description);


--
-- Name: public_auth_roles_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_roles_name_idx ON auth_roles USING btree (name);


--
-- Name: public_auth_routes_icon_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_routes_icon_idx ON auth_routes USING btree (icon);


--
-- Name: public_auth_routes_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_routes_name_idx ON auth_routes USING btree (name);


--
-- Name: public_auth_routes_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_routes_parent_id_idx ON auth_routes USING btree (parent_id);


--
-- Name: public_auth_routes_url_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_routes_url_idx ON auth_routes USING btree (url);


--
-- Name: public_auth_sessions_data_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_sessions_data_idx ON auth_sessions USING btree (data);


--
-- Name: public_auth_sessions_ip_address_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_sessions_ip_address_idx ON auth_sessions USING btree (ip_address);


--
-- Name: public_auth_sessions_timestamp_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_sessions_timestamp_idx ON auth_sessions USING btree ("timestamp");


--
-- Name: public_auth_users_activation_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_activation_code_idx ON auth_users USING btree (activation_code);


--
-- Name: public_auth_users_activation_selector_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_activation_selector_idx ON auth_users USING btree (activation_selector);


--
-- Name: public_auth_users_active_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_active_idx ON auth_users USING btree (active);


--
-- Name: public_auth_users_created_on_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_created_on_idx ON auth_users USING btree (created_on);


--
-- Name: public_auth_users_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_email_idx ON auth_users USING btree (email);


--
-- Name: public_auth_users_forgotten_password_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_forgotten_password_code_idx ON auth_users USING btree (forgotten_password_code);


--
-- Name: public_auth_users_forgotten_password_selector_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_forgotten_password_selector_idx ON auth_users USING btree (forgotten_password_selector);


--
-- Name: public_auth_users_forgotten_password_time_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_forgotten_password_time_idx ON auth_users USING btree (forgotten_password_time);


--
-- Name: public_auth_users_ip_address_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_ip_address_idx ON auth_users USING btree (ip_address);


--
-- Name: public_auth_users_last_login_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_last_login_idx ON auth_users USING btree (last_login);


--
-- Name: public_auth_users_notifications_notification_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_notifications_notification_id_idx ON auth_users_notifications USING btree (notification_id);


--
-- Name: public_auth_users_notifications_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_notifications_user_id_idx ON auth_users_notifications USING btree (user_id);


--
-- Name: public_auth_users_password_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_password_idx ON auth_users USING btree (password);


--
-- Name: public_auth_users_phone_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_phone_idx ON auth_users USING btree (phone);


--
-- Name: public_auth_users_remember_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_remember_code_idx ON auth_users USING btree (remember_code);


--
-- Name: public_auth_users_remember_selector_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_remember_selector_idx ON auth_users USING btree (remember_selector);


--
-- Name: public_auth_users_roles_group_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_roles_group_id_idx ON auth_users_roles USING btree (role_id);


--
-- Name: public_auth_users_roles_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_roles_user_id_idx ON auth_users_roles USING btree (user_id);


--
-- Name: public_auth_users_username_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_auth_users_username_idx ON auth_users USING btree (username);


--
-- Name: public_core_attachments_file_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_core_attachments_file_name_idx ON core_attachments USING btree (file_name);


--
-- Name: public_core_attachments_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_core_attachments_path_idx ON core_attachments USING btree (path);


--
-- Name: public_core_attachments_schema_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_core_attachments_schema_name_idx ON core_attachments USING btree (schema_name);


--
-- Name: public_core_attachments_table_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_core_attachments_table_id_idx ON core_attachments USING btree (table_id);


--
-- Name: public_core_attachments_table_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_core_attachments_table_name_idx ON core_attachments USING btree (table_name);


--
-- Name: public_core_attachments_type_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_core_attachments_type_idx ON core_attachments USING btree (type);


--
-- Name: public_core_attachments_uploaded_by_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_core_attachments_uploaded_by_idx ON core_attachments USING btree (uploaded_by);


--
-- Name: public_core_notifications_body_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_core_notifications_body_idx ON core_notifications USING btree (body);


--
-- Name: public_core_notifications_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_core_notifications_status_idx ON core_notifications USING btree (status);


--
-- Name: public_core_notifications_subject_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_core_notifications_subject_idx ON core_notifications USING btree (subject);


--
-- Name: public_core_settings_body_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_core_settings_body_idx ON core_settings USING btree (body);


--
-- Name: public_core_settings_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_core_settings_name_idx ON core_settings USING btree (name);


--
-- Name: public_core_settings_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_core_settings_slug_idx ON core_settings USING btree (slug);


--
-- Name: public_core_settings_sort_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_core_settings_sort_idx ON core_settings USING btree (sort);


--
-- Name: public_core_settings_type_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_core_settings_type_idx ON core_settings USING btree (type);


--
-- Name: public_ref_currencies_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_ref_currencies_code_idx ON ref_currencies USING btree (code);


--
-- Name: public_ref_currencies_country_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_ref_currencies_country_id_idx ON ref_currencies USING btree (country_id);


--
-- Name: public_ref_currencies_description_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_ref_currencies_description_idx ON ref_currencies USING btree (description);


--
-- Name: public_ref_currencies_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_ref_currencies_name_idx ON ref_currencies USING btree (name);


--
-- Name: public_ref_social_media_icon_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_ref_social_media_icon_idx ON ref_social_media USING btree (icon);


--
-- Name: public_ref_social_media_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_ref_social_media_name_idx ON ref_social_media USING btree (name);


--
-- Name: public_ref_social_media_url_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_ref_social_media_url_idx ON ref_social_media USING btree (url);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

