#!/bin/bash

# setup basic TC-Showcase database for local development
# should be replaced with Flyway in each application

set -e

DATABASES='order manufacture supplier'

for i in $DATABASES; do
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        CREATE USER "${i}_user" WITH PASSWORD '${i}_pass';
        CREATE DATABASE "${i}_db";
        GRANT ALL PRIVILEGES ON DATABASE "${i}_db" TO "${i}_user";
EOSQL
done

psql manufacture_db --username=manufacture_user --dbname=manufacture_db <<-EOSQL 
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.9 (Debian 11.9-1.pgdg90+1)
-- Dumped by pg_dump version 11.9 (Debian 11.9-1.pgdg90+1)

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

SET default_with_oids = false;

--
-- Name: m_bom; Type: TABLE; Schema: public; Owner: manufacture_user
--

CREATE TABLE public.m_bom (
    b_comp_id character varying(20) NOT NULL,
    b_line_no integer NOT NULL,
    b_assembly_id character varying(20) NOT NULL,
    b_eng_change character varying(10),
    b_ops_desc character varying(100),
    b_ops integer,
    b_qty integer,
    b_version integer
);


ALTER TABLE public.m_bom OWNER TO manufacture_user;

--
-- Name: m_inventory; Type: TABLE; Schema: public; Owner: manufacture_user
--

CREATE TABLE public.m_inventory (
    in_p_id character varying(20) NOT NULL,
    in_location integer NOT NULL,
    in_acc_code integer,
    in_act_date timestamp without time zone,
    in_ordered integer,
    in_qty integer,
    in_version integer
);


ALTER TABLE public.m_inventory OWNER TO manufacture_user;

--
-- Name: m_parts; Type: TABLE; Schema: public; Owner: manufacture_user
--

CREATE TABLE public.m_parts (
    p_id character varying(20) NOT NULL,
    p_type integer,
    p_desc character varying(100),
    p_himark integer,
    p_lomark integer,
    p_name character varying(35),
    p_planner integer,
    p_ind integer,
    p_rev character varying(6),
    p_version integer
);


ALTER TABLE public.m_parts OWNER TO manufacture_user;

--
-- Name: m_workorder; Type: TABLE; Schema: public; Owner: manufacture_user
--

CREATE TABLE public.m_workorder (
    wo_number integer NOT NULL,
    wo_assembly_id character varying(20),
    wo_comp_qty integer,
    wo_due_date timestamp without time zone,
    wo_location integer NOT NULL,
    wo_ol_id integer,
    wo_orig_qty integer,
    wo_o_id integer,
    wo_start_date timestamp without time zone,
    wo_status integer,
    wo_version integer
);


ALTER TABLE public.m_workorder OWNER TO manufacture_user;

--
-- Name: u_sequences; Type: TABLE; Schema: public; Owner: manufacture_user
--

CREATE TABLE public.u_sequences (
    s_id character varying(50) NOT NULL,
    s_nextnum numeric(38,0)
);


ALTER TABLE public.u_sequences OWNER TO manufacture_user;

--
-- Data for Name: m_bom; Type: TABLE DATA; Schema: public; Owner: manufacture_user
--

