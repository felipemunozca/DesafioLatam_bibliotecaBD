PGDMP       5                    z         
   biblioteca    13.6    13.6 '    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    33126 
   biblioteca    DATABASE     f   CREATE DATABASE biblioteca WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE biblioteca;
                postgres    false            �            1259    33291    autor    TABLE     �   CREATE TABLE public.autor (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    fecha_nacimiento date NOT NULL,
    fecha_muerte date,
    tipo_autor character varying(20) NOT NULL
);
    DROP TABLE public.autor;
       public         heap    postgres    false            �            1259    33289    autor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.autor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.autor_id_seq;
       public          postgres    false    203            �           0    0    autor_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.autor_id_seq OWNED BY public.autor.id;
          public          postgres    false    202            �            1259    33305    autor_libro    TABLE     b   CREATE TABLE public.autor_libro (
    id_autor integer NOT NULL,
    id_libro integer NOT NULL
);
    DROP TABLE public.autor_libro;
       public         heap    postgres    false            �            1259    33299    libro    TABLE     �   CREATE TABLE public.libro (
    id integer NOT NULL,
    isbn character varying(15) NOT NULL,
    titulo character varying(50) NOT NULL,
    numero_paginas integer NOT NULL,
    disponibilidad boolean
);
    DROP TABLE public.libro;
       public         heap    postgres    false            �            1259    33297    libro_id_seq    SEQUENCE     �   CREATE SEQUENCE public.libro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.libro_id_seq;
       public          postgres    false    205            �           0    0    libro_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.libro_id_seq OWNED BY public.libro.id;
          public          postgres    false    204            �            1259    33322    prestamo    TABLE     �   CREATE TABLE public.prestamo (
    id integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_devolucion date,
    fecha_devolucion_real date,
    devuelto boolean,
    id_socio integer,
    id_libro integer
);
    DROP TABLE public.prestamo;
       public         heap    postgres    false            �            1259    33320    prestamo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.prestamo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.prestamo_id_seq;
       public          postgres    false    208            �           0    0    prestamo_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.prestamo_id_seq OWNED BY public.prestamo.id;
          public          postgres    false    207            �            1259    33283    socio    TABLE       CREATE TABLE public.socio (
    id integer NOT NULL,
    rut character varying(12) NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    direccion character varying(50) NOT NULL,
    telefono character varying(10) NOT NULL
);
    DROP TABLE public.socio;
       public         heap    postgres    false            �            1259    33281    socio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.socio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.socio_id_seq;
       public          postgres    false    201            �           0    0    socio_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.socio_id_seq OWNED BY public.socio.id;
          public          postgres    false    200            9           2604    33294    autor id    DEFAULT     d   ALTER TABLE ONLY public.autor ALTER COLUMN id SET DEFAULT nextval('public.autor_id_seq'::regclass);
 7   ALTER TABLE public.autor ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            :           2604    33302    libro id    DEFAULT     d   ALTER TABLE ONLY public.libro ALTER COLUMN id SET DEFAULT nextval('public.libro_id_seq'::regclass);
 7   ALTER TABLE public.libro ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            ;           2604    33325    prestamo id    DEFAULT     j   ALTER TABLE ONLY public.prestamo ALTER COLUMN id SET DEFAULT nextval('public.prestamo_id_seq'::regclass);
 :   ALTER TABLE public.prestamo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    208    208            8           2604    33286    socio id    DEFAULT     d   ALTER TABLE ONLY public.socio ALTER COLUMN id SET DEFAULT nextval('public.socio_id_seq'::regclass);
 7   ALTER TABLE public.socio ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            �          0    33291    autor 
   TABLE DATA           a   COPY public.autor (id, nombre, apellido, fecha_nacimiento, fecha_muerte, tipo_autor) FROM stdin;
    public          postgres    false    203   +       �          0    33305    autor_libro 
   TABLE DATA           9   COPY public.autor_libro (id_autor, id_libro) FROM stdin;
    public          postgres    false    206    ,       �          0    33299    libro 
   TABLE DATA           Q   COPY public.libro (id, isbn, titulo, numero_paginas, disponibilidad) FROM stdin;
    public          postgres    false    205   b,       �          0    33322    prestamo 
   TABLE DATA           {   COPY public.prestamo (id, fecha_inicio, fecha_devolucion, fecha_devolucion_real, devuelto, id_socio, id_libro) FROM stdin;
    public          postgres    false    208   :-       �          0    33283    socio 
   TABLE DATA           O   COPY public.socio (id, rut, nombre, apellido, direccion, telefono) FROM stdin;
    public          postgres    false    201   �.       �           0    0    autor_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.autor_id_seq', 5, true);
          public          postgres    false    202            �           0    0    libro_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.libro_id_seq', 4, true);
          public          postgres    false    204            �           0    0    prestamo_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.prestamo_id_seq', 7, true);
          public          postgres    false    207            �           0    0    socio_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.socio_id_seq', 5, true);
          public          postgres    false    200            C           2606    33309    autor_libro autor_libro_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.autor_libro
    ADD CONSTRAINT autor_libro_pkey PRIMARY KEY (id_autor, id_libro);
 F   ALTER TABLE ONLY public.autor_libro DROP CONSTRAINT autor_libro_pkey;
       public            postgres    false    206    206            ?           2606    33296    autor autor_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.autor DROP CONSTRAINT autor_pkey;
       public            postgres    false    203            A           2606    33304    libro libro_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.libro DROP CONSTRAINT libro_pkey;
       public            postgres    false    205            E           2606    33327    prestamo prestamo_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT prestamo_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.prestamo DROP CONSTRAINT prestamo_pkey;
       public            postgres    false    208            =           2606    33288    socio socio_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.socio
    ADD CONSTRAINT socio_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.socio DROP CONSTRAINT socio_pkey;
       public            postgres    false    201            F           2606    33310 %   autor_libro autor_libro_id_autor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.autor_libro
    ADD CONSTRAINT autor_libro_id_autor_fkey FOREIGN KEY (id_autor) REFERENCES public.autor(id);
 O   ALTER TABLE ONLY public.autor_libro DROP CONSTRAINT autor_libro_id_autor_fkey;
       public          postgres    false    2879    203    206            G           2606    33315 %   autor_libro autor_libro_id_libro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.autor_libro
    ADD CONSTRAINT autor_libro_id_libro_fkey FOREIGN KEY (id_libro) REFERENCES public.libro(id);
 O   ALTER TABLE ONLY public.autor_libro DROP CONSTRAINT autor_libro_id_libro_fkey;
       public          postgres    false    206    205    2881            I           2606    33333    prestamo prestamo_id_libro_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT prestamo_id_libro_fkey FOREIGN KEY (id_libro) REFERENCES public.libro(id);
 I   ALTER TABLE ONLY public.prestamo DROP CONSTRAINT prestamo_id_libro_fkey;
       public          postgres    false    205    2881    208            H           2606    33328    prestamo prestamo_id_socio_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT prestamo_id_socio_fkey FOREIGN KEY (id_socio) REFERENCES public.socio(id);
 I   ALTER TABLE ONLY public.prestamo DROP CONSTRAINT prestamo_id_socio_fkey;
       public          postgres    false    208    2877    201            �   (   1	ANDRÉS	ULLOA	1982-01-01	\N	PRINCIPAL
 2   2	SERGIO	MARDONES	1950-01-01	2012-01-01	PRINCIPAL
 /   3	JOSE	SALGADO	1968-01-01	2020-01-01	PRINCIPAL
 $   4	ANA	SALGADO	1972-01-01	\N	COAUTOR
 '   5	MARTIN	PORTA	1976-01-01	\N	PRINCIPAL
    \.


      �      1	2
    2	3
    3	1
    4	1
    5	4
    \.


      �   *   1	111-1111111-111	CUENTOS DE TERROR	344	t
 0   2	222-2222222-222	POESÍAS CONTEMPORANEAS	167	t
 )   3	333-3333333-333	HISTORIA DE ASIA	511	t
 ,   4	444-4444444-444	MANUAL DE MECÁNICA	298	t
    \.


      �   )   1	2020-01-20	2020-01-27	2020-01-27	t	1	1
 )   2	2020-01-20	2020-01-27	2020-01-30	t	5	2
 )   3	2020-01-22	2020-01-29	2020-01-30	t	3	3
 )   4	2020-01-23	2020-01-30	2020-01-30	t	4	4
 )   5	2020-01-27	2020-02-03	2020-02-04	t	2	1
 )   6	2020-01-31	2020-02-07	2020-02-12	t	1	4
 )   7	2020-01-31	2020-02-07	2020-02-12	t	3	2
    \.


      �   4   1	1111111-1	JUAN	SOTO	AVENIDA 1, SANTIAGO	911111111
 4   2	2222222-2	ANA	PÉREZ	PASAJE 2, SANTIAGO	922222222
 9   3	3333333-3	SANDRA	AGUILAR	AVENIDA 2, SANTIAGO	933333333
 8   4	4444444-4	ESTEBAN	JEREZ	AVENIDA 3, SANTIAGO	944444444
 8   5	5555555-5	SILVANA	MUÑOZ	PASAJE 3, SANTIAGO	955555555
    \.


     