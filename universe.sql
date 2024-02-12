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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type_of_galaxy text,
    description text,
    distance_light_years integer,
    has_spiral_structure boolean NOT NULL,
    has_elliptical_structure boolean
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
    diameter_km integer,
    mass_kg text,
    mass_numeric numeric,
    num_of_craters integer,
    is_round boolean,
    has_atmosphere boolean,
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
    type_of_planet text,
    diameter_km numeric,
    mass_kg text,
    gravity_ms2 numeric,
    num_of_moons integer,
    age_in_millions_of_years integer,
    is_spherical boolean,
    habitable boolean,
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
    name character varying(30) NOT NULL,
    spectral_type text,
    luminosity_class text,
    temperature_kelvin integer,
    is_binary boolean NOT NULL,
    is_variable boolean,
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
-- Name: universe_entity; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe_entity (
    universe_entity_id integer NOT NULL,
    entity_type text,
    name character varying(30) NOT NULL,
    attribute_name text,
    attribute_value text,
    galaxy_id integer,
    moon_id integer,
    star_id integer,
    planet_id integer,
    num_of_craters integer,
    is_round boolean,
    has_atmosphere boolean,
    num_of_satellites integer,
    orbital_period_days numeric
);


ALTER TABLE public.universe_entity OWNER TO freecodecamp;

--
-- Name: universe_entity_universe_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_entity_universe_entity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_entity_universe_entity_id_seq OWNER TO freecodecamp;

--
-- Name: universe_entity_universe_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_entity_universe_entity_id_seq OWNED BY public.universe_entity.universe_entity_id;


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
-- Name: universe_entity universe_entity_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_entity ALTER COLUMN universe_entity_id SET DEFAULT nextval('public.universe_entity_universe_entity_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'The Milky Way is the galaxy that contains our Solar System.', 100000, true, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'The Andromeda Galaxy is the closest spiral galaxy to the Milky Way.', 2500000, true, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Spiral', 'The Triangulum Galaxy is the third-largest galaxy in the Local Group.', 3000000, true, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'Spiral', 'The Whirlpool Galaxy is an interacting grand-design spiral galaxy.', 23000000, true, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Elliptical', 'The Sombrero Galaxy is an elliptical galaxy located in the constellation Virgo.', 29000000, false, true);
INSERT INTO public.galaxy VALUES (6, 'Cigar Galaxy', 'Irregular', 'The Cigar Galaxy is an irregular galaxy in the constellation Ursa Major.', 12000000, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474, '7.35 × 10^22', 73500000000000000000000, 500000, true, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, '1.08 × 10^16', 10800000000000000, 0, false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, '2.0 × 10^15', 2000000000000000, 0, false, false, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5262, '1.48 × 10^23', 148000000000000000000000, 150000, true, false, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 4821, '1.08 × 10^23', 108000000000000000000000, 300000, true, false, 5);
INSERT INTO public.moon VALUES (6, 'Europa', 3122, '4.8 × 10^22', 48000000000000000000000, 200000, true, false, 5);
INSERT INTO public.moon VALUES (7, 'Io', 3643, '8.93 × 10^22', 89300000000000000000000, 100000, true, false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 5150, '1.35 × 10^23', 135000000000000000000000, 50000, true, true, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 1528, '2.31 × 10^21', 2310000000000000000000, 75000, true, false, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 1436, '1.81 × 10^21', 1810000000000000000000, 100000, true, false, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 1123, '1.1 × 10^21', 1100000000000000000000, 50000, true, false, 6);
INSERT INTO public.moon VALUES (12, 'Triton', 2706, '2.14 × 10^22', 21400000000000000000000, 50000, true, false, 7);
INSERT INTO public.moon VALUES (13, 'Proteus', 418, '5.19 × 10^19', 51900000000000000000, 1000, true, false, 7);
INSERT INTO public.moon VALUES (14, 'Tethys', 1062, '6.17 × 10^20', 617000000000000000000, 20000, true, false, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 471, '6.59 × 10^19', 65900000000000000000, 5000, true, false, 6);
INSERT INTO public.moon VALUES (16, 'Umbriel', 1170, '1.27 × 10^21', 1270000000000000000000, 10000, true, false, 6);
INSERT INTO public.moon VALUES (17, 'Ariel', 1158, '1.27 × 10^21', 1270000000000000000000, 15000, true, false, 6);
INSERT INTO public.moon VALUES (18, 'Oberon', 1522, '1.77 × 10^21', 1770000000000000000000, 20000, true, false, 6);
INSERT INTO public.moon VALUES (19, 'Titania', 1578, '3.53 × 10^21', 3530000000000000000000, 30000, true, false, 6);
INSERT INTO public.moon VALUES (20, 'Charon', 1212, '1.52 × 10^21', 1520000000000000000000, 25000, true, false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 4880, '3.30 × 10^23', 3.7, 0, 4600, true, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 12104, '4.87 × 10^24', 8.87, 0, 4600, true, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 12742, '5.97 × 10^24', 9.81, 1, 4600, true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 6779, '6.42 × 10^23', 3.71, 2, 4600, true, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gaseous', 139820, '1.90 × 10^27', 24.79, 79, 4600, false, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gaseous', 116460, '5.68 × 10^26', 10.44, 82, 4600, false, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Gaseous', 50724, '8.68 × 10^25', 8.69, 27, 4600, false, false, 1);
INSERT INTO public.planet VALUES (8, 'Kepler-186f', 'Exoplanet', 12000, '1.85 × 10^25', NULL, NULL, NULL, NULL, true, 3);
INSERT INTO public.planet VALUES (9, 'HD 209458 b', 'Exoplanet', 94500, '1.49 × 10^27', NULL, NULL, NULL, NULL, false, 8);
INSERT INTO public.planet VALUES (10, 'Kepler-442b', 'Exoplanet', 33400, '7.17 × 10^24', NULL, NULL, NULL, NULL, true, 9);
INSERT INTO public.planet VALUES (11, 'Gliese 581c', 'Exoplanet', 17520, '5.36 × 10^24', NULL, NULL, NULL, NULL, true, 6);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 'Exoplanet', 8028, '3.44 × 10^24', NULL, NULL, NULL, NULL, true, 7);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri b', 'Exoplanet', 15760, '1.17 × 10^24', NULL, NULL, NULL, NULL, true, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G', 'V', 5778, false, false, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'G', 'V', 5790, false, false, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 'K', 'V', 5260, false, false, 1);
INSERT INTO public.star VALUES (4, 'Barnard''s Star', 'M', 'V', 3134, false, true, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'M', 'V', 3042, false, true, 1);
INSERT INTO public.star VALUES (6, 'Andromeda II-AGB1', 'F', 'III', 7090, false, false, 2);
INSERT INTO public.star VALUES (7, 'Andromeda II-AGB2', 'F', 'III', 7180, false, false, 2);
INSERT INTO public.star VALUES (8, 'Andromeda II-AGB3', 'F', 'III', 7280, false, false, 2);
INSERT INTO public.star VALUES (9, 'Andromeda II-AGB4', 'F', 'III', 7320, false, false, 2);
INSERT INTO public.star VALUES (10, 'Andromeda II-AGB5', 'F', 'III', 7400, false, false, 2);
INSERT INTO public.star VALUES (11, 'Triangulum X-1', 'O', 'I', 35000, false, true, 3);
INSERT INTO public.star VALUES (12, 'Triangulum Y-1', 'B', 'V', 13000, false, false, 3);
INSERT INTO public.star VALUES (13, 'Whirlpool 1', 'A', 'V', 7500, false, false, 4);
INSERT INTO public.star VALUES (14, 'Whirlpool 2', 'A', 'V', 7300, false, false, 4);
INSERT INTO public.star VALUES (15, 'Whirlpool 3', 'A', 'V', 7000, false, false, 4);
INSERT INTO public.star VALUES (16, 'Sombrero 1', 'G', 'III', 5900, true, false, 5);
INSERT INTO public.star VALUES (17, 'Sombrero 2', 'G', 'III', 6000, true, false, 5);
INSERT INTO public.star VALUES (18, 'Cigar 1', 'O', 'I', 40000, false, false, 6);
INSERT INTO public.star VALUES (19, 'Cigar 2', 'O', 'I', 39000, false, false, 6);
INSERT INTO public.star VALUES (20, 'Cigar 3', 'O', 'I', 38000, false, false, 6);