COPY public.m_bom (b_comp_id, b_line_no, b_assembly_id, b_eng_change, b_ops_desc, b_ops, b_qty, b_version) FROM stdin;
1	1	4	engChange	description	1	4	1
2	2	4	engChange	description	1	2	1
3	3	4	engChange	description	1	2	1
1	1	5	engChange	description	1	2	1
2	2	5	engChange	description	1	4	1
1	1	6	engChange	description	1	2	1
3	2	6	engChange	description	1	4	1
1	1	7	engChange	description	1	2	1
3	2	7	engChange	description	1	4	1
1	1	8	engChange	description	1	2	1
3	2	8	engChange	description	1	4	1
1	1	9	engChange	description	1	2	1
3	2	9	engChange	description	1	4	1
1	1	10	engChange	description	1	2	1
3	2	10	engChange	description	1	4	1
1	1	11	engChange	description	1	2	1
3	2	11	engChange	description	1	4	1
1	1	12	engChange	description	1	2	1
3	2	12	engChange	description	1	4	1
1	1	13	engChange	description	1	2	1
3	2	13	engChange	description	1	4	1
1	1	14	engChange	description	1	2	1
3	2	14	engChange	description	1	4	1
1	1	15	engChange	description	1	2	1
3	2	15	engChange	description	1	4	1
1	1	16	engChange	description	1	2	1
3	2	16	engChange	description	1	4	1
1	1	17	engChange	description	1	2	1
3	2	17	engChange	description	1	4	1
1	1	18	engChange	description	1	2	1
3	2	18	engChange	description	1	4	1
1	1	19	engChange	description	1	2	1
3	2	19	engChange	description	1	4	1
1	1	20	engChange	description	1	2	1
3	2	20	engChange	description	1	4	1
1	1	21	engChange	description	1	2	1
3	2	21	engChange	description	1	4	1
1	1	22	engChange	description	1	2	1
3	2	22	engChange	description	1	4	1
1	1	23	engChange	description	1	2	1
3	2	23	engChange	description	1	4	1
1	1	24	engChange	description	1	2	1
3	2	24	engChange	description	1	4	1
\.


--
-- Data for Name: m_inventory; Type: TABLE DATA; Schema: public; Owner: manufacture_user
--

COPY public.m_inventory (in_p_id, in_location, in_acc_code, in_act_date, in_ordered, in_qty, in_version) FROM stdin;
1	1	1	2019-12-02 00:00:00	10	10	1
3	1	1	2019-12-02 00:00:00	10	10	1
2	1	1	2019-12-02 00:00:00	10	10	1
5	1	1	2019-12-02 00:00:00	10	10	1
4	1	1	2019-12-02 00:00:00	10	10	1
\.


--
-- Data for Name: m_parts; Type: TABLE DATA; Schema: public; Owner: manufacture_user
--

COPY public.m_parts (p_id, p_type, p_desc, p_himark, p_lomark, p_name, p_planner, p_ind, p_rev, p_version) FROM stdin;
1	0	The 1st part...	1	1	Part 1	1	1	1	1
2	0	The 2nd part...	1	1	Part 2	1	1	1	1
3	0	The 3rd part...	1	1	Part 3	1	1	1	1
4	1	Assembly 1 which is build from 3 parts	3	3	Assembly 1	2	3	1	1
5	1	Assembly 2 which is build from 2 parts	3	3	Assembly 2	2	3	1	1
6	1	Assembly 3 which is build from 2 parts	3	3	Assembly 3	2	3	1	1
7	1	Assembly 4 which is build from 2 parts	3	3	Assembly 4	2	3	1	1
8	1	Assembly 5 which is build from 2 parts	3	3	Assembly 5	2	3	1	1
9	1	Assembly 6 which is build from 2 parts	3	3	Assembly 6	2	3	1	1
10	1	Assembly 7 which is build from 2 parts	3	3	Assembly 7	2	3	1	1
11	1	Assembly 8 which is build from 2 parts	3	3	Assembly 8	2	3	1	1
12	1	Assembly 9 which is build from 2 parts	3	3	Assembly 9	2	3	1	1
13	1	Assembly 10 which is build from 2 parts	3	3	Assembly 10	2	3	1	1
14	1	Assembly 11 which is build from 2 parts	3	3	Assembly 11	2	3	1	1
15	1	Assembly 12 which is build from 2 parts	3	3	Assembly 12	2	3	1	1
16	1	Assembly 13 which is build from 2 parts	3	3	Assembly 13	2	3	1	1
17	1	Assembly 14 which is build from 2 parts	3	3	Assembly 14	2	3	1	1
18	1	Assembly 15 which is build from 2 parts	3	3	Assembly 15	2	3	1	1
19	1	Assembly 16 which is build from 2 parts	3	3	Assembly 16	2	3	1	1
20	1	Assembly 17 which is build from 2 parts	3	3	Assembly 17	2	3	1	1
21	1	Assembly 18 which is build from 2 parts	3	3	Assembly 18	2	3	1	1
22	1	Assembly 19 which is build from 2 parts	3	3	Assembly 19	2	3	1	1
23	1	Assembly 20 which is build from 2 parts	3	3	Assembly 20	2	3	1	1
24	1	Assembly 21 which is build from 2 parts	3	3	Assembly 21	2	3	1	1
\.


