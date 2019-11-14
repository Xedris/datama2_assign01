--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

-- Started on 2019-11-14 09:01:33

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
-- TOC entry 217 (class 1259 OID 24664)
-- Name: chef; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chef (
    chef_id integer NOT NULL,
    chef_position character varying(45) NOT NULL,
    chef_lname character varying(45) NOT NULL,
    chef_fname character varying(45) NOT NULL
);


ALTER TABLE public.chef OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24662)
-- Name: chef_chef_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chef_chef_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chef_chef_id_seq OWNER TO postgres;

--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 216
-- Name: chef_chef_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chef_chef_id_seq OWNED BY public.chef.chef_id;


--
-- TOC entry 207 (class 1259 OID 24617)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    emp_id integer NOT NULL,
    emp_fname character varying(45) NOT NULL,
    emp_lname character varying(45) NOT NULL,
    emp_dob date,
    emp_address character varying(45) DEFAULT NULL::character varying,
    emp_date_hired date
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24615)
-- Name: employee_emp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_emp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_emp_id_seq OWNER TO postgres;

--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 206
-- Name: employee_emp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_emp_id_seq OWNED BY public.employee.emp_id;


--
-- TOC entry 209 (class 1259 OID 24626)
-- Name: online_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.online_customer (
    onl_id integer NOT NULL,
    onl_fname character varying(45) DEFAULT NULL::character varying,
    onl_lname character varying(45) DEFAULT NULL::character varying,
    onl_dob date
);


ALTER TABLE public.online_customer OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 24624)
-- Name: online_customer_onl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.online_customer_onl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.online_customer_onl_id_seq OWNER TO postgres;

--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 208
-- Name: online_customer_onl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.online_customer_onl_id_seq OWNED BY public.online_customer.onl_id;


--
-- TOC entry 211 (class 1259 OID 24636)
-- Name: onsite_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.onsite_customer (
    ons_id integer NOT NULL,
    ons_fname character varying(45) DEFAULT NULL::character varying,
    ons_lname character varying(45) DEFAULT NULL::character varying,
    ons_dob date
);


ALTER TABLE public.onsite_customer OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24634)
-- Name: onsite_customer_ons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.onsite_customer_ons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.onsite_customer_ons_id_seq OWNER TO postgres;

--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 210
-- Name: onsite_customer_ons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.onsite_customer_ons_id_seq OWNED BY public.onsite_customer.ons_id;


--
-- TOC entry 213 (class 1259 OID 24646)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    ord_id integer NOT NULL,
    ord_menu_name character varying(45) DEFAULT NULL::character varying,
    ord_amount integer,
    ord_date timestamp without time zone NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24685)
-- Name: onsitecust_order; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.onsitecust_order AS
 SELECT onsite_customer.ons_id,
    onsite_customer.ons_lname,
    onsite_customer.ons_fname,
    orders.ord_id,
    orders.ord_menu_name,
    orders.ord_amount
   FROM (public.onsite_customer
     JOIN public.orders ON ((onsite_customer.ons_id = orders.ord_id)));


ALTER TABLE public.onsitecust_order OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24644)
-- Name: orders_ord_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_ord_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_ord_id_seq OWNER TO postgres;

--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 212
-- Name: orders_ord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_ord_id_seq OWNED BY public.orders.ord_id;


--
-- TOC entry 215 (class 1259 OID 24655)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    prod_id integer NOT NULL,
    prod_type character varying(45) DEFAULT NULL::character varying,
    prod_date date,
    prod_date_expire date,
    prod_num_items integer
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24653)
-- Name: product_prod_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_prod_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_prod_id_seq OWNER TO postgres;

--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 214
-- Name: product_prod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_prod_id_seq OWNED BY public.product.prod_id;


--
-- TOC entry 203 (class 1259 OID 24599)
-- Name: restaurant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant (
    res_id integer NOT NULL,
    res_loc character varying(45) DEFAULT NULL::character varying,
    res_employed_num integer
);