--
-- Data for Name: universe_entity; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe_entity VALUES (1, 'galaxy', 'Milky Way', 'diameter_ly', '100000', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (2, 'moon', 'Luna', 'diameter_km', '3474', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (3, 'star', 'Sun', 'mass_kg', '1.989 × 10^30', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (4, 'planet', 'Earth', 'diameter_km', '12742', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (5, 'planet', 'Mars', 'diameter_km', '6779', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (6, 'star', 'Proxima Centauri', 'mass_kg', '2.447 × 10^29', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (7, 'moon', 'Phobos', 'diameter_km', '22.2', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (8, 'planet', 'Kepler-186f', 'diameter_km', '12000', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (9, 'galaxy', 'Andromeda', 'diameter_ly', '120000', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (10, 'moon', 'Deimos', 'diameter_km', '12.4', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (11, 'planet', 'Jupiter', 'diameter_km', '139820', NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (12, 'planet', 'Neptune', 'diameter_km', '49244', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (13, 'star', 'Alpha Centauri A', 'mass_kg', '2.188 × 10^30', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (14, 'moon', 'Ganymede', 'diameter_km', '5262', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (15, 'planet', 'Kepler-186f', 'diameter_km', '12000', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (16, 'moon', 'Deimos', 'diameter_km', '12.4', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (17, 'star', 'Alpha Centauri A', 'mass_kg', '2.188 × 10^30', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.universe_entity VALUES (18, 'moon', 'Ganymede', 'diameter_km', '5262', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: universe_entity_universe_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_entity_universe_entity_id_seq', 18, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: universe_entity universe_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_entity
    ADD CONSTRAINT universe_entity_pkey PRIMARY KEY (universe_entity_id);


--
-- Name: universe_entity universe_entity_universe_entity_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_entity
    ADD CONSTRAINT universe_entity_universe_entity_id_key UNIQUE (universe_entity_id);


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
-- Name: universe_entity universe_entity_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_entity
    ADD CONSTRAINT universe_entity_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: universe_entity universe_entity_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_entity
    ADD CONSTRAINT universe_entity_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: universe_entity universe_entity_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_entity
    ADD CONSTRAINT universe_entity_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: universe_entity universe_entity_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_entity
    ADD CONSTRAINT universe_entity_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