--
-- Data for Name: m_workorder; Type: TABLE DATA; Schema: public; Owner: manufacture_user
--

COPY public.m_workorder (wo_number, wo_assembly_id, wo_comp_qty, wo_due_date, wo_location, wo_ol_id, wo_orig_qty, wo_o_id, wo_start_date, wo_status, wo_version) FROM stdin;
\.


--
-- Data for Name: u_sequences; Type: TABLE DATA; Schema: public; Owner: manufacture_user
--

COPY public.u_sequences (s_id, s_nextnum) FROM stdin;
WO_SEQ	0
C_SEQ	24
\.


--
-- Name: m_bom m_bom_pkey; Type: CONSTRAINT; Schema: public; Owner: manufacture_user
--

ALTER TABLE ONLY public.m_bom
    ADD CONSTRAINT m_bom_pkey PRIMARY KEY (b_comp_id, b_line_no, b_assembly_id);


--
-- Name: m_inventory m_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: manufacture_user
--

ALTER TABLE ONLY public.m_inventory
    ADD CONSTRAINT m_inventory_pkey PRIMARY KEY (in_p_id, in_location);


--
-- Name: m_parts m_parts_pkey; Type: CONSTRAINT; Schema: public; Owner: manufacture_user
--

ALTER TABLE ONLY public.m_parts
    ADD CONSTRAINT m_parts_pkey PRIMARY KEY (p_id);


--
-- Name: m_workorder m_workorder_pkey; Type: CONSTRAINT; Schema: public; Owner: manufacture_user
--

ALTER TABLE ONLY public.m_workorder
    ADD CONSTRAINT m_workorder_pkey PRIMARY KEY (wo_number);


--
-- Name: u_sequences u_sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: manufacture_user
--

ALTER TABLE ONLY public.u_sequences
    ADD CONSTRAINT u_sequences_pkey PRIMARY KEY (s_id);


--
-- Name: m_bom fk_m_bom_b_assembly_id; Type: FK CONSTRAINT; Schema: public; Owner: manufacture_user
--

ALTER TABLE ONLY public.m_bom
    ADD CONSTRAINT fk_m_bom_b_assembly_id FOREIGN KEY (b_assembly_id) REFERENCES public.m_parts(p_id);


--
-- Name: m_inventory fk_m_inventory_in_p_id; Type: FK CONSTRAINT; Schema: public; Owner: manufacture_user
--

ALTER TABLE ONLY public.m_inventory
    ADD CONSTRAINT fk_m_inventory_in_p_id FOREIGN KEY (in_p_id) REFERENCES public.m_parts(p_id);


--
-- PostgreSQL database dump complete
--
EOSQL

psql order_db --username=order_user --dbname=order_db <<-EOSQL
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.9 (Debian 11.9-1.pgdg90+1)
-- Dumped by pg_dump version 11.9 (Debian 11.9-1.pgdg90+1)

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

SET default_with_oids = false;

--
-- Name: o_customer; Type: TABLE; Schema: public; Owner: order_user
--

CREATE TABLE public.o_customer (
    c_id integer NOT NULL,
    c_balance numeric(12,2),
    c_contact character varying(25),
    c_credit character varying(2),
    c_credit_limit numeric(12,2),
    c_first character varying(16),
    c_last character varying(16),
    c_since date,
    c_version integer,
    c_ytd_payment numeric(12,2),
    c_city character varying(20),
    c_country character varying(10),
    c_phone character varying(16),
    c_state character varying(2),
    c_street1 character varying(20),
    c_street2 character varying(20),
    c_zip character varying(9)
);


ALTER TABLE public.o_customer OWNER TO order_user;

--
-- Name: o_customerinventory; Type: TABLE; Schema: public; Owner: order_user
--

CREATE TABLE public.o_customerinventory (
    ci_customerid integer NOT NULL,
    ci_id integer NOT NULL,
    ci_quantity integer,
    ci_value numeric(12,2),
    ci_version integer,
    ci_itemid character varying(20)
);


