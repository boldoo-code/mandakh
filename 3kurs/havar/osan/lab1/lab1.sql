PGDMP      0                }         	   lab1_usan    17.2    17.2                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                        1262    24699 	   lab1_usan    DATABASE     �   CREATE DATABASE lab1_usan WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE lab1_usan;
                     postgres    false            �            1259    24700    book    TABLE       CREATE TABLE public.book (
    bookcode character varying NOT NULL,
    bookname character varying,
    author character varying,
    tcode character varying NOT NULL,
    dtcode character varying NOT NULL,
    bindex character varying,
    page integer,
    ognoo date
);
    DROP TABLE public.book;
       public         heap r       postgres    false            �            1259    24705    bookgive    TABLE     �   CREATE TABLE public.bookgive (
    bgid bigint NOT NULL,
    bookcode character varying NOT NULL,
    bookname character varying,
    enterognoo date,
    retognoo date,
    libcode character varying NOT NULL,
    stcode character varying NOT NULL
);
    DROP TABLE public.bookgive;
       public         heap r       postgres    false            �            1259    24710    bookgive_bgid_seq    SEQUENCE     �   ALTER TABLE public.bookgive ALTER COLUMN bgid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.bookgive_bgid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    218            �            1259    24711    dedtorol    TABLE     f   CREATE TABLE public.dedtorol (
    dtcode character varying NOT NULL,
    dtname character varying
);
    DROP TABLE public.dedtorol;
       public         heap r       postgres    false            �            1259    24716 	   librarian    TABLE     �   CREATE TABLE public.librarian (
    libcode character varying NOT NULL,
    liblast character varying,
    libname character varying,
    phone integer,
    address character varying
);
    DROP TABLE public.librarian;
       public         heap r       postgres    false            �            1259    24721    mergejil    TABLE     d   CREATE TABLE public.mergejil (
    mcode character varying NOT NULL,
    mname character varying
);
    DROP TABLE public.mergejil;
       public         heap r       postgres    false            �            1259    24726    student    TABLE     �   CREATE TABLE public.student (
    stcode character varying NOT NULL,
    stlast character varying,
    stname character varying,
    regdug character varying,
    mcode character varying,
    phone integer,
    ognoo date
);
    DROP TABLE public.student;
       public         heap r       postgres    false            �            1259    24731    torol    TABLE     a   CREATE TABLE public.torol (
    tcode character varying NOT NULL,
    tname character varying
);
    DROP TABLE public.torol;
       public         heap r       postgres    false                      0    24700    book 
   TABLE DATA           ^   COPY public.book (bookcode, bookname, author, tcode, dtcode, bindex, page, ognoo) FROM stdin;
    public               postgres    false    217   �$                 0    24705    bookgive 
   TABLE DATA           c   COPY public.bookgive (bgid, bookcode, bookname, enterognoo, retognoo, libcode, stcode) FROM stdin;
    public               postgres    false    218   �%                 0    24711    dedtorol 
   TABLE DATA           2   COPY public.dedtorol (dtcode, dtname) FROM stdin;
    public               postgres    false    220   /&                 0    24716 	   librarian 
   TABLE DATA           N   COPY public.librarian (libcode, liblast, libname, phone, address) FROM stdin;
    public               postgres    false    221   }&                 0    24721    mergejil 
   TABLE DATA           0   COPY public.mergejil (mcode, mname) FROM stdin;
    public               postgres    false    222   �&                 0    24726    student 
   TABLE DATA           V   COPY public.student (stcode, stlast, stname, regdug, mcode, phone, ognoo) FROM stdin;
    public               postgres    false    223   4'                 0    24731    torol 
   TABLE DATA           -   COPY public.torol (tcode, tname) FROM stdin;
    public               postgres    false    224   �'       !           0    0    bookgive_bgid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.bookgive_bgid_seq', 3, true);
          public               postgres    false    219            p           2606    24737    book book_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (bookcode);
 8   ALTER TABLE ONLY public.book DROP CONSTRAINT book_pkey;
       public                 postgres    false    217            r           2606    24739    bookgive bookgive_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.bookgive
    ADD CONSTRAINT bookgive_pkey PRIMARY KEY (bgid);
 @   ALTER TABLE ONLY public.bookgive DROP CONSTRAINT bookgive_pkey;
       public                 postgres    false    218            t           2606    24741    dedtorol dedtorol_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.dedtorol
    ADD CONSTRAINT dedtorol_pkey PRIMARY KEY (dtcode);
 @   ALTER TABLE ONLY public.dedtorol DROP CONSTRAINT dedtorol_pkey;
       public                 postgres    false    220            v           2606    24743    librarian librarian_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.librarian
    ADD CONSTRAINT librarian_pkey PRIMARY KEY (libcode);
 B   ALTER TABLE ONLY public.librarian DROP CONSTRAINT librarian_pkey;
       public                 postgres    false    221            x           2606    24745    mergejil mergejil_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.mergejil
    ADD CONSTRAINT mergejil_pkey PRIMARY KEY (mcode);
 @   ALTER TABLE ONLY public.mergejil DROP CONSTRAINT mergejil_pkey;
       public                 postgres    false    222            z           2606    24747    student student_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (stcode);
 >   ALTER TABLE ONLY public.student DROP CONSTRAINT student_pkey;
       public                 postgres    false    223            |           2606    24749    torol torol_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.torol
    ADD CONSTRAINT torol_pkey PRIMARY KEY (tcode);
 :   ALTER TABLE ONLY public.torol DROP CONSTRAINT torol_pkey;
       public                 postgres    false    224            }           2606    24750    book book_dtcode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_dtcode_fkey FOREIGN KEY (dtcode) REFERENCES public.dedtorol(dtcode) NOT VALID;
 ?   ALTER TABLE ONLY public.book DROP CONSTRAINT book_dtcode_fkey;
       public               postgres    false    217    4724    220            ~           2606    24755    book book_tcode_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_tcode_fkey FOREIGN KEY (tcode) REFERENCES public.torol(tcode) NOT VALID;
 >   ALTER TABLE ONLY public.book DROP CONSTRAINT book_tcode_fkey;
       public               postgres    false    224    217    4732                       2606    24760    bookgive bookgive_libcode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookgive
    ADD CONSTRAINT bookgive_libcode_fkey FOREIGN KEY (libcode) REFERENCES public.librarian(libcode) NOT VALID;
 H   ALTER TABLE ONLY public.bookgive DROP CONSTRAINT bookgive_libcode_fkey;
       public               postgres    false    218    4726    221            �           2606    24765    bookgive bookgive_stcode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookgive
    ADD CONSTRAINT bookgive_stcode_fkey FOREIGN KEY (stcode) REFERENCES public.student(stcode) NOT VALID;
 G   ALTER TABLE ONLY public.bookgive DROP CONSTRAINT bookgive_stcode_fkey;
       public               postgres    false    218    223    4730            �           2606    24770    student student_mcode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_mcode_fkey FOREIGN KEY (mcode) REFERENCES public.mergejil(mcode) NOT VALID;
 D   ALTER TABLE ONLY public.student DROP CONSTRAINT student_mcode_fkey;
       public               postgres    false    4728    222    223               �   x�M�1