ALTER TABLE public.restaurant OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24597)
-- Name: restaurant_res_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurant_res_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_res_id_seq OWNER TO postgres;

--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 202
-- Name: restaurant_res_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurant_res_id_seq OWNED BY public.restaurant.res_id;


--
-- TOC entry 218 (class 1259 OID 24670)
-- Name: restaurant_supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant_supplier (
    res_id integer NOT NULL,
    supp_id integer NOT NULL,
    integ_date timestamp without time zone
);


ALTER TABLE public.restaurant_supplier OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24608)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    supp_id integer NOT NULL,
    supp_name character varying(45) NOT NULL,
    supp_contact integer,
    supp_address character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24606)
-- Name: supplier_supp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_supp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_supp_id_seq OWNER TO postgres;

--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 204
-- Name: supplier_supp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_supp_id_seq OWNED BY public.supplier.supp_id;


--
-- TOC entry 2753 (class 2604 OID 24667)
-- Name: chef chef_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chef ALTER COLUMN chef_id SET DEFAULT nextval('public.chef_chef_id_seq'::regclass);


--
-- TOC entry 2741 (class 2604 OID 24620)
-- Name: employee emp_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN emp_id SET DEFAULT nextval('public.employee_emp_id_seq'::regclass);


--
-- TOC entry 2743 (class 2604 OID 24629)
-- Name: online_customer onl_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.online_customer ALTER COLUMN onl_id SET DEFAULT nextval('public.online_customer_onl_id_seq'::regclass);


--
-- TOC entry 2746 (class 2604 OID 24639)
-- Name: onsite_customer ons_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.onsite_customer ALTER COLUMN ons_id SET DEFAULT nextval('public.onsite_customer_ons_id_seq'::regclass);


--
-- TOC entry 2749 (class 2604 OID 24649)
-- Name: orders ord_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN ord_id SET DEFAULT nextval('public.orders_ord_id_seq'::regclass);


--
-- TOC entry 2751 (class 2604 OID 24658)
-- Name: product prod_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN prod_id SET DEFAULT nextval('public.product_prod_id_seq'::regclass);


--
-- TOC entry 2737 (class 2604 OID 24602)
-- Name: restaurant res_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant ALTER COLUMN res_id SET DEFAULT nextval('public.restaurant_res_id_seq'::regclass);


--
-- TOC entry 2739 (class 2604 OID 24611)
-- Name: supplier supp_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier ALTER COLUMN supp_id SET DEFAULT nextval('public.supplier_supp_id_seq'::regclass);


--
-- TOC entry 2916 (class 0 OID 24664)
-- Dependencies: 217
-- Data for Name: chef; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chef (chef_id, chef_position, chef_lname, chef_fname) FROM stdin;
1	head chef	Bernardo	Herrick
2	sous chef	Jeremy	Carmack
\.


--
-- TOC entry 2906 (class 0 OID 24617)
-- Dependencies: 207
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (emp_id, emp_fname, emp_lname, emp_dob, emp_address, emp_date_hired) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 24626)
-- Dependencies: 209
-- Data for Name: online_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.online_customer (onl_id, onl_fname, onl_lname, onl_dob) FROM stdin;
1	Ramsay	Karena	1998-07-09
2	Carney	Daniele	1990-10-04
3	Bryce	Harper	1985-10-02
4	Jose	Altuve	1988-04-08
5	Trae	Young	1999-09-03
6	Jaren	Jackson	1997-12-06
\.


--
-- TOC entry 2910 (class 0 OID 24636)
-- Dependencies: 211
-- Data for Name: onsite_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.onsite_customer (ons_id, ons_fname, ons_lname, ons_dob) FROM stdin;
1	Tom	Tomson	2019-10-17
2	Jean	Garisson	2018-10-25
\.


--
-- TOC entry 2912 (class 0 OID 24646)
-- Dependencies: 213
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (ord_id, ord_menu_name, ord_amount, ord_date) FROM stdin;
1	pancake	280	1957-06-13 00:00:00
2	shake	190	1957-06-13 00:00:00
\.


