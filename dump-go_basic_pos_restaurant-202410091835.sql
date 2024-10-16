PGDMP  /    #        	    	    |            go_basic_pos_restaurant    16.4 (Debian 16.4-1.pgdg120+1)    16.3     7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            :           1262    16460    go_basic_pos_restaurant    DATABASE     �   CREATE DATABASE go_basic_pos_restaurant WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
 '   DROP DATABASE go_basic_pos_restaurant;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            ;           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16461 	   employees    TABLE     %  CREATE TABLE public.employees (
    id integer NOT NULL,
    nip character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);
    DROP TABLE public.employees;
       public         heap    postgres    false    4            �            1259    16466    employees_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public          postgres    false    4    215            <           0    0    employees_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;
          public          postgres    false    216            �            1259    16467    menus    TABLE     v  CREATE TABLE public.menus (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    category character varying(100) NOT NULL,
    description character varying(255),
    price integer NOT NULL,
    image_url character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);
    DROP TABLE public.menus;
       public         heap    postgres    false    4            �            1259    16474    menus_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.menus_id_seq;
       public          postgres    false    217    4            =           0    0    menus_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;
          public          postgres    false    218            �            1259    16475    transactions    TABLE     	  CREATE TABLE public.transactions (
    id integer NOT NULL,
    employee_id integer,
    menu_id integer,
    quantity integer,
    total integer,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);
     DROP TABLE public.transactions;
       public         heap    postgres    false    4            �            1259    16480    transactions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.transactions_id_seq;
       public          postgres    false    4    219            >           0    0    transactions_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;
          public          postgres    false    220            �           2604    16481    employees id    DEFAULT     l   ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            �           2604    16482    menus id    DEFAULT     d   ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);
 7   ALTER TABLE public.menus ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            �           2604    16483    transactions id    DEFAULT     r   ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);
 >   ALTER TABLE public.transactions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            /          0    16461 	   employees 
   TABLE DATA                 public          postgres    false    215   �        1          0    16467    menus 
   TABLE DATA                 public          postgres    false    217   �!       3          0    16475    transactions 
   TABLE DATA                 public          postgres    false    219   q#       ?           0    0    employees_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.employees_id_seq', 14, true);
          public          postgres    false    216            @           0    0    menus_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.menus_id_seq', 5, true);
          public          postgres    false    218            A           0    0    transactions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.transactions_id_seq', 2, true);
          public          postgres    false    220            �           2606    16485    employees employees_nip_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_nip_key UNIQUE (nip);
 E   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_nip_key;
       public            postgres    false    215            �           2606    16487    employees employees_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    215            �           2606    16489    menus menus_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.menus DROP CONSTRAINT menus_pkey;
       public            postgres    false    217            �           2606    16491    transactions transactions_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_pkey;
       public            postgres    false    219            �           2606    16492 *   transactions transactions_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(id);
 T   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_employee_id_fkey;
       public          postgres    false    3225    215    219            �           2606    16497 &   transactions transactions_menu_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES public.menus(id);
 P   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_menu_id_fkey;
       public          postgres    false    219    217    3227            /   �   x���1k�0�w��ۜ�c��ըʔ����:^�0&�d��_	:tlox��W7�j;�����c>s3ͣیy���z�4�x)���7�:�b<��2؅�ˠ#��i!12,L�3 *&�\�(����J0Ŋ\�(Q��SR�E�0��E�����D6�w�ot'�п���<P����K�P�      1   �  x���͊�0F�y
��B�/;v�J(i;h�n�b��Ʋ$,	�߾Jfӄ�tS�F���{t�v��|?����|:ݠA��χo?6{��} ˝|v���e�>�^Zi���
Z�\�!$�.F���75�6:��x�q6*q���6`FǄb����m�=�Z�{Ԫ��nz��.�Ii]�b]T�,�w�����=k�#������b�m^��"`�B:+�k�i�� C�ڋ�N�$�Q㌧NF�|N��(m;7����%8�^A��_GiI�5��m���9A����w��9b�Au�QZn�o��6oZ��~�G9_�}���5&s�)�|��$aT
ZVLT�(�������U�_�����f�3s~���ѝk�]+���'�̌���yc��a�W+V�wh�z��7��      3   l   x���v
Q���W((M��L�+)J�+NL.���+Vs�	uV�0�Q� # 2100�QP7202�5��5�T02�2��24�371701V�/�i��I��F!�[Pn/ �D8B     