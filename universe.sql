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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    visible_with_naked_eye boolean,
    diameter_in_lightyears numeric
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
-- Name: meteor; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.meteor (
    meteor_id integer NOT NULL,
    name character varying(30),
    location text,
    observation_date date NOT NULL
);


ALTER TABLE public.meteor OWNER TO freecodecamp;

--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.meteor_meteor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meteor_meteor_id_seq OWNER TO freecodecamp;

--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.meteor_meteor_id_seq OWNED BY public.meteor.meteor_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    description text NOT NULL,
    discovery_date date,
    planet_id integer
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
    planet_type text,
    orbital_speed_kms integer,
    orbital_period_in_days integer,
    star_id integer
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
    name character varying(30),
    age_in_million_years integer,
    mass integer,
    luminosity numeric,
    visible_with_naked_eye boolean NOT NULL,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: meteor meteor_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor ALTER COLUMN meteor_id SET DEFAULT nextval('public.meteor_meteor_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that includes the Solar System', true, 87400);
INSERT INTO public.galaxy VALUES (2, 'Sombrero', 'also known as Messier Object 104, M104 or NGC 4594', false, 100000);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'nearest major galaxy to the Milky Way', true, 152000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'a dwarf galaxy and satellite galaxy of the Milky Way', true, 32200);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'a dwarf galaxy near the Milky Way', true, 18900);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 'the second-smallest spiral galaxy in the Local Group after the Large Magellanic Cloud', true, 61100);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool Galaxy', 'the first galaxy to be classified as a spiral galaxy', false, 76900);
INSERT INTO public.galaxy VALUES (8, 'Sunrise Arc', 'most strongly magnified galaxy known in the Universe’s first billion years', false, NULL);


--
-- Data for Name: meteor; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.meteor VALUES (1, 'The Peekskill Meteorite', 'New York, USA', '1992-10-09');
INSERT INTO public.meteor VALUES (2, 'The Bone Fireball', 'Bone, Indonesia', '2009-10-08');
INSERT INTO public.meteor VALUES (3, NULL, 'Sothwestern USA', '2009-11-18');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 'Earths Satellite', NULL, 3);
INSERT INTO public.moon VALUES (2, 'Io', 'innermost and second-smallest of the four Galilean moons', '1610-01-08', 5);
INSERT INTO public.moon VALUES (3, 'Europa', 'the smallest of the four Galilean moons ', '1610-01-08', 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'composed of silicate rock and water in approximately equal proportions', '1610-01-07', 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'second-largest moon of Jupiter, after Ganymede', '1610-01-07', 5);
INSERT INTO public.moon VALUES (6, 'Amalthea', 'the third-closest orbit around Jupiter among known moons', '1892-09-09', 5);
INSERT INTO public.moon VALUES (7, 'Metis', 'the innermost known moon of Jupiter', '1979-03-04', 5);
INSERT INTO public.moon VALUES (8, 'Adrastea', 'It was discovered in photographs taken by Voyager 2', '1979-07-08', 5);
INSERT INTO public.moon VALUES (9, 'Thebe', 'discovered by Stephen P. Synnott in images from the Voyager 1', '1979-03-05', 5);
INSERT INTO public.moon VALUES (10, 'Themisto', 'discovered in 1975, subsequently lost, and rediscovered in 2000', '1975-09-30', 5);
INSERT INTO public.moon VALUES (11, 'Himalia', 'sixth largest Jovian satellite, after the four Galilean moons and Amalthea', '1904-12-03', 5);
INSERT INTO public.moon VALUES (12, 'Elara', 'the eighth-largest moon of Jupiter and is named after Elara, one of Zeuss lovers and the mother of the giant Tityos', '1905-01-05', 5);
INSERT INTO public.moon VALUES (13, 'Valetudo', 'discovered by Scott S. Sheppard and his team in data acquired by the 6.5-m Magellan-Baade telescope', '2016-03-09', 5);
INSERT INTO public.moon VALUES (14, 'Titan', 'the largest moon of Saturn and the second-largest in the Solar System', '1655-03-25', 6);
INSERT INTO public.moon VALUES (15, 'Rhea', 'the second-largest moon of Saturn and the ninth-largest moon in the Solar System', '1672-12-23', 6);
INSERT INTO public.moon VALUES (16, 'Iapetus', 'the third-largest moon of Saturn and the eleventh-largest in the Solar System', '1671-10-25', 6);
INSERT INTO public.moon VALUES (17, 'Enceladus', 'the sixth-largest moon of Saturn and the 19th-largest in the Solar System', '1789-08-28', 6);
INSERT INTO public.moon VALUES (18, 'Phoebe', 'the largest irregular satellite of Saturn with a mean diameter of 213 km (132 mi)', '1899-03-18', 6);
INSERT INTO public.moon VALUES (19, 'Tethys', 'the fifth-largest moon of Saturn, measuring about 1,060 km (660 mi) across', '1684-03-11', 6);
INSERT INTO public.moon VALUES (20, 'Dione', 'the fourth-largest moon of Saturn. With a mean diameter of 1123 km and a density of about 1.48 g/cm3', '1684-03-30', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 47, 116, 8);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 35, 224, 8);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 30, 365, 8);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 24, 686, 8);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 13, 4333, 8);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 10, 10755, 8);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 7, 30688, 8);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 5, 60195, 8);
INSERT INTO public.planet VALUES (9, 'Ceres', 'Dwarf', 18, 467, 8);
INSERT INTO public.planet VALUES (10, 'Pluto', 'Dwarf', 5, 90560, 8);
INSERT INTO public.planet VALUES (11, 'Haumea', 'Dwarf', 5, 103410, 8);
INSERT INTO public.planet VALUES (12, 'Makemake', 'Dwarf', 4, 111845, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 242, 2, 25.4, true, 1);
INSERT INTO public.star VALUES (2, 'Canopus', 25, 10, 10700, true, 1);
INSERT INTO public.star VALUES (3, 'Antares', 15, 11, 75900, true, 1);
INSERT INTO public.star VALUES (4, 'Alphard', 420, 3, 971, true, 1);
INSERT INTO public.star VALUES (5, 'Regulus', NULL, 3, 314, true, 1);
INSERT INTO public.star VALUES (6, 'Aldebaran', 6, 1, 439, true, 1);
INSERT INTO public.star VALUES (7, 'Earendel', NULL, 200, 631000, false, 8);
INSERT INTO public.star VALUES (8, 'Sol', 4000, 2, 3.828, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.meteor_meteor_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: meteor meteor_meteor_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_meteor_id_key UNIQUE (meteor_id);


--
-- Name: meteor meteor_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_pkey PRIMARY KEY (meteor_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