ALTER TABLE public.o_customerinventory OWNER TO order_user;

--
-- Name: o_item; Type: TABLE; Schema: public; Owner: order_user
--

CREATE TABLE public.o_item (
    i_id character varying(20) NOT NULL,
    i_category integer NOT NULL,
    i_desc character varying(100),
    i_discount numeric(6,4),
    i_name character varying(35),
    i_price numeric(12,2),
    i_version integer
);


ALTER TABLE public.o_item OWNER TO order_user;

--
-- Name: o_orderline; Type: TABLE; Schema: public; Owner: order_user
--

CREATE TABLE public.o_orderline (
    ol_o_id integer NOT NULL,
    ol_id integer NOT NULL,
    ol_msrp numeric(12,2),
    ol_qty integer,
    ol_ship_date date,
    ol_status integer,
    ol_total_value numeric(12,2),
    ol_version integer,
    ol_i_id character varying(20)
);


ALTER TABLE public.o_orderline OWNER TO order_user;

--
-- Name: o_orders; Type: TABLE; Schema: public; Owner: order_user
--

CREATE TABLE public.o_orders (
    o_id integer NOT NULL,
    o_discount numeric(12,2),
    o_entry_date timestamp without time zone,
    o_ol_cnt integer,
    o_ship_date date,
    o_status integer,
    o_total numeric(12,2),
    o_version integer,
    o_c_id integer
);


ALTER TABLE public.o_orders OWNER TO order_user;

--
-- Name: u_sequences; Type: TABLE; Schema: public; Owner: order_user
--

CREATE TABLE public.u_sequences (
    s_id character varying(50) NOT NULL,
    s_nextnum numeric(38,0)
);


ALTER TABLE public.u_sequences OWNER TO order_user;

--
-- Data for Name: o_customer; Type: TABLE DATA; Schema: public; Owner: order_user
--

COPY public.o_customer (c_id, c_balance, c_contact, c_credit, c_credit_limit, c_first, c_last, c_since, c_version, c_ytd_payment, c_city, c_country, c_phone, c_state, c_street1, c_street2, c_zip) FROM stdin;
1	20000.00	contact	GC	1000.00	firstName	lastName	2020-08-27	1	100.00	city	county	phone	DE	street1	street2	zip
\.


--
-- Data for Name: o_customerinventory; Type: TABLE DATA; Schema: public; Owner: order_user
--

COPY public.o_customerinventory (ci_customerid, ci_id, ci_quantity, ci_value, ci_version, ci_itemid) FROM stdin;
\.


--
-- Data for Name: o_item; Type: TABLE DATA; Schema: public; Owner: order_user
--

COPY public.o_item (i_id, i_category, i_desc, i_discount, i_name, i_price, i_version) FROM stdin;
1	1	description1	0.0000	name1	100.00	1
2	1	description2	0.0000	name2	100.00	1
3	2	description3	10.0000	name3	200.00	1
4	2	Assembly 1 which is build from 3 parts	10.0000	Assembly 1	200.00	1
5	2	Assembly 2 which is build from 2 parts	10.0000	Assembly 2	200.00	1
6	2	Assembly 3 which is build from 2 parts	10.0000	Assembly 3	200.00	1
7	2	Assembly 4 which is build from 2 parts	10.0000	Assembly 4	200.00	1
8	2	Assembly 5 which is build from 2 parts	10.0000	Assembly 5	200.00	1
9	2	Assembly 6 which is build from 2 parts	10.0000	Assembly 6	200.00	1
10	2	Assembly 7 which is build from 2 parts	10.0000	Assembly 7	200.00	1
11	2	Assembly 8 which is build from 2 parts	10.0000	Assembly 8	200.00	1
12	2	Assembly 9 which is build from 2 parts	10.0000	Assembly 9	200.00	1
13	2	Assembly 10 which is build from 2 parts	10.0000	Assembly 10	200.00	1
14	2	Assembly 11 which is build from 2 parts	10.0000	Assembly 11	200.00	1
15	2	Assembly 12 which is build from 2 parts	10.0000	Assembly 12	200.00	1
16	2	Assembly 13 which is build from 2 parts	10.0000	Assembly 13	200.00	1
17	2	Assembly 14 which is build from 2 parts	10.0000	Assembly 14	200.00	1
18	2	Assembly 15 which is build from 2 parts	10.0000	Assembly 15	200.00	1
19	2	Assembly 16 which is build from 2 parts	10.0000	Assembly 16	200.00	1
20	2	Assembly 17 which is build from 2 parts	10.0000	Assembly 17	200.00	1
21	2	Assembly 18 which is build from 2 parts	10.0000	Assembly 18	200.00	1
22	2	Assembly 19 which is build from 2 parts	10.0000	Assembly 19	200.00	1
23	2	Assembly 20 which is build from 2 parts	10.0000	Assembly 20	200.00	1
24	2	Assembly 21 which is build from 2 parts	10.0000	Assembly 21	200.00	1
\.