�P�z�)r��M��
�im�kk
���S�=��AF�0��,�3�I�Œ9&���K��hd�B��1jrkr��.@ZZJ8�<ck��er�v�VJ)��C�RJ�!�E
����O��%ㄽi��x5s̖p��=�^u[���n��W���&Zuo�p4s�6Q,�=��42�� Aj^         �   x�3�.O�700�0�¾;.�^��p�������^N#CS]CC]c(�H��ш38�������ːӵ81��T�0���.�������F%���89������1��u�"�`�0�c���� G�A�         >   x�K��0�¾{.�^��p�������^��d�s/l��Q���{/l
6r��qqq `A         [   x�s4�0��M��\콰��拽.칰��NKSSs����p9�X����p^^��_�qa'��������)Hr2PY� g�,         <   x�s��0���u/L������/�P��z���n��r��/,�rL���sa!W� �^         �   x�U�1
�P��9�K%��i�(x�.nµVp+R\tQD�Tt���^�ׂ��!?�IOL��V���8�B�+J�q֌��ܵ�p�lQ2$��ݶ�"
�,Aҩ a�R����y����	3���L��x$��s��D�Pg@��hCv_�*+ꦇ����o������a_�1��0��~#�7\�a�         c   x�-�;@P�wWabE:���':� �ZB�����-�4'��$s�<ܼ�j����@km�l^��1���8��$M#�_��4k	���G"��?1     