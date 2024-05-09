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
-- Name: celestial_object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_object (
    celestial_object_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.celestial_object OWNER TO freecodecamp;

--
-- Name: celestial_object_celestial_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_object_celestial_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_object_celestial_object_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_object_celestial_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_object_celestial_object_id_seq OWNED BY public.celestial_object.celestial_object_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    galaxy_age_in_million_years integer,
    celestial_object_id integer
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
    moon_radius_in_km numeric(6,2),
    sidereal_period_in_days numeric(4,2),
    planet_id integer,
    celestial_object_id integer
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
    has_life boolean,
    has_ring boolean,
    star_id integer,
    celestial_object_id integer,
    planet_type character varying(30)
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
    star_color character varying(30),
    star_age_in_million_years integer,
    galaxy_id integer,
    celestial_object_id integer
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
-- Name: celestial_object celestial_object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_object ALTER COLUMN celestial_object_id SET DEFAULT nextval('public.celestial_object_celestial_object_id_seq'::regclass);


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
-- Data for Name: celestial_object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_object VALUES (1, 'Galaxy', 'A galaxy is a huge collection of gas, dust, and billions of stars and their solar systems, all held together by gravity.');
INSERT INTO public.celestial_object VALUES (2, 'Star', 'A star is a luminous spheroid of plasma held together by self-gravity.');
INSERT INTO public.celestial_object VALUES (3, 'Planet', 'A planet is a celestial body that is in orbit around the Sun, has sufficient mass for its self-gravity to overcome rigid body forces, and has cleared the neighborhood around its orbit.');
INSERT INTO public.celestial_object VALUES (4, 'Moon', 'A moon is an astronomical body that orbits a planet, a dwarf planet, or a smaller celestial body.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 'Spiral', 13610, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Spiral', 10010, 1);
INSERT INTO public.galaxy VALUES (3, 'Cigar Galaxy', 'Starburst', 13300, 1);
INSERT INTO public.galaxy VALUES (4, 'Bear Paw Galaxy', 'Compact Dwarf', 10, 1);
INSERT INTO public.galaxy VALUES (5, 'Comet Galaxy', 'Spiral', 200, 1);
INSERT INTO public.galaxy VALUES (6, 'Black Eye Galaxy', 'Spiral', 13280, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1738.00, 27.32, 3, 4);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.27, 0.32, 4, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.20, 1.26, 4, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1821.60, 1.77, 5, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 1560.80, 3.55, 5, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634.10, 7.16, 5, 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410.30, 16.69, 5, 4);
INSERT INTO public.moon VALUES (8, 'Mimas', 198.20, 0.94, 6, 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252.10, 1.37, 6, 4);
INSERT INTO public.moon VALUES (10, 'Tethys', 533.10, 1.89, 6, 4);
INSERT INTO public.moon VALUES (11, 'Dione', 561.40, 2.74, 6, 4);
INSERT INTO public.moon VALUES (12, 'Rhea', 763.80, 4.52, 6, 4);
INSERT INTO public.moon VALUES (13, 'Titan', 2574.73, 15.95, 6, 4);
INSERT INTO public.moon VALUES (14, 'Ariel', 578.90, 2.52, 7, 4);
INSERT INTO public.moon VALUES (15, 'Umbriel', 584.70, 4.14, 7, 4);
INSERT INTO public.moon VALUES (16, 'Titania', 788.90, 8.71, 7, 4);
INSERT INTO public.moon VALUES (17, 'Oberon', 761.40, 13.46, 7, 4);
INSERT INTO public.moon VALUES (18, 'Miranda', 235.80, 1.41, 7, 4);
INSERT INTO public.moon VALUES (19, 'Triton', 1353.40, 5.88, 8, 4);
INSERT INTO public.moon VALUES (21, 'Charon', 606.00, 6.39, 9, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, false, 1, 3, 'Terrestrial Planet');
INSERT INTO public.planet VALUES (2, 'Venus', false, false, 1, 3, 'Terrestrial Planet');
INSERT INTO public.planet VALUES (3, 'Earth', true, false, 1, 3, 'Terrestrial Planet');
INSERT INTO public.planet VALUES (4, 'Mars', false, false, 1, 3, 'Terrestrial Planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', false, true, 1, 3, 'Gas Giant');
INSERT INTO public.planet VALUES (6, 'Saturn', false, true, 1, 3, 'Gas Giant');
INSERT INTO public.planet VALUES (7, 'Uranus', false, true, 1, 3, 'Ice Giant');
INSERT INTO public.planet VALUES (8, 'Neptune', false, true, 1, 3, 'Ice Giant');
INSERT INTO public.planet VALUES (9, 'Pluto', false, false, 1, 3, 'Dwarf Planet');
INSERT INTO public.planet VALUES (10, 'Ceres', false, false, 1, 3, 'Dwarf Planet');
INSERT INTO public.planet VALUES (11, 'Haumea', false, true, 1, 3, 'Dwarf Planet');
INSERT INTO public.planet VALUES (12, 'Makemake', false, false, 1, 3, 'Dwarf Planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'White', 4603, 1, 2);
INSERT INTO public.star VALUES (2, 'Polaris', 'Yellow', 70, 1, 2);
INSERT INTO public.star VALUES (3, 'Sirius', 'White', 230, 1, 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red', 10, 1, 2);
INSERT INTO public.star VALUES (5, 'Rigel', 'Blue', 8, 1, 2);
INSERT INTO public.star VALUES (6, 'Antares', 'Red', 11, 1, 2);


--
-- Name: celestial_object_celestial_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_object_celestial_object_id_seq', 4, true);


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
-- Name: celestial_object celestial_object_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_object
    ADD CONSTRAINT celestial_object_name_key UNIQUE (name);


--
-- Name: celestial_object celestial_object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_object
    ADD CONSTRAINT celestial_object_pkey PRIMARY KEY (celestial_object_id);


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
-- Name: galaxy galaxy_celestial_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_celestial_object_id_fkey FOREIGN KEY (celestial_object_id) REFERENCES public.celestial_object(celestial_object_id);


--
-- Name: moon moon_celestial_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_celestial_object_id_fkey FOREIGN KEY (celestial_object_id) REFERENCES public.celestial_object(celestial_object_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_celestial_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_celestial_object_id_fkey FOREIGN KEY (celestial_object_id) REFERENCES public.celestial_object(celestial_object_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_celestial_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_celestial_object_id_fkey FOREIGN KEY (celestial_object_id) REFERENCES public.celestial_object(celestial_object_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

