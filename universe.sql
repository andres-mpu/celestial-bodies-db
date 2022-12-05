--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    name character varying(20) NOT NULL,
    description text,
    zodiac_name boolean,
    constellation_id integer NOT NULL,
    abbreviation character varying(10)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    constellation_name character varying(40),
    constellation_id integer
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
    name character varying(20),
    description text,
    planet_id integer NOT NULL,
    planet_name character varying(40)
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
    name character varying(20) NOT NULL,
    number_of_moons integer,
    daylength_in_hours numeric(5,1),
    mean_temperature_celcius integer,
    global_magnetic_field boolean,
    star_id integer NOT NULL
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
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    description text,
    age_in_billion_years numeric(2,1),
    galaxy_name character varying(20) NOT NULL,
    galaxy_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES ('Sagittarius', '', true, 1, NULL);
INSERT INTO public.constellation VALUES ('Andromeda', '', false, 2, NULL);
INSERT INTO public.constellation VALUES ('Corvus', '', false, 3, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'A band of light', 'Sagittarius', 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Andromeda is the closest galaxy to the Milky Way', 'Andromeda', 2);
INSERT INTO public.galaxy VALUES (3, 'Antennae Galaxies', 'Appearance is similar to an insects antennae', 'Corvus', 3);
INSERT INTO public.galaxy VALUES (4, 'NGC 68822', 'AKA: Bernard''s Galaxy. A barred irregular galaxy approximately 1.6 million light-years away in the constellation Sagittarius.', 'Sagittarius', 1);
INSERT INTO public.galaxy VALUES (5, 'Messier 32', 'Know as Messier 32: Le Gentil. Named after Guillaume Le Gentil, the French astronomer who discovered it in 1749.', 'Andromeda', 2);
INSERT INTO public.galaxy VALUES (6, 'NGC 6836', 'Intermediate Spiral Galaxy in the Sagittarius constellation sittuated close to the celestial equator.', 'Sagittarius', 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Adrastea', 'Discovered by the Voyager in 1979', 5, 'Jupiter');
INSERT INTO public.moon VALUES (2, 'Aitne', 'Discovered on December 9th 2001 by Scott S. Sheppard, David C. Jewitt and Jan T. Klenya', 5, 'Jupiter');
INSERT INTO public.moon VALUES (3, 'Amalthea', 'Discovered on September 9th, 1892, by American astronomer Edward Emerson Barnard', 5, 'Jupiter');
INSERT INTO public.moon VALUES (4, 'Arche', 'Discovered on October 31st by Scott S. Sheppard at the Mauna Kea Observatory, Hawaii', 5, 'Jupiter');
INSERT INTO public.moon VALUES (5, 'Autonoe', 'Discovered on December 10th, 2001 by Scott S. Sheppard, David C. Jewitt, Jan T. Kleya at the Mauna Kea Observatory, Hawaii.', 5, 'Jupiter');
INSERT INTO public.moon VALUES (6, 'Dia', 'Discovered on December 5th, 2000, by Scott S. Sheppard, David Jewitt, Y.R. Fernandez, and G. Magnier with the 2.2-m reflector on Mauna Kea Observatory, Hawaii.', 5, 'Jupiter');
INSERT INTO public.moon VALUES (7, 'Herse', 'Discovered on February, 27th, by Brett J. Gladman, John J. Kavelaars, Jean-Marc Petit, and Lynne Allen.', 5, 'Jupiter');
INSERT INTO public.moon VALUES (8, 'Io', 'Discovered on January 8th, 1610, by Italian scscientist Galilleo Galilei', 5, 'Jupiter');
INSERT INTO public.moon VALUES (9, 'Metis', 'Discovered in March 1979 by the Voyager Science Team', 5, 'Jupiter');
INSERT INTO public.moon VALUES (10, 'Pandia', 'First Spotted in 2017, the moon''s discovery by Scott S. Sheppard and his team was announced on July of 2018', 5, 'Jupiter');
INSERT INTO public.moon VALUES (11, 'Pasiphae', 'Discovered on January 27th, 1908, by British astronomer Phillibert Jacques Melotte with Greenwich Observatory''s 30-inch Cassegrain telescope.', 5, 'Jupiter');
INSERT INTO public.moon VALUES (12, 'Pasithee', 'Discovered on December 11, 2001 by Scott S. Sheppard, David C. Jewitt and Jan T. Klenya at the Mauna Kea Observatory, Hawaii.', 5, 'Jupiter');
INSERT INTO public.moon VALUES (13, 'Valetudo', 'First spotted in 2017, the moon''s discovery by Scott S. Sheppard and his team was announced in 2018.', 5, 'Jupiter');
INSERT INTO public.moon VALUES (14, 'Thyone', 'Discoverd on December 11, 2001, by Scott S. Sheppard, David C. Jewitt, and Jan T. Kleyna at the Mauna Kae Observtory, Hawaii.', 5, 'Jupiter');
INSERT INTO public.moon VALUES (15, 'Themisto', 'Discovered initially on September 30, 1975 by American astronomer Charles Thomas Kowal and Elizabeth Roemer...', 5, 'Jupiter');
INSERT INTO public.moon VALUES (16, 'Thelxnoe', 'Discovered on February 9th, 2003, by Scott S. Sheppard and Brett J. Gladman at Mauna Kea Observatory, Hawaii.', 5, 'Jupiter');
INSERT INTO public.moon VALUES (17, 'Thebe', 'Discovered in 1980 by the Voyager science team investigating images captured by Voyager 1.', 5, 'Jupiter');
INSERT INTO public.moon VALUES (18, 'Taygete', 'Discovered on November 25th, 2000, by Scott S. Sheppar, David C. Jewitt and Jan T. Klenya at the Mauna Kea Observatory, Hawaii.', 5, 'Jupiter');
INSERT INTO public.moon VALUES (19, 'Sponde', 'Discovered on December 9, 2001, by Scott S. Sheppard, David C. Jewitt and Jan T. Klenya at the Mauna Kea Observatory, Hawaii.', 5, 'Jupiter');
INSERT INTO public.moon VALUES (20, 'Deimos', 'The smallest and outermore of the two natural satellites of the planet Mars with a mean radius of 6.2 km.', 4, 'Mars');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 4222.6, 167, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 2802.0, 464, false, 1);
INSERT INTO public.planet VALUES (3, 'Gaia', 1, 2802.0, 15, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 24.7, -65, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 79, 9.9, -110, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 82, 10.7, -140, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 17.2, -195, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 16.1, -200, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 153.3, -225, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 0, NULL, -105, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 2, NULL, -241, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 0, NULL, -239, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'The star at the center of the Solar System', 4.6, 'Milky Way', 1);
INSERT INTO public.star VALUES (2, 'Vega', 'Vega is the largest star in the northern constellation of Lira', 0.4, 'Milky Way', 1);
INSERT INTO public.star VALUES (3, 'Arcturus', 'Arcturus is the brightest star in the northern constellation of Bootes', 7.1, 'Milky Way', 1);
INSERT INTO public.star VALUES (4, 'KY Cygni', 'A red supergiant of spectral class M3.5la located in the constellation of Cygnus.', NULL, 'Milky Way', 1);
INSERT INTO public.star VALUES (5, 'BC Cygni', 'A red supergiant and pulsating variable star of spectral type M3.5la in the constellation Cygnus.', NULL, 'Milky Way', 1);
INSERT INTO public.star VALUES (6, 'LL Pegasi', 'A Mira variable star surrounded by a pinwheel-shaped nebula, IRAS 23166+1655, thought to be a preplanetary nebula.', NULL, 'Milky Way', 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 1, false);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 1, false);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 1, false);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 1, false);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: constellation constellation_abbreviation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_abbreviation_key UNIQUE (abbreviation);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


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

