PGDMP      ;                |         	   motorphdb    16.3 (Debian 16.3-1.pgdg120+1)     16.3 (Ubuntu 16.3-1.pgdg22.04+1) �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16389 	   motorphdb    DATABASE     t   CREATE DATABASE motorphdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF8';
    DROP DATABASE motorphdb;
                jon    false            �           0    0 	   motorphdb    DATABASE PROPERTIES     2   ALTER DATABASE motorphdb SET "TimeZone" TO 'utc';
                     jon    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                jon    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   jon    false    5            �            1259    16471    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    jon    false    5            �            1259    16821 
   attendance    TABLE     %  CREATE TABLE public.attendance (
    employee_id integer NOT NULL,
    id bigint NOT NULL,
    total_hours double precision DEFAULT 0,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    notes character varying,
    overtime double precision DEFAULT 0
);
    DROP TABLE public.attendance;
       public         heap    jon    false    5            �            1259    16828    attendance_id_seq    SEQUENCE     z   CREATE SEQUENCE public.attendance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.attendance_id_seq;
       public          jon    false    5    216            �           0    0    attendance_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.attendance_id_seq OWNED BY public.attendance.id;
          public          jon    false    217            �            1259    16829 	   deduction    TABLE     �   CREATE TABLE public.deduction (
    name character varying NOT NULL,
    description character varying,
    id bigint NOT NULL
);
    DROP TABLE public.deduction;
       public         heap    jon    false    5            �           0    0    COLUMN deduction.name    COMMENT     B   COMMENT ON COLUMN public.deduction.name IS 'identification name';
          public          jon    false    218            �            1259    16834    deduction_id_seq    SEQUENCE     y   CREATE SEQUENCE public.deduction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.deduction_id_seq;
       public          jon    false    218    5            �           0    0    deduction_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.deduction_id_seq OWNED BY public.deduction.id;
          public          jon    false    219            �            1259    16835    emp_ids    TABLE     }   CREATE TABLE public.emp_ids (
    id bigint NOT NULL,
    employee_id bigint,
    deduction_id bigint,
    id_number text
);
    DROP TABLE public.emp_ids;
       public         heap    jon    false    5            �            1259    16840    emp_perk    TABLE     �   CREATE TABLE public.emp_perk (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    perk_id bigint NOT NULL,
    amount double precision
);
    DROP TABLE public.emp_perk;
       public         heap    jon    false    5            �            1259    16843    employee    TABLE       CREATE TABLE public.employee (
    id_number integer NOT NULL,
    firstname character varying NOT NULL,
    lastname character varying NOT NULL,
    middlei character varying,
    address character varying NOT NULL,
    password character varying,
    gender character varying(10),
    id bigint NOT NULL,
    birthday date,
    phone_number character varying(12),
    employment_status character varying,
    "position" character varying,
    supervisor_id character varying,
    basic_salary double precision DEFAULT 0
);
    DROP TABLE public.employee;
       public         heap    jon    false    5            �           0    0    COLUMN employee.supervisor_id    COMMENT     N   COMMENT ON COLUMN public.employee.supervisor_id IS 'id_number of supervisor';
          public          jon    false    222            �            1259    16849    pay_deduction    TABLE     �   CREATE TABLE public.pay_deduction (
    amount double precision DEFAULT 0.00,
    payroll_id integer,
    note text,
    manual boolean DEFAULT false,
    id bigint NOT NULL,
    name text
);
 !   DROP TABLE public.pay_deduction;
       public         heap    jon    false    5            �           0    0    COLUMN pay_deduction.manual    COMMENT     k   COMMENT ON COLUMN public.pay_deduction.manual IS 'user can set this to true to manually input the amount';
          public          jon    false    223            �            1259    16856    employee_deduction_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_deduction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.employee_deduction_id_seq;
       public          jon    false    223    5            �           0    0    employee_deduction_id_seq    SEQUENCE OWNED BY     R   ALTER SEQUENCE public.employee_deduction_id_seq OWNED BY public.pay_deduction.id;
          public          jon    false    224            �            1259    16857    employee_id_seq    SEQUENCE     x   CREATE SEQUENCE public.employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.employee_id_seq;
       public          jon    false    222    5            �           0    0    employee_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;
          public          jon    false    225            �            1259    16858    pay_perk    TABLE     �   CREATE TABLE public.pay_perk (
    payroll_id integer NOT NULL,
    amount double precision DEFAULT 0.00 NOT NULL,
    id bigint NOT NULL,
    perk_id bigint
);
    DROP TABLE public.pay_perk;
       public         heap    jon    false    5            �            1259    16862    employee_perk_id_seq    SEQUENCE     }   CREATE SEQUENCE public.employee_perk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.employee_perk_id_seq;
       public          jon    false    5    226            �           0    0    employee_perk_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.employee_perk_id_seq OWNED BY public.pay_perk.id;
          public          jon    false    227            �            1259    16863 	   employees    TABLE     '  CREATE TABLE public.employees (
    id integer NOT NULL,
    id_number integer NOT NULL,
    firstname character varying NOT NULL,
    lastname character varying NOT NULL,
    middlei character varying NOT NULL,
    address character varying NOT NULL,
    password character varying NOT NULL
);
    DROP TABLE public.employees;
       public         heap    jon    false    5            �            1259    16868    employees_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public          jon    false    5    228            �           0    0    employees_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;
          public          jon    false    229            �            1259    16869    my_ids_id_seq    SEQUENCE     v   CREATE SEQUENCE public.my_ids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.my_ids_id_seq;
       public          jon    false    5    220            �           0    0    my_ids_id_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.my_ids_id_seq OWNED BY public.emp_ids.id;
          public          jon    false    230            �            1259    16870    my_perk_id_seq    SEQUENCE     w   CREATE SEQUENCE public.my_perk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.my_perk_id_seq;
       public          jon    false    5    221            �           0    0    my_perk_id_seq    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.my_perk_id_seq OWNED BY public.emp_perk.id;
          public          jon    false    231            �            1259    16871    overtime    TABLE     -  CREATE TABLE public.overtime (
    employee_id integer NOT NULL,
    supervisor_id integer NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    approved boolean DEFAULT false,
    total_hours double precision,
    id bigint NOT NULL
);
    DROP TABLE public.overtime;
       public         heap    jon    false    5            �            1259    16875    overtime_employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.overtime_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.overtime_employee_id_seq;
       public          jon    false    5    232                        0    0    overtime_employee_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.overtime_employee_id_seq OWNED BY public.overtime.employee_id;
          public          jon    false    233            �            1259    16876    overtime_id_seq    SEQUENCE     x   CREATE SEQUENCE public.overtime_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.overtime_id_seq;
       public          jon    false    5    232                       0    0    overtime_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.overtime_id_seq OWNED BY public.overtime.id;
          public          jon    false    234            �            1259    16877    overtime_supervisor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.overtime_supervisor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.overtime_supervisor_id_seq;
       public          jon    false    232    5                       0    0    overtime_supervisor_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.overtime_supervisor_id_seq OWNED BY public.overtime.supervisor_id;
          public          jon    false    235            �            1259    16878    pagibig_matrix    TABLE     �   CREATE TABLE public.pagibig_matrix (
    id bigint NOT NULL,
    monthly_salary_min double precision,
    monthly_salary_max double precision,
    employee_rate double precision,
    employeer_rate double precision,
    total_rate double precision
);
 "   DROP TABLE public.pagibig_matrix;
       public         heap    jon    false    5            �            1259    16881    pagibig_matrix_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.pagibig_matrix_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.pagibig_matrix_id_seq;
       public          jon    false    236    5                       0    0    pagibig_matrix_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.pagibig_matrix_id_seq OWNED BY public.pagibig_matrix.id;
          public          jon    false    237            �            1259    16882    payroll    TABLE     �  CREATE TABLE public.payroll (
    employee_id integer NOT NULL,
    start_date date,
    end_date date,
    gross_pay double precision,
    net_pay double precision,
    total_deductions double precision,
    total_perks double precision DEFAULT 0.00,
    id bigint NOT NULL,
    basic_salary double precision,
    days integer,
    take_home double precision,
    total_hours double precision,
    overtime double precision,
    tax double precision
);
    DROP TABLE public.payroll;
       public         heap    jon    false    5            �            1259    16886    payslip_id_seq    SEQUENCE     w   CREATE SEQUENCE public.payslip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.payslip_id_seq;
       public          jon    false    5    238                       0    0    payslip_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.payslip_id_seq OWNED BY public.payroll.id;
          public          jon    false    239            �            1259    16887    perk    TABLE     }   CREATE TABLE public.perk (
    name character varying NOT NULL,
    description character varying,
    id bigint NOT NULL
);
    DROP TABLE public.perk;
       public         heap    jon    false    5                       0    0    COLUMN perk.name    COMMENT     7   COMMENT ON COLUMN public.perk.name IS 'Name of perks';
          public          jon    false    240            �            1259    16892    perk_id_seq    SEQUENCE     t   CREATE SEQUENCE public.perk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.perk_id_seq;
       public          jon    false    5    240                       0    0    perk_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.perk_id_seq OWNED BY public.perk.id;
          public          jon    false    241            �            1259    16893    phealth_matrix    TABLE     �   CREATE TABLE public.phealth_matrix (
    id bigint NOT NULL,
    salary_min double precision,
    premium_rate double precision,
    premium double precision,
    salary_max double precision
);
 "   DROP TABLE public.phealth_matrix;
       public         heap    jon    false    5                       0    0    COLUMN phealth_matrix.premium    COMMENT     }   COMMENT ON COLUMN public.phealth_matrix.premium IS 'if value is zero, multiply monthly salary with rate to get the premium';
          public          jon    false    242            �            1259    16896    philhealth_matrix_id_seq    SEQUENCE     �   CREATE SEQUENCE public.philhealth_matrix_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.philhealth_matrix_id_seq;
       public          jon    false    5    242                       0    0    philhealth_matrix_id_seq    SEQUENCE OWNED BY     R   ALTER SEQUENCE public.philhealth_matrix_id_seq OWNED BY public.phealth_matrix.id;
          public          jon    false    243            �            1259    16897    role    TABLE     �   CREATE TABLE public.role (
    role character varying NOT NULL,
    description character varying NOT NULL,
    employee_id bigint NOT NULL,
    id bigint NOT NULL
);
    DROP TABLE public.role;
       public         heap    jon    false    5            �            1259    16902    role_id_seq    SEQUENCE     t   CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public          jon    false    244    5            	           0    0    role_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;
          public          jon    false    245            �            1259    16903    roles    TABLE     �   CREATE TABLE public.roles (
    id integer NOT NULL,
    role character varying NOT NULL,
    description character varying NOT NULL,
    employee_id integer NOT NULL
);
    DROP TABLE public.roles;
       public         heap    jon    false    5            �            1259    16908    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          jon    false    246    5            
           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          jon    false    247            �            1259    16909 
   sss_matrix    TABLE     �   CREATE TABLE public.sss_matrix (
    id bigint NOT NULL,
    min_val double precision,
    max_val double precision,
    contribution double precision
);
    DROP TABLE public.sss_matrix;
       public         heap    jon    false    5            �            1259    16912    sss_matrix_id_seq    SEQUENCE     z   CREATE SEQUENCE public.sss_matrix_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.sss_matrix_id_seq;
       public          jon    false    5    248                       0    0    sss_matrix_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.sss_matrix_id_seq OWNED BY public.sss_matrix.id;
          public          jon    false    249            �            1259    16913 
   tax_matrix    TABLE     �   CREATE TABLE public.tax_matrix (
    id bigint NOT NULL,
    salary_min double precision,
    salary_max double precision,
    tax_rate double precision,
    excess_rate double precision
);
    DROP TABLE public.tax_matrix;
       public         heap    jon    false    5                       0    0    TABLE tax_matrix    COMMENT     8   COMMENT ON TABLE public.tax_matrix IS 'witholding tax';
          public          jon    false    250            �            1259    16916    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL
);
    DROP TABLE public.users;
       public         heap    jon    false    5            �            1259    16921    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          jon    false    251    5                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          jon    false    252            �            1259    16922    witholding_matrix_id_seq    SEQUENCE     �   CREATE SEQUENCE public.witholding_matrix_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.witholding_matrix_id_seq;
       public          jon    false    250    5                       0    0    witholding_matrix_id_seq    SEQUENCE OWNED BY     N   ALTER SEQUENCE public.witholding_matrix_id_seq OWNED BY public.tax_matrix.id;
          public          jon    false    253            �           2604    16924    attendance id    DEFAULT     n   ALTER TABLE ONLY public.attendance ALTER COLUMN id SET DEFAULT nextval('public.attendance_id_seq'::regclass);
 <   ALTER TABLE public.attendance ALTER COLUMN id DROP DEFAULT;
       public          jon    false    217    216            �           2604    16925    deduction id    DEFAULT     l   ALTER TABLE ONLY public.deduction ALTER COLUMN id SET DEFAULT nextval('public.deduction_id_seq'::regclass);
 ;   ALTER TABLE public.deduction ALTER COLUMN id DROP DEFAULT;
       public          jon    false    219    218            �           2604    16926 
   emp_ids id    DEFAULT     g   ALTER TABLE ONLY public.emp_ids ALTER COLUMN id SET DEFAULT nextval('public.my_ids_id_seq'::regclass);
 9   ALTER TABLE public.emp_ids ALTER COLUMN id DROP DEFAULT;
       public          jon    false    230    220            �           2604    16927    emp_perk id    DEFAULT     i   ALTER TABLE ONLY public.emp_perk ALTER COLUMN id SET DEFAULT nextval('public.my_perk_id_seq'::regclass);
 :   ALTER TABLE public.emp_perk ALTER COLUMN id DROP DEFAULT;
       public          jon    false    231    221            �           2604    16928    employee id    DEFAULT     j   ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);
 :   ALTER TABLE public.employee ALTER COLUMN id DROP DEFAULT;
       public          jon    false    225    222            �           2604    16929    employees id    DEFAULT     l   ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public          jon    false    229    228            �           2604    16930    overtime employee_id    DEFAULT     |   ALTER TABLE ONLY public.overtime ALTER COLUMN employee_id SET DEFAULT nextval('public.overtime_employee_id_seq'::regclass);
 C   ALTER TABLE public.overtime ALTER COLUMN employee_id DROP DEFAULT;
       public          jon    false    233    232            �           2604    16931    overtime supervisor_id    DEFAULT     �   ALTER TABLE ONLY public.overtime ALTER COLUMN supervisor_id SET DEFAULT nextval('public.overtime_supervisor_id_seq'::regclass);
 E   ALTER TABLE public.overtime ALTER COLUMN supervisor_id DROP DEFAULT;
       public          jon    false    235    232            �           2604    16932    overtime id    DEFAULT     j   ALTER TABLE ONLY public.overtime ALTER COLUMN id SET DEFAULT nextval('public.overtime_id_seq'::regclass);
 :   ALTER TABLE public.overtime ALTER COLUMN id DROP DEFAULT;
       public          jon    false    234    232            �           2604    16933    pagibig_matrix id    DEFAULT     v   ALTER TABLE ONLY public.pagibig_matrix ALTER COLUMN id SET DEFAULT nextval('public.pagibig_matrix_id_seq'::regclass);
 @   ALTER TABLE public.pagibig_matrix ALTER COLUMN id DROP DEFAULT;
       public          jon    false    237    236            �           2604    16934    pay_deduction id    DEFAULT     y   ALTER TABLE ONLY public.pay_deduction ALTER COLUMN id SET DEFAULT nextval('public.employee_deduction_id_seq'::regclass);
 ?   ALTER TABLE public.pay_deduction ALTER COLUMN id DROP DEFAULT;
       public          jon    false    224    223            �           2604    16935    pay_perk id    DEFAULT     o   ALTER TABLE ONLY public.pay_perk ALTER COLUMN id SET DEFAULT nextval('public.employee_perk_id_seq'::regclass);
 :   ALTER TABLE public.pay_perk ALTER COLUMN id DROP DEFAULT;
       public          jon    false    227    226            �           2604    16936 
   payroll id    DEFAULT     h   ALTER TABLE ONLY public.payroll ALTER COLUMN id SET DEFAULT nextval('public.payslip_id_seq'::regclass);
 9   ALTER TABLE public.payroll ALTER COLUMN id DROP DEFAULT;
       public          jon    false    239    238            �           2604    16937    perk id    DEFAULT     b   ALTER TABLE ONLY public.perk ALTER COLUMN id SET DEFAULT nextval('public.perk_id_seq'::regclass);
 6   ALTER TABLE public.perk ALTER COLUMN id DROP DEFAULT;
       public          jon    false    241    240            �           2604    16938    phealth_matrix id    DEFAULT     y   ALTER TABLE ONLY public.phealth_matrix ALTER COLUMN id SET DEFAULT nextval('public.philhealth_matrix_id_seq'::regclass);
 @   ALTER TABLE public.phealth_matrix ALTER COLUMN id DROP DEFAULT;
       public          jon    false    243    242            �           2604    16939    role id    DEFAULT     b   ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);
 6   ALTER TABLE public.role ALTER COLUMN id DROP DEFAULT;
       public          jon    false    245    244            �           2604    16940    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          jon    false    247    246            �           2604    16941    sss_matrix id    DEFAULT     n   ALTER TABLE ONLY public.sss_matrix ALTER COLUMN id SET DEFAULT nextval('public.sss_matrix_id_seq'::regclass);
 <   ALTER TABLE public.sss_matrix ALTER COLUMN id DROP DEFAULT;
       public          jon    false    249    248            �           2604    16942    tax_matrix id    DEFAULT     u   ALTER TABLE ONLY public.tax_matrix ALTER COLUMN id SET DEFAULT nextval('public.witholding_matrix_id_seq'::regclass);
 <   ALTER TABLE public.tax_matrix ALTER COLUMN id DROP DEFAULT;
       public          jon    false    253    250            �           2604    16943    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          jon    false    252    251            �          0    16471    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          jon    false    215   ��       �          0    16821 
   attendance 
   TABLE DATA           i   COPY public.attendance (employee_id, id, total_hours, start_date, end_date, notes, overtime) FROM stdin;
    public          jon    false    216   '�       �          0    16829 	   deduction 
   TABLE DATA           :   COPY public.deduction (name, description, id) FROM stdin;
    public          jon    false    218   r�       �          0    16835    emp_ids 
   TABLE DATA           K   COPY public.emp_ids (id, employee_id, deduction_id, id_number) FROM stdin;
    public          jon    false    220   ��       �          0    16840    emp_perk 
   TABLE DATA           D   COPY public.emp_perk (id, employee_id, perk_id, amount) FROM stdin;
    public          jon    false    221   �       �          0    16843    employee 
   TABLE DATA           �   COPY public.employee (id_number, firstname, lastname, middlei, address, password, gender, id, birthday, phone_number, employment_status, "position", supervisor_id, basic_salary) FROM stdin;
    public          jon    false    222   ��       �          0    16863 	   employees 
   TABLE DATA           c   COPY public.employees (id, id_number, firstname, lastname, middlei, address, password) FROM stdin;
    public          jon    false    228   c�       �          0    16871    overtime 
   TABLE DATA           o   COPY public.overtime (employee_id, supervisor_id, start_date, end_date, approved, total_hours, id) FROM stdin;
    public          jon    false    232   ��       �          0    16878    pagibig_matrix 
   TABLE DATA              COPY public.pagibig_matrix (id, monthly_salary_min, monthly_salary_max, employee_rate, employeer_rate, total_rate) FROM stdin;
    public          jon    false    236   ��       �          0    16849    pay_deduction 
   TABLE DATA           S   COPY public.pay_deduction (amount, payroll_id, note, manual, id, name) FROM stdin;
    public          jon    false    223   ��       �          0    16858    pay_perk 
   TABLE DATA           C   COPY public.pay_perk (payroll_id, amount, id, perk_id) FROM stdin;
    public          jon    false    226   p�       �          0    16882    payroll 
   TABLE DATA           �   COPY public.payroll (employee_id, start_date, end_date, gross_pay, net_pay, total_deductions, total_perks, id, basic_salary, days, take_home, total_hours, overtime, tax) FROM stdin;
    public          jon    false    238   ��       �          0    16887    perk 
   TABLE DATA           5   COPY public.perk (name, description, id) FROM stdin;
    public          jon    false    240   ��       �          0    16893    phealth_matrix 
   TABLE DATA           [   COPY public.phealth_matrix (id, salary_min, premium_rate, premium, salary_max) FROM stdin;
    public          jon    false    242   O�       �          0    16897    role 
   TABLE DATA           B   COPY public.role (role, description, employee_id, id) FROM stdin;
    public          jon    false    244   ��       �          0    16903    roles 
   TABLE DATA           C   COPY public.roles (id, role, description, employee_id) FROM stdin;
    public          jon    false    246   6�       �          0    16909 
   sss_matrix 
   TABLE DATA           H   COPY public.sss_matrix (id, min_val, max_val, contribution) FROM stdin;
    public          jon    false    248   S�       �          0    16913 
   tax_matrix 
   TABLE DATA           W   COPY public.tax_matrix (id, salary_min, salary_max, tax_rate, excess_rate) FROM stdin;
    public          jon    false    250   ��       �          0    16916    users 
   TABLE DATA           7   COPY public.users (id, username, password) FROM stdin;
    public          jon    false    251   ��                  0    0    attendance_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.attendance_id_seq', 46, true);
          public          jon    false    217                       0    0    deduction_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.deduction_id_seq', 4, true);
          public          jon    false    219                       0    0    employee_deduction_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.employee_deduction_id_seq', 162, true);
          public          jon    false    224                       0    0    employee_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.employee_id_seq', 41, true);
          public          jon    false    225                       0    0    employee_perk_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.employee_perk_id_seq', 138, true);
          public          jon    false    227                       0    0    employees_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.employees_id_seq', 1, false);
          public          jon    false    229                       0    0    my_ids_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.my_ids_id_seq', 272, true);
          public          jon    false    230                       0    0    my_perk_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.my_perk_id_seq', 102, true);
          public          jon    false    231                       0    0    overtime_employee_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.overtime_employee_id_seq', 1, false);
          public          jon    false    233                       0    0    overtime_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.overtime_id_seq', 1, false);
          public          jon    false    234                       0    0    overtime_supervisor_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.overtime_supervisor_id_seq', 1, false);
          public          jon    false    235                       0    0    pagibig_matrix_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.pagibig_matrix_id_seq', 2, true);
          public          jon    false    237                       0    0    payslip_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.payslip_id_seq', 62, true);
          public          jon    false    239                       0    0    perk_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.perk_id_seq', 1, false);
          public          jon    false    241                       0    0    philhealth_matrix_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.philhealth_matrix_id_seq', 3, true);
          public          jon    false    243                       0    0    role_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.role_id_seq', 104, true);
          public          jon    false    245                       0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
          public          jon    false    247                        0    0    sss_matrix_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.sss_matrix_id_seq', 45, true);
          public          jon    false    249            !           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          jon    false    252            "           0    0    witholding_matrix_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.witholding_matrix_id_seq', 6, true);
          public          jon    false    253            �           2606    16570 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            jon    false    215                       2606    16945    attendance attendance_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.attendance DROP CONSTRAINT attendance_pkey;
       public            jon    false    216                       2606    16947    deduction deduction_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.deduction
    ADD CONSTRAINT deduction_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.deduction DROP CONSTRAINT deduction_pkey;
       public            jon    false    218                       2606    16949 %   pay_deduction employee_deduction_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.pay_deduction
    ADD CONSTRAINT employee_deduction_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY public.pay_deduction DROP CONSTRAINT employee_deduction_pkey;
       public            jon    false    223                       2606    16951    pay_perk employee_perk_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.pay_perk
    ADD CONSTRAINT employee_perk_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.pay_perk DROP CONSTRAINT employee_perk_pkey;
       public            jon    false    226                       2606    16953    employee employee_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public            jon    false    222                       2606    16955     employee employees_id_number_key 
   CONSTRAINT     `   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employees_id_number_key UNIQUE (id_number);
 J   ALTER TABLE ONLY public.employee DROP CONSTRAINT employees_id_number_key;
       public            jon    false    222                       2606    16957 "   employees employees_id_number_key1 
   CONSTRAINT     b   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_id_number_key1 UNIQUE (id_number);
 L   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_id_number_key1;
       public            jon    false    228                       2606    16959    employees employees_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            jon    false    228                       2606    16961    deduction identification_unique 
   CONSTRAINT     Z   ALTER TABLE ONLY public.deduction
    ADD CONSTRAINT identification_unique UNIQUE (name);
 I   ALTER TABLE ONLY public.deduction DROP CONSTRAINT identification_unique;
       public            jon    false    218                       2606    16963    emp_ids my_ids_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.emp_ids
    ADD CONSTRAINT my_ids_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.emp_ids DROP CONSTRAINT my_ids_pkey;
       public            jon    false    220            	           2606    16965    emp_perk my_perk_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.emp_perk
    ADD CONSTRAINT my_perk_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.emp_perk DROP CONSTRAINT my_perk_pkey;
       public            jon    false    221                       2606    16967    overtime overtime_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.overtime
    ADD CONSTRAINT overtime_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.overtime DROP CONSTRAINT overtime_pkey;
       public            jon    false    232                       2606    16969 "   pagibig_matrix pagibig_matrix_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.pagibig_matrix
    ADD CONSTRAINT pagibig_matrix_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.pagibig_matrix DROP CONSTRAINT pagibig_matrix_pkey;
       public            jon    false    236                       2606    16971    payroll payroll_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.payroll
    ADD CONSTRAINT payroll_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.payroll DROP CONSTRAINT payroll_pkey;
       public            jon    false    238                       2606    16973    perk perk_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.perk
    ADD CONSTRAINT perk_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.perk DROP CONSTRAINT perk_pkey;
       public            jon    false    240                       2606    16975 %   phealth_matrix philhealth_matrix_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.phealth_matrix
    ADD CONSTRAINT philhealth_matrix_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY public.phealth_matrix DROP CONSTRAINT philhealth_matrix_pkey;
       public            jon    false    242            !           2606    16977    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            jon    false    244            #           2606    16979    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            jon    false    246            %           2606    16981    sss_matrix sss_matrix_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.sss_matrix
    ADD CONSTRAINT sss_matrix_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.sss_matrix DROP CONSTRAINT sss_matrix_pkey;
       public            jon    false    248            )           2606    16983    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            jon    false    251            +           2606    16985    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            jon    false    251            '           2606    16987 !   tax_matrix witholding_matrix_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.tax_matrix
    ADD CONSTRAINT witholding_matrix_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY public.tax_matrix DROP CONSTRAINT witholding_matrix_pkey;
       public            jon    false    250            ,           2606    16988 !   attendance attendance_employee_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_employee_id FOREIGN KEY (employee_id) REFERENCES public.employee(id) NOT VALID;
 K   ALTER TABLE ONLY public.attendance DROP CONSTRAINT attendance_employee_id;
       public          jon    false    216    222    3339            1           2606    16993 +   pay_deduction employee_deduction_payroll_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pay_deduction
    ADD CONSTRAINT employee_deduction_payroll_id FOREIGN KEY (payroll_id) REFERENCES public.payroll(id) NOT VALID;
 U   ALTER TABLE ONLY public.pay_deduction DROP CONSTRAINT employee_deduction_payroll_id;
       public          jon    false    238    3355    223            2           2606    16998    pay_perk employee_perk_slip_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pay_perk
    ADD CONSTRAINT employee_perk_slip_id FOREIGN KEY (payroll_id) REFERENCES public.payroll(id) NOT VALID;
 H   ALTER TABLE ONLY public.pay_perk DROP CONSTRAINT employee_perk_slip_id;
       public          jon    false    226    3355    238            -           2606    17003    emp_ids myids_deduction_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.emp_ids
    ADD CONSTRAINT myids_deduction_id_fk FOREIGN KEY (deduction_id) REFERENCES public.deduction(id) NOT VALID;
 G   ALTER TABLE ONLY public.emp_ids DROP CONSTRAINT myids_deduction_id_fk;
       public          jon    false    220    218    3331            .           2606    17008    emp_ids myids_employee_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.emp_ids
    ADD CONSTRAINT myids_employee_id_fk FOREIGN KEY (employee_id) REFERENCES public.employee(id) NOT VALID;
 F   ALTER TABLE ONLY public.emp_ids DROP CONSTRAINT myids_employee_id_fk;
       public          jon    false    222    220    3339            /           2606    17013    emp_perk myperk_employee_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.emp_perk
    ADD CONSTRAINT myperk_employee_id_fk FOREIGN KEY (employee_id) REFERENCES public.employee(id) NOT VALID;
 H   ALTER TABLE ONLY public.emp_perk DROP CONSTRAINT myperk_employee_id_fk;
       public          jon    false    3339    222    221            0           2606    17018    emp_perk myperk_perk_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.emp_perk
    ADD CONSTRAINT myperk_perk_id_fk FOREIGN KEY (perk_id) REFERENCES public.perk(id) NOT VALID;
 D   ALTER TABLE ONLY public.emp_perk DROP CONSTRAINT myperk_perk_id_fk;
       public          jon    false    221    3357    240            3           2606    17023    overtime overtime_employee_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.overtime
    ADD CONSTRAINT overtime_employee_id FOREIGN KEY (employee_id) REFERENCES public.employee(id) NOT VALID;
 G   ALTER TABLE ONLY public.overtime DROP CONSTRAINT overtime_employee_id;
       public          jon    false    222    3339    232            4           2606    17028    payroll payroll_employee_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.payroll
    ADD CONSTRAINT payroll_employee_id FOREIGN KEY (employee_id) REFERENCES public.employee(id) NOT VALID;
 E   ALTER TABLE ONLY public.payroll DROP CONSTRAINT payroll_employee_id;
       public          jon    false    222    3339    238            5           2606    17033    role role_employee_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_employee_id FOREIGN KEY (employee_id) REFERENCES public.employee(id) NOT VALID;
 ?   ALTER TABLE ONLY public.role DROP CONSTRAINT role_employee_id;
       public          jon    false    3339    222    244            6           2606    17038    roles roles_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(id);
 F   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_employee_id_fkey;
       public          jon    false    3349    228    246            R           826    16391     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     J   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES TO jon;
                   postgres    false            T           826    16393    DEFAULT PRIVILEGES FOR TYPES    DEFAULT ACL     F   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES TO jon;
                   postgres    false            S           826    16392     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     J   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS TO jon;
                   postgres    false            Q           826    16390    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     G   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES TO jon;
                   postgres    false            �      x�K�0M3��H425O����� +��      �   ;  x�m��m�@D�o��4`��}Hr���בM��K�_��Ƿk}d���ov=��7���~{�o��vG2
2@ܢ���4�Y��F��Ѭ7���iz4*�hF4�0�fFS����h��yq�X�
s���]�F�*��Q쁊|�|{��n��{���b�{���b�{�"1���G��\��c��[�������6��|*��}���e��t��#0����4yG`N��#�ķ�w�i���&��iyG`�O�;S�-��E�w��yG���yG`�O�;û��#0�u�;�^��#0̧������}�? �q]      �   7   x�+..�,bC���̜��Ĝ�N$�WIf's$�g&e�s�h�=...       �   J  x�M�[�m�
C�gs �K��w8k�T:Ғ�w&�a��g�;�䮝7��_�ڷyuƤ� 
�8'*��{}�՘OF�{�O�}��=�
����u*���U�m�����T1���1[�w���e����4��e�)��vͼ�b���ڵ��7�f�C��]�Zr�p�ؘq��Y�`����s��h��䱚S��ز���ܙ � ����{���F�ߦ��q����tǤǹ�~�.����X�o߽�?�-�)�d���tL��-B�_E�e��؞���<����/�-�O���Y~��x��S���FOlw��n�|�J�[��W�O��	��&���u'Eͫ4�ϋfљY�q�Rn��p��
zA��{��	\[��f_b½/Z���mF����:7��6�8@-��n3T�� �������<�n��3���0��
$W+	ڱ��Z5	��u�{�S�v�T�А��!�O�I���_"� �.^��c�|�G[>>=�G��6��3bE�	��SB^��[�&�Ϲ}�	����rL��*���I�IL�|������G8ùHě���L����*4���$��룤�mer�9����Lfzc)�r��=��}ŉ���H��	���ɤ��T�GT��q�O&u��b�"ܡ�"��oը�W� ��
Ai�+���{Ι~[ ��D��j�M&ԝ����q��'E�uM 9B��L�Ԭ�hj<�.���|���=��pF��D$�@E�Qd�/b	�f�=����_DQ�s��dF���- G�fKϋ�[�S!��Sys5-�?>b�վ��aod;\X-*���\��_D�屇��uӣ���D;��ku	"�T'�j������Fn/b�i�.�RuWSM�� �N#f��u�_��5&P�̞������@��d
Q����U�l7�#H;�%f���֤@^���q��%�3�X��j��C�e{kZ�ɀu��ȹ���6~Kjo�ϼ�o�{��2��[����sa6w��!�<7<˺���Y��� /Pr�<��"y]b4Y�w�C�P:����������WJ�RW�gqa�&/�|$�=�{�	}�j����' 4@�XsA9&�7�=J��&2E�$�BɕV��ZB���J{���A*b"�|F'[ԃ�}Yۦ'�d�td���g��%!�6l35
f y�c��yV��o�D9n�b�"�=ߔb���G���q�6lNQ!�{�1T��ר�	@yt�\5��t�G�������S�w7*/꒢hO36�V��-[oFLTP�o���>�3]$QQ@\@~`��M%j#�x�b3�w���J�<'4V^���J	�y!�u������?����      �   �  x�E�[��0���,��l�.{�s,Y�\��$R� �~����6;p�%Z�Op����p)\`	,a�f���S�?g5�c��򸃟�ۖsږs�ωvt?<�%��5��#2p��q�/z\�i�\�K	��eu�Zf�P�k2<m1<��������\{�����
r�e���m0�d�\.���j+s���c��Ð[�%�V����;CJ>�)9.��}1�Vn���1[��f(�K�݃!���)m����d(i�KB3�|;CI�\�F���PR�S:���`H�LrI8S�c(��%a�?���K.	����)�AN�b����$#���j�n���$�j�CJ��)ZU�1JZ�Ѕg��.6C=v�{P�q�z�`��[���>蓩�ߟ����µ�      �   �	  x��Y�R�J��<�Tmj��h$�.�oHL� �=[{3�{�e��H����g���d�8�%R�-OO�_cvj�֖����0v���kS����	K�|�u��US��~�k.��w������}׬�{9z/���ww�~�wi3�QTj����5ay��s*s���s~|w$�O���>V0Q�$q$+�,�Y�<fvږ&��������������֍m`1+b�{'b�U�+���-p�KS��~`�������W��>���T�x`�	�2��߹��E$	���,� �<R@����l"v�� 3�S����Ɔ_�[�3��u���/��%W�G��3�OWn�|pgA-�������z�$D�<^{��YD1��5s�+y����ۿD��ImF�,޴�5;b*���;��N�&�E|́!����k��$��PO�5U��T�?[�)�`�S�Q]a�>Z|N5�ؙ/��W���tvoV;���~���������l<v[5���C�ᡈd�bT��D����c������rU7vQwHR��$��&� ��ځT�9��wuJd����kbZ��
�9��Ҍq�>45?w��T�~ ���Dg���6�@�	eRD�������n8zD���`&��O���UQ_�
�e�Ǟ�K7�i�b~e�]D��.>�jˢV���ȣ����⯬Y�5� %�< �%*�]�EkJ��#&�`7I��%|�v�����7H����q.�P�+�)�b�����Mhd���2ʋbͅ��]���vx�L;��e�z�b�8[=P�� �2��`JmH D�}�k=��4�k�m��K|�P���b2#��H����8�en<Ow&�O�Mjů>�S�y>���@ƾmp�������M=kYk$����)����;��K�:?��J�
Z���W+H��	)��4��f�W�Ү6��c��'�\B����gDP.(��q���$��]��*��|��XK��i]`C��Ԣ��%���^�?������|"�x˙a��ăϞj]$����7FI�>��G0� ъ@$�l��vd�)I0J�J��A{��J2��ud yk�/�ySM͛��P�W����I��DEI����ZQ]�����Mp\�u�$�U���p.3���3�����E&��|��QKqNtN�,U�Aʎ������!#���Sɇ��߻恟�EO�ŕ�M��E��@]�F�u���'��R�z�s�?�G�v��&��A��
������[��a-�$/(7n:�K��!�˶l{����ݗ�+��D���IO9����g��C���b�aQ��S �&�����#\�
��#]V���)Q9��H$�<S	�I�(�N��쥫Q����=0V~h�Y�-?���һү�<�P��ſb�z���8���n(���Lȗ�~����T���1^�;�`W
�g�C�wUS��.��BǛ6�{��:h��i)�kQD�V�����9�39�NY�O۰���>Z���POH9�9�@d�%٣k�Պ��^�.�J��Vd%J�
�DR�Ac&@.���:��|�[(�M�#����i��-P���~��?o�
v)�&D$�li>M5;~�����I�ٗ��@�(��$�l���r
�;~���UM�=�����,��N���Y����0X&E��9I~ٺ�`���Ѹ��5�wn&H��M�yBԩAo1c�\I�`�ڄ�@�ljd�V ����QmĥX��.�h(���ҰH�F�n2�O����V���Z�1E�x�g�3jB_](Є֧�D�F��"K�'L�%� Bl��Ȧ�ٍij76��ē�{�z�_驆�V��ܶ��-Jv9Au�Z�2y��]f{e1�6��R1;�-bF�bO���!���1��)on
D��rkh{�z��Qn�Z�]��W �;������r��\��6�qC̏��6 ��tcϚ5)�g�è��D����M֑Ԍ��L�J�W#�l�l3�ݱ��:g˲�<�pX�kg)�[W#�ًÛ�"�B���,ALJr�#b�+���Exa�'�rvp٘ŢK�d�m��
:�Ĥ�\k� .b�
�*�1W��#0�.l��&l��RX�N��������Hd�Z*��9x�iͿЙ?�?z�b�\��3��ϒ��r�k1	�r�4@��<�K�~��Om5n:�@���q������7��I���9"g)��<��jf��`V��Ɩ(2�"P�]ԝ���[A#�%�ܾ�}���~�NJ����u�4)��8��>�A���]�tS��yz�-Ŷ�K�6�;U'������c(A�
R��A/��D:��N<�S�0�ON����i�{�jS�t���M���޿�)?V��+��)�>�(C"K���!�XP���΍m��̋�y������ݻw�o�M      �      x������ � �      �      x������ � �      �   -   x�3�4400�44z� �DsAD�� .&L�b���� 3Y	�      �   �  x�e�Kj�@��a��ӣ�K��8��/��	����to_��Ť"�Rd9}.?�>���v�~���5m$}[����vY����|>�S;� ev`�/Gz��	H�%�wҏ�Ș�<6s�8�$ y�`.���ت�(�I�sӿ���� ��0�������(J�F�l<c	EU=)e1@��blA�hw"݈cHWQڜHA2��1�KT�H�I��C�D͉0�ڱ����� d�rC�Dى=H6l!g"�=�I��&�N��d-h�����)��3$ZB�D.k�� ��&rYt�BK�ZQuU�MZC�D.j� ��&rQ0jA�5DM�V &jA��&rQ�7��P	U��	�N7*!j"5���!��&rQ��>}���<R��      �   h  x�5����0��8��)�i1��;5n���=@[��}����Ϻ�Y���糯]�Y9k�z��ɞ7� {ެ��l�gIv���8+�v����C������f��f��'�/�����&gI�D���r��-g�l;k��f�&�ov�,��,�t���Y�Y᠐V8(�
i��BZ᠐Vh�
�BZ�QH+4
i�F!��(���B��Vh�
���֯��!n S"��
ŔXhM	�֔hhM	���x��� ��"�(��D9%(Ҕ�HS�"M��jJ`TS"#�ĂF����l=S��3%<:S�3%@�)RO	�zJ�j�6F5F���Q��ƨ�hcTc�1�1�#`�Ĩ�hc��ﺮ��m��      �     x���Qn�0D�������.��9JҤ�*��f�|D��&P��>��ߏ����5AAwX3/�ӽ�YD�#�qŽ`�!�87АT�o{��`���6p��B+�Kd*�vY廦G��fڗL��+�e����ʻ2����ɉ��/|�x�����⑋�\�X��7�F�8��9�����[�Ŏ��]ϱJ�N�x��4zNk���]�i�y��~Ҫ!gհ�jw�JI�x1��<ϭ���Xp�R�\���G�K��~�Z�'P���      �   A   x�+�LNU(.M*�L��,B�rd��*$���'�%�r�󍸒s�K22�ґ�s��qqq 3i%[      �   :   x�-��  �0LCm4v���{��!S $�
���6���2XO��w��W#y�#n      �   �   x�M�;
A Ѹ�0�󟽋�������A
���M�����9�(R�*�hR�.�Ҍ)�X���7�Y���Bv%����dO��;�ٙl��J%����dO��;��6�3مl����F�r}ܟ�<����R� �2��      �      x������ � �      �   :  x�5�ۑC1C��b2��l�u��O��h�k���>��>�9�ǹ�ss̆��؈��n�ِ�vϱzL*�<vâb�8=.*ny܆�?Gh޵��L��CͲ��Ps�����-���g�O6�(�g�0�6����� <0hw�p�:l��ԭ�s��������O!���/`�+�B����/���|��;t�A�+D�^�? �߇�Bt��1] �f��)8�V! 8�~)tVp��-�[�I�-tVp㭎�Y�]��Bg��+��e{w`�����+0>��b���A��K �B��~��2��c��Q�#      �   N   x�E��� ��0Qp�0��� �?'ݹ�A~��pb���ҔT}N-ɾ_m�n�<j,�YlEq-�M�=��0^�      �      x������ � �     