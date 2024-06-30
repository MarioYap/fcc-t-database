--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: element; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.element (
    element_id integer NOT NULL,
    name character varying(30) NOT NULL,
    lethality boolean
);


ALTER TABLE public.element OWNER TO freecodecamp;

--
-- Name: elements_element_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.elements_element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elements_element_id_seq OWNER TO freecodecamp;

--
-- Name: elements_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.elements_element_id_seq OWNED BY public.element.element_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(3,1),
    number_of_star integer,
    is_spherical boolean,
    has_life boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(3,1),
    distance_from_parent_planet integer,
    is_spherical boolean,
    has_life boolean,
    description text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(3,1),
    numbers_of_moon integer,
    is_spherical boolean,
    has_life boolean,
    description text,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(3,1),
    numbers_of_planet integer,
    is_spherical boolean,
    has_life boolean,
    description text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: element element_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element ALTER COLUMN element_id SET DEFAULT nextval('public.elements_element_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: element; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.element VALUES (1, 'gas', true);
INSERT INTO public.element VALUES (2, 'liquid', true);
INSERT INTO public.element VALUES (3, 'solid', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'milky way', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'cartwheel', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'tadpole', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'cigar', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'cygnus', NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'moon1', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (3, 'moon2', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (4, 'moon3', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (5, 'moon4', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (6, 'moon5', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (7, 'moon6', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (8, 'moon7', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (9, 'moon8', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (10, 'moon9', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (11, 'moon10', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (12, 'moon11', NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (13, 'moon12', NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (14, 'moon13', NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (15, 'moon14', NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (16, 'moon15', NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (17, 'moon16', NULL, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (18, 'moon17', NULL, NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (19, 'moon18', NULL, NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (20, 'moon19', NULL, NULL, NULL, NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (21, 'moon20', NULL, NULL, NULL, NULL, NULL, NULL, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'imgA', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'imgB', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (3, 'imgC', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (4, 'imgD', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (5, 'imgE', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (6, 'imgF', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (7, 'Mercury', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (8, 'venus', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (9, 'mars', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (10, 'earth', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (11, 'imgG', NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (12, 'imgH', NULL, NULL, NULL, NULL, NULL, NULL, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'apheratz', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'mirach', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'Antares', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (4, 'sun', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (5, 'Arneb', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (6, 'deneb', NULL, NULL, NULL, NULL, NULL, NULL, 6);


--
-- Name: elements_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.elements_element_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: element element_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_name_key UNIQUE (name);


--
-- Name: element elements_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT elements_pkey PRIMARY KEY (element_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

