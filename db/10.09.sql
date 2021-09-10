--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Name: actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actors (
    id integer NOT NULL,
    sort integer,
    name character varying(255),
    app_name character varying(255)
);


ALTER TABLE public.actors OWNER TO postgres;

--
-- Name: actors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actors_id_seq OWNER TO postgres;

--
-- Name: actors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actors_id_seq OWNED BY public.actors.id;


--
-- Name: actors_stands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actors_stands (
    id integer NOT NULL,
    stands_id integer,
    actors_id integer,
    sort integer
);


ALTER TABLE public.actors_stands OWNER TO postgres;

--
-- Name: actors_stands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actors_stands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actors_stands_id_seq OWNER TO postgres;

--
-- Name: actors_stands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actors_stands_id_seq OWNED BY public.actors_stands.id;


--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50) NOT NULL,
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text
);


ALTER TABLE public.directus_activity OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json
);


ALTER TABLE public.directus_collections OWNER TO postgres;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    "group" integer,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false
);


ALTER TABLE public.directus_fields OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json
);


ALTER TABLE public.directus_files OWNER TO postgres;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO postgres;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO postgres;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text
);


ALTER TABLE public.directus_permissions OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    filters json,
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer
);


ALTER TABLE public.directus_presets OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer
);


ALTER TABLE public.directus_revisions OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    module_list json,
    collection_list json,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_roles OWNER TO postgres;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid NOT NULL,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255)
);


ALTER TABLE public.directus_sessions OWNER TO postgres;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(10) DEFAULT '#00C897'::character varying,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255)
);


ALTER TABLE public.directus_settings OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128) NOT NULL,
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(8) DEFAULT 'en-US'::character varying,
    theme character varying(20) DEFAULT 'auto'::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255)
);


ALTER TABLE public.directus_users OWNER TO postgres;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url text,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections text
);


ALTER TABLE public.directus_webhooks OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_webhooks_id_seq OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photos (
    id integer NOT NULL,
    date_created timestamp with time zone,
    file uuid,
    user_id character varying(255),
    stand_id integer
);


ALTER TABLE public.photos OWNER TO postgres;

--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photos_id_seq OWNER TO postgres;

--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.photos_id_seq OWNED BY public.photos.id;


--
-- Name: stands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stands (
    id integer NOT NULL,
    name character varying(255),
    active boolean DEFAULT true NOT NULL,
    status character varying(255) DEFAULT 'available'::character varying,
    photo integer
);


ALTER TABLE public.stands OWNER TO postgres;

--
-- Name: stands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stands_id_seq OWNER TO postgres;

--
-- Name: stands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stands_id_seq OWNED BY public.stands.id;


--
-- Name: actors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors ALTER COLUMN id SET DEFAULT nextval('public.actors_id_seq'::regclass);


