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
-- Name: astronaut; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronaut (
    astronaut_id integer NOT NULL,
    name character varying(50) NOT NULL,
    birthday date
);


ALTER TABLE public.astronaut OWNER TO freecodecamp;

--
-- Name: astronaut_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronaut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronaut_id_seq OWNER TO freecodecamp;

--
-- Name: astronaut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronaut_id_seq OWNED BY public.astronaut.astronaut_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    age_in_years integer NOT NULL,
    weight numeric NOT NULL,
    do_we_like_it boolean,
    cordinates text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_id integer,
    age_in_years integer NOT NULL,
    weight numeric NOT NULL,
    nickname text,
    mankid_on_moon boolean,
    cordinates text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    star_id integer,
    age_in_years integer NOT NULL,
    weight numeric NOT NULL,
    life_on_planet boolean,
    cordinates text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer,
    age_in_years integer NOT NULL,
    weight numeric NOT NULL,
    cordinates text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: astronaut astronaut_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut ALTER COLUMN astronaut_id SET DEFAULT nextval('public.astronaut_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: astronaut; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronaut VALUES (1, 'Buzz', '1990-02-04');
INSERT INTO public.astronaut VALUES (3, 'Buzz2', '1990-02-04');
INSERT INTO public.astronaut VALUES (4, 'Buzz3', '1990-02-04');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, '1', 25, 35.5, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, '2', 25, 35.5, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, '3', 25, 35.5, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, '4', 25, 35.5, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, '5', 25, 35.5, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, '6', 25, 35.5, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, '1', 9, 23, 43.5, 'Mooners', false, NULL);
INSERT INTO public.moon VALUES (2, '1', 9, 23, 43.5, 'Mooners', false, NULL);
INSERT INTO public.moon VALUES (3, '1', 9, 23, 43.5, 'Mooners', false, NULL);
INSERT INTO public.moon VALUES (4, '1', 9, 23, 43.5, 'Mooners', false, NULL);
INSERT INTO public.moon VALUES (5, '1', 9, 23, 43.5, 'Mooners', false, NULL);
INSERT INTO public.moon VALUES (6, '1', 9, 23, 43.5, 'Mooners', false, NULL);
INSERT INTO public.moon VALUES (7, '1', 9, 23, 43.5, 'Mooners', false, NULL);
INSERT INTO public.moon VALUES (8, '1', 9, 23, 43.5, 'Mooners', false, NULL);
INSERT INTO public.moon VALUES (9, '1', 9, 23, 43.5, 'Mooners', false, NULL);
INSERT INTO public.moon VALUES (10, '1', 9, 23, 43.5, 'Mooners', false, NULL);
INSERT INTO public.moon VALUES (11, '1', 9, 23, 43.5, 'Mooners', false, NULL);
INSERT INTO public.moon VALUES (12, '1super', 9, 23, 43.5, 'Flyer', true, NULL);
INSERT INTO public.moon VALUES (13, '1super', 9, 23, 43.5, 'Flyer', true, NULL);
INSERT INTO public.moon VALUES (14, '1super', 9, 23, 43.5, 'Flyer', true, NULL);
INSERT INTO public.moon VALUES (15, '1super', 9, 23, 43.5, 'Flyer', true, NULL);
INSERT INTO public.moon VALUES (16, '1super', 9, 23, 43.5, 'Flyer', true, NULL);
INSERT INTO public.moon VALUES (17, '1super', 9, 23, 43.5, 'Flyer', true, NULL);
INSERT INTO public.moon VALUES (18, '1super', 9, 23, 43.5, 'Flyer', true, NULL);
INSERT INTO public.moon VALUES (19, '1super', 9, 23, 43.5, 'Flyer', true, NULL);
INSERT INTO public.moon VALUES (20, '1super', 9, 23, 43.5, 'Flyer', true, NULL);
INSERT INTO public.moon VALUES (21, '1super', 9, 23, 43.5, 'Flyer', true, NULL);
INSERT INTO public.moon VALUES (22, '1super', 9, 23, 43.5, 'Flyer', true, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, '1', 2, 354, 22.4, true, NULL);
INSERT INTO public.planet VALUES (2, '2', 2, 354, 22.4, false, NULL);
INSERT INTO public.planet VALUES (3, '22', 2, 354, 22.4, false, NULL);
INSERT INTO public.planet VALUES (4, '43', 2, 354, 22.4, false, NULL);
INSERT INTO public.planet VALUES (5, 'asdas', 2, 354, 22.4, false, NULL);
INSERT INTO public.planet VALUES (6, 'asssdas', 2, 354, 22.4, false, NULL);
INSERT INTO public.planet VALUES (7, 'qwe', 2, 354, 22.4, false, NULL);
INSERT INTO public.planet VALUES (8, 'wer', 2, 354, 22.4, false, NULL);
INSERT INTO public.planet VALUES (9, 'ert', 2, 354, 22.4, false, NULL);
INSERT INTO public.planet VALUES (10, 'rtyt', 2, 354, 22.4, false, NULL);
INSERT INTO public.planet VALUES (11, 'rtyut', 2, 354, 22.4, false, NULL);
INSERT INTO public.planet VALUES (12, 'yuiut', 2, 354, 22.4, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, '1', 2, 35, 128.8, NULL);
INSERT INTO public.star VALUES (2, '2', 3, 35, 128.8, NULL);
INSERT INTO public.star VALUES (3, '3', 3, 35, 128.8, NULL);
INSERT INTO public.star VALUES (4, '4', 3, 35, 128.8, NULL);
INSERT INTO public.star VALUES (5, '5', 1, 35, 128.8, NULL);
INSERT INTO public.star VALUES (6, '55', 5, 35, 128.8, NULL);


--
-- Name: astronaut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronaut_id_seq', 4, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 22, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: astronaut astronaut_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_name_key UNIQUE (name);


--
-- Name: astronaut astronaut_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_pkey PRIMARY KEY (astronaut_id);


--
-- Name: galaxy galaxy_cordinates_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_cordinates_key UNIQUE (cordinates);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_cordinates_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_cordinates_key UNIQUE (cordinates);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_cordinates_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_cordinates_key UNIQUE (cordinates);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_cordinates_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_cordinates_key UNIQUE (cordinates);


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

