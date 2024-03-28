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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    users_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_users_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_users_id_seq OWNER TO freecodecamp;

--
-- Name: users_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_users_id_seq OWNED BY public.users.users_id;


--
-- Name: users users_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN users_id SET DEFAULT nextval('public.users_users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1711622098457', 1, 409);
INSERT INTO public.users VALUES (2, 'user_1711622098456', 1, 945);
INSERT INTO public.users VALUES (4, 'user_1711622202113', 1, 674);
INSERT INTO public.users VALUES (5, 'user_1711622202112', 1, 892);
INSERT INTO public.users VALUES (6, 'user_1711622311420', 1, 221);
INSERT INTO public.users VALUES (7, 'user_1711622311419', 1, 398);
INSERT INTO public.users VALUES (8, '2', 1, 0);
INSERT INTO public.users VALUES (9, 'user_1711622740602', 1, 0);
INSERT INTO public.users VALUES (10, 'user_1711622740601', 1, 4);
INSERT INTO public.users VALUES (11, 'user_1711622750216', 1, 1);
INSERT INTO public.users VALUES (12, 'user_1711622750215', 1, 4);
INSERT INTO public.users VALUES (14, 'user_1711622812280', 2, 1);
INSERT INTO public.users VALUES (36, 'user_1711623168193', 2, 277);
INSERT INTO public.users VALUES (13, 'user_1711622812281', 5, 1);
INSERT INTO public.users VALUES (3, 'Jasiu', 2, 1);
INSERT INTO public.users VALUES (16, 'user_1711622831419', 2, 2);
INSERT INTO public.users VALUES (35, 'user_1711623168194', 5, 280);
INSERT INTO public.users VALUES (15, 'user_1711622831420', 5, 0);
INSERT INTO public.users VALUES (18, 'user_1711622835479', 2, 0);
INSERT INTO public.users VALUES (38, 'user_1711623206644', 2, 275);
INSERT INTO public.users VALUES (17, 'user_1711622835480', 5, 0);
INSERT INTO public.users VALUES (37, 'user_1711623206645', 5, 37);
INSERT INTO public.users VALUES (20, 'user_1711622848127', 2, 359);
INSERT INTO public.users VALUES (19, 'user_1711622848128', 5, 249);
INSERT INTO public.users VALUES (40, 'user_1711623212004', 2, 34);
INSERT INTO public.users VALUES (22, 'user_1711622882589', 2, 116);
INSERT INTO public.users VALUES (39, 'user_1711623212005', 5, 273);
INSERT INTO public.users VALUES (21, 'user_1711622882590', 5, 318);
INSERT INTO public.users VALUES (24, 'user_1711622966176', 2, 607);
INSERT INTO public.users VALUES (42, 'user_1711623233355', 2, 720);
INSERT INTO public.users VALUES (23, 'user_1711622966177', 5, 147);
INSERT INTO public.users VALUES (41, 'user_1711623233356', 5, 6);
INSERT INTO public.users VALUES (26, 'user_1711623027138', 2, 684);
INSERT INTO public.users VALUES (25, 'user_1711623027139', 5, 188);
INSERT INTO public.users VALUES (28, 'user_1711623033869', 2, 505);
INSERT INTO public.users VALUES (44, 'user_1711623263866', 2, 394);
INSERT INTO public.users VALUES (27, 'user_1711623033870', 5, 120);
INSERT INTO public.users VALUES (43, 'user_1711623263867', 5, 22);
INSERT INTO public.users VALUES (30, 'user_1711623036848', 2, 203);
INSERT INTO public.users VALUES (29, 'user_1711623036849', 5, 165);
INSERT INTO public.users VALUES (32, 'user_1711623044292', 2, 156);
INSERT INTO public.users VALUES (46, 'user_1711623288066', 2, 436);
INSERT INTO public.users VALUES (31, 'user_1711623044293', 5, 292);
INSERT INTO public.users VALUES (45, 'user_1711623288067', 5, 120);
INSERT INTO public.users VALUES (34, 'user_1711623047801', 2, 75);
INSERT INTO public.users VALUES (48, 'user_1711623316170', 2, 271);
INSERT INTO public.users VALUES (33, 'user_1711623047802', 5, 32);
INSERT INTO public.users VALUES (47, 'user_1711623316171', 5, 488);


--
-- Name: users_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_users_id_seq', 48, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (users_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