--
-- Name: actors_stands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors_stands ALTER COLUMN id SET DEFAULT nextval('public.actors_stands_id_seq'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq'::regclass);


--
-- Name: stands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stands ALTER COLUMN id SET DEFAULT nextval('public.stands_id_seq'::regclass);


--
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actors (id, sort, name, app_name) FROM stdin;
1	\N	Ксения Петрова	ksenia
\.


--
-- Data for Name: actors_stands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actors_stands (id, stands_id, actors_id, sort) FROM stdin;
1	1	1	\N
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment) FROM stdin;
1	authenticate	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:35:02.282255+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_users	d51af580-89ff-4ca4-b91a-5d3fab759b63	\N
2	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:36:00.892783+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_collections	stands	\N
3	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:36:00.892783+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	1	\N
4	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:36:00.892783+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	2	\N
5	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:36:51.514085+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	2	\N
6	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:37:17.524519+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_collections	actors	\N
7	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:37:17.524519+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	3	\N
8	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:37:17.524519+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	4	\N
9	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:37:46.75079+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	5	\N
10	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:37:58.204602+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	5	\N
11	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:38:30.349333+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	6	\N
12	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:38:49.723444+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	1	\N
13	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:38:49.729572+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	5	\N
14	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:38:49.734925+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	2	\N
15	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:38:51.555797+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	5	\N
16	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:38:53.034458+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	2	\N
17	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:38:55.30674+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	2	\N
18	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:38:57.87284+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	2	\N
19	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:41:08.467743+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	7	\N
20	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:41:08.632054+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_collections	actors_stands	\N
21	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:41:08.632054+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	8	\N
22	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:41:08.78075+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	9	\N
23	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:41:08.777577+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	10	\N
24	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:41:08.897549+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	11	\N
25	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:41:08.989126+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	12	\N
26	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:42:08.908418+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	13	\N
27	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:42:12.803968+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	3	\N
28	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:42:12.812349+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	4	\N
29	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:42:12.81873+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	6	\N
30	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:42:12.824484+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	13	\N
31	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:42:12.830836+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	7	\N
32	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:42:17.014358+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	6	\N
33	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:42:18.990134+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	13	\N
34	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:42:42.315289+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	actors	1	\N
35	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:42:42.315289+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	actors_stands	1	\N
36	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:42:42.315289+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	stands	1	\N
304	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:28:11.74863+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
37	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:43:04.333247+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	7	\N
38	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:43:27.541473+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	9	\N
39	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:43:39.669495+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	9	\N
40	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:44:18.0209+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	9	\N
41	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:44:43.808868+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	9	\N
42	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:45:00.245839+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	9	\N
43	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:45:15.763193+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	7	\N
44	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:46:12.201797+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	7	\N
45	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:46:27.939712+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	7	\N
46	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:47:09.116123+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	7	\N
47	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:47:31.394414+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	7	\N
48	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:48:06.647682+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_settings	1	\N
49	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:48:19.245394+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_settings	1	\N
50	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:48:46.094086+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_users	d51af580-89ff-4ca4-b91a-5d3fab759b63	\N
51	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:49:37.874811+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_users	d51af580-89ff-4ca4-b91a-5d3fab759b63	\N
52	authenticate	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:50:07.889409+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_users	d51af580-89ff-4ca4-b91a-5d3fab759b63	\N
53	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:51:00.753102+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_collections	photos	\N
54	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:51:00.753102+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	14	\N
55	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:51:00.753102+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	15	\N
56	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:52:20.248078+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	16	\N
57	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:52:39.880786+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	photos	1	\N
58	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:52:50.345089+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	photos	1	\N
59	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:53:18.828943+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	16	\N
60	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:53:51.265994+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	17	\N
61	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:54:03.274933+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_files	23f33c6c-a526-4441-97b1-3717e7d740df	\N
62	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 06:54:04.439126+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	photos	1	\N
63	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:16.402887+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	1	\N
64	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:19.341356+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	2	\N
65	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:20.806175+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	3	\N
66	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:22.199612+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	3	\N
67	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:23.664+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	2	\N
68	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:37.059904+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_roles	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	\N
69	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:37.167541+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	4	\N
70	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:37.167541+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	5	\N
71	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:37.167541+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	6	\N
72	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:37.167541+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	7	\N
73	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:37.167541+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	8	\N
74	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:37.167541+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	9	\N
75	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:37.167541+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	10	\N
76	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:37.167541+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	11	\N
77	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:37.167541+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	12	\N
78	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:37.167541+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	13	\N
79	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:37.167541+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	14	\N
80	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:41.807415+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	15	\N
81	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:44.076035+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	16	\N
82	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:45.686551+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	17	\N
83	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:47.500841+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	18	\N
84	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:49.045128+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	19	\N
85	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:34:51.863203+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	20	\N
86	authenticate	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:36:50.56754+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_users	d51af580-89ff-4ca4-b91a-5d3fab759b63	\N
87	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-05 07:37:41.678175+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_users	87fd071a-9e2b-498c-8498-26cb7101a6c1	\N
88	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:35:07.481336+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	21	\N
89	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:35:08.653826+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	22	\N
90	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:35:09.521327+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	23	\N
91	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:37:45.931147+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	24	\N
92	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:40:23.749156+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	25	\N
93	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:40:23.75121+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	26	\N
94	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:40:23.754105+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	23	\N
95	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:40:23.755905+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	27	\N
96	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:40:25.189656+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	23	\N
97	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:40:25.189656+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	25	\N
98	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:40:25.189656+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	26	\N
99	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:40:25.189656+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	27	\N
100	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:40:27.69982+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	28	\N
101	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:40:30.190585+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	28	\N
102	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:40:32.449364+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	29	\N
103	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:40:37.791149+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_permissions	29	\N
104	authenticate	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 06:43:17.078383+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_users	d51af580-89ff-4ca4-b91a-5d3fab759b63	\N
105	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:31:40.028411+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	18	\N
106	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:31:42.922527+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	18	\N
107	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:31:46.709843+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	1	\N
108	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:31:46.719352+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	5	\N
109	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:31:46.726032+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	18	\N
110	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:31:46.73177+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	9	\N
111	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:32:27.69727+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	18	\N
112	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:33:09.5683+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	18	\N
113	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:33:35.992588+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	18	\N
114	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:34:08.5234+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	18	\N
115	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:34:27.169882+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	stands	1	\N
116	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:34:29.788103+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	stands	1	\N
117	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:37:47.742586+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	19	\N
118	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:37:57.4627+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	19	\N
119	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:38:07.364484+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	stands	1	\N
120	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:38:21.557662+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	stands	1	\N
121	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:39:05.074152+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	20	\N
122	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:39:14.333531+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	19	\N
123	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:39:15.862257+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	20	\N
124	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:39:57.011089+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	20	\N
125	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 07:40:09.533604+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	stands	1	\N
126	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:15:05.559307+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	19	\N
127	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:15:13.624711+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	stands	1	\N
128	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:15:17.015925+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	stands	1	\N
129	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:15:21.944407+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	stands	1	\N
130	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:15:24.313569+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	stands	1	\N
131	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:16:33.308298+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	19	\N
132	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:16:45.016605+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	stands	1	\N
133	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:16:48.227442+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	stands	1	\N
134	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:18:11.94869+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	21	\N
135	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:18:45.245236+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	21	\N
136	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:01.304022+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	22	\N
137	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:03.787822+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	1	\N
138	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:03.790265+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	22	\N
139	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:03.797974+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	5	\N
140	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:03.803672+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	18	\N
141	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:03.810708+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	9	\N
142	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:03.816129+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	19	\N
143	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:03.821141+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	20	\N
144	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:03.827754+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	21	\N
145	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:31.851788+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	23	\N
146	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:35.833059+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	1	\N
147	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:35.834745+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	22	\N
148	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:35.916757+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	5	\N
149	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:35.917492+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	23	\N
150	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:35.923932+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	18	\N
151	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:35.932671+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	9	\N
152	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:35.937793+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	19	\N
153	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:35.942887+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	20	\N
154	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:35.949583+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	21	\N
155	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:19:51.082953+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	21	\N
156	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:20:43.100496+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	24	\N
157	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:21:33.007052+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	directus_fields	24	\N
158	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:22:42.612597+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	stands	1	\N
159	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-07 12:22:46.111846+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36	stands	1	\N
160	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:16:35.679547+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_users	87fd071a-9e2b-498c-8498-26cb7101a6c1	\N
161	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:20:33.785156+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_users	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	\N
162	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:01.06889+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_roles	b13f106d-bf98-4c45-94f9-f90bb0d040ad	\N
163	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:01.183343+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	30	\N
164	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:01.183343+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	31	\N
165	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:01.183343+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	32	\N
166	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:01.183343+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	33	\N
167	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:01.183343+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	34	\N
168	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:01.183343+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	35	\N
169	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:01.183343+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	36	\N
170	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:01.183343+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	37	\N
171	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:01.183343+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	38	\N
172	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:01.183343+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	39	\N
173	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:01.183343+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	40	\N
174	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:05.872846+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	41	\N
175	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:08.565236+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	42	\N
176	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:09.505946+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	43	\N
177	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:10.874471+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	42	\N
178	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:13.054388+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	44	\N
179	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:14.122146+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	45	\N
180	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 09:21:15.864438+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	46	\N
181	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 10:53:06.691363+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	25	\N
182	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 10:54:28.966003+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	25	\N
183	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 11:06:53.605007+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_users	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	\N
184	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 11:07:01.871547+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_users	87fd071a-9e2b-498c-8498-26cb7101a6c1	\N
185	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-08 11:07:07.700398+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
186	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 11:08:12.929817+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
187	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-08 11:08:15.895015+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
188	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 11:12:42.436278+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
189	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-08 11:12:45.099294+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
190	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 11:14:25.454972+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
191	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-08 11:14:27.415185+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
192	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 11:14:39.617985+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
193	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-08 11:14:40.880975+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
194	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 11:34:20.290686+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
195	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-08 11:34:21.911291+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
196	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 11:38:21.228847+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
197	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-08 11:38:22.947676+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
198	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 11:38:29.513833+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
199	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-08 11:38:31.766424+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
200	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 11:38:48.249053+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
201	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-08 11:42:25.986569+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
202	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-08 11:42:40.912821+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
203	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-08 11:42:58.576933+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
204	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:33:11.829061+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
205	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:33:31.911879+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	2	\N
206	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:35:01.014798+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	15	\N
207	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:35:03.250516+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	15	\N
208	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:35:39.948437+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	26	\N
209	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:36:37.38581+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	15	\N
210	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:36:49.419005+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	26	\N
211	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:36:52.276459+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	14	\N
212	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:36:52.281247+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	17	\N
213	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:36:52.286394+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	15	\N
214	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:36:52.291346+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	26	\N
215	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:37:15.953066+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	15	\N
216	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:37:33.567912+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	15	\N
217	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:37:48.034728+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	15	\N
218	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:37:54.785647+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	15	\N
219	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:42:12.203941+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	27	\N
220	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:42:27.649774+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	1	\N
221	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:42:39.076104+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	2	\N
222	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:43:34.228758+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	28	\N
223	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:44:02.756872+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	47	\N
224	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:44:04.612604+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	48	\N
225	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:44:46.816557+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	29	\N
226	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:44:50.114489+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	29	\N
227	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:46:12.469694+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	29	\N
228	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:46:59.386192+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	30	\N
229	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:47:02.357159+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	30	\N
230	authenticate	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:47:11.711786+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_users	d51af580-89ff-4ca4-b91a-5d3fab759b63	\N
231	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:50:13.612486+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	31	\N
232	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 08:57:57.702791+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	3	\N
233	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 08:57:57.810401+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
234	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 08:58:01.235657+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	4	\N
235	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 08:58:01.24808+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
236	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 08:58:10.007544+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	5	\N
237	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 08:58:10.086418+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
238	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 08:58:19.919051+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	6	\N
239	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 08:58:19.999526+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
240	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:59:16.190483+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	1	\N
241	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:59:16.190483+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	2	\N
242	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:59:16.190483+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	3	\N
243	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:59:16.190483+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	4	\N
244	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:59:16.190483+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	5	\N
245	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:59:16.190483+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	6	\N
246	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 08:59:56.786658+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
247	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 08:59:59.554929+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	7	\N
248	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 08:59:59.562055+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
249	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 09:01:34.044041+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	19	\N
250	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 09:04:14.059648+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	30	\N
251	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 09:04:55.466595+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
252	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 09:05:01.645756+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	8	\N
253	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 09:05:01.65893+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
254	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 09:53:34.11895+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
255	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 18:32:03.150001+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
256	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 18:39:43.870763+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
257	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 18:40:01.360193+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	9	\N
258	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 18:40:01.441504+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
259	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 19:33:14.413682+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_users	87fd071a-9e2b-498c-8498-26cb7101a6c1	\N
260	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 19:34:21.212976+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	f8b3e33a-e747-4398-900e-d32d2a36ae52	\N
261	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 19:35:36.60814+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	7500bd17-28f7-4aa2-80d9-64711a55c81a	\N
262	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 19:48:36.577102+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	5d896c8e-2d01-4ec6-b8f3-418b324f0985	\N
345	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:38:35.022911+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	18	\N
263	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 19:52:14.763812+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	40b736fc-d82c-4e58-b18e-3ee07055c86a	\N
264	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 19:52:43.820159+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	a90dd62d-339f-4e11-82c5-75290866dcbf	\N
265	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 19:53:09.243373+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	90319eb8-55fe-4501-9c1d-7fec606314ce	\N
266	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 19:53:18.595876+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	6a451917-fdb9-4b78-b772-705cdd66fa8f	\N
267	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 19:54:23.139819+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	c74c6eae-f854-4438-b4d7-81309b700045	\N
268	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 19:55:15.368913+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	ef4c81a3-0dad-4ce9-bc66-c791e77aed23	\N
269	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 19:55:58.396835+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	09a301b2-b3ec-4975-9e2a-265f0532d00b	\N
270	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 19:56:21.114211+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	e0f72959-f8a2-43ed-8bd2-eb43b4d757aa	\N
271	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:09:52.445562+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	eb399d98-4c33-4d06-b9a8-33a458a072b5	\N
272	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:11:03.768275+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	8a3c96d2-a55f-4563-990b-9ffd906feb57	\N
273	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:11:35.033794+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	ab391bfd-4c92-4a2a-b072-eb5abc46535e	\N
274	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:11:59.812148+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	15acfe2d-d5c9-4cf5-b8da-8039f174d1f0	\N
275	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:12:23.086402+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	41dd10aa-3c04-4337-8a49-9ae81e806e02	\N
276	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:13:55.92734+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	14966128-aac4-40b0-982e-6cb5ce25d8f2	\N
277	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:14:25.23425+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	5e95ee3d-88ea-454f-842b-450c4b51bf83	\N
278	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:17:04.897448+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	f1431fae-c012-404b-9ec0-18cd40d2e207	\N
279	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:18:36.00234+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	4deceb5a-d693-46f3-b377-59e6fe95ea82	\N
280	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:18:36.090692+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	9	\N
281	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 20:18:58.497997+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	7	\N
282	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 20:18:58.497997+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	8	\N
283	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 20:18:58.497997+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	9	\N
284	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 20:19:02.607398+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
285	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 20:19:13.280308+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	10	\N
286	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 20:19:13.286367+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
287	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:19:16.73345+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	c809bf88-bd48-4230-9dfc-0f966ddf79e8	\N
288	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:19:16.780812+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	10	\N
289	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:23:43.839706+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	cad3e2e7-608e-412a-b895-7b15471b14f5	\N
290	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:23:44.04776+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	10	\N
291	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:24:22.707602+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	d3db9c49-d057-4348-a0bf-c21bf945b277	\N
292	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:24:22.855774+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	10	\N
293	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:25:24.5115+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	6300dd8c-a1b6-4743-a2ff-7e219dc2fd08	\N
294	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:25:24.650297+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	10	\N
295	create	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 20:25:44.302065+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_permissions	49	\N
296	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:25:58.358496+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	12f57859-c44b-4e30-8833-f98374795717	\N
297	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:25:58.489396+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	10	\N
298	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:25:58.499246+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
299	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 20:28:00.162188+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
300	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 20:28:07.899496+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	11	\N
301	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 20:28:07.97619+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
302	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:28:11.706124+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	5873f93f-706d-4d61-9bca-d202a177dbd7	\N
303	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 20:28:11.742748+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	11	\N
305	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 21:20:43.612258+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
306	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:20:53.035491+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	12	\N
307	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:20:53.041159+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
308	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:20:58.047235+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	29266e9b-843a-4ef3-985a-8b32df76bfcf	\N
309	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:20:58.116562+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	12	\N
310	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:20:58.123445+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
311	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 21:21:40.756623+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
312	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:22:20.746941+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	13	\N
313	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:22:20.826677+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
314	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:22:26.151693+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	deec5ec8-29b5-4927-9187-25ee49cddeae	\N
315	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:22:26.193881+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	13	\N
316	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:22:26.200744+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
317	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 21:22:35.358607+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
318	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:24:37.761725+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	14	\N
319	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:24:37.841864+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
320	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:24:42.025689+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	4e7240d9-7f7f-4549-9da7-92d6878c7b62	\N
321	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:24:42.080155+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	14	\N
322	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:24:42.085698+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
323	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 21:26:33.845484+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
324	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:26:36.462911+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	15	\N
325	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:26:36.52196+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
326	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:26:41.854051+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	f7e7a1bb-99f9-4d65-a3f1-414618ed028f	\N
327	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:26:41.879092+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	15	\N
328	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:26:41.889023+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
329	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 21:27:23.053042+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
330	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:28:00.140318+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	16	\N
331	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:28:00.145766+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
332	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:28:03.969647+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	af12c236-df03-4622-b479-e53af9ac7eae	\N
333	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:28:04.007721+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	16	\N
334	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:28:04.015391+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
335	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 21:36:31.1747+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
336	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:36:40.906412+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	17	\N
337	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:36:40.984707+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
338	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:36:45.364187+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	fb4705a8-5553-429e-97a6-a4ca9826dc2c	\N
339	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:36:45.417676+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	17	\N
340	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:36:45.423194+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
341	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 21:38:21.406545+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
342	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:38:31.076206+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	18	\N
343	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:38:31.081255+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
344	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:38:34.969029+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	43fb011c-b5f0-49d5-af46-efaf8f142406	\N
346	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:38:35.028925+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
347	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 21:39:47.06753+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
348	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:39:54.979012+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	19	\N
349	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:39:54.984359+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
350	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:39:58.481983+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	98d1bcce-705d-4789-be62-300b16a68164	\N
351	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:39:58.637051+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	19	\N
352	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:39:58.645286+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
353	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 21:41:10.881511+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
354	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:41:22.086111+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	20	\N
355	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:41:22.092807+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
356	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:41:27.591587+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	82527a7b-3841-4113-9ba1-e402b59cc0c3	\N
357	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:41:27.644447+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	20	\N
358	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:41:27.64979+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
359	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 21:41:41.112157+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
360	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:42:57.409741+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	21	\N
361	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:42:57.41605+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
362	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:43:03.617926+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	477f936f-9771-4e22-9075-ecda07180f9b	\N
363	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:43:03.665667+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	21	\N
364	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:43:03.671726+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
365	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 21:43:44.990534+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
366	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:43:47.379064+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	22	\N
367	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:43:47.387021+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
368	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:43:52.783542+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	e7c19415-0c66-451e-931c-da3bc2071544	\N
369	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:43:52.849379+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	22	\N
370	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:43:52.858153+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
371	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 21:51:51.607198+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
372	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:51:54.460328+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	23	\N
373	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:51:54.471168+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
374	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:52:00.899013+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	b4fb63a5-cd83-4531-bc24-0654d872c335	\N
375	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:52:01.015124+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	23	\N
376	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:52:01.0204+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
377	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 21:53:37.553689+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
378	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:53:42.236682+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	24	\N
379	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:53:42.330642+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
380	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:53:45.049919+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	1d1cc1e1-b37f-4cea-9917-9f64973d6fc4	\N
381	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:53:45.191758+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	24	\N
382	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:53:45.207986+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
383	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 21:58:07.044561+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
384	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:58:13.195154+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	25	\N
385	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:58:13.272899+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
426	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:25:25.247133+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	32	\N
386	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:58:16.749956+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	e72884fc-84fe-4e9d-b7e5-3ea6141712ae	\N
387	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:58:16.868547+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	25	\N
388	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:58:16.875031+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
389	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 21:58:32.014682+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
390	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:58:36.40524+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	26	\N
391	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 21:58:36.410584+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
392	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:58:41.147875+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	1bcd4481-12e0-4c90-9cb2-b73704ae2301	\N
393	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:58:41.184328+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	26	\N
394	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 21:58:41.189536+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
395	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:01:08.870301+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
396	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:01:19.267404+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	27	\N
397	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:01:19.274837+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
398	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:01:22.792683+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	4bf872b1-9399-4303-8bcb-527cad9b3725	\N
399	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:01:22.865023+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	27	\N
400	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:01:22.877416+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
401	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:03:33.951484+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
402	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:03:36.869969+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	28	\N
403	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:03:36.874008+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
404	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:03:39.796895+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	fa41c398-374c-4c9f-8ac5-9003a1258579	\N
405	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:03:39.929226+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	28	\N
406	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:03:39.943969+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
407	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:09:39.512465+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
408	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:09:42.362328+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	29	\N
409	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:09:42.369429+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
410	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:09:49.872627+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	37fb06a0-1142-4547-a026-b7db82d2bf6f	\N
411	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:09:50.000402+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	29	\N
412	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:09:50.007938+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
413	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:21:59.830943+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
414	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:22:03.434783+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	30	\N
415	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:22:03.441156+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
416	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:22:08.920631+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	dcb3f4aa-afd6-472a-a0f9-1f97a6178c3c	\N
417	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:22:08.975536+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	30	\N
418	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:22:08.983294+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
419	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:24:09.708253+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
420	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:24:18.87388+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	31	\N
421	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:24:18.886341+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
422	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:25:01.599717+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
423	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:25:21.954581+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	32	\N
424	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:25:21.962728+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
425	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:25:25.109459+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	9d7b7123-d1f2-4a62-b73c-78ac858bfc47	\N
427	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:25:25.254154+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
428	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:25:30.270532+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
429	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:25:36.807361+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	33	\N
430	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:25:36.812385+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
431	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:25:40.002686+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	ae770ba1-7e6d-46d2-90fa-43cbe33b7b49	\N
432	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:25:40.064781+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	33	\N
433	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:25:40.077579+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
434	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:25:45.100966+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
435	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:29:38.024359+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	34	\N
436	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:29:38.028728+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
437	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:29:41.717582+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	674426d4-de8b-4711-b447-454179754122	\N
462	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:31:40.924445+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	38	\N
463	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:31:40.934887+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
464	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:31:45.949208+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
438	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:29:41.820576+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	34	\N
439	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:29:41.836054+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
440	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:29:46.857504+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
441	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:30:46.161875+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	photos	35	\N
442	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:30:46.166862+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	stands	1	\N
443	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:30:48.562105+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	b39db71e-44f9-425b-8589-b42897cbf612	\N
444	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:30:48.601117+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	35	\N
445	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:30:48.607407+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
446	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:30:53.617819+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
447	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:31:09.227373+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	photos	36	\N
448	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:31:09.309224+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	stands	1	\N
449	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:31:11.487769+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	0af14a88-8042-4ad6-9443-074974940038	\N
450	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:31:11.525752+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	36	\N
451	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:31:11.534751+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
452	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:31:16.548512+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
453	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:31:24.644605+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	photos	37	\N
454	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:31:24.652522+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	stands	1	\N
455	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:31:26.908477+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	7dd1e29b-5e6d-4dec-b5fe-1667b119c85d	\N
456	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:31:26.953688+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	37	\N
457	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:31:26.960633+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
458	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:31:31.973502+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
459	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:31:38.364572+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	photos	38	\N
460	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:31:38.444254+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	stands	1	\N
461	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:31:40.804578+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	56701c45-16ab-46cb-8196-03dcbbe8baaa	\N
465	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	10	\N
466	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	11	\N
467	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	12	\N
468	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	13	\N
469	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	14	\N
470	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	15	\N
471	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	16	\N
472	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	17	\N
473	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	18	\N
474	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	19	\N
475	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	20	\N
476	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	21	\N
477	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	22	\N
478	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	23	\N
479	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	24	\N
480	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	25	\N
481	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	26	\N
482	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	27	\N
483	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	28	\N
484	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	29	\N
485	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	30	\N
486	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	31	\N
487	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	32	\N
488	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	33	\N
489	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:14.615558+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	34	\N
490	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:18.080042+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	35	\N
491	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:18.080042+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	36	\N
492	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:18.080042+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	37	\N
493	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-09 22:33:18.080042+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	38	\N
494	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:33:42.845232+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	photos	39	\N
495	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:33:42.925417+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	stands	1	\N
496	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:33:45.234119+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	1229d63d-c88f-400c-b036-cb7fbaeffd7a	\N
497	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:33:45.288253+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	39	\N
498	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:33:45.301641+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
499	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:33:50.312771+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
500	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:33:50.826253+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	photos	40	\N
501	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:33:50.907672+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	stands	1	\N
502	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:33:53.180783+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	75e027f2-041b-4872-9436-5f9b19e63f7c	\N
503	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:33:53.216353+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	40	\N
504	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:33:53.222244+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
505	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:33:58.23427+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
506	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:34:02.386351+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	photos	41	\N
507	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:34:02.464786+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	stands	1	\N
508	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:34:04.88107+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	34c40ad3-b8f0-4361-bcca-963445176a9d	\N
509	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:34:04.918628+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	41	\N
510	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:34:04.924551+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
511	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:34:09.944339+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
512	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:34:11.685262+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	photos	42	\N
513	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:34:11.690548+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	stands	1	\N
514	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:34:13.877108+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	d558a308-d649-4be3-9176-f820688b8be5	\N
515	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:34:14.000582+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	42	\N
516	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:34:14.011266+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
517	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:34:19.019364+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
518	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:34:24.872637+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	photos	43	\N
519	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-09 22:34:24.950334+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	stands	1	\N
520	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:34:27.278025+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	295657bd-5c26-4399-afc7-870e73f8da0e	\N
521	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:34:27.393963+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	43	\N
522	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:34:27.405488+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
523	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-09 22:34:32.434449+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
524	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 04:40:00.247859+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	44	\N
525	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 04:40:00.268833+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
526	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:41:10.16277+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	65d6c22e-7bd3-48d4-970c-108b1a7ab19d	\N
527	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:41:10.263131+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	44	\N
528	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:41:10.279296+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
529	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:41:15.298982+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
530	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 04:41:54.726338+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	45	\N
531	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 04:41:54.805754+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
532	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:41:58.254965+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	6f0eabf0-b4b0-4d15-a221-00c9ed6edc7f	\N
533	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:41:58.309572+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	45	\N
534	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:41:58.314534+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
535	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:42:03.328122+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
536	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 04:45:55.668467+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	46	\N
537	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 04:45:55.748244+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
538	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:46:00.016936+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	0e17bfb2-aa41-4d9a-9c96-9e91a731886f	\N
539	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:46:00.122012+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	46	\N
540	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:46:00.133143+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
541	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:46:05.156764+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
542	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 04:46:43.147278+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	47	\N
543	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 04:46:43.150962+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
544	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:46:48.15013+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	0d427bb2-6ddc-4f68-a674-be436ebcc316	\N
545	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:46:48.193164+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	47	\N
546	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:46:48.20011+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
547	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:46:53.221588+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
548	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 04:47:04.875995+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	48	\N
549	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 04:47:04.880825+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
550	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:47:07.790712+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	fdf3db00-25c3-4d5b-b8de-98bb04e7aa52	\N
551	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:47:07.84176+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	48	\N
552	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:47:07.849083+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
553	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 04:47:12.857818+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
554	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 04:52:43.671923+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	photos	49	\N
555	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 04:52:43.751862+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	stands	1	\N
556	update	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:14:46.212674+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	stands	1	\N
557	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:14:55.111437+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	photos	50	\N
558	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:14:55.178039+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	stands	1	\N
559	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:14:57.846528+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	6f305678-8bfe-4728-9ce1-a4b494c2146c	\N
560	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:14:57.94038+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	50	\N
561	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:14:57.948683+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
562	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:15:02.969559+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
563	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:15:12.476625+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	photos	51	\N
564	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:15:12.559617+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	stands	1	\N
565	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:15:15.005004+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	d73e7607-2757-4160-b72f-9aacebe48813	\N
566	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:15:15.126676+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	51	\N
567	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:15:15.135516+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
568	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:15:20.162549+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
569	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:15:36.683655+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	photos	52	\N
570	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:15:36.769691+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	stands	1	\N
571	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:15:38.857545+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	c686eb24-340e-4975-9a9a-8caae9c4e744	\N
572	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:15:38.916064+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	52	\N
573	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:15:38.936254+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
574	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:15:43.949092+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
575	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:15:46.752507+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	photos	53	\N
576	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:15:46.83313+00	192.168.0.103	Mozilla/5.0 (Linux; Android 11; Mi A3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.166 Mobile Safari/537.36	stands	1	\N
577	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:15:48.93356+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	c957c98e-64d0-4f1d-aca1-b02e1b0848c6	\N
578	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:15:49.049017+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	53	\N
579	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:15:49.056246+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
580	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:15:54.064438+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
581	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:17.52123+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	39	\N
582	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:17.52123+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	40	\N
583	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:17.52123+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	41	\N
584	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:17.52123+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	42	\N
585	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:17.52123+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	43	\N
586	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:17.52123+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	44	\N
587	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:17.52123+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	45	\N
588	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:17.52123+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	46	\N
589	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:17.52123+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	47	\N
590	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:17.52123+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	48	\N
591	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:17.52123+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	49	\N
592	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:17.52123+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	50	\N
593	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:17.52123+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	51	\N
594	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:17.52123+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	52	\N
595	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:17.52123+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	53	\N
596	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	c957c98e-64d0-4f1d-aca1-b02e1b0848c6	\N
597	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	c686eb24-340e-4975-9a9a-8caae9c4e744	\N
598	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	d73e7607-2757-4160-b72f-9aacebe48813	\N
599	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	6f305678-8bfe-4728-9ce1-a4b494c2146c	\N
600	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	fdf3db00-25c3-4d5b-b8de-98bb04e7aa52	\N
601	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	0d427bb2-6ddc-4f68-a674-be436ebcc316	\N
602	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	0e17bfb2-aa41-4d9a-9c96-9e91a731886f	\N
603	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	6f0eabf0-b4b0-4d15-a221-00c9ed6edc7f	\N
604	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	65d6c22e-7bd3-48d4-970c-108b1a7ab19d	\N
605	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	295657bd-5c26-4399-afc7-870e73f8da0e	\N
606	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	d558a308-d649-4be3-9176-f820688b8be5	\N
607	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	34c40ad3-b8f0-4361-bcca-963445176a9d	\N
608	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	75e027f2-041b-4872-9436-5f9b19e63f7c	\N
609	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	1229d63d-c88f-400c-b036-cb7fbaeffd7a	\N
610	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	56701c45-16ab-46cb-8196-03dcbbe8baaa	\N
611	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	7dd1e29b-5e6d-4dec-b5fe-1667b119c85d	\N
612	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	0af14a88-8042-4ad6-9443-074974940038	\N
613	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	b39db71e-44f9-425b-8589-b42897cbf612	\N
614	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	674426d4-de8b-4711-b447-454179754122	\N
615	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	ae770ba1-7e6d-46d2-90fa-43cbe33b7b49	\N
616	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	9d7b7123-d1f2-4a62-b73c-78ac858bfc47	\N
617	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	dcb3f4aa-afd6-472a-a0f9-1f97a6178c3c	\N
618	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	37fb06a0-1142-4547-a026-b7db82d2bf6f	\N
619	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	fa41c398-374c-4c9f-8ac5-9003a1258579	\N
620	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:22.100989+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	4bf872b1-9399-4303-8bcb-527cad9b3725	\N
621	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	1bcd4481-12e0-4c90-9cb2-b73704ae2301	\N
622	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	e72884fc-84fe-4e9d-b7e5-3ea6141712ae	\N
623	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	1d1cc1e1-b37f-4cea-9917-9f64973d6fc4	\N
624	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	b4fb63a5-cd83-4531-bc24-0654d872c335	\N
625	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	e7c19415-0c66-451e-931c-da3bc2071544	\N
626	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	477f936f-9771-4e22-9075-ecda07180f9b	\N
627	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	82527a7b-3841-4113-9ba1-e402b59cc0c3	\N
628	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	98d1bcce-705d-4789-be62-300b16a68164	\N
629	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	43fb011c-b5f0-49d5-af46-efaf8f142406	\N
630	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	fb4705a8-5553-429e-97a6-a4ca9826dc2c	\N
631	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	af12c236-df03-4622-b479-e53af9ac7eae	\N
632	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	f7e7a1bb-99f9-4d65-a3f1-414618ed028f	\N
633	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	4e7240d9-7f7f-4549-9da7-92d6878c7b62	\N
634	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	deec5ec8-29b5-4927-9187-25ee49cddeae	\N
635	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	29266e9b-843a-4ef3-985a-8b32df76bfcf	\N
636	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	5873f93f-706d-4d61-9bca-d202a177dbd7	\N
637	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	12f57859-c44b-4e30-8833-f98374795717	\N
638	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	6300dd8c-a1b6-4743-a2ff-7e219dc2fd08	\N
639	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	d3db9c49-d057-4348-a0bf-c21bf945b277	\N
640	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	cad3e2e7-608e-412a-b895-7b15471b14f5	\N
641	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	c809bf88-bd48-4230-9dfc-0f966ddf79e8	\N
642	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	4deceb5a-d693-46f3-b377-59e6fe95ea82	\N
643	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	f1431fae-c012-404b-9ec0-18cd40d2e207	\N
644	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	5e95ee3d-88ea-454f-842b-450c4b51bf83	\N
645	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:24.882965+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	14966128-aac4-40b0-982e-6cb5ce25d8f2	\N
646	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	41dd10aa-3c04-4337-8a49-9ae81e806e02	\N
647	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	15acfe2d-d5c9-4cf5-b8da-8039f174d1f0	\N
648	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	ab391bfd-4c92-4a2a-b072-eb5abc46535e	\N
649	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	8a3c96d2-a55f-4563-990b-9ffd906feb57	\N
650	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	eb399d98-4c33-4d06-b9a8-33a458a072b5	\N
651	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	e0f72959-f8a2-43ed-8bd2-eb43b4d757aa	\N
652	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	09a301b2-b3ec-4975-9e2a-265f0532d00b	\N
653	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	ef4c81a3-0dad-4ce9-bc66-c791e77aed23	\N
654	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	c74c6eae-f854-4438-b4d7-81309b700045	\N
655	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	6a451917-fdb9-4b78-b772-705cdd66fa8f	\N
656	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	90319eb8-55fe-4501-9c1d-7fec606314ce	\N
657	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	a90dd62d-339f-4e11-82c5-75290866dcbf	\N
658	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	40b736fc-d82c-4e58-b18e-3ee07055c86a	\N
659	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	5d896c8e-2d01-4ec6-b8f3-418b324f0985	\N
660	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	7500bd17-28f7-4aa2-80d9-64711a55c81a	\N
661	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	f8b3e33a-e747-4398-900e-d32d2a36ae52	\N
662	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:17:26.872539+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	23f33c6c-a526-4441-97b1-3717e7d740df	\N
663	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:18:45.110172+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	photos	54	\N
664	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:18:45.190045+00	127.0.0.1	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36	stands	1	\N
665	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:18:50.68377+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	448744ec-118c-4fe6-9266-99ea54971ae4	\N
666	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:18:50.805916+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	54	\N
667	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:18:50.815827+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
668	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:18:55.828106+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
669	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:28:02.19807+00	192.168.0.102	Mozilla/5.0 (Linux; Android 8.0.0; AUM-L41) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36	photos	55	\N
670	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:28:02.245731+00	192.168.0.102	Mozilla/5.0 (Linux; Android 8.0.0; AUM-L41) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36	photos	56	\N
671	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:28:02.290537+00	192.168.0.102	Mozilla/5.0 (Linux; Android 8.0.0; AUM-L41) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36	stands	1	\N
676	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:28:09.505326+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
672	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:28:02.291923+00	192.168.0.102	Mozilla/5.0 (Linux; Android 8.0.0; AUM-L41) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36	stands	1	\N
673	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:28:04.359753+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	bc7827f4-1dfd-427d-aec9-8bdaed023ba2	\N
674	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:28:04.480072+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	56	\N
675	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:28:04.488774+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
677	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:28:37.790132+00	192.168.0.102	Mozilla/5.0 (Linux; Android 8.0.0; AUM-L41) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36	photos	57	\N
678	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:28:37.880156+00	192.168.0.102	Mozilla/5.0 (Linux; Android 8.0.0; AUM-L41) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36	stands	1	\N
679	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:28:43.253539+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	1a7de6b6-189d-4e4b-8be9-5dbfe1fe99c7	\N
680	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:28:43.363184+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	57	\N
681	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:28:43.371145+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
682	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:28:48.383266+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
683	create	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:29:02.965893+00	192.168.0.102	Mozilla/5.0 (Linux; Android 8.0.0; AUM-L41) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36	photos	58	\N
684	update	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	2021-09-10 05:29:03.046577+00	192.168.0.102	Mozilla/5.0 (Linux; Android 8.0.0; AUM-L41) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36	stands	1	\N
685	create	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:29:08.224269+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	directus_files	388d49af-9d13-4708-9c9d-4494d9d006ad	\N
686	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:29:08.352224+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	photos	58	\N
687	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:29:08.358416+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
688	update	87fd071a-9e2b-498c-8498-26cb7101a6c1	2021-09-10 05:29:13.377854+00	::1	UnityPlayer/2019.2.9f1 (UnityWebRequest/1.0, libcurl/7.52.0-DEV)	stands	1	\N
689	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:44:35.293381+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	54	\N
690	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:44:35.293381+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	55	\N
691	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:44:35.293381+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	56	\N
692	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:44:35.293381+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	57	\N
693	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:44:35.293381+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	photos	58	\N
694	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:44:40.606118+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	388d49af-9d13-4708-9c9d-4494d9d006ad	\N
695	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:44:40.606118+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	1a7de6b6-189d-4e4b-8be9-5dbfe1fe99c7	\N
696	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:44:40.606118+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	bc7827f4-1dfd-427d-aec9-8bdaed023ba2	\N
697	delete	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-10 05:44:40.606118+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_files	448744ec-118c-4fe6-9266-99ea54971ae4	\N
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields) FROM stdin;
actors	\N	\N	\N	f	f	\N	\N	t	\N	\N	sort	all	\N	\N
actors_stands	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N
photos	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N
stands	\N	\N	\N	f	f	\N	\N	t	archived	draft	\N	all	\N	\N
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, "group", translations, note, conditions, required) FROM stdin;
8	actors_stands	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	\N	f
10	actors_stands	stands_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	\N	f
11	actors_stands	actors_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	\N	f
12	actors_stands	sort	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	\N	f
3	actors	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	\N	f
4	actors	sort	\N	input	\N	\N	\N	f	t	2	full	\N	\N	\N	\N	f
6	actors	name	\N	input	{"placeholder":"Enter actor's name..."}	raw	\N	f	f	3	half	\N	\N	\N	\N	f
13	actors	app_name	\N	input	{"placeholder":"Enter actor's name for app"}	raw	\N	f	f	4	half	\N	\N	\N	\N	f
14	photos	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	\N	f
17	photos	file	\N	file-image	\N	image	{}	f	f	2	full	\N	\N	\N	\N	f
26	photos	user_id	\N	input	\N	raw	\N	t	f	4	half	\N	\N	User who make this photo	\N	f
15	photos	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	f	3	half	\N	\N	\N	\N	f
7	actors	stands	m2m	list-m2m	{"template":"{{stands_id.name}}"}	related-values	{"template":"{{stands_id.name}}"}	f	f	5	full	\N	\N	\N	\N	f
1	stands	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	\N	f
28	photos	stand_id	\N	input	\N	raw	\N	t	f	\N	full	\N	\N	\N	\N	f
5	stands	name	\N	input	{"placeholder":"Enter stand's name"}	raw	\N	f	f	2	half	\N	\N	\N	\N	f
18	stands	active	boolean	boolean	{"label":"Active"}	boolean	{"iconOff":"stop","colorOff":"#B70101","iconOn":"play_arrow","labelOn":"active","labelOff":"disable"}	f	f	3	half	\N	\N	\N	\N	f
9	stands	actors	m2m	list-m2m	{"template":"{{actors_id.name}}"}	related-values	{"template":"{{actors_id.name}}"}	f	f	4	full	\N	\N	\N	\N	f
19	stands	status	\N	select-dropdown	{"choices":[{"text":"Available","value":"available"},{"text":"OnWelcomeScreen","value":"welcome"},{"text":"OnPhotoScreen","value":"photo"},{"text":"OnFinalScreen","value":"final"}]}	labels	{"choices":[{"text":"Available","value":"available","foreground":null,"background":"#00C897"},{"text":"On Welcome Screen","value":"welcome"},{"text":"On Photo Screen","value":"photo"},{"text":"OnFinalScreen","value":"final"}]}	f	f	5	half	\N	\N	\N	\N	f
30	stands	photo	\N	select-dropdown-m2o	{"template":"{{id}}"}	related-values	{"template":"{{id}}"}	f	f	\N	half	\N	\N	\N	\N	f
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata) FROM stdin;
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2021-09-05 06:33:41.507058+00
20201029A	Remove System Relations	2021-09-05 06:33:41.512117+00
20201029B	Remove System Collections	2021-09-05 06:33:41.515114+00
20201029C	Remove System Fields	2021-09-05 06:33:41.523406+00
20201105A	Add Cascade System Relations	2021-09-05 06:33:41.568382+00
20201105B	Change Webhook URL Type	2021-09-05 06:33:41.594572+00
20210225A	Add Relations Sort Field	2021-09-05 06:33:41.597673+00
20210304A	Remove Locked Fields	2021-09-05 06:33:41.6011+00
20210312A	Webhooks Collections Text	2021-09-05 06:33:41.603964+00
20210331A	Add Refresh Interval	2021-09-05 06:33:41.605929+00
20210415A	Make Filesize Nullable	2021-09-05 06:33:41.61094+00
20210416A	Add Collections Accountability	2021-09-05 06:33:41.614285+00
20210422A	Remove Files Interface	2021-09-05 06:33:41.616477+00
20210506A	Rename Interfaces	2021-09-05 06:33:41.638443+00
20210510A	Restructure Relations	2021-09-05 06:33:41.666579+00
20210518A	Add Foreign Key Constraints	2021-09-05 06:33:41.679337+00
20210519A	Add System Fk Triggers	2021-09-05 06:33:41.700623+00
20210521A	Add Collections Icon Color	2021-09-05 06:33:41.702929+00
20210608A	Add Deep Clone Config	2021-09-05 06:33:41.706098+00
20210626A	Change Filesize Bigint	2021-09-05 06:33:41.72264+00
20210716A	Add Conditions to Fields	2021-09-05 06:33:41.725641+00
20210721A	Add Default Folder	2021-09-05 06:33:41.732013+00
20210802A	Replace Groups	2021-09-05 06:33:41.734909+00
20210803A	Add Required to Fields	2021-09-05 06:33:41.737115+00
20210805A	Update Groups	2021-09-05 06:33:41.73928+00
20210805B	Change Image Metadata Structure	2021-09-05 06:33:41.743683+00
20210811A	Add Geometry Config	2021-09-05 06:33:41.746154+00
20210831A	Remove Limit Column	2021-09-05 06:33:41.748778+00
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) FROM stdin;
1	\N	photos	read	{}	{}	\N	*
4	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	directus_files	create	{}	\N	\N	*
5	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	directus_files	read	{}	\N	\N	*
6	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	directus_files	update	{}	\N	\N	*
7	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	directus_files	delete	{}	\N	\N	*
8	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	directus_folders	create	{}	\N	\N	*
9	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	directus_folders	read	{}	\N	\N	*
10	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	directus_folders	update	{}	\N	\N	*
11	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	directus_folders	delete	{}	\N	\N	\N
12	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	directus_users	read	{}	\N	\N	\N
13	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	directus_users	update	{"id":{"_eq":"$CURRENT_USER"}}	\N	\N	first_name,last_name,email,password,location,title,description,avatar,language,theme
14	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	directus_roles	read	{}	\N	\N	*
15	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	actors	read	{}	{}	\N	*
16	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	stands	read	{}	{}	\N	*
17	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	photos	update	{}	{}	\N	*
18	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	photos	create	{}	{}	\N	*
19	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	photos	read	{}	{}	\N	*
20	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	actors_stands	read	{}	{}	\N	*
21	\N	stands	read	{}	{}	\N	*
22	\N	actors_stands	read	{}	{}	\N	*
24	\N	directus_files	read	{}	{}	\N	*
29	\N	actors	read	{}	{}	\N	*
30	b13f106d-bf98-4c45-94f9-f90bb0d040ad	directus_files	create	{}	\N	\N	*
31	b13f106d-bf98-4c45-94f9-f90bb0d040ad	directus_files	read	{}	\N	\N	*
32	b13f106d-bf98-4c45-94f9-f90bb0d040ad	directus_files	update	{}	\N	\N	*
33	b13f106d-bf98-4c45-94f9-f90bb0d040ad	directus_files	delete	{}	\N	\N	*
34	b13f106d-bf98-4c45-94f9-f90bb0d040ad	directus_folders	create	{}	\N	\N	*
35	b13f106d-bf98-4c45-94f9-f90bb0d040ad	directus_folders	read	{}	\N	\N	*
36	b13f106d-bf98-4c45-94f9-f90bb0d040ad	directus_folders	update	{}	\N	\N	*
37	b13f106d-bf98-4c45-94f9-f90bb0d040ad	directus_folders	delete	{}	\N	\N	\N
38	b13f106d-bf98-4c45-94f9-f90bb0d040ad	directus_users	read	{}	\N	\N	\N
39	b13f106d-bf98-4c45-94f9-f90bb0d040ad	directus_users	update	{"id":{"_eq":"$CURRENT_USER"}}	\N	\N	first_name,last_name,email,password,location,title,description,avatar,language,theme
40	b13f106d-bf98-4c45-94f9-f90bb0d040ad	directus_roles	read	{}	\N	\N	*
41	b13f106d-bf98-4c45-94f9-f90bb0d040ad	actors	read	{}	{}	\N	*
43	b13f106d-bf98-4c45-94f9-f90bb0d040ad	actors_stands	read	{}	{}	\N	*
44	b13f106d-bf98-4c45-94f9-f90bb0d040ad	stands	read	{}	{}	\N	*
45	b13f106d-bf98-4c45-94f9-f90bb0d040ad	stands	update	{}	{}	\N	*
46	b13f106d-bf98-4c45-94f9-f90bb0d040ad	photos	read	{}	{}	\N	*
47	b13f106d-bf98-4c45-94f9-f90bb0d040ad	photos	create	{}	{}	\N	*
48	b13f106d-bf98-4c45-94f9-f90bb0d040ad	photos	update	{}	{}	\N	*
49	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	stands	update	{}	{}	\N	*
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, filters, layout, layout_query, layout_options, refresh_interval) FROM stdin;
3	\N	d51af580-89ff-4ca4-b91a-5d3fab759b63	\N	directus_users	\N	\N	cards	{"cards":{"sort":"email","page":1}}	{"cards":{"icon":"account_circle","title":"{{ first_name }} {{ last_name }}","subtitle":"{{ email }}","size":4}}	\N
4	\N	d51af580-89ff-4ca4-b91a-5d3fab759b63	\N	photos	\N	[]	cards	{"tabular":{"fields":["file","date_created"]},"cards":{"page":1,"sort":"id"}}	{"cards":{"title":"{{id}}. Stand {{stand_id}}","subtitle":"{{date_created}}","imageFit":"crop","size":2}}	\N
5	\N	d51af580-89ff-4ca4-b91a-5d3fab759b63	\N	directus_files	\N	\N	cards	{"cards":{"sort":"-uploaded_on","page":1}}	{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}	\N
1	\N	d51af580-89ff-4ca4-b91a-5d3fab759b63	\N	stands	\N	\N	tabular	{"tabular":{"page":1,"fields":["name","status","actors","active"],"sort":"status"}}	\N	\N
2	\N	d51af580-89ff-4ca4-b91a-5d3fab759b63	\N	actors	\N	\N	tabular	{"tabular":{"page":1,"fields":["name","app_name","stands"]}}	\N	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
1	actors_stands	actors_id	actors	stands	\N	\N	stands_id	sort	delete
2	actors_stands	stands_id	stands	actors	\N	\N	actors_id	\N	nullify
3	photos	file	directus_files	\N	\N	\N	\N	\N	nullify
5	stands	photo	photos	\N	\N	\N	\N	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent) FROM stdin;
1	2	directus_collections	stands	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"stands"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"stands"}	\N
2	3	directus_fields	1	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"stands"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"stands"}	\N
3	4	directus_fields	2	{"width":"full","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#00C897","value":"published"},{"background":"#D3DAE4","value":"draft"},{"background":"#F7971C","value":"archived"}]},"field":"status","collection":"stands"}	{"width":"full","options":{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#00C897","value":"published"},{"background":"#D3DAE4","value":"draft"},{"background":"#F7971C","value":"archived"}]},"field":"status","collection":"stands"}	\N
4	5	directus_fields	2	{"id":2,"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Active","value":"active"},{"text":"Disable","value":"disable"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#00C897","value":"active"},{"background":"#D3DAE4","value":"disable"}]},"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Active","value":"active"},{"text":"Disable","value":"disable"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#00C897","value":"active"},{"background":"#D3DAE4","value":"disable"}]},"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
5	6	directus_collections	actors	{"sort_field":"sort","singleton":false,"collection":"actors"}	{"sort_field":"sort","singleton":false,"collection":"actors"}	\N
6	7	directus_fields	3	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"actors"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"actors"}	\N
7	8	directus_fields	4	{"interface":"input","hidden":true,"field":"sort","collection":"actors"}	{"interface":"input","hidden":true,"field":"sort","collection":"actors"}	\N
8	9	directus_fields	5	{"hidden":false,"interface":"input","options":{"placeholder":"Enter stand's name"},"display":"raw","readonly":false,"collection":"stands","field":"name"}	{"hidden":false,"interface":"input","options":{"placeholder":"Enter stand's name"},"display":"raw","readonly":false,"collection":"stands","field":"name"}	\N
9	10	directus_fields	5	{"id":5,"collection":"stands","field":"name","special":null,"interface":"input","options":{"placeholder":"Enter stand's name"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"name","special":null,"interface":"input","options":{"placeholder":"Enter stand's name"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
10	11	directus_fields	6	{"hidden":false,"interface":"input","options":{"placeholder":"Enter actor's name..."},"display":"raw","readonly":false,"collection":"actors","field":"name"}	{"hidden":false,"interface":"input","options":{"placeholder":"Enter actor's name..."},"display":"raw","readonly":false,"collection":"actors","field":"name"}	\N
11	12	directus_fields	1	{"id":1,"collection":"stands","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"id","sort":1,"group":null}	\N
12	13	directus_fields	5	{"id":5,"collection":"stands","field":"name","special":null,"interface":"input","options":{"placeholder":"Enter stand's name"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"name","sort":2,"group":null}	\N
13	14	directus_fields	2	{"id":2,"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Active","value":"active"},{"text":"Disable","value":"disable"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#00C897","value":"active"},{"background":"#D3DAE4","value":"disable"}]},"readonly":false,"hidden":false,"sort":3,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"status","sort":3,"group":null}	\N
14	15	directus_fields	5	{"id":5,"collection":"stands","field":"name","special":null,"interface":"input","options":{"placeholder":"Enter stand's name"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"name","width":"half"}	\N
15	16	directus_fields	2	{"id":2,"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Active","value":"active"},{"text":"Disable","value":"disable"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#00C897","value":"active"},{"background":"#D3DAE4","value":"disable"}]},"readonly":false,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"status","width":"half"}	\N
16	17	directus_fields	2	{"id":2,"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Active","value":"active"},{"text":"Disable","value":"disable"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#00C897","value":"active"},{"background":"#D3DAE4","value":"disable"}]},"readonly":false,"hidden":false,"sort":3,"width":"fill","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"status","width":"fill"}	\N
17	18	directus_fields	2	{"id":2,"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Active","value":"active"},{"text":"Disable","value":"disable"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"background":"#00C897","value":"active"},{"background":"#D3DAE4","value":"disable"}]},"readonly":false,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"status","width":"half"}	\N
18	19	directus_fields	7	{"hidden":false,"interface":"list-m2m","options":{"template":"{{actors_id.name}}-{{stands_id.name}}"},"display":"related-values","readonly":false,"special":"m2m","collection":"actors","field":"stands"}	{"hidden":false,"interface":"list-m2m","options":{"template":"{{actors_id.name}}-{{stands_id.name}}"},"display":"related-values","readonly":false,"special":"m2m","collection":"actors","field":"stands"}	\N
22	23	directus_fields	10	{"hidden":true,"collection":"actors_stands","field":"stands_id"}	{"hidden":true,"collection":"actors_stands","field":"stands_id"}	\N
19	20	directus_collections	actors_stands	{"hidden":true,"icon":"import_export","collection":"actors_stands"}	{"hidden":true,"icon":"import_export","collection":"actors_stands"}	\N
20	21	directus_fields	8	{"hidden":true,"field":"id","collection":"actors_stands"}	{"hidden":true,"field":"id","collection":"actors_stands"}	\N
21	22	directus_fields	9	{"special":"m2m","interface":"list-m2m","collection":"stands","field":"actors"}	{"special":"m2m","interface":"list-m2m","collection":"stands","field":"actors"}	\N
23	24	directus_fields	11	{"hidden":true,"collection":"actors_stands","field":"actors_id"}	{"hidden":true,"collection":"actors_stands","field":"actors_id"}	\N
24	25	directus_fields	12	{"hidden":true,"collection":"actors_stands","field":"sort"}	{"hidden":true,"collection":"actors_stands","field":"sort"}	\N
25	26	directus_fields	13	{"hidden":false,"interface":"input","options":{"placeholder":"Enter actor's name for app"},"display":"raw","readonly":false,"collection":"actors","field":"app_name"}	{"hidden":false,"interface":"input","options":{"placeholder":"Enter actor's name for app"},"display":"raw","readonly":false,"collection":"actors","field":"app_name"}	\N
26	27	directus_fields	3	{"id":3,"collection":"actors","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"actors","field":"id","sort":1,"group":null}	\N
27	28	directus_fields	4	{"id":4,"collection":"actors","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":2,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"actors","field":"sort","sort":2,"group":null}	\N
28	29	directus_fields	6	{"id":6,"collection":"actors","field":"name","special":null,"interface":"input","options":{"placeholder":"Enter actor's name..."},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"actors","field":"name","sort":3,"group":null}	\N
29	30	directus_fields	13	{"id":13,"collection":"actors","field":"app_name","special":null,"interface":"input","options":{"placeholder":"Enter actor's name for app"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"actors","field":"app_name","sort":4,"group":null}	\N
30	31	directus_fields	7	{"id":7,"collection":"actors","field":"stands","special":["m2m"],"interface":"list-m2m","options":{"template":"{{actors_id.name}}-{{stands_id.name}}"},"display":"related-values","display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"actors","field":"stands","sort":5,"group":null}	\N
31	32	directus_fields	6	{"id":6,"collection":"actors","field":"name","special":null,"interface":"input","options":{"placeholder":"Enter actor's name..."},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"actors","field":"name","width":"half"}	\N
32	33	directus_fields	13	{"id":13,"collection":"actors","field":"app_name","special":null,"interface":"input","options":{"placeholder":"Enter actor's name for app"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"actors","field":"app_name","width":"half"}	\N
33	34	actors	1	{"name":"Ксения Петрова","app_name":"ksenia"}	{"name":"Ксения Петрова","app_name":"ksenia"}	34
35	36	stands	1	{"name":"Первый стенд","actors":[{"actors_id":{"name":"Ксения Петрова","app_name":"ksenia"}}]}	{"name":"Первый стенд","actors":[{"actors_id":{"name":"Ксения Петрова","app_name":"ksenia"}}]}	\N
34	35	actors_stands	1	{"actors_id":{"name":"Ксения Петрова","app_name":"ksenia"},"stands_id":1}	{"actors_id":{"name":"Ксения Петрова","app_name":"ksenia"},"stands_id":1}	35
36	37	directus_fields	7	{"id":7,"collection":"actors","field":"stands","special":["m2m"],"interface":"list-m2m","options":{"template":"{{actors_id.name}}-{{stands_id.name}}"},"display":"related-values","display_options":{"template":"{{actors_id.name}}"},"readonly":false,"hidden":false,"sort":5,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"actors","field":"stands","special":["m2m"],"interface":"list-m2m","options":{"template":"{{actors_id.name}}-{{stands_id.name}}"},"display":"related-values","display_options":{"template":"{{actors_id.name}}"},"readonly":false,"hidden":false,"sort":5,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
37	38	directus_fields	9	{"id":9,"collection":"stands","field":"actors","special":["m2m"],"interface":"list-m2m","options":null,"display":"related-values","display_options":{"template":"{{actors_id.name}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"actors","special":["m2m"],"interface":"list-m2m","options":null,"display":"related-values","display_options":{"template":"{{actors_id.name}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
38	39	directus_fields	9	{"id":9,"collection":"stands","field":"actors","special":["m2m"],"interface":"list-m2m","options":{"template":"{{actors_id.name}}"},"display":"related-values","display_options":{"template":"{{actors_id.name}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"actors","special":["m2m"],"interface":"list-m2m","options":{"template":"{{actors_id.name}}"},"display":"related-values","display_options":{"template":"{{actors_id.name}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
39	40	directus_fields	9	{"id":9,"collection":"stands","field":"actors","special":["m2m"],"interface":"list-m2m","options":{"template":"{{actors_id.name}}"},"display":"related-values","display_options":{"template":"{{actors_id.name}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"actors","special":["m2m"],"interface":"list-m2m","options":{"template":"{{actors_id.name}}"},"display":"related-values","display_options":{"template":"{{actors_id.name}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
40	41	directus_fields	9	{"id":9,"collection":"stands","field":"actors","special":["m2m"],"interface":"list-m2m","options":{"template":"1"},"display":"related-values","display_options":{"template":"{{actors_id.name}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"actors","special":["m2m"],"interface":"list-m2m","options":{"template":"1"},"display":"related-values","display_options":{"template":"{{actors_id.name}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
41	42	directus_fields	9	{"id":9,"collection":"stands","field":"actors","special":["m2m"],"interface":"list-m2m","options":{"template":"{{actors_id.name}}"},"display":"related-values","display_options":{"template":"{{actors_id.name}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"actors","special":["m2m"],"interface":"list-m2m","options":{"template":"{{actors_id.name}}"},"display":"related-values","display_options":{"template":"{{actors_id.name}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
43	44	directus_fields	7	{"id":7,"collection":"actors","field":"stands","special":["m2m"],"interface":"list-m2m","options":{"template":"{{stands_id.name}}"},"display":"related-values","display_options":{"template":"{{stands_id.name}}"},"readonly":false,"hidden":false,"sort":5,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"actors","field":"stands","special":["m2m"],"interface":"list-m2m","options":{"template":"{{stands_id.name}}"},"display":"related-values","display_options":{"template":"{{stands_id.name}}"},"readonly":false,"hidden":false,"sort":5,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
42	43	directus_fields	7	{"id":7,"collection":"actors","field":"stands","special":["m2m"],"interface":"list-m2m","options":{"template":"{{actors_id.name}}-{{stands_id.name}}"},"display":"related-values","display_options":{"template":"{{stands_id.name}}"},"readonly":false,"hidden":false,"sort":5,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"actors","field":"stands","special":["m2m"],"interface":"list-m2m","options":{"template":"{{actors_id.name}}-{{stands_id.name}}"},"display":"related-values","display_options":{"template":"{{stands_id.name}}"},"readonly":false,"hidden":false,"sort":5,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
44	45	directus_fields	7	{"id":7,"collection":"actors","field":"stands","special":["m2m"],"interface":"list-m2m","options":{"template":"{{stands_id.name}}"},"display":"related-values","display_options":{"template":"{{stands_id.id}} {{stands_id.name}}"},"readonly":false,"hidden":false,"sort":5,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"actors","field":"stands","special":["m2m"],"interface":"list-m2m","options":{"template":"{{stands_id.name}}"},"display":"related-values","display_options":{"template":"{{stands_id.id}} {{stands_id.name}}"},"readonly":false,"hidden":false,"sort":5,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
45	46	directus_fields	7	{"id":7,"collection":"actors","field":"stands","special":["m2m"],"interface":"list-m2m","options":{"template":"{{stands_id.id}} {{stands_id.name}}"},"display":"related-values","display_options":{"template":"{{stands_id.name}}"},"readonly":false,"hidden":false,"sort":5,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"actors","field":"stands","special":["m2m"],"interface":"list-m2m","options":{"template":"{{stands_id.id}} {{stands_id.name}}"},"display":"related-values","display_options":{"template":"{{stands_id.name}}"},"readonly":false,"hidden":false,"sort":5,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
46	47	directus_fields	7	{"id":7,"collection":"actors","field":"stands","special":["m2m"],"interface":"list-m2m","options":{"template":"{{stands_id.name}}"},"display":"related-values","display_options":{"template":"{{stands_id.name}}"},"readonly":false,"hidden":false,"sort":5,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"actors","field":"stands","special":["m2m"],"interface":"list-m2m","options":{"template":"{{stands_id.name}}"},"display":"related-values","display_options":{"template":"{{stands_id.name}}"},"readonly":false,"hidden":false,"sort":5,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
47	48	directus_settings	1	{"project_color":"#C70000"}	{"project_color":"#C70000"}	\N
48	49	directus_settings	1	{"id":1,"project_name":"MTS-Life","project_url":null,"project_color":"#C70000","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null}	{"project_name":"MTS-Life"}	\N
49	50	directus_users	d51af580-89ff-4ca4-b91a-5d3fab759b63	{"id":"d51af580-89ff-4ca4-b91a-5d3fab759b63","first_name":"Admin","last_name":"User","email":"den59k@gmail.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":"ru-RU","theme":"auto","tfa_secret":null,"status":"active","role":"98e517fe-4b06-4b03-b132-f9f669249ef5","token":null,"last_access":"2021-09-05T06:47:36.869Z","last_page":"/users/d51af580-89ff-4ca4-b91a-5d3fab759b63"}	{"language":"ru-RU"}	\N
50	51	directus_users	d51af580-89ff-4ca4-b91a-5d3fab759b63	{"id":"d51af580-89ff-4ca4-b91a-5d3fab759b63","first_name":"Admin","last_name":"User","email":"den59k@gmail.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":"en-US","theme":"auto","tfa_secret":null,"status":"active","role":"98e517fe-4b06-4b03-b132-f9f669249ef5","token":null,"last_access":"2021-09-05T06:47:36.869Z","last_page":"/users/d51af580-89ff-4ca4-b91a-5d3fab759b63"}	{"language":"en-US"}	\N
51	53	directus_collections	photos	{"singleton":false,"collection":"photos"}	{"singleton":false,"collection":"photos"}	\N
52	54	directus_fields	14	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"photos"}	{"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"photos"}	\N
53	55	directus_fields	15	{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"photos"}	{"special":"date-created","interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"photos"}	\N
54	56	directus_fields	16	{"hidden":false,"interface":"input","options":{"placeholder":null,"iconLeft":"file_copy"},"display":"mime-type","readonly":false,"collection":"photos","field":"filename"}	{"hidden":false,"interface":"input","options":{"placeholder":null,"iconLeft":"file_copy"},"display":"mime-type","readonly":false,"collection":"photos","field":"filename"}	\N
55	57	photos	1	{"filename":"File 1"}	{"filename":"File 1"}	\N
56	58	photos	1	{"id":1,"date_created":"2021-09-05T06:52:39.882Z","filename":"photo.png"}	{"filename":"photo.png"}	\N
57	59	directus_fields	16	{"id":16,"collection":"photos","field":"filename","special":null,"interface":"input","options":{"placeholder":null,"iconLeft":"file_copy"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"photos","field":"filename","special":null,"interface":"input","options":{"placeholder":null,"iconLeft":"file_copy"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
58	60	directus_fields	17	{"hidden":false,"interface":"file-image","display":"image","display_options":{},"readonly":false,"collection":"photos","field":"file"}	{"hidden":false,"interface":"file-image","display":"image","display_options":{},"readonly":false,"collection":"photos","field":"file"}	\N
59	61	directus_files	23f33c6c-a526-4441-97b1-3717e7d740df	{"title":"1920х1080","filename_download":"1920х1080.jpg","type":"image/jpeg","storage":"local"}	{"title":"1920х1080","filename_download":"1920х1080.jpg","type":"image/jpeg","storage":"local"}	\N
60	62	photos	1	{"id":1,"date_created":"2021-09-05T06:52:39.882Z","file":"23f33c6c-a526-4441-97b1-3717e7d740df"}	{"file":"23f33c6c-a526-4441-97b1-3717e7d740df"}	\N
61	63	directus_permissions	1	{"role":null,"collection":"photos","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"photos","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
62	64	directus_permissions	2	{"role":null,"collection":"stands","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"stands","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
63	65	directus_permissions	3	{"role":null,"collection":"actors_stands","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"actors_stands","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
64	68	directus_roles	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	{"name":"Stand","admin_access":false,"app_access":true}	{"name":"Stand","admin_access":false,"app_access":true}	\N
65	69	directus_permissions	4	{"collection":"directus_files","action":"create","permissions":{},"fields":"*","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	{"collection":"directus_files","action":"create","permissions":{},"fields":"*","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	\N
66	70	directus_permissions	5	{"collection":"directus_files","action":"read","permissions":{},"fields":"*","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	{"collection":"directus_files","action":"read","permissions":{},"fields":"*","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	\N
67	71	directus_permissions	6	{"collection":"directus_files","action":"update","permissions":{},"fields":"*","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	{"collection":"directus_files","action":"update","permissions":{},"fields":"*","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	\N
68	72	directus_permissions	7	{"collection":"directus_files","action":"delete","permissions":{},"fields":"*","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	{"collection":"directus_files","action":"delete","permissions":{},"fields":"*","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	\N
69	73	directus_permissions	8	{"collection":"directus_folders","action":"create","permissions":{},"fields":"*","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	{"collection":"directus_folders","action":"create","permissions":{},"fields":"*","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	\N
70	74	directus_permissions	9	{"collection":"directus_folders","action":"read","permissions":{},"fields":"*","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	{"collection":"directus_folders","action":"read","permissions":{},"fields":"*","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	\N
71	75	directus_permissions	10	{"collection":"directus_folders","action":"update","permissions":{},"fields":"*","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	{"collection":"directus_folders","action":"update","permissions":{},"fields":"*","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	\N
72	76	directus_permissions	11	{"collection":"directus_folders","action":"delete","permissions":{},"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	{"collection":"directus_folders","action":"delete","permissions":{},"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	\N
73	77	directus_permissions	12	{"collection":"directus_users","action":"read","permissions":{},"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	{"collection":"directus_users","action":"read","permissions":{},"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	\N
74	78	directus_permissions	13	{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":"first_name,last_name,email,password,location,title,description,avatar,language,theme","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":"first_name,last_name,email,password,location,title,description,avatar,language,theme","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	\N
75	79	directus_permissions	14	{"collection":"directus_roles","action":"read","permissions":{},"fields":"*","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	{"collection":"directus_roles","action":"read","permissions":{},"fields":"*","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	\N
76	80	directus_permissions	15	{"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a","collection":"actors","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a","collection":"actors","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
77	81	directus_permissions	16	{"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a","collection":"stands","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a","collection":"stands","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
78	82	directus_permissions	17	{"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a","collection":"photos","action":"update","fields":["*"],"permissions":{},"validation":{}}	{"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a","collection":"photos","action":"update","fields":["*"],"permissions":{},"validation":{}}	\N
79	83	directus_permissions	18	{"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a","collection":"photos","action":"create","fields":["*"],"permissions":{},"validation":{}}	{"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a","collection":"photos","action":"create","fields":["*"],"permissions":{},"validation":{}}	\N
80	84	directus_permissions	19	{"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a","collection":"photos","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a","collection":"photos","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
81	85	directus_permissions	20	{"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a","collection":"actors_stands","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a","collection":"actors_stands","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
82	87	directus_users	87fd071a-9e2b-498c-8498-26cb7101a6c1	{"first_name":"Stand1","password":"**********","email":"example@mail.ru"}	{"first_name":"Stand1","password":"**********","email":"example@mail.ru"}	\N
83	88	directus_permissions	21	{"role":null,"collection":"stands","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"stands","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
84	89	directus_permissions	22	{"role":null,"collection":"actors_stands","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"actors_stands","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
85	90	directus_permissions	23	{"role":null,"collection":"actors","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"actors","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
86	91	directus_permissions	24	{"role":null,"collection":"directus_files","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_files","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
87	92	directus_permissions	25	{"role":null,"collection":"actors","action":"create","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"actors","action":"create","fields":["*"],"permissions":{},"validation":{}}	\N
88	93	directus_permissions	26	{"role":null,"collection":"actors","action":"update","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"actors","action":"update","fields":["*"],"permissions":{},"validation":{}}	\N
89	95	directus_permissions	27	{"role":null,"collection":"actors","action":"delete","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"actors","action":"delete","fields":["*"],"permissions":{},"validation":{}}	\N
90	94	directus_permissions	23	{"id":23,"role":null,"collection":"actors","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"]}	{"permissions":{},"validation":{},"fields":["*"]}	\N
91	100	directus_permissions	28	{"role":null,"collection":"actors","action":"read"}	{"role":null,"collection":"actors","action":"read"}	\N
92	102	directus_permissions	29	{"role":null,"collection":"actors","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"actors","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
93	103	directus_permissions	29	{"id":29,"role":null,"collection":"actors","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"]}	{"role":null,"collection":"actors","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"]}	\N
94	105	directus_fields	18	{"hidden":false,"interface":null,"options":null,"display":"boolean","display_options":{"iconOff":"stop","colorOff":"#B70101","iconOn":"play_arrow"},"readonly":false,"special":"boolean","collection":"stands","field":"active"}	{"hidden":false,"interface":null,"options":null,"display":"boolean","display_options":{"iconOff":"stop","colorOff":"#B70101","iconOn":"play_arrow"},"readonly":false,"special":"boolean","collection":"stands","field":"active"}	\N
95	106	directus_fields	18	{"id":18,"collection":"stands","field":"active","special":["boolean"],"interface":null,"options":null,"display":"boolean","display_options":{"iconOff":"stop","colorOff":"#B70101","iconOn":"play_arrow"},"readonly":false,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"active","width":"half"}	\N
96	107	directus_fields	1	{"id":1,"collection":"stands","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"id","sort":1,"group":null}	\N
97	108	directus_fields	5	{"id":5,"collection":"stands","field":"name","special":null,"interface":"input","options":{"placeholder":"Enter stand's name"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"name","sort":2,"group":null}	\N
98	109	directus_fields	18	{"id":18,"collection":"stands","field":"active","special":["boolean"],"interface":null,"options":null,"display":"boolean","display_options":{"iconOff":"stop","colorOff":"#B70101","iconOn":"play_arrow"},"readonly":false,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"active","sort":3,"group":null}	\N
99	110	directus_fields	9	{"id":9,"collection":"stands","field":"actors","special":["m2m"],"interface":"list-m2m","options":{"template":"{{actors_id.name}}"},"display":"related-values","display_options":{"template":"{{actors_id.name}}"},"readonly":false,"hidden":false,"sort":4,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"actors","sort":4,"group":null}	\N
100	111	directus_fields	18	{"id":18,"collection":"stands","field":"active","special":["boolean"],"interface":null,"options":null,"display":"boolean","display_options":{"iconOff":"stop","colorOff":"#B70101","iconOn":"play_arrow","labelOn":"active","labelOff":"disable"},"readonly":false,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"active","special":["boolean"],"interface":null,"options":null,"display":"boolean","display_options":{"iconOff":"stop","colorOff":"#B70101","iconOn":"play_arrow","labelOn":"active","labelOff":"disable"},"readonly":false,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
101	112	directus_fields	18	{"id":18,"collection":"stands","field":"active","special":["boolean"],"interface":"boolean","options":{"iconOn":"play_arrow","iconOff":"stop","label":"Active"},"display":"boolean","display_options":{"iconOff":"stop","colorOff":"#B70101","iconOn":"play_arrow","labelOn":"active","labelOff":"disable"},"readonly":false,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"active","special":["boolean"],"interface":"boolean","options":{"iconOn":"play_arrow","iconOff":"stop","label":"Active"},"display":"boolean","display_options":{"iconOff":"stop","colorOff":"#B70101","iconOn":"play_arrow","labelOn":"active","labelOff":"disable"},"readonly":false,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
102	113	directus_fields	18	{"id":18,"collection":"stands","field":"active","special":["boolean"],"interface":"boolean","options":{"iconOn":"play_arrow","iconOff":"stop","label":"Active"},"display":"boolean","display_options":{"iconOff":"stop","colorOff":"#B70101","iconOn":"play_arrow","labelOn":"active","labelOff":"disable"},"readonly":false,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"active","special":["boolean"],"interface":"boolean","options":{"iconOn":"play_arrow","iconOff":"stop","label":"Active"},"display":"boolean","display_options":{"iconOff":"stop","colorOff":"#B70101","iconOn":"play_arrow","labelOn":"active","labelOff":"disable"},"readonly":false,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
103	114	directus_fields	18	{"id":18,"collection":"stands","field":"active","special":["boolean"],"interface":"boolean","options":{"label":"Active"},"display":"boolean","display_options":{"iconOff":"stop","colorOff":"#B70101","iconOn":"play_arrow","labelOn":"active","labelOff":"disable"},"readonly":false,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"active","special":["boolean"],"interface":"boolean","options":{"label":"Active"},"display":"boolean","display_options":{"iconOff":"stop","colorOff":"#B70101","iconOn":"play_arrow","labelOn":"active","labelOff":"disable"},"readonly":false,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
104	115	stands	1	{"id":1,"name":"Первый стенд","active":false,"actors":[1]}	{"active":false}	\N
105	116	stands	1	{"id":1,"name":"Первый стенд","active":true,"actors":[1]}	{"active":true}	\N
106	117	directus_fields	19	{"hidden":false,"interface":"select-dropdown","options":{"choices":[{"text":"Available","value":"available"},{"text":"Welcome","value":"welcome"},{"text":"Photo","value":"photo"}]},"display":"raw","display_options":{"choices":null},"readonly":false,"collection":"stands","field":"status"}	{"hidden":false,"interface":"select-dropdown","options":{"choices":[{"text":"Available","value":"available"},{"text":"Welcome","value":"welcome"},{"text":"Photo","value":"photo"}]},"display":"raw","display_options":{"choices":null},"readonly":false,"collection":"stands","field":"status"}	\N
107	118	directus_fields	19	{"id":19,"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Available","value":"available"},{"text":"Welcome","value":"welcome"},{"text":"Photo","value":"photo"}]},"display":"raw","display_options":{"choices":null},"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Available","value":"available"},{"text":"Welcome","value":"welcome"},{"text":"Photo","value":"photo"}]},"display":"raw","display_options":{"choices":null},"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
108	119	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","actors":[1]}	{"status":"available"}	\N
109	120	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"welcome","actors":[1]}	{"status":"welcome"}	\N
110	121	directus_fields	20	{"hidden":false,"interface":"input","display":"raw","readonly":true,"collection":"stands","field":"user_id"}	{"hidden":false,"interface":"input","display":"raw","readonly":true,"collection":"stands","field":"user_id"}	\N
111	122	directus_fields	19	{"id":19,"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Available","value":"available"},{"text":"Welcome","value":"welcome"},{"text":"Photo","value":"photo"}]},"display":"raw","display_options":{"choices":null},"readonly":false,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"status","width":"half"}	\N
112	123	directus_fields	20	{"id":20,"collection":"stands","field":"user_id","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":true,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"user_id","width":"half"}	\N
113	124	directus_fields	20	{"id":20,"collection":"stands","field":"user_id","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":true,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":"User who uses the stand","conditions":null,"required":false}	{"collection":"stands","field":"user_id","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":true,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":"User who uses the stand","conditions":null,"required":false}	\N
114	125	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","user_id":null,"actors":[1]}	{"status":"available"}	\N
115	126	directus_fields	19	{"id":19,"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Available","value":"available"},{"text":"OnWelcomeScreen","value":"welcome"},{"text":"OnPhotoScreen","value":"photo"}]},"display":"raw","display_options":{"choices":null},"readonly":false,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Available","value":"available"},{"text":"OnWelcomeScreen","value":"welcome"},{"text":"OnPhotoScreen","value":"photo"}]},"display":"raw","display_options":{"choices":null},"readonly":false,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
116	127	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"welcome","user_id":null,"actors":[1]}	{"status":"welcome"}	\N
117	128	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","user_id":null,"actors":[1]}	{"status":"available"}	\N
118	129	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"welcome","user_id":null,"actors":[1]}	{"status":"welcome"}	\N
119	130	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","user_id":null,"actors":[1]}	{"status":"available"}	\N
120	131	directus_fields	19	{"id":19,"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Available","value":"available"},{"text":"OnWelcomeScreen","value":"welcome"},{"text":"OnPhotoScreen","value":"photo"}]},"display":"labels","display_options":{"choices":[{"text":"Available","value":"available","foreground":null,"background":"#00C897"},{"text":"On Welcome Screen","value":"welcome"},{"text":"On Photo Screen","value":"photo"}]},"readonly":false,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Available","value":"available"},{"text":"OnWelcomeScreen","value":"welcome"},{"text":"OnPhotoScreen","value":"photo"}]},"display":"labels","display_options":{"choices":[{"text":"Available","value":"available","foreground":null,"background":"#00C897"},{"text":"On Welcome Screen","value":"welcome"},{"text":"On Photo Screen","value":"photo"}]},"readonly":false,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
121	132	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"welcome","user_id":null,"actors":[1]}	{"status":"welcome"}	\N
122	133	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","user_id":null,"actors":[1]}	{"status":"available"}	\N
123	134	directus_fields	21	{"hidden":false,"interface":"group-accordion","readonly":false,"special":"alias,no-data,group","collection":"stands","field":"group"}	{"hidden":false,"interface":"group-accordion","readonly":false,"special":"alias,no-data,group","collection":"stands","field":"group"}	\N
124	135	directus_fields	21	{"id":21,"collection":"stands","field":"group","special":["alias","no-data","group"],"interface":"group-accordion","options":null,"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"group","special":["alias","no-data","group"],"interface":"group-accordion","options":null,"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
125	136	directus_fields	22	{"hidden":false,"interface":"input","display":"raw","readonly":false,"collection":"stands","field":"key"}	{"hidden":false,"interface":"input","display":"raw","readonly":false,"collection":"stands","field":"key"}	\N
126	137	directus_fields	1	{"id":1,"collection":"stands","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"id","sort":1,"group":null}	\N
127	138	directus_fields	22	{"id":22,"collection":"stands","field":"key","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","group":21,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"key","sort":1,"group":21}	\N
128	139	directus_fields	5	{"id":5,"collection":"stands","field":"name","special":null,"interface":"input","options":{"placeholder":"Enter stand's name"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"name","sort":2,"group":null}	\N
163	174	directus_permissions	41	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","collection":"actors","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","collection":"actors","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
129	140	directus_fields	18	{"id":18,"collection":"stands","field":"active","special":["boolean"],"interface":"boolean","options":{"label":"Active"},"display":"boolean","display_options":{"iconOff":"stop","colorOff":"#B70101","iconOn":"play_arrow","labelOn":"active","labelOff":"disable"},"readonly":false,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"active","sort":3,"group":null}	\N
130	141	directus_fields	9	{"id":9,"collection":"stands","field":"actors","special":["m2m"],"interface":"list-m2m","options":{"template":"{{actors_id.name}}"},"display":"related-values","display_options":{"template":"{{actors_id.name}}"},"readonly":false,"hidden":false,"sort":4,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"actors","sort":4,"group":null}	\N
131	142	directus_fields	19	{"id":19,"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Available","value":"available"},{"text":"OnWelcomeScreen","value":"welcome"},{"text":"OnPhotoScreen","value":"photo"}]},"display":"labels","display_options":{"choices":[{"text":"Available","value":"available","foreground":null,"background":"#00C897"},{"text":"On Welcome Screen","value":"welcome"},{"text":"On Photo Screen","value":"photo"}]},"readonly":false,"hidden":false,"sort":5,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"status","sort":5,"group":null}	\N
132	143	directus_fields	20	{"id":20,"collection":"stands","field":"user_id","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":true,"hidden":false,"sort":6,"width":"half","group":null,"translations":null,"note":"User who uses the stand","conditions":null,"required":false}	{"collection":"stands","field":"user_id","sort":6,"group":null}	\N
133	144	directus_fields	21	{"id":21,"collection":"stands","field":"group","special":["alias","no-data","group"],"interface":"group-accordion","options":null,"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"group","sort":7,"group":null}	\N
134	145	directus_fields	23	{"hidden":false,"interface":"input","display":"raw","readonly":false,"collection":"stands","field":"key2"}	{"hidden":false,"interface":"input","display":"raw","readonly":false,"collection":"stands","field":"key2"}	\N
135	146	directus_fields	1	{"id":1,"collection":"stands","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"id","sort":1,"group":null}	\N
137	148	directus_fields	5	{"id":5,"collection":"stands","field":"name","special":null,"interface":"input","options":{"placeholder":"Enter stand's name"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"name","sort":2,"group":null}	\N
139	150	directus_fields	18	{"id":18,"collection":"stands","field":"active","special":["boolean"],"interface":"boolean","options":{"label":"Active"},"display":"boolean","display_options":{"iconOff":"stop","colorOff":"#B70101","iconOn":"play_arrow","labelOn":"active","labelOff":"disable"},"readonly":false,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"active","sort":3,"group":null}	\N
140	151	directus_fields	9	{"id":9,"collection":"stands","field":"actors","special":["m2m"],"interface":"list-m2m","options":{"template":"{{actors_id.name}}"},"display":"related-values","display_options":{"template":"{{actors_id.name}}"},"readonly":false,"hidden":false,"sort":4,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"actors","sort":4,"group":null}	\N
141	152	directus_fields	19	{"id":19,"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Available","value":"available"},{"text":"OnWelcomeScreen","value":"welcome"},{"text":"OnPhotoScreen","value":"photo"}]},"display":"labels","display_options":{"choices":[{"text":"Available","value":"available","foreground":null,"background":"#00C897"},{"text":"On Welcome Screen","value":"welcome"},{"text":"On Photo Screen","value":"photo"}]},"readonly":false,"hidden":false,"sort":5,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"status","sort":5,"group":null}	\N
142	153	directus_fields	20	{"id":20,"collection":"stands","field":"user_id","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":true,"hidden":false,"sort":6,"width":"half","group":null,"translations":null,"note":"User who uses the stand","conditions":null,"required":false}	{"collection":"stands","field":"user_id","sort":6,"group":null}	\N
143	154	directus_fields	21	{"id":21,"collection":"stands","field":"group","special":["alias","no-data","group"],"interface":"group-accordion","options":null,"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"group","sort":7,"group":null}	\N
136	147	directus_fields	22	{"id":22,"collection":"stands","field":"key","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","group":21,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"key","sort":1,"group":21}	\N
138	149	directus_fields	23	{"id":23,"collection":"stands","field":"key2","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","group":21,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"key2","sort":2,"group":21}	\N
144	155	directus_fields	21	{"id":21,"collection":"stands","field":"group","special":["alias","no-data","group"],"interface":"group-detail","options":{"start":"closed"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"group","special":["alias","no-data","group"],"interface":"group-detail","options":{"start":"closed"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
145	156	directus_fields	24	{"hidden":false,"interface":"presentation-links","options":{"links":[{"label":"Link1","icon":"account_balance","type":"primary","url":"https://vk.com"}]},"readonly":false,"special":"alias,no-data","collection":"stands","field":"presentation"}	{"hidden":false,"interface":"presentation-links","options":{"links":[{"label":"Link1","icon":"account_balance","type":"primary","url":"https://vk.com"}]},"readonly":false,"special":"alias,no-data","collection":"stands","field":"presentation"}	\N
146	157	directus_fields	24	{"id":24,"collection":"stands","field":"presentation","special":["alias","no-data"],"interface":"presentation-notice","options":{"links":[{"label":"Link1","icon":"account_balance","type":"primary","url":"https://vk.com"}],"text":"Hey!\\nMust be a devil between us"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"presentation","special":["alias","no-data"],"interface":"presentation-notice","options":{"links":[{"label":"Link1","icon":"account_balance","type":"primary","url":"https://vk.com"}],"text":"Hey!\\nMust be a devil between us"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
147	158	stands	1	{"id":1,"name":"Первый стенд","active":false,"status":"available","user_id":null,"actors":[1]}	{"active":false}	\N
148	159	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","user_id":null,"actors":[1]}	{"active":true}	\N
149	160	directus_users	87fd071a-9e2b-498c-8498-26cb7101a6c1	{"id":"87fd071a-9e2b-498c-8498-26cb7101a6c1","first_name":"Stand1","last_name":null,"email":"example@mail.ru","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":"en-US","theme":"auto","tfa_secret":null,"status":"active","role":null,"token":"secure_token","last_access":null,"last_page":null}	{"token":"secure_token"}	\N
150	161	directus_users	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	{"first_name":"User1","email":"user@mail.ru","password":"**********","token":"4721F803B60B0F8A450091E73F4D22207B96A32383B4B0398BB43F66752352FD"}	{"first_name":"User1","email":"user@mail.ru","password":"**********","token":"4721F803B60B0F8A450091E73F4D22207B96A32383B4B0398BB43F66752352FD"}	\N
151	162	directus_roles	b13f106d-bf98-4c45-94f9-f90bb0d040ad	{"name":"User","admin_access":false,"app_access":true}	{"name":"User","admin_access":false,"app_access":true}	\N
152	163	directus_permissions	30	{"collection":"directus_files","action":"create","permissions":{},"fields":"*","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	{"collection":"directus_files","action":"create","permissions":{},"fields":"*","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	\N
153	164	directus_permissions	31	{"collection":"directus_files","action":"read","permissions":{},"fields":"*","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	{"collection":"directus_files","action":"read","permissions":{},"fields":"*","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	\N
154	165	directus_permissions	32	{"collection":"directus_files","action":"update","permissions":{},"fields":"*","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	{"collection":"directus_files","action":"update","permissions":{},"fields":"*","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	\N
155	166	directus_permissions	33	{"collection":"directus_files","action":"delete","permissions":{},"fields":"*","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	{"collection":"directus_files","action":"delete","permissions":{},"fields":"*","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	\N
156	167	directus_permissions	34	{"collection":"directus_folders","action":"create","permissions":{},"fields":"*","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	{"collection":"directus_folders","action":"create","permissions":{},"fields":"*","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	\N
157	168	directus_permissions	35	{"collection":"directus_folders","action":"read","permissions":{},"fields":"*","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	{"collection":"directus_folders","action":"read","permissions":{},"fields":"*","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	\N
158	169	directus_permissions	36	{"collection":"directus_folders","action":"update","permissions":{},"fields":"*","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	{"collection":"directus_folders","action":"update","permissions":{},"fields":"*","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	\N
159	170	directus_permissions	37	{"collection":"directus_folders","action":"delete","permissions":{},"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	{"collection":"directus_folders","action":"delete","permissions":{},"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	\N
160	171	directus_permissions	38	{"collection":"directus_users","action":"read","permissions":{},"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	{"collection":"directus_users","action":"read","permissions":{},"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	\N
161	172	directus_permissions	39	{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":"first_name,last_name,email,password,location,title,description,avatar,language,theme","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":"first_name,last_name,email,password,location,title,description,avatar,language,theme","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	\N
162	173	directus_permissions	40	{"collection":"directus_roles","action":"read","permissions":{},"fields":"*","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	{"collection":"directus_roles","action":"read","permissions":{},"fields":"*","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	\N
164	175	directus_permissions	42	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","collection":"actors_stands","action":"update","fields":["*"],"permissions":{},"validation":{}}	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","collection":"actors_stands","action":"update","fields":["*"],"permissions":{},"validation":{}}	\N
165	176	directus_permissions	43	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","collection":"actors_stands","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","collection":"actors_stands","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
166	178	directus_permissions	44	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","collection":"stands","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","collection":"stands","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
167	179	directus_permissions	45	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","collection":"stands","action":"update","fields":["*"],"permissions":{},"validation":{}}	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","collection":"stands","action":"update","fields":["*"],"permissions":{},"validation":{}}	\N
168	180	directus_permissions	46	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","collection":"photos","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","collection":"photos","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
169	181	directus_fields	25	{"hidden":false,"interface":"presentation-links","options":{"links":[{"label":"Reset stand","type":"normal","url":"/api/launch"}]},"readonly":false,"special":"alias,no-data","collection":"stands","field":"reset"}	{"hidden":false,"interface":"presentation-links","options":{"links":[{"label":"Reset stand","type":"normal","url":"/api/launch"}]},"readonly":false,"special":"alias,no-data","collection":"stands","field":"reset"}	\N
170	182	directus_fields	25	{"id":25,"collection":"stands","field":"reset","special":["alias","no-data"],"interface":"presentation-links","options":{"links":[{"label":"Reset stand","type":"primary","url":"POST /api/launch"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"reset","special":["alias","no-data"],"interface":"presentation-links","options":{"links":[{"label":"Reset stand","type":"primary","url":"POST /api/launch"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
171	183	directus_users	5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	{"id":"5c57e883-4a3a-4bfe-9bee-2117fa9e4c70","first_name":"User1","last_name":null,"email":"user@mail.ru","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":"en-US","theme":"auto","tfa_secret":null,"status":"active","role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","token":"4721F803B60B0F8A450091E73F4D22207B96A32383B4B0398BB43F66752352FD","last_access":null,"last_page":null}	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad"}	\N
172	184	directus_users	87fd071a-9e2b-498c-8498-26cb7101a6c1	{"id":"87fd071a-9e2b-498c-8498-26cb7101a6c1","first_name":"Stand1","last_name":null,"email":"example@mail.ru","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":"en-US","theme":"auto","tfa_secret":null,"status":"active","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a","token":"secure_token","last_access":null,"last_page":null}	{"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a"}	\N
173	185	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"welcome","user_id":"WKWKVDmJQZcQHAuzTeQUI","actors":[1]}	{"status":"welcome","user_id":"WKWKVDmJQZcQHAuzTeQUI"}	\N
174	186	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","user_id":"WKWKVDmJQZcQHAuzTeQUI","actors":[1]}	{"status":"available"}	\N
175	187	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"welcome","user_id":"KETxspA-ODm_I7HXxuIw7","actors":[1]}	{"status":"welcome","user_id":"KETxspA-ODm_I7HXxuIw7"}	\N
176	188	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","user_id":"KETxspA-ODm_I7HXxuIw7","actors":[1]}	{"status":"available"}	\N
177	189	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"welcome","user_id":"hy7NOzQThie093tyTaaiG","actors":[1]}	{"status":"welcome","user_id":"hy7NOzQThie093tyTaaiG"}	\N
178	190	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","user_id":"hy7NOzQThie093tyTaaiG","actors":[1]}	{"status":"available"}	\N
179	191	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"welcome","user_id":"CE1uYrE6DexDfHjOM-am_","actors":[1]}	{"status":"welcome","user_id":"CE1uYrE6DexDfHjOM-am_"}	\N
180	192	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","user_id":"CE1uYrE6DexDfHjOM-am_","actors":[1]}	{"status":"available"}	\N
181	193	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"welcome","user_id":"Q12cwhKf2auVsnb-NpbiY","actors":[1]}	{"status":"welcome","user_id":"Q12cwhKf2auVsnb-NpbiY"}	\N
182	194	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","user_id":"Q12cwhKf2auVsnb-NpbiY","actors":[1]}	{"status":"available"}	\N
183	195	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"welcome","user_id":"5jnbaGwAXAe1k0h-i_1-9","actors":[1]}	{"status":"welcome","user_id":"5jnbaGwAXAe1k0h-i_1-9"}	\N
184	196	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","user_id":"5jnbaGwAXAe1k0h-i_1-9","actors":[1]}	{"status":"available"}	\N
185	197	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"welcome","user_id":"Bi1zzcTnkWd4dLBPDcHa8","actors":[1]}	{"status":"welcome","user_id":"Bi1zzcTnkWd4dLBPDcHa8"}	\N
186	198	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","user_id":"Bi1zzcTnkWd4dLBPDcHa8","actors":[1]}	{"status":"available"}	\N
187	199	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"welcome","user_id":"QnwJtaSVGYMWOnJQpfE3p","actors":[1]}	{"status":"welcome","user_id":"QnwJtaSVGYMWOnJQpfE3p"}	\N
188	200	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","user_id":"QnwJtaSVGYMWOnJQpfE3p","actors":[1]}	{"status":"available"}	\N
189	201	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"welcome","user_id":"T7fDg4I-FPYhP2ZHgfSNm","actors":[1]}	{"status":"welcome","user_id":"T7fDg4I-FPYhP2ZHgfSNm"}	\N
190	202	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","user_id":"T7fDg4I-FPYhP2ZHgfSNm","actors":[1]}	{"status":"available"}	\N
191	203	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"welcome","user_id":"_wEGvq4c9hy1BRZlxIg5L","actors":[1]}	{"status":"welcome","user_id":"_wEGvq4c9hy1BRZlxIg5L"}	\N
192	204	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","user_id":"_wEGvq4c9hy1BRZlxIg5L","actors":[1]}	{"status":"available"}	\N
193	205	photos	2	{}	{}	\N
194	206	directus_fields	15	{"id":15,"collection":"photos","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":null,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"photos","field":"date_created","width":"full"}	\N
195	207	directus_fields	15	{"id":15,"collection":"photos","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":null,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"photos","field":"date_created","width":"half"}	\N
196	208	directus_fields	26	{"hidden":false,"interface":"input","display":"raw","readonly":true,"note":"User who make this photo","collection":"photos","field":"user_id"}	{"hidden":false,"interface":"input","display":"raw","readonly":true,"note":"User who make this photo","collection":"photos","field":"user_id"}	\N
197	209	directus_fields	15	{"id":15,"collection":"photos","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"photos","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
198	210	directus_fields	26	{"id":26,"collection":"photos","field":"user_id","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":true,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":"User who make this photo","conditions":null,"required":false}	{"collection":"photos","field":"user_id","width":"half"}	\N
199	211	directus_fields	14	{"id":14,"collection":"photos","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"photos","field":"id","sort":1,"group":null}	\N
200	212	directus_fields	17	{"id":17,"collection":"photos","field":"file","special":null,"interface":"file-image","options":null,"display":"image","display_options":{},"readonly":false,"hidden":false,"sort":2,"width":"full","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"photos","field":"file","sort":2,"group":null}	\N
201	213	directus_fields	15	{"id":15,"collection":"photos","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"photos","field":"date_created","sort":3,"group":null}	\N
202	214	directus_fields	26	{"id":26,"collection":"photos","field":"user_id","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":true,"hidden":false,"sort":4,"width":"half","group":null,"translations":null,"note":"User who make this photo","conditions":null,"required":false}	{"collection":"photos","field":"user_id","sort":4,"group":null}	\N
203	215	directus_fields	15	{"id":15,"collection":"photos","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"photos","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
204	216	directus_fields	15	{"id":15,"collection":"photos","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true,"format":"short"},"readonly":true,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"photos","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true,"format":"short"},"readonly":true,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
205	217	directus_fields	15	{"id":15,"collection":"photos","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"photos","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
206	218	directus_fields	15	{"id":15,"collection":"photos","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"photos","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":false,"sort":3,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
207	219	directus_fields	27	{"hidden":false,"interface":"select-dropdown-m2o","options":{"template":"{{name}}"},"display":"related-values","display_options":{"template":"{{name}}"},"readonly":false,"collection":"photos","field":"stand"}	{"hidden":false,"interface":"select-dropdown-m2o","options":{"template":"{{name}}"},"display":"related-values","display_options":{"template":"{{name}}"},"readonly":false,"collection":"photos","field":"stand"}	\N
208	220	photos	1	{"id":1,"date_created":"2021-09-05T06:52:39.882Z","file":"23f33c6c-a526-4441-97b1-3717e7d740df","user_id":null,"stand":1}	{"stand":1}	\N
209	221	photos	2	{"id":2,"date_created":"2021-09-09T08:33:31.913Z","file":null,"user_id":null,"stand":1}	{"stand":1}	\N
237	256	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":8,"actors":[1]}	{"status":"available"}	\N
239	258	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":9,"actors":[1]}	{"status":"photo","photo":9}	\N
210	222	directus_fields	28	{"hidden":false,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":true,"special":null,"collection":"photos","field":"stand_id"}	{"hidden":false,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":true,"special":null,"collection":"photos","field":"stand_id"}	\N
211	223	directus_permissions	47	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","collection":"photos","action":"create","fields":["*"],"permissions":{},"validation":{}}	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","collection":"photos","action":"create","fields":["*"],"permissions":{},"validation":{}}	\N
212	224	directus_permissions	48	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","collection":"photos","action":"update","fields":["*"],"permissions":{},"validation":{}}	{"role":"b13f106d-bf98-4c45-94f9-f90bb0d040ad","collection":"photos","action":"update","fields":["*"],"permissions":{},"validation":{}}	\N
213	225	directus_fields	29	{"hidden":false,"interface":"input","display":"raw","readonly":true,"collection":"stands","field":"photo_id"}	{"hidden":false,"interface":"input","display":"raw","readonly":true,"collection":"stands","field":"photo_id"}	\N
214	226	directus_fields	29	{"id":29,"collection":"stands","field":"photo_id","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":true,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"photo_id","width":"half"}	\N
215	227	directus_fields	29	{"id":29,"collection":"stands","field":"photo_id","special":null,"interface":"input","options":null,"display":"related-values","display_options":null,"readonly":true,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"photo_id","special":null,"interface":"input","options":null,"display":"related-values","display_options":null,"readonly":true,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
216	228	directus_fields	30	{"hidden":false,"interface":"select-dropdown-m2o","options":{"template":"{{id}}"},"display":"related-values","display_options":{"template":"{{id}}"},"readonly":true,"collection":"stands","field":"photo"}	{"hidden":false,"interface":"select-dropdown-m2o","options":{"template":"{{id}}"},"display":"related-values","display_options":{"template":"{{id}}"},"readonly":true,"collection":"stands","field":"photo"}	\N
217	229	directus_fields	30	{"id":30,"collection":"stands","field":"photo","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{id}}"},"display":"related-values","display_options":{"template":"{{id}}"},"readonly":true,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"photo","width":"half"}	\N
218	231	directus_fields	31	{"hidden":false,"interface":"input","display":"raw","readonly":false,"collection":"photos","field":"user_ids"}	{"hidden":false,"interface":"input","display":"raw","readonly":false,"collection":"photos","field":"user_ids"}	\N
219	232	photos	3	{"stand_id":1}	{"stand_id":1}	\N
220	233	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":3,"actors":[1]}	{"status":"photo","photo":3}	\N
221	234	photos	4	{"stand_id":1}	{"stand_id":1}	\N
222	235	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":4,"actors":[1]}	{"status":"photo","photo":4}	\N
223	236	photos	5	{"stand_id":1}	{"stand_id":1}	\N
224	237	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":5,"actors":[1]}	{"status":"photo","photo":5}	\N
225	238	photos	6	{"stand_id":1}	{"stand_id":1}	\N
226	239	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":6,"actors":[1]}	{"status":"photo","photo":6}	\N
227	246	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":null,"actors":[1]}	{"status":"available"}	\N
228	247	photos	7	{"stand_id":1}	{"stand_id":1}	\N
229	248	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":7,"actors":[1]}	{"status":"photo","photo":7}	\N
230	249	directus_fields	19	{"id":19,"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Available","value":"available"},{"text":"OnWelcomeScreen","value":"welcome"},{"text":"OnPhotoScreen","value":"photo"},{"text":"OnFinalScreen","value":"final"}]},"display":"labels","display_options":{"choices":[{"text":"Available","value":"available","foreground":null,"background":"#00C897"},{"text":"On Welcome Screen","value":"welcome"},{"text":"On Photo Screen","value":"photo"},{"text":"OnFinalScreen","value":"final"}]},"readonly":false,"hidden":false,"sort":5,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Available","value":"available"},{"text":"OnWelcomeScreen","value":"welcome"},{"text":"OnPhotoScreen","value":"photo"},{"text":"OnFinalScreen","value":"final"}]},"display":"labels","display_options":{"choices":[{"text":"Available","value":"available","foreground":null,"background":"#00C897"},{"text":"On Welcome Screen","value":"welcome"},{"text":"On Photo Screen","value":"photo"},{"text":"OnFinalScreen","value":"final"}]},"readonly":false,"hidden":false,"sort":5,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
231	250	directus_fields	30	{"id":30,"collection":"stands","field":"photo","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{id}}"},"display":"related-values","display_options":{"template":"{{id}}"},"readonly":false,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	{"collection":"stands","field":"photo","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{id}}"},"display":"related-values","display_options":{"template":"{{id}}"},"readonly":false,"hidden":false,"sort":null,"width":"half","group":null,"translations":null,"note":null,"conditions":null,"required":false}	\N
232	251	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":7,"actors":[1]}	{"status":"available"}	\N
233	252	photos	8	{"user_id":"5XpCnoXNv_RO4kb8utcSN","stand_id":1}	{"user_id":"5XpCnoXNv_RO4kb8utcSN","stand_id":1}	\N
234	253	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":8,"actors":[1]}	{"status":"photo","photo":8}	\N
235	254	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":8,"actors":[1]}	{"status":"available"}	\N
236	255	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":8,"actors":[1]}	{"status":"photo"}	\N
238	257	photos	9	{"user_id":"zkbpPihu0NCxtCGHaRwPc","stand_id":1}	{"user_id":"zkbpPihu0NCxtCGHaRwPc","stand_id":1}	\N
240	259	directus_users	87fd071a-9e2b-498c-8498-26cb7101a6c1	{"id":"87fd071a-9e2b-498c-8498-26cb7101a6c1","first_name":"Stand1","last_name":null,"email":"example@mail.ru","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":"en-US","theme":"auto","tfa_secret":null,"status":"active","role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a","token":"B7C8CCE779F58C8399C81C0ACD392E3036621544","last_access":null,"last_page":null}	{"token":"B7C8CCE779F58C8399C81C0ACD392E3036621544"}	\N
241	260	directus_files	f8b3e33a-e747-4398-900e-d32d2a36ae52	{"title":"Photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"Photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
242	261	directus_files	7500bd17-28f7-4aa2-80d9-64711a55c81a	{"title":"Any Photo","filename_download":"any_photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"Any Photo","filename_download":"any_photo.jpg","type":"image/jpeg","storage":"local"}	\N
243	262	directus_files	5d896c8e-2d01-4ec6-b8f3-418b324f0985	{"title":"Any Photo","filename_download":"any_photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"Any Photo","filename_download":"any_photo.jpg","type":"image/jpeg","storage":"local"}	\N
244	263	directus_files	40b736fc-d82c-4e58-b18e-3ee07055c86a	{"fields":"id","title":"any photo","filename_download":"any_photo.jpg","type":"image/jpeg","storage":"local"}	{"fields":"id","title":"any photo","filename_download":"any_photo.jpg","type":"image/jpeg","storage":"local"}	\N
245	264	directus_files	a90dd62d-339f-4e11-82c5-75290866dcbf	{"fields":"id","title":"any photo","filename_download":"any_photo.jpg","type":"image/jpeg","storage":"local"}	{"fields":"id","title":"any photo","filename_download":"any_photo.jpg","type":"image/jpeg","storage":"local"}	\N
246	265	directus_files	90319eb8-55fe-4501-9c1d-7fec606314ce	{"fields":"id","title":"any photo","filename_download":"any_photo.jpg","type":"image/jpeg","storage":"local"}	{"fields":"id","title":"any photo","filename_download":"any_photo.jpg","type":"image/jpeg","storage":"local"}	\N
247	266	directus_files	6a451917-fdb9-4b78-b772-705cdd66fa8f	{"fields":"id","title":"any photo","filename_download":"any_photo.jpg","type":"image/jpeg","storage":"local"}	{"fields":"id","title":"any photo","filename_download":"any_photo.jpg","type":"image/jpeg","storage":"local"}	\N
248	267	directus_files	c74c6eae-f854-4438-b4d7-81309b700045	{"fields":"id","title":"any photo","filename_download":"any_photo.jpg","type":"image/jpeg","storage":"local"}	{"fields":"id","title":"any photo","filename_download":"any_photo.jpg","type":"image/jpeg","storage":"local"}	\N
249	268	directus_files	ef4c81a3-0dad-4ce9-bc66-c791e77aed23	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
250	269	directus_files	09a301b2-b3ec-4975-9e2a-265f0532d00b	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
251	270	directus_files	e0f72959-f8a2-43ed-8bd2-eb43b4d757aa	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
252	271	directus_files	eb399d98-4c33-4d06-b9a8-33a458a072b5	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
253	272	directus_files	8a3c96d2-a55f-4563-990b-9ffd906feb57	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
254	273	directus_files	ab391bfd-4c92-4a2a-b072-eb5abc46535e	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
255	274	directus_files	15acfe2d-d5c9-4cf5-b8da-8039f174d1f0	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
256	275	directus_files	41dd10aa-3c04-4337-8a49-9ae81e806e02	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
257	276	directus_files	14966128-aac4-40b0-982e-6cb5ce25d8f2	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
258	277	directus_files	5e95ee3d-88ea-454f-842b-450c4b51bf83	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
259	278	directus_files	f1431fae-c012-404b-9ec0-18cd40d2e207	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
260	279	directus_files	4deceb5a-d693-46f3-b377-59e6fe95ea82	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
261	280	photos	9	{"id":9,"date_created":"2021-09-09T18:40:01.360Z","file":"4deceb5a-d693-46f3-b377-59e6fe95ea82","user_id":"zkbpPihu0NCxtCGHaRwPc","stand_id":1}	{"file":"4deceb5a-d693-46f3-b377-59e6fe95ea82"}	\N
262	284	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":null,"actors":[1]}	{"status":"available"}	\N
263	285	photos	10	{"user_id":"3MJsC4gsPeopvpaRhdDwx","stand_id":1}	{"user_id":"3MJsC4gsPeopvpaRhdDwx","stand_id":1}	\N
264	286	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":10,"actors":[1]}	{"status":"photo","photo":10}	\N
265	287	directus_files	c809bf88-bd48-4230-9dfc-0f966ddf79e8	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
266	288	photos	10	{"id":10,"date_created":"2021-09-09T20:19:13.279Z","file":"c809bf88-bd48-4230-9dfc-0f966ddf79e8","user_id":"3MJsC4gsPeopvpaRhdDwx","stand_id":1}	{"file":"c809bf88-bd48-4230-9dfc-0f966ddf79e8"}	\N
267	289	directus_files	cad3e2e7-608e-412a-b895-7b15471b14f5	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
268	290	photos	10	{"id":10,"date_created":"2021-09-09T20:19:13.279Z","file":"cad3e2e7-608e-412a-b895-7b15471b14f5","user_id":"3MJsC4gsPeopvpaRhdDwx","stand_id":1}	{"file":"cad3e2e7-608e-412a-b895-7b15471b14f5"}	\N
269	291	directus_files	d3db9c49-d057-4348-a0bf-c21bf945b277	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
270	292	photos	10	{"id":10,"date_created":"2021-09-09T20:19:13.279Z","file":"d3db9c49-d057-4348-a0bf-c21bf945b277","user_id":"3MJsC4gsPeopvpaRhdDwx","stand_id":1}	{"file":"d3db9c49-d057-4348-a0bf-c21bf945b277"}	\N
271	293	directus_files	6300dd8c-a1b6-4743-a2ff-7e219dc2fd08	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
272	294	photos	10	{"id":10,"date_created":"2021-09-09T20:19:13.279Z","file":"6300dd8c-a1b6-4743-a2ff-7e219dc2fd08","user_id":"3MJsC4gsPeopvpaRhdDwx","stand_id":1}	{"file":"6300dd8c-a1b6-4743-a2ff-7e219dc2fd08"}	\N
273	295	directus_permissions	49	{"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a","collection":"stands","action":"update","fields":["*"],"permissions":{},"validation":{}}	{"role":"de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a","collection":"stands","action":"update","fields":["*"],"permissions":{},"validation":{}}	\N
274	296	directus_files	12f57859-c44b-4e30-8833-f98374795717	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
275	297	photos	10	{"id":10,"date_created":"2021-09-09T20:19:13.279Z","file":"12f57859-c44b-4e30-8833-f98374795717","user_id":"3MJsC4gsPeopvpaRhdDwx","stand_id":1}	{"file":"12f57859-c44b-4e30-8833-f98374795717"}	\N
276	298	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":10,"actors":[1]}	{"status":"final"}	\N
277	299	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":10,"actors":[1]}	{"status":"available"}	\N
278	300	photos	11	{"user_id":"b9AXqyjPKHqbSl3r8Cbjm","stand_id":1}	{"user_id":"b9AXqyjPKHqbSl3r8Cbjm","stand_id":1}	\N
279	301	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":11,"actors":[1]}	{"status":"photo","photo":11}	\N
280	302	directus_files	5873f93f-706d-4d61-9bca-d202a177dbd7	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
281	303	photos	11	{"id":11,"date_created":"2021-09-09T20:28:07.899Z","file":"5873f93f-706d-4d61-9bca-d202a177dbd7","user_id":"b9AXqyjPKHqbSl3r8Cbjm","stand_id":1}	{"file":"5873f93f-706d-4d61-9bca-d202a177dbd7"}	\N
282	304	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":11,"actors":[1]}	{"status":"final"}	\N
283	305	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":11,"actors":[1]}	{"status":"available"}	\N
284	306	photos	12	{"user_id":"Ik6z5KGm9ZtyMUpgKC4sB","stand_id":1}	{"user_id":"Ik6z5KGm9ZtyMUpgKC4sB","stand_id":1}	\N
285	307	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":12,"actors":[1]}	{"status":"photo","photo":12}	\N
286	308	directus_files	29266e9b-843a-4ef3-985a-8b32df76bfcf	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
287	309	photos	12	{"id":12,"date_created":"2021-09-09T21:20:53.035Z","file":"29266e9b-843a-4ef3-985a-8b32df76bfcf","user_id":"Ik6z5KGm9ZtyMUpgKC4sB","stand_id":1}	{"file":"29266e9b-843a-4ef3-985a-8b32df76bfcf"}	\N
288	310	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":12,"actors":[1]}	{"status":"final"}	\N
289	311	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":12,"actors":[1]}	{"status":"available"}	\N
290	312	photos	13	{"user_id":"TG5TOe523IjaAHOPqbw3J","stand_id":1}	{"user_id":"TG5TOe523IjaAHOPqbw3J","stand_id":1}	\N
291	313	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":13,"actors":[1]}	{"status":"photo","photo":13}	\N
292	314	directus_files	deec5ec8-29b5-4927-9187-25ee49cddeae	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
293	315	photos	13	{"id":13,"date_created":"2021-09-09T21:22:20.747Z","file":"deec5ec8-29b5-4927-9187-25ee49cddeae","user_id":"TG5TOe523IjaAHOPqbw3J","stand_id":1}	{"file":"deec5ec8-29b5-4927-9187-25ee49cddeae"}	\N
294	316	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":13,"actors":[1]}	{"status":"final"}	\N
295	317	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":13,"actors":[1]}	{"status":"available"}	\N
296	318	photos	14	{"user_id":"ZzfgJ4zg_Y9Siry_88_NU","stand_id":1}	{"user_id":"ZzfgJ4zg_Y9Siry_88_NU","stand_id":1}	\N
297	319	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":14,"actors":[1]}	{"status":"photo","photo":14}	\N
298	320	directus_files	4e7240d9-7f7f-4549-9da7-92d6878c7b62	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
299	321	photos	14	{"id":14,"date_created":"2021-09-09T21:24:37.762Z","file":"4e7240d9-7f7f-4549-9da7-92d6878c7b62","user_id":"ZzfgJ4zg_Y9Siry_88_NU","stand_id":1}	{"file":"4e7240d9-7f7f-4549-9da7-92d6878c7b62"}	\N
300	322	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":14,"actors":[1]}	{"status":"final"}	\N
301	323	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":14,"actors":[1]}	{"status":"available"}	\N
302	324	photos	15	{"user_id":"KvTwOEbAadQy9KyJUf6zv","stand_id":1}	{"user_id":"KvTwOEbAadQy9KyJUf6zv","stand_id":1}	\N
303	325	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":15,"actors":[1]}	{"status":"photo","photo":15}	\N
304	326	directus_files	f7e7a1bb-99f9-4d65-a3f1-414618ed028f	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
305	327	photos	15	{"id":15,"date_created":"2021-09-09T21:26:36.463Z","file":"f7e7a1bb-99f9-4d65-a3f1-414618ed028f","user_id":"KvTwOEbAadQy9KyJUf6zv","stand_id":1}	{"file":"f7e7a1bb-99f9-4d65-a3f1-414618ed028f"}	\N
306	328	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":15,"actors":[1]}	{"status":"final"}	\N
307	329	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":15,"actors":[1]}	{"status":"available"}	\N
308	330	photos	16	{"user_id":"DmN_A3WNl3bMiM_NH6mZF","stand_id":1}	{"user_id":"DmN_A3WNl3bMiM_NH6mZF","stand_id":1}	\N
309	331	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":16,"actors":[1]}	{"status":"photo","photo":16}	\N
310	332	directus_files	af12c236-df03-4622-b479-e53af9ac7eae	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
311	333	photos	16	{"id":16,"date_created":"2021-09-09T21:28:00.141Z","file":"af12c236-df03-4622-b479-e53af9ac7eae","user_id":"DmN_A3WNl3bMiM_NH6mZF","stand_id":1}	{"file":"af12c236-df03-4622-b479-e53af9ac7eae"}	\N
312	334	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":16,"actors":[1]}	{"status":"final"}	\N
313	335	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":16,"actors":[1]}	{"status":"available"}	\N
314	336	photos	17	{"user_id":"KLJ8BS6d6oYOkf9D2LkjV","stand_id":1}	{"user_id":"KLJ8BS6d6oYOkf9D2LkjV","stand_id":1}	\N
315	337	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":17,"actors":[1]}	{"status":"photo","photo":17}	\N
316	338	directus_files	fb4705a8-5553-429e-97a6-a4ca9826dc2c	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
317	339	photos	17	{"id":17,"date_created":"2021-09-09T21:36:40.906Z","file":"fb4705a8-5553-429e-97a6-a4ca9826dc2c","user_id":"KLJ8BS6d6oYOkf9D2LkjV","stand_id":1}	{"file":"fb4705a8-5553-429e-97a6-a4ca9826dc2c"}	\N
318	340	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":17,"actors":[1]}	{"status":"final"}	\N
319	341	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":17,"actors":[1]}	{"status":"available"}	\N
320	342	photos	18	{"user_id":"k7h1xzj-banrUG4v8EJok","stand_id":1}	{"user_id":"k7h1xzj-banrUG4v8EJok","stand_id":1}	\N
321	343	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":18,"actors":[1]}	{"status":"photo","photo":18}	\N
322	344	directus_files	43fb011c-b5f0-49d5-af46-efaf8f142406	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
323	345	photos	18	{"id":18,"date_created":"2021-09-09T21:38:31.076Z","file":"43fb011c-b5f0-49d5-af46-efaf8f142406","user_id":"k7h1xzj-banrUG4v8EJok","stand_id":1}	{"file":"43fb011c-b5f0-49d5-af46-efaf8f142406"}	\N
324	346	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":18,"actors":[1]}	{"status":"final"}	\N
325	347	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":18,"actors":[1]}	{"status":"available"}	\N
326	348	photos	19	{"user_id":"x5u6IBYLSuC3Qnnghos3l","stand_id":1}	{"user_id":"x5u6IBYLSuC3Qnnghos3l","stand_id":1}	\N
327	349	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":19,"actors":[1]}	{"status":"photo","photo":19}	\N
328	350	directus_files	98d1bcce-705d-4789-be62-300b16a68164	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
329	351	photos	19	{"id":19,"date_created":"2021-09-09T21:39:54.979Z","file":"98d1bcce-705d-4789-be62-300b16a68164","user_id":"x5u6IBYLSuC3Qnnghos3l","stand_id":1}	{"file":"98d1bcce-705d-4789-be62-300b16a68164"}	\N
330	352	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":19,"actors":[1]}	{"status":"final"}	\N
331	353	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":19,"actors":[1]}	{"status":"available"}	\N
332	354	photos	20	{"user_id":"dAPtBVrigrPjK478Putpb","stand_id":1}	{"user_id":"dAPtBVrigrPjK478Putpb","stand_id":1}	\N
333	355	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":20,"actors":[1]}	{"status":"photo","photo":20}	\N
334	356	directus_files	82527a7b-3841-4113-9ba1-e402b59cc0c3	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
335	357	photos	20	{"id":20,"date_created":"2021-09-09T21:41:22.086Z","file":"82527a7b-3841-4113-9ba1-e402b59cc0c3","user_id":"dAPtBVrigrPjK478Putpb","stand_id":1}	{"file":"82527a7b-3841-4113-9ba1-e402b59cc0c3"}	\N
336	358	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":20,"actors":[1]}	{"status":"final"}	\N
337	359	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":20,"actors":[1]}	{"status":"available"}	\N
338	360	photos	21	{"user_id":"zIQ3ASrvNOMD7rQSpZQHH","stand_id":1}	{"user_id":"zIQ3ASrvNOMD7rQSpZQHH","stand_id":1}	\N
339	361	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":21,"actors":[1]}	{"status":"photo","photo":21}	\N
340	362	directus_files	477f936f-9771-4e22-9075-ecda07180f9b	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
341	363	photos	21	{"id":21,"date_created":"2021-09-09T21:42:57.410Z","file":"477f936f-9771-4e22-9075-ecda07180f9b","user_id":"zIQ3ASrvNOMD7rQSpZQHH","stand_id":1}	{"file":"477f936f-9771-4e22-9075-ecda07180f9b"}	\N
342	364	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":21,"actors":[1]}	{"status":"final"}	\N
343	365	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":21,"actors":[1]}	{"status":"available"}	\N
344	366	photos	22	{"user_id":"67ykFuIEiATrveN1rdLwS","stand_id":1}	{"user_id":"67ykFuIEiATrveN1rdLwS","stand_id":1}	\N
345	367	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":22,"actors":[1]}	{"status":"photo","photo":22}	\N
346	368	directus_files	e7c19415-0c66-451e-931c-da3bc2071544	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
347	369	photos	22	{"id":22,"date_created":"2021-09-09T21:43:47.379Z","file":"e7c19415-0c66-451e-931c-da3bc2071544","user_id":"67ykFuIEiATrveN1rdLwS","stand_id":1}	{"file":"e7c19415-0c66-451e-931c-da3bc2071544"}	\N
348	370	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":22,"actors":[1]}	{"status":"final"}	\N
349	371	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":22,"actors":[1]}	{"status":"available"}	\N
350	372	photos	23	{"user_id":"efphsOodjQEeOb12ODQs3","stand_id":1}	{"user_id":"efphsOodjQEeOb12ODQs3","stand_id":1}	\N
351	373	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":23,"actors":[1]}	{"status":"photo","photo":23}	\N
352	374	directus_files	b4fb63a5-cd83-4531-bc24-0654d872c335	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
353	375	photos	23	{"id":23,"date_created":"2021-09-09T21:51:54.460Z","file":"b4fb63a5-cd83-4531-bc24-0654d872c335","user_id":"efphsOodjQEeOb12ODQs3","stand_id":1}	{"file":"b4fb63a5-cd83-4531-bc24-0654d872c335"}	\N
354	376	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":23,"actors":[1]}	{"status":"final"}	\N
355	377	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":23,"actors":[1]}	{"status":"available"}	\N
356	378	photos	24	{"user_id":"NqdnVjmiDQN_QSM-IkRAR","stand_id":1}	{"user_id":"NqdnVjmiDQN_QSM-IkRAR","stand_id":1}	\N
357	379	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":24,"actors":[1]}	{"status":"photo","photo":24}	\N
358	380	directus_files	1d1cc1e1-b37f-4cea-9917-9f64973d6fc4	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
359	381	photos	24	{"id":24,"date_created":"2021-09-09T21:53:42.237Z","file":"1d1cc1e1-b37f-4cea-9917-9f64973d6fc4","user_id":"NqdnVjmiDQN_QSM-IkRAR","stand_id":1}	{"file":"1d1cc1e1-b37f-4cea-9917-9f64973d6fc4"}	\N
360	382	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":24,"actors":[1]}	{"status":"final"}	\N
361	383	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":24,"actors":[1]}	{"status":"available"}	\N
362	384	photos	25	{"user_id":"aCfXNbjValKdYLF0jKtLw","stand_id":1}	{"user_id":"aCfXNbjValKdYLF0jKtLw","stand_id":1}	\N
363	385	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":25,"actors":[1]}	{"status":"photo","photo":25}	\N
364	386	directus_files	e72884fc-84fe-4e9d-b7e5-3ea6141712ae	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
365	387	photos	25	{"id":25,"date_created":"2021-09-09T21:58:13.195Z","file":"e72884fc-84fe-4e9d-b7e5-3ea6141712ae","user_id":"aCfXNbjValKdYLF0jKtLw","stand_id":1}	{"file":"e72884fc-84fe-4e9d-b7e5-3ea6141712ae"}	\N
366	388	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":25,"actors":[1]}	{"status":"final"}	\N
367	389	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":25,"actors":[1]}	{"status":"available"}	\N
368	390	photos	26	{"user_id":"595OgYiTOW2Q4aUi7f4ck","stand_id":1}	{"user_id":"595OgYiTOW2Q4aUi7f4ck","stand_id":1}	\N
369	391	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":26,"actors":[1]}	{"status":"photo","photo":26}	\N
370	392	directus_files	1bcd4481-12e0-4c90-9cb2-b73704ae2301	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
371	393	photos	26	{"id":26,"date_created":"2021-09-09T21:58:36.405Z","file":"1bcd4481-12e0-4c90-9cb2-b73704ae2301","user_id":"595OgYiTOW2Q4aUi7f4ck","stand_id":1}	{"file":"1bcd4481-12e0-4c90-9cb2-b73704ae2301"}	\N
372	394	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":26,"actors":[1]}	{"status":"final"}	\N
373	395	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":26,"actors":[1]}	{"status":"available"}	\N
374	396	photos	27	{"user_id":"dr1qmpuYs9bcYmGZkNtrA","stand_id":1}	{"user_id":"dr1qmpuYs9bcYmGZkNtrA","stand_id":1}	\N
375	397	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":27,"actors":[1]}	{"status":"photo","photo":27}	\N
376	398	directus_files	4bf872b1-9399-4303-8bcb-527cad9b3725	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
377	399	photos	27	{"id":27,"date_created":"2021-09-09T22:01:19.268Z","file":"4bf872b1-9399-4303-8bcb-527cad9b3725","user_id":"dr1qmpuYs9bcYmGZkNtrA","stand_id":1}	{"file":"4bf872b1-9399-4303-8bcb-527cad9b3725"}	\N
378	400	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":27,"actors":[1]}	{"status":"final"}	\N
379	401	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":27,"actors":[1]}	{"status":"available"}	\N
380	402	photos	28	{"user_id":"T9ZVWZ0R9lIAi7rBflcR9","stand_id":1}	{"user_id":"T9ZVWZ0R9lIAi7rBflcR9","stand_id":1}	\N
381	403	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":28,"actors":[1]}	{"status":"photo","photo":28}	\N
382	404	directus_files	fa41c398-374c-4c9f-8ac5-9003a1258579	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
383	405	photos	28	{"id":28,"date_created":"2021-09-09T22:03:36.870Z","file":"fa41c398-374c-4c9f-8ac5-9003a1258579","user_id":"T9ZVWZ0R9lIAi7rBflcR9","stand_id":1}	{"file":"fa41c398-374c-4c9f-8ac5-9003a1258579"}	\N
384	406	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":28,"actors":[1]}	{"status":"final"}	\N
385	407	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":28,"actors":[1]}	{"status":"available"}	\N
386	408	photos	29	{"user_id":"rT3ErSiqsMlDF4mIoDH3c","stand_id":1}	{"user_id":"rT3ErSiqsMlDF4mIoDH3c","stand_id":1}	\N
387	409	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":29,"actors":[1]}	{"status":"photo","photo":29}	\N
388	410	directus_files	37fb06a0-1142-4547-a026-b7db82d2bf6f	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
389	411	photos	29	{"id":29,"date_created":"2021-09-09T22:09:42.362Z","file":"37fb06a0-1142-4547-a026-b7db82d2bf6f","user_id":"rT3ErSiqsMlDF4mIoDH3c","stand_id":1}	{"file":"37fb06a0-1142-4547-a026-b7db82d2bf6f"}	\N
390	412	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":29,"actors":[1]}	{"status":"final"}	\N
391	413	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":29,"actors":[1]}	{"status":"available"}	\N
392	414	photos	30	{"user_id":"U_k92RIUJcJ1K5bRp708g","stand_id":1}	{"user_id":"U_k92RIUJcJ1K5bRp708g","stand_id":1}	\N
393	415	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":30,"actors":[1]}	{"status":"photo","photo":30}	\N
394	416	directus_files	dcb3f4aa-afd6-472a-a0f9-1f97a6178c3c	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
395	417	photos	30	{"id":30,"date_created":"2021-09-09T22:22:03.435Z","file":"dcb3f4aa-afd6-472a-a0f9-1f97a6178c3c","user_id":"U_k92RIUJcJ1K5bRp708g","stand_id":1}	{"file":"dcb3f4aa-afd6-472a-a0f9-1f97a6178c3c"}	\N
396	418	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":30,"actors":[1]}	{"status":"final"}	\N
397	419	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":30,"actors":[1]}	{"status":"available"}	\N
398	420	photos	31	{"user_id":"DPdWSc5l-673vwazN0AHG","stand_id":1}	{"user_id":"DPdWSc5l-673vwazN0AHG","stand_id":1}	\N
399	421	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":31,"actors":[1]}	{"status":"photo","photo":31}	\N
400	422	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":31,"actors":[1]}	{"status":"available"}	\N
401	423	photos	32	{"user_id":"67HkPjA73dMsRZNRVtiwE","stand_id":1}	{"user_id":"67HkPjA73dMsRZNRVtiwE","stand_id":1}	\N
402	424	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":32,"actors":[1]}	{"status":"photo","photo":32}	\N
403	425	directus_files	9d7b7123-d1f2-4a62-b73c-78ac858bfc47	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
404	426	photos	32	{"id":32,"date_created":"2021-09-09T22:25:21.954Z","file":"9d7b7123-d1f2-4a62-b73c-78ac858bfc47","user_id":"67HkPjA73dMsRZNRVtiwE","stand_id":1}	{"file":"9d7b7123-d1f2-4a62-b73c-78ac858bfc47"}	\N
405	427	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":32,"actors":[1]}	{"status":"final"}	\N
406	428	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":32,"actors":[1]}	{"status":"available"}	\N
407	429	photos	33	{"user_id":"67HkPjA73dMsRZNRVtiwE","stand_id":1}	{"user_id":"67HkPjA73dMsRZNRVtiwE","stand_id":1}	\N
408	430	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":33,"actors":[1]}	{"status":"photo","photo":33}	\N
409	431	directus_files	ae770ba1-7e6d-46d2-90fa-43cbe33b7b49	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
410	432	photos	33	{"id":33,"date_created":"2021-09-09T22:25:36.807Z","file":"ae770ba1-7e6d-46d2-90fa-43cbe33b7b49","user_id":"67HkPjA73dMsRZNRVtiwE","stand_id":1}	{"file":"ae770ba1-7e6d-46d2-90fa-43cbe33b7b49"}	\N
411	433	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":33,"actors":[1]}	{"status":"final"}	\N
412	434	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":33,"actors":[1]}	{"status":"available"}	\N
413	435	photos	34	{"user_id":"67HkPjA73dMsRZNRVtiwE","stand_id":1}	{"user_id":"67HkPjA73dMsRZNRVtiwE","stand_id":1}	\N
414	436	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":34,"actors":[1]}	{"status":"photo","photo":34}	\N
415	437	directus_files	674426d4-de8b-4711-b447-454179754122	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
416	438	photos	34	{"id":34,"date_created":"2021-09-09T22:29:38.024Z","file":"674426d4-de8b-4711-b447-454179754122","user_id":"67HkPjA73dMsRZNRVtiwE","stand_id":1}	{"file":"674426d4-de8b-4711-b447-454179754122"}	\N
417	439	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":34,"actors":[1]}	{"status":"final"}	\N
418	440	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":34,"actors":[1]}	{"status":"available"}	\N
419	441	photos	35	{"user_id":"rLOgao7qTvHajaEYImO23","stand_id":1}	{"user_id":"rLOgao7qTvHajaEYImO23","stand_id":1}	\N
420	442	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":35,"actors":[1]}	{"status":"photo","photo":35}	\N
421	443	directus_files	b39db71e-44f9-425b-8589-b42897cbf612	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
422	444	photos	35	{"id":35,"date_created":"2021-09-09T22:30:46.162Z","file":"b39db71e-44f9-425b-8589-b42897cbf612","user_id":"rLOgao7qTvHajaEYImO23","stand_id":1}	{"file":"b39db71e-44f9-425b-8589-b42897cbf612"}	\N
423	445	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":35,"actors":[1]}	{"status":"final"}	\N
424	446	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":35,"actors":[1]}	{"status":"available"}	\N
425	447	photos	36	{"user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	{"user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	\N
426	448	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":36,"actors":[1]}	{"status":"photo","photo":36}	\N
427	449	directus_files	0af14a88-8042-4ad6-9443-074974940038	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
428	450	photos	36	{"id":36,"date_created":"2021-09-09T22:31:09.227Z","file":"0af14a88-8042-4ad6-9443-074974940038","user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	{"file":"0af14a88-8042-4ad6-9443-074974940038"}	\N
429	451	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":36,"actors":[1]}	{"status":"final"}	\N
522	573	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":52,"actors":[1]}	{"status":"final"}	\N
430	452	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":36,"actors":[1]}	{"status":"available"}	\N
431	453	photos	37	{"user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	{"user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	\N
432	454	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":37,"actors":[1]}	{"status":"photo","photo":37}	\N
433	455	directus_files	7dd1e29b-5e6d-4dec-b5fe-1667b119c85d	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
434	456	photos	37	{"id":37,"date_created":"2021-09-09T22:31:24.644Z","file":"7dd1e29b-5e6d-4dec-b5fe-1667b119c85d","user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	{"file":"7dd1e29b-5e6d-4dec-b5fe-1667b119c85d"}	\N
435	457	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":37,"actors":[1]}	{"status":"final"}	\N
436	458	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":37,"actors":[1]}	{"status":"available"}	\N
437	459	photos	38	{"user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	{"user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	\N
438	460	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":38,"actors":[1]}	{"status":"photo","photo":38}	\N
439	461	directus_files	56701c45-16ab-46cb-8196-03dcbbe8baaa	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
440	462	photos	38	{"id":38,"date_created":"2021-09-09T22:31:38.364Z","file":"56701c45-16ab-46cb-8196-03dcbbe8baaa","user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	{"file":"56701c45-16ab-46cb-8196-03dcbbe8baaa"}	\N
441	463	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":38,"actors":[1]}	{"status":"final"}	\N
442	464	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":38,"actors":[1]}	{"status":"available"}	\N
443	494	photos	39	{"user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	{"user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	\N
444	495	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":39,"actors":[1]}	{"status":"photo","photo":39}	\N
445	496	directus_files	1229d63d-c88f-400c-b036-cb7fbaeffd7a	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
446	497	photos	39	{"id":39,"date_created":"2021-09-09T22:33:42.844Z","file":"1229d63d-c88f-400c-b036-cb7fbaeffd7a","user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	{"file":"1229d63d-c88f-400c-b036-cb7fbaeffd7a"}	\N
447	498	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":39,"actors":[1]}	{"status":"final"}	\N
448	499	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":39,"actors":[1]}	{"status":"available"}	\N
449	500	photos	40	{"user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	{"user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	\N
450	501	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":40,"actors":[1]}	{"status":"photo","photo":40}	\N
451	502	directus_files	75e027f2-041b-4872-9436-5f9b19e63f7c	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
452	503	photos	40	{"id":40,"date_created":"2021-09-09T22:33:50.827Z","file":"75e027f2-041b-4872-9436-5f9b19e63f7c","user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	{"file":"75e027f2-041b-4872-9436-5f9b19e63f7c"}	\N
453	504	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":40,"actors":[1]}	{"status":"final"}	\N
454	505	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":40,"actors":[1]}	{"status":"available"}	\N
455	506	photos	41	{"user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	{"user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	\N
456	507	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":41,"actors":[1]}	{"status":"photo","photo":41}	\N
457	508	directus_files	34c40ad3-b8f0-4361-bcca-963445176a9d	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
458	509	photos	41	{"id":41,"date_created":"2021-09-09T22:34:02.386Z","file":"34c40ad3-b8f0-4361-bcca-963445176a9d","user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	{"file":"34c40ad3-b8f0-4361-bcca-963445176a9d"}	\N
459	510	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":41,"actors":[1]}	{"status":"final"}	\N
460	511	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":41,"actors":[1]}	{"status":"available"}	\N
461	512	photos	42	{"user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	{"user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	\N
462	513	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":42,"actors":[1]}	{"status":"photo","photo":42}	\N
463	514	directus_files	d558a308-d649-4be3-9176-f820688b8be5	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
464	515	photos	42	{"id":42,"date_created":"2021-09-09T22:34:11.685Z","file":"d558a308-d649-4be3-9176-f820688b8be5","user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	{"file":"d558a308-d649-4be3-9176-f820688b8be5"}	\N
465	516	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":42,"actors":[1]}	{"status":"final"}	\N
466	517	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":42,"actors":[1]}	{"status":"available"}	\N
467	518	photos	43	{"user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	{"user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	\N
468	519	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":43,"actors":[1]}	{"status":"photo","photo":43}	\N
469	520	directus_files	295657bd-5c26-4399-afc7-870e73f8da0e	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
470	521	photos	43	{"id":43,"date_created":"2021-09-09T22:34:24.872Z","file":"295657bd-5c26-4399-afc7-870e73f8da0e","user_id":"z7ra80lDwUPuXEUGNGNOE","stand_id":1}	{"file":"295657bd-5c26-4399-afc7-870e73f8da0e"}	\N
471	522	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":43,"actors":[1]}	{"status":"final"}	\N
472	523	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":43,"actors":[1]}	{"status":"available"}	\N
473	524	photos	44	{"user_id":"cdtWeC-kCHBkRovm2AQP0","stand_id":1}	{"user_id":"cdtWeC-kCHBkRovm2AQP0","stand_id":1}	\N
474	525	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":44,"actors":[1]}	{"status":"photo","photo":44}	\N
475	526	directus_files	65d6c22e-7bd3-48d4-970c-108b1a7ab19d	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
476	527	photos	44	{"id":44,"date_created":"2021-09-10T04:40:00.250Z","file":"65d6c22e-7bd3-48d4-970c-108b1a7ab19d","user_id":"cdtWeC-kCHBkRovm2AQP0","stand_id":1}	{"file":"65d6c22e-7bd3-48d4-970c-108b1a7ab19d"}	\N
477	528	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":44,"actors":[1]}	{"status":"final"}	\N
478	529	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":44,"actors":[1]}	{"status":"available"}	\N
479	530	photos	45	{"user_id":"8X1geC8M521YvEwuXF1xz","stand_id":1}	{"user_id":"8X1geC8M521YvEwuXF1xz","stand_id":1}	\N
480	531	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":45,"actors":[1]}	{"status":"photo","photo":45}	\N
481	532	directus_files	6f0eabf0-b4b0-4d15-a221-00c9ed6edc7f	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
482	533	photos	45	{"id":45,"date_created":"2021-09-10T04:41:54.726Z","file":"6f0eabf0-b4b0-4d15-a221-00c9ed6edc7f","user_id":"8X1geC8M521YvEwuXF1xz","stand_id":1}	{"file":"6f0eabf0-b4b0-4d15-a221-00c9ed6edc7f"}	\N
483	534	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":45,"actors":[1]}	{"status":"final"}	\N
484	535	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":45,"actors":[1]}	{"status":"available"}	\N
485	536	photos	46	{"user_id":"S9yEKNviDMS7Y_n1XZx6W","stand_id":1}	{"user_id":"S9yEKNviDMS7Y_n1XZx6W","stand_id":1}	\N
486	537	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":46,"actors":[1]}	{"status":"photo","photo":46}	\N
487	538	directus_files	0e17bfb2-aa41-4d9a-9c96-9e91a731886f	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
488	539	photos	46	{"id":46,"date_created":"2021-09-10T04:45:55.668Z","file":"0e17bfb2-aa41-4d9a-9c96-9e91a731886f","user_id":"S9yEKNviDMS7Y_n1XZx6W","stand_id":1}	{"file":"0e17bfb2-aa41-4d9a-9c96-9e91a731886f"}	\N
489	540	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":46,"actors":[1]}	{"status":"final"}	\N
490	541	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":46,"actors":[1]}	{"status":"available"}	\N
491	542	photos	47	{"user_id":"o-X2GFvv4PJ1wRaK5tkb_","stand_id":1}	{"user_id":"o-X2GFvv4PJ1wRaK5tkb_","stand_id":1}	\N
492	543	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":47,"actors":[1]}	{"status":"photo","photo":47}	\N
493	544	directus_files	0d427bb2-6ddc-4f68-a674-be436ebcc316	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
494	545	photos	47	{"id":47,"date_created":"2021-09-10T04:46:43.147Z","file":"0d427bb2-6ddc-4f68-a674-be436ebcc316","user_id":"o-X2GFvv4PJ1wRaK5tkb_","stand_id":1}	{"file":"0d427bb2-6ddc-4f68-a674-be436ebcc316"}	\N
495	546	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":47,"actors":[1]}	{"status":"final"}	\N
496	547	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":47,"actors":[1]}	{"status":"available"}	\N
497	548	photos	48	{"user_id":"yDZK1YUQQt0Odr-kvAY2i","stand_id":1}	{"user_id":"yDZK1YUQQt0Odr-kvAY2i","stand_id":1}	\N
498	549	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":48,"actors":[1]}	{"status":"photo","photo":48}	\N
499	550	directus_files	fdf3db00-25c3-4d5b-b8de-98bb04e7aa52	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
500	551	photos	48	{"id":48,"date_created":"2021-09-10T04:47:04.876Z","file":"fdf3db00-25c3-4d5b-b8de-98bb04e7aa52","user_id":"yDZK1YUQQt0Odr-kvAY2i","stand_id":1}	{"file":"fdf3db00-25c3-4d5b-b8de-98bb04e7aa52"}	\N
501	552	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":48,"actors":[1]}	{"status":"final"}	\N
502	553	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":48,"actors":[1]}	{"status":"available"}	\N
503	554	photos	49	{"user_id":"Zcgr5sffsjtCI7ob2fdaE","stand_id":1}	{"user_id":"Zcgr5sffsjtCI7ob2fdaE","stand_id":1}	\N
504	555	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":49,"actors":[1]}	{"status":"photo","photo":49}	\N
505	556	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":49,"actors":[1]}	{"status":"available"}	\N
506	557	photos	50	{"user_id":"vCtIs7Ruf9pN_XRb65LA7","stand_id":1}	{"user_id":"vCtIs7Ruf9pN_XRb65LA7","stand_id":1}	\N
507	558	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":50,"actors":[1]}	{"status":"photo","photo":50}	\N
508	559	directus_files	6f305678-8bfe-4728-9ce1-a4b494c2146c	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
509	560	photos	50	{"id":50,"date_created":"2021-09-10T05:14:55.112Z","file":"6f305678-8bfe-4728-9ce1-a4b494c2146c","user_id":"vCtIs7Ruf9pN_XRb65LA7","stand_id":1}	{"file":"6f305678-8bfe-4728-9ce1-a4b494c2146c"}	\N
510	561	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":50,"actors":[1]}	{"status":"final"}	\N
511	562	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":50,"actors":[1]}	{"status":"available"}	\N
512	563	photos	51	{"user_id":"vCtIs7Ruf9pN_XRb65LA7","stand_id":1}	{"user_id":"vCtIs7Ruf9pN_XRb65LA7","stand_id":1}	\N
513	564	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":51,"actors":[1]}	{"status":"photo","photo":51}	\N
514	565	directus_files	d73e7607-2757-4160-b72f-9aacebe48813	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
515	566	photos	51	{"id":51,"date_created":"2021-09-10T05:15:12.477Z","file":"d73e7607-2757-4160-b72f-9aacebe48813","user_id":"vCtIs7Ruf9pN_XRb65LA7","stand_id":1}	{"file":"d73e7607-2757-4160-b72f-9aacebe48813"}	\N
516	567	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":51,"actors":[1]}	{"status":"final"}	\N
517	568	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":51,"actors":[1]}	{"status":"available"}	\N
518	569	photos	52	{"user_id":"nsc-WQtH_Jptwb2D-Uxa3","stand_id":1}	{"user_id":"nsc-WQtH_Jptwb2D-Uxa3","stand_id":1}	\N
519	570	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":52,"actors":[1]}	{"status":"photo","photo":52}	\N
520	571	directus_files	c686eb24-340e-4975-9a9a-8caae9c4e744	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
521	572	photos	52	{"id":52,"date_created":"2021-09-10T05:15:36.685Z","file":"c686eb24-340e-4975-9a9a-8caae9c4e744","user_id":"nsc-WQtH_Jptwb2D-Uxa3","stand_id":1}	{"file":"c686eb24-340e-4975-9a9a-8caae9c4e744"}	\N
523	574	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":52,"actors":[1]}	{"status":"available"}	\N
524	575	photos	53	{"user_id":"nsc-WQtH_Jptwb2D-Uxa3","stand_id":1}	{"user_id":"nsc-WQtH_Jptwb2D-Uxa3","stand_id":1}	\N
525	576	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":53,"actors":[1]}	{"status":"photo","photo":53}	\N
526	577	directus_files	c957c98e-64d0-4f1d-aca1-b02e1b0848c6	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
527	578	photos	53	{"id":53,"date_created":"2021-09-10T05:15:46.752Z","file":"c957c98e-64d0-4f1d-aca1-b02e1b0848c6","user_id":"nsc-WQtH_Jptwb2D-Uxa3","stand_id":1}	{"file":"c957c98e-64d0-4f1d-aca1-b02e1b0848c6"}	\N
528	579	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":53,"actors":[1]}	{"status":"final"}	\N
529	580	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":53,"actors":[1]}	{"status":"available"}	\N
530	663	photos	54	{"user_id":"F9zOBQXhK5rIGyWjh1Pct","stand_id":1}	{"user_id":"F9zOBQXhK5rIGyWjh1Pct","stand_id":1}	\N
531	664	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":54,"actors":[1]}	{"status":"photo","photo":54}	\N
532	665	directus_files	448744ec-118c-4fe6-9266-99ea54971ae4	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
533	666	photos	54	{"id":54,"date_created":"2021-09-10T05:18:45.110Z","file":"448744ec-118c-4fe6-9266-99ea54971ae4","user_id":"F9zOBQXhK5rIGyWjh1Pct","stand_id":1}	{"file":"448744ec-118c-4fe6-9266-99ea54971ae4"}	\N
534	667	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":54,"actors":[1]}	{"status":"final"}	\N
535	668	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":54,"actors":[1]}	{"status":"available"}	\N
536	669	photos	55	{"user_id":"cNVPAqbX1BXgpeFxKzo-u","stand_id":1}	{"user_id":"cNVPAqbX1BXgpeFxKzo-u","stand_id":1}	\N
537	670	photos	56	{"user_id":"cNVPAqbX1BXgpeFxKzo-u","stand_id":1}	{"user_id":"cNVPAqbX1BXgpeFxKzo-u","stand_id":1}	\N
538	671	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":55,"actors":[1]}	{"status":"photo","photo":55}	\N
539	672	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":56,"actors":[1]}	{"status":"photo","photo":56}	\N
540	673	directus_files	bc7827f4-1dfd-427d-aec9-8bdaed023ba2	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
541	674	photos	56	{"id":56,"date_created":"2021-09-10T05:28:02.245Z","file":"bc7827f4-1dfd-427d-aec9-8bdaed023ba2","user_id":"cNVPAqbX1BXgpeFxKzo-u","stand_id":1}	{"file":"bc7827f4-1dfd-427d-aec9-8bdaed023ba2"}	\N
542	675	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":56,"actors":[1]}	{"status":"final"}	\N
543	676	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":56,"actors":[1]}	{"status":"available"}	\N
544	677	photos	57	{"user_id":"cNVPAqbX1BXgpeFxKzo-u","stand_id":1}	{"user_id":"cNVPAqbX1BXgpeFxKzo-u","stand_id":1}	\N
545	678	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":57,"actors":[1]}	{"status":"photo","photo":57}	\N
546	679	directus_files	1a7de6b6-189d-4e4b-8be9-5dbfe1fe99c7	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
547	680	photos	57	{"id":57,"date_created":"2021-09-10T05:28:37.790Z","file":"1a7de6b6-189d-4e4b-8be9-5dbfe1fe99c7","user_id":"cNVPAqbX1BXgpeFxKzo-u","stand_id":1}	{"file":"1a7de6b6-189d-4e4b-8be9-5dbfe1fe99c7"}	\N
548	681	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":57,"actors":[1]}	{"status":"final"}	\N
549	682	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":57,"actors":[1]}	{"status":"available"}	\N
550	683	photos	58	{"user_id":"cNVPAqbX1BXgpeFxKzo-u","stand_id":1}	{"user_id":"cNVPAqbX1BXgpeFxKzo-u","stand_id":1}	\N
551	684	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"photo","photo":58,"actors":[1]}	{"status":"photo","photo":58}	\N
552	685	directus_files	388d49af-9d13-4708-9c9d-4494d9d006ad	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	{"title":"yet one photo","filename_download":"photo.jpg","type":"image/jpeg","storage":"local"}	\N
553	686	photos	58	{"id":58,"date_created":"2021-09-10T05:29:02.965Z","file":"388d49af-9d13-4708-9c9d-4494d9d006ad","user_id":"cNVPAqbX1BXgpeFxKzo-u","stand_id":1}	{"file":"388d49af-9d13-4708-9c9d-4494d9d006ad"}	\N
554	687	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"final","photo":58,"actors":[1]}	{"status":"final"}	\N
555	688	stands	1	{"id":1,"name":"Первый стенд","active":true,"status":"available","photo":58,"actors":[1]}	{"status":"available"}	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, module_list, collection_list, admin_access, app_access) FROM stdin;
98e517fe-4b06-4b03-b132-f9f669249ef5	Administrator	verified	Initial administrative role with unrestricted App/API access	\N	f	\N	\N	t	t
de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	Stand	supervised_user_circle	\N	\N	f	\N	\N	f	t
b13f106d-bf98-4c45-94f9-f90bb0d040ad	User	supervised_user_circle	\N	\N	f	\N	\N	f	t
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent) FROM stdin;
Ey0WowLANBszn-1HyW_5NhMItbIRDCP0-REuhv9pprvhjBDRKJ6XfGqWKm8zEWrz	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-17 05:44:29.25+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36
JItykQ_1AGtXLmz-KPxROtut4IGgdeWkunQuh3deupza3zxAqQpQY87g-v294t-V	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-12 07:34:26.815+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36
ICsCVEITdZUXzCFF2KrsZRcrS4u-xBP3-k1vK0MA4bMEkEAS89NXKNnvvEZ0_1XS	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-12 06:49:54.858+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36
z_yXQlJypYYGCOGS-fdfmbGFNdkCL8oPwBuOp6u8LJ02BKkc3sHVMlVk6lzAVai9	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-14 06:42:32.335+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36
0Zr1Q8kz3Phf_DRwU-EkhsHXpGaPXmtkwq3RR4TM5MW-XdHWfuCX_GAFZiqbm8hW	d51af580-89ff-4ca4-b91a-5d3fab759b63	2021-09-16 08:47:07.565+00	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key) FROM stdin;
1	MTS-Life	\N	#C70000	\N	\N	\N	\N	25	\N	all	\N	\N	\N	\N	\N
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, theme, tfa_secret, status, role, token, last_access, last_page) FROM stdin;
5c57e883-4a3a-4bfe-9bee-2117fa9e4c70	User1	\N	user@mail.ru	$argon2i$v=19$m=4096,t=3,p=1$EgkwaBeyowVKfRimee1z6A$HWA++V9rny8ViavpHrbuJ+p47zhwqbR+uHCfBck8rNc	\N	\N	\N	\N	\N	en-US	auto	\N	active	b13f106d-bf98-4c45-94f9-f90bb0d040ad	4721F803B60B0F8A450091E73F4D22207B96A32383B4B0398BB43F66752352FD	\N	\N
87fd071a-9e2b-498c-8498-26cb7101a6c1	Stand1	\N	example@mail.ru	$argon2i$v=19$m=4096,t=3,p=1$COOhq+9CJp8SzOrA96QnRA$9YYu1XqUIhnnChHBsCDsLJyfMDLreGO9z/X1mgbmMY4	\N	\N	\N	\N	\N	en-US	auto	\N	active	de36e8f5-b7d4-4ead-88e8-a2d8b2d7e98a	B7C8CCE779F58C8399C81C0ACD392E3036621544	\N	\N
d51af580-89ff-4ca4-b91a-5d3fab759b63	Admin	User	den59k@gmail.com	$argon2i$v=19$m=4096,t=3,p=1$Tv8IQZw9qfiQdoZqjW7Y+w$t+iFslpB6uDblG7Za7iN3i1XbVdiQm6x4oxiyyC8shk	\N	\N	\N	\N	\N	en-US	auto	\N	active	98e517fe-4b06-4b03-b132-f9f669249ef5	\N	2021-09-10 05:44:29.292+00	/collections/stands
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections) FROM stdin;
\.


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.photos (id, date_created, file, user_id, stand_id) FROM stdin;
\.


--
-- Data for Name: stands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stands (id, name, active, status, photo) FROM stdin;
1	Первый стенд	t	available	\N
\.


--
-- Name: actors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actors_id_seq', 1, true);


--
-- Name: actors_stands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actors_stands_id_seq', 1, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 697, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 31, true);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 49, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 5, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 5, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 555, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.photos_id_seq', 58, true);


--
-- Name: stands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stands_id_seq', 1, true);


--
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (id);


--
-- Name: actors_stands actors_stands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors_stands
    ADD CONSTRAINT actors_stands_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: stands stands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stands
    ADD CONSTRAINT stands_pkey PRIMARY KEY (id);


--
-- Name: actors_stands actors_stands_actors_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors_stands
    ADD CONSTRAINT actors_stands_actors_id_foreign FOREIGN KEY (actors_id) REFERENCES public.actors(id) ON DELETE CASCADE;


--
-- Name: actors_stands actors_stands_stands_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors_stands
    ADD CONSTRAINT actors_stands_stands_id_foreign FOREIGN KEY (stands_id) REFERENCES public.stands(id) ON DELETE CASCADE;


--
-- Name: directus_fields directus_fields_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_fields(id);


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: photos photos_file_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_file_foreign FOREIGN KEY (file) REFERENCES public.directus_files(id);


--
-- Name: stands stands_photo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stands
    ADD CONSTRAINT stands_photo_foreign FOREIGN KEY (photo) REFERENCES public.photos(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