--
-- Data for Name: o_orderline; Type: TABLE DATA; Schema: public; Owner: order_user
--

COPY public.o_orderline (ol_o_id, ol_id, ol_msrp, ol_qty, ol_ship_date, ol_status, ol_total_value, ol_version, ol_i_id) FROM stdin;
\.


--
-- Data for Name: o_orders; Type: TABLE DATA; Schema: public; Owner: order_user
--

COPY public.o_orders (o_id, o_discount, o_entry_date, o_ol_cnt, o_ship_date, o_status, o_total, o_version, o_c_id) FROM stdin;
\.


--
-- Data for Name: u_sequences; Type: TABLE DATA; Schema: public; Owner: order_user
--

COPY public.u_sequences (s_id, s_nextnum) FROM stdin;
O_SEQ	0
INV_SEQ	0
OL_SEQ	0
C_SEQ	1
I_SEQ	24
\.


--
-- Name: o_customer o_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public.o_customer
    ADD CONSTRAINT o_customer_pkey PRIMARY KEY (c_id);


--
-- Name: o_customerinventory o_customerinventory_pkey; Type: CONSTRAINT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public.o_customerinventory
    ADD CONSTRAINT o_customerinventory_pkey PRIMARY KEY (ci_customerid, ci_id);


--
-- Name: o_item o_item_pkey; Type: CONSTRAINT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public.o_item
    ADD CONSTRAINT o_item_pkey PRIMARY KEY (i_id);


--
-- Name: o_orderline o_orderline_pkey; Type: CONSTRAINT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public.o_orderline
    ADD CONSTRAINT o_orderline_pkey PRIMARY KEY (ol_o_id, ol_id);


--
-- Name: o_orders o_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public.o_orders
    ADD CONSTRAINT o_orders_pkey PRIMARY KEY (o_id);


--
-- Name: u_sequences u_sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public.u_sequences
    ADD CONSTRAINT u_sequences_pkey PRIMARY KEY (s_id);


--
-- Name: o_customerinventory fk_o_customerinventory_ci_customerid; Type: FK CONSTRAINT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public.o_customerinventory
    ADD CONSTRAINT fk_o_customerinventory_ci_customerid FOREIGN KEY (ci_customerid) REFERENCES public.o_customer(c_id);


--
-- Name: o_orderline fk_o_orderline_ol_o_id; Type: FK CONSTRAINT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public.o_orderline
    ADD CONSTRAINT fk_o_orderline_ol_o_id FOREIGN KEY (ol_o_id) REFERENCES public.o_orders(o_id);


--
-- Name: o_orders fk_o_orders_o_c_id; Type: FK CONSTRAINT; Schema: public; Owner: order_user
--

ALTER TABLE ONLY public.o_orders
    ADD CONSTRAINT fk_o_orders_o_c_id FOREIGN KEY (o_c_id) REFERENCES public.o_customer(c_id);


--
-- PostgreSQL database dump complete
--

EOSQL

psql supplier_db --username=supplier_user --dbname=supplier_db <<-EOSQL
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.9 (Debian 11.9-1.pgdg90+1)
-- Dumped by pg_dump version 11.9 (Debian 11.9-1.pgdg90+1)

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

