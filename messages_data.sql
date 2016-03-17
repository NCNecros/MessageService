--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: address_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE address_book (
    id bigint NOT NULL,
    description character varying(255),
    owner character varying(45),
    user_t character varying(45)
);


ALTER TABLE address_book OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE message (
    id bigint NOT NULL,
    date_time timestamp without time zone NOT NULL,
    text character varying(1000) NOT NULL,
    title character varying(255) NOT NULL,
    recipient character varying(45) NOT NULL,
    sender character varying(45) NOT NULL
);


ALTER TABLE message OWNER TO postgres;

--
-- Name: userrole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE userrole (
    userrole_id integer NOT NULL,
    userrole character varying(45) NOT NULL,
    user_username character varying(45)
);


ALTER TABLE userrole OWNER TO postgres;

--
-- Name: userrole_userrole_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE userrole_userrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE userrole_userrole_id_seq OWNER TO postgres;

--
-- Name: userrole_userrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE userrole_userrole_id_seq OWNED BY userrole.userrole_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    username character varying(45) NOT NULL,
    email character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    password character varying(60) NOT NULL,
    surname character varying(255)
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: userrole_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userrole ALTER COLUMN userrole_id SET DEFAULT nextval('userrole_userrole_id_seq'::regclass);


--
-- Name: address_book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address_book
    ADD CONSTRAINT address_book_pkey PRIMARY KEY (id);


--
-- Name: message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- Name: uk_8u5c095v46pjah5tmxuvf5h8x; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address_book
    ADD CONSTRAINT uk_8u5c095v46pjah5tmxuvf5h8x UNIQUE (user_t);


--
-- Name: userrole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userrole
    ADD CONSTRAINT userrole_pkey PRIMARY KEY (userrole_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: fk_6q6jrdl0wrowdwhkqsmtcuke4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address_book
    ADD CONSTRAINT fk_6q6jrdl0wrowdwhkqsmtcuke4 FOREIGN KEY (owner) REFERENCES users(username);


--
-- Name: fk_8l5bwcfajoa0p4opo5av8x39g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY message
    ADD CONSTRAINT fk_8l5bwcfajoa0p4opo5av8x39g FOREIGN KEY (sender) REFERENCES users(username);


--
-- Name: fk_8u5c095v46pjah5tmxuvf5h8x; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address_book
    ADD CONSTRAINT fk_8u5c095v46pjah5tmxuvf5h8x FOREIGN KEY (user_t) REFERENCES users(username);


--
-- Name: fk_avb4fdv0npeq3dmyq3o7yppm4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY message
    ADD CONSTRAINT fk_avb4fdv0npeq3dmyq3o7yppm4 FOREIGN KEY (recipient) REFERENCES users(username);


--
-- Name: fk_goty5lpovb4t6berlocmcy3uj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userrole
    ADD CONSTRAINT fk_goty5lpovb4t6berlocmcy3uj FOREIGN KEY (user_username) REFERENCES users(username);


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