--
-- TOC entry 2914 (class 0 OID 24655)
-- Dependencies: 215
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (prod_id, prod_type, prod_date, prod_date_expire, prod_num_items) FROM stdin;
1	perishable	2019-10-17	2019-10-11	23
2	perishable	2019-10-31	2020-02-13	522
\.


--
-- TOC entry 2902 (class 0 OID 24599)
-- Dependencies: 203
-- Data for Name: restaurant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurant (res_id, res_loc, res_employed_num) FROM stdin;
1	Chambersburg City	32
2	Jefferson City	32
\.


--
-- TOC entry 2917 (class 0 OID 24670)
-- Dependencies: 218
-- Data for Name: restaurant_supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurant_supplier (res_id, supp_id, integ_date) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 24608)
-- Dependencies: 205
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (supp_id, supp_name, supp_contact, supp_address) FROM stdin;
1	meat.ly	922222	1019  Cambridge Court
2	Foodure	71763487	1335  Lincoln Drive
\.


--
-- TOC entry 2931 (class 0 OID 0)
-- Dependencies: 216
-- Name: chef_chef_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chef_chef_id_seq', 1, false);


--
-- TOC entry 2932 (class 0 OID 0)
-- Dependencies: 206
-- Name: employee_emp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_emp_id_seq', 1, false);


--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 208
-- Name: online_customer_onl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.online_customer_onl_id_seq', 1, false);


--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 210
-- Name: onsite_customer_ons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.onsite_customer_ons_id_seq', 1, false);


--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 212
-- Name: orders_ord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_ord_id_seq', 1, false);


--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 214
-- Name: product_prod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_prod_id_seq', 1, false);


--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 202
-- Name: restaurant_res_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_res_id_seq', 1, false);


--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 204
-- Name: supplier_supp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_supp_id_seq', 1, false);


--
-- TOC entry 2769 (class 2606 OID 24669)
-- Name: chef chef_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chef
    ADD CONSTRAINT chef_pkey PRIMARY KEY (chef_id);


--
-- TOC entry 2759 (class 2606 OID 24623)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_id);


--
-- TOC entry 2761 (class 2606 OID 24633)
-- Name: online_customer online_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.online_customer
    ADD CONSTRAINT online_customer_pkey PRIMARY KEY (onl_id);


--
-- TOC entry 2763 (class 2606 OID 24643)
-- Name: onsite_customer onsite_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.onsite_customer
    ADD CONSTRAINT onsite_customer_pkey PRIMARY KEY (ons_id);


--
-- TOC entry 2765 (class 2606 OID 24652)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (ord_id);


--
-- TOC entry 2767 (class 2606 OID 24661)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (prod_id);


--
-- TOC entry 2755 (class 2606 OID 24605)
-- Name: restaurant restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT restaurant_pkey PRIMARY KEY (res_id);


--
-- TOC entry 2771 (class 2606 OID 24674)
-- Name: restaurant_supplier restaurant_supplier_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_supplier
    ADD CONSTRAINT restaurant_supplier_id PRIMARY KEY (res_id, supp_id);


--
-- TOC entry 2757 (class 2606 OID 24614)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supp_id);


--
-- TOC entry 2772 (class 2606 OID 24675)
-- Name: restaurant_supplier restaurant_supplier_res_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_supplier
    ADD CONSTRAINT restaurant_supplier_res_id_fkey FOREIGN KEY (res_id) REFERENCES public.restaurant(res_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2773 (class 2606 OID 24680)
-- Name: restaurant_supplier restaurant_supplier_supp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_supplier
    ADD CONSTRAINT restaurant_supplier_supp_id_fkey FOREIGN KEY (supp_id) REFERENCES public.supplier(supp_id) ON UPDATE CASCADE;


-- Completed on 2019-11-14 09:01:34

--
-- PostgreSQL database dump complete
--