SET default_with_oids = false;

--
-- Name: s_component; Type: TABLE; Schema: public; Owner: supplier_user
--

CREATE TABLE public.s_component (
    comp_id character varying(20) NOT NULL,
    container_size integer,
    comp_cost numeric(12,2),
    comp_desc character varying(100),
    lead_time integer,
    comp_name character varying(10),
    qty_demanded integer,
    qty_on_order integer,
    comp_site_id integer,
    comp_unit character varying(10),
    comp_version integer
);


ALTER TABLE public.s_component OWNER TO supplier_user;

--
-- Name: s_purchase_order; Type: TABLE; Schema: public; Owner: supplier_user
--

CREATE TABLE public.s_purchase_order (
    po_number integer NOT NULL,
    po_sent_date date,
    po_site_id integer NOT NULL,
    po_start_date timestamp without time zone,
    po_supp_id integer,
    po_version integer
);


ALTER TABLE public.s_purchase_order OWNER TO supplier_user;

--
-- Name: s_purchase_orderline; Type: TABLE; Schema: public; Owner: supplier_user
--

CREATE TABLE public.s_purchase_orderline (
    pol_number integer NOT NULL,
    pol_po_id integer NOT NULL,
    pol_location integer NOT NULL,
    pol_leadtime integer,
    pol_message character varying(100),
    pol_qty integer,
    pol_balance numeric(12,2),
    pol_p_id character varying(20),
    pol_deldate date,
    pol_version integer
);


ALTER TABLE public.s_purchase_orderline OWNER TO supplier_user;

--
-- Name: s_supp_component; Type: TABLE; Schema: public; Owner: supplier_user
--

CREATE TABLE public.s_supp_component (
    sc_p_id character varying(20) NOT NULL,
    sc_supp_id integer NOT NULL,
    sc_del_date integer,
    sc_discount numeric(38,0),
    sc_price numeric(12,2),
    sc_qty integer,
    sc_version integer
);


ALTER TABLE public.s_supp_component OWNER TO supplier_user;

--
-- Name: s_supplier; Type: TABLE; Schema: public; Owner: supplier_user
--

CREATE TABLE public.s_supplier (
    supp_id integer NOT NULL,
    supp_contact character varying(25),
    supp_name character varying(16),
    supp_reply_url character varying(128),
    supp_version integer,
    supp_ws_url character varying(128),
    supp_city character varying(20),
    supp_country character varying(10),
    supp_phone character varying(16),
    supp_state character varying(2),
    supp_street1 character varying(20),
    supp_street2 character varying(20),
    supp_zip character varying(9)
);


ALTER TABLE public.s_supplier OWNER TO supplier_user;

--
-- Name: sequence; Type: TABLE; Schema: public; Owner: supplier_user
--

CREATE TABLE public.sequence (
    seq_name character varying(50) NOT NULL,
    seq_count numeric(38,0)
);


ALTER TABLE public.sequence OWNER TO supplier_user;

--
-- Name: u_sequences; Type: TABLE; Schema: public; Owner: supplier_user
--

CREATE TABLE public.u_sequences (
    s_id character varying(50) NOT NULL,
    s_nextnum numeric(38,0)
);


ALTER TABLE public.u_sequences OWNER TO supplier_user;

--
-- Data for Name: s_component; Type: TABLE DATA; Schema: public; Owner: supplier_user
--

COPY public.s_component (comp_id, container_size, comp_cost, comp_desc, lead_time, comp_name, qty_demanded, qty_on_order, comp_site_id, comp_unit, comp_version) FROM stdin;
\.


--
-- Data for Name: s_purchase_order; Type: TABLE DATA; Schema: public; Owner: supplier_user
--

COPY public.s_purchase_order (po_number, po_sent_date, po_site_id, po_start_date, po_supp_id, po_version) FROM stdin;
\.


--
-- Data for Name: s_purchase_orderline; Type: TABLE DATA; Schema: public; Owner: supplier_user
--

COPY public.s_purchase_orderline (pol_number, pol_po_id, pol_location, pol_leadtime, pol_message, pol_qty, pol_balance, pol_p_id, pol_deldate, pol_version) FROM stdin;
\.


