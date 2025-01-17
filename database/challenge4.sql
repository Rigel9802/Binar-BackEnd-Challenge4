PGDMP                          {         
   challenge4    15.2    15.2     "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    24839 
   challenge4    DATABASE     �   CREATE DATABASE challenge4 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE challenge4;
                postgres    false            �            1259    25008    booking    TABLE     �   CREATE TABLE public.booking (
    bookingid bigint NOT NULL,
    userid bigint NOT NULL,
    seat character varying(5) NOT NULL,
    payment character varying(20) NOT NULL,
    lastupdate date NOT NULL,
    filmcode bigint NOT NULL
);
    DROP TABLE public.booking;
       public         heap    postgres    false            �            1259    24991    films    TABLE     w   CREATE TABLE public.films (
    filmcode bigint NOT NULL,
    filmname character varying(50),
    isshowing boolean
);
    DROP TABLE public.films;
       public         heap    postgres    false            �            1259    25001    payment    TABLE     �   CREATE TABLE public.payment (
    paymentid bigint NOT NULL,
    "timestamp" date NOT NULL,
    discountcouponid bigint NOT NULL,
    bookingid bigint NOT NULL,
    amount bigint NOT NULL,
    paymentmethod character varying(50) NOT NULL
);
    DROP TABLE public.payment;
       public         heap    postgres    false            �            1259    24850 	   schedules    TABLE     �   CREATE TABLE public.schedules (
    scheduleid bigint NOT NULL,
    date date NOT NULL,
    starttime time with time zone NOT NULL,
    endtime time with time zone NOT NULL,
    price bigint NOT NULL,
    filmcode bigint NOT NULL
);
    DROP TABLE public.schedules;
       public         heap    postgres    false            �            1259    24974    seats    TABLE     z   CREATE TABLE public.seats (
    studioname character varying(1) NOT NULL,
    seatnumber character varying(5) NOT NULL
);
    DROP TABLE public.seats;
       public         heap    postgres    false            �            1259    24985    users    TABLE     �   CREATE TABLE public.users (
    userid integer NOT NULL,
    username character varying(50),
    email character varying(50),
    password character varying(50)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24984    users_userid_seq    SEQUENCE     �   CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.users_userid_seq;
       public          postgres    false    217            &           0    0    users_userid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;
          public          postgres    false    216            y           2604    24988    users userid    DEFAULT     l   ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);
 ;   ALTER TABLE public.users ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    217    216    217                      0    25008    booking 
   TABLE DATA           Y   COPY public.booking (bookingid, userid, seat, payment, lastupdate, filmcode) FROM stdin;
    public          postgres    false    220   �"                 0    24991    films 
   TABLE DATA           >   COPY public.films (filmcode, filmname, isshowing) FROM stdin;
    public          postgres    false    218   #                 0    25001    payment 
   TABLE DATA           m   COPY public.payment (paymentid, "timestamp", discountcouponid, bookingid, amount, paymentmethod) FROM stdin;
    public          postgres    false    219   �#                 0    24850 	   schedules 
   TABLE DATA           Z   COPY public.schedules (scheduleid, date, starttime, endtime, price, filmcode) FROM stdin;
    public          postgres    false    214   %$                 0    24974    seats 
   TABLE DATA           7   COPY public.seats (studioname, seatnumber) FROM stdin;
    public          postgres    false    215   �$                 0    24985    users 
   TABLE DATA           B   COPY public.users (userid, username, email, password) FROM stdin;
    public          postgres    false    217   %       '           0    0    users_userid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.users_userid_seq', 1, true);
          public          postgres    false    216            �           2606    25012    booking booking_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (bookingid);
 >   ALTER TABLE ONLY public.booking DROP CONSTRAINT booking_pkey;
       public            postgres    false    220            �           2606    24995    films films_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (filmcode);
 :   ALTER TABLE ONLY public.films DROP CONSTRAINT films_pkey;
       public            postgres    false    218            �           2606    25007    payment payment_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (paymentid);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public            postgres    false    219            {           2606    24856    schedules schedules_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (scheduleid);
 B   ALTER TABLE ONLY public.schedules DROP CONSTRAINT schedules_pkey;
       public            postgres    false    214            }           2606    25029    seats seats_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (seatnumber);
 :   ALTER TABLE ONLY public.seats DROP CONSTRAINT seats_pkey;
       public            postgres    false    215                       2606    24990    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            �           2606    25018    booking fk_booking_id    FK CONSTRAINT     w   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT fk_booking_id FOREIGN KEY (userid) REFERENCES public.users(userid);
 ?   ALTER TABLE ONLY public.booking DROP CONSTRAINT fk_booking_id;
       public          postgres    false    3199    217    220            �           2606    25035    booking fk_films_id    FK CONSTRAINT     y   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT fk_films_id FOREIGN KEY (filmcode) REFERENCES public.films(filmcode);
 =   ALTER TABLE ONLY public.booking DROP CONSTRAINT fk_films_id;
       public          postgres    false    218    220    3201            �           2606    25013    payment fk_payment_id    FK CONSTRAINT        ALTER TABLE ONLY public.payment
    ADD CONSTRAINT fk_payment_id FOREIGN KEY (bookingid) REFERENCES public.booking(bookingid);
 ?   ALTER TABLE ONLY public.payment DROP CONSTRAINT fk_payment_id;
       public          postgres    false    219    3205    220            �           2606    24996    schedules fk_schedules_id    FK CONSTRAINT        ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT fk_schedules_id FOREIGN KEY (filmcode) REFERENCES public.films(filmcode);
 C   ALTER TABLE ONLY public.schedules DROP CONSTRAINT fk_schedules_id;
       public          postgres    false    218    3201    214            �           2606    25030    booking fk_seats_id    FK CONSTRAINT     w   ALTER TABLE ONLY public.booking
    ADD CONSTRAINT fk_seats_id FOREIGN KEY (seat) REFERENCES public.seats(seatnumber);
 =   ALTER TABLE ONLY public.booking DROP CONSTRAINT fk_seats_id;
       public          postgres    false    215    220    3197               A   x�3�4�4t�,H�L�4202�50�54�4400�2�B'μ�,�&\Ɯ������s��qqq q�(         �   x�5��
�0�ϛ��P��� mT��e!�č�Q��M-g�������9���zz0de����,�IGR�>�>���x�x�n肄(e�|c<��1:l�k��0�m!pď�Uy�L�WiٳX<8�� Y]�J�/��-�         Z   x�3�4202�50�54�4�4�44 CN�Ԕ��Ģ.#T5F�� 5�.�I0��*��ML9�9�A�8��B���R��b���� sY�         �   x���9� �_e��+!9���C���"Da�������oM�b���G��8x�&�NZ|?2�W��}��׌=��ҏ�탢x�A�V���gN��P�ǚ�(���졷7ş����=ӏ��c$\.�|����$rU         2   x��A  �w+����v���R�qF�F95Kɩ)L%����)�w�|U
!         a   x�m�;� Eњ���.Ć(�1�|�q�iNs�Q����n�-m\U��Q�z�<,UV|,UV|<UV|<UV|"UV|"UV|2UV|2v�9�d�     