--
-- Data for Name: s_supp_component; Type: TABLE DATA; Schema: public; Owner: supplier_user
--

COPY public.s_supp_component (sc_p_id, sc_supp_id, sc_del_date, sc_discount, sc_price, sc_qty, sc_version) FROM stdin;
1	1	1	0	101.00	10	1
1	2	1	5	102.00	10	1
2	2	1	7	101.00	10	1
2	3	1	5	102.00	5	1
3	3	1	5	102.00	5	1
\.


--
-- Data for Name: s_supplier; Type: TABLE DATA; Schema: public; Owner: supplier_user
--

COPY public.s_supplier (supp_id, supp_contact, supp_name, supp_reply_url, supp_version, supp_ws_url, supp_city, supp_country, supp_phone, supp_state, supp_street1, supp_street2, supp_zip) FROM stdin;
1	contact	Supplier 1	http://localhost:9080/reply	1	http://localhost:9080/ws	city	country	0102020203	DE	street1	street2	zip
2	contact	Supplier 2	http://localhost:9080/reply	1	http://localhost:9080/ws	city	country	0102020203	DE	street1	street2	zip
3	contact	Supplier 3	http://localhost:9080/reply	1	http://localhost:9080/ws	city	country	0102020203	DE	street1	street2	zip
\.


--
-- Data for Name: sequence; Type: TABLE DATA; Schema: public; Owner: supplier_user
--

COPY public.sequence (seq_name, seq_count) FROM stdin;
SEQ_GEN_TABLE	0
\.


--
-- Data for Name: u_sequences; Type: TABLE DATA; Schema: public; Owner: supplier_user
--

COPY public.u_sequences (s_id, s_nextnum) FROM stdin;
S_SEQ	3
\.


--
-- Name: s_component s_component_pkey; Type: CONSTRAINT; Schema: public; Owner: supplier_user
--

ALTER TABLE ONLY public.s_component
    ADD CONSTRAINT s_component_pkey PRIMARY KEY (comp_id);


--
-- Name: s_purchase_order s_purchase_order_pkey; Type: CONSTRAINT; Schema: public; Owner: supplier_user
--

ALTER TABLE ONLY public.s_purchase_order
    ADD CONSTRAINT s_purchase_order_pkey PRIMARY KEY (po_number);


--
-- Name: s_purchase_orderline s_purchase_orderline_pkey; Type: CONSTRAINT; Schema: public; Owner: supplier_user
--

ALTER TABLE ONLY public.s_purchase_orderline
    ADD CONSTRAINT s_purchase_orderline_pkey PRIMARY KEY (pol_number, pol_po_id);


--
-- Name: s_supp_component s_supp_component_pkey; Type: CONSTRAINT; Schema: public; Owner: supplier_user
--

ALTER TABLE ONLY public.s_supp_component
    ADD CONSTRAINT s_supp_component_pkey PRIMARY KEY (sc_p_id, sc_supp_id);


--
-- Name: s_supplier s_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: supplier_user
--

ALTER TABLE ONLY public.s_supplier
    ADD CONSTRAINT s_supplier_pkey PRIMARY KEY (supp_id);


--
-- Name: sequence sequence_pkey; Type: CONSTRAINT; Schema: public; Owner: supplier_user
--

ALTER TABLE ONLY public.sequence
    ADD CONSTRAINT sequence_pkey PRIMARY KEY (seq_name);


--
-- Name: u_sequences u_sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: supplier_user
--

ALTER TABLE ONLY public.u_sequences
    ADD CONSTRAINT u_sequences_pkey PRIMARY KEY (s_id);


--
-- Name: s_purchase_orderline fk_s_purchase_orderline_pol_po_id; Type: FK CONSTRAINT; Schema: public; Owner: supplier_user
--

ALTER TABLE ONLY public.s_purchase_orderline
    ADD CONSTRAINT fk_s_purchase_orderline_pol_po_id FOREIGN KEY (pol_po_id) REFERENCES public.s_purchase_order(po_number);


--
-- PostgreSQL database dump complete
--
EOSQL