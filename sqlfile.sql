PGDMP  /                    }           sales_database    17.4    17.4 X               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            
           1262    17278    sales_database    DATABASE     t   CREATE DATABASE sales_database WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-GB';
    DROP DATABASE sales_database;
                     postgres    false                        2615    17280    olap    SCHEMA        CREATE SCHEMA olap;
    DROP SCHEMA olap;
                     postgres    false                        2615    17279    oltp    SCHEMA        CREATE SCHEMA oltp;
    DROP SCHEMA oltp;
                     postgres    false            �            1259    17337    dim_customers    TABLE     o   CREATE TABLE olap.dim_customers (
    customer_id integer NOT NULL,
    customername character varying(150)
);
    DROP TABLE olap.dim_customers;
       olap         heap r       postgres    false    7            �            1259    17336    dim_customers_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE olap.dim_customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE olap.dim_customers_customer_id_seq;
       olap               postgres    false    230    7                       0    0    dim_customers_customer_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE olap.dim_customers_customer_id_seq OWNED BY olap.dim_customers.customer_id;
          olap               postgres    false    229            �            1259    17365    dim_date    TABLE     �   CREATE TABLE olap.dim_date (
    date_id integer NOT NULL,
    order_date date,
    day integer,
    month integer,
    quarter integer,
    year integer,
    day_of_week character varying(15)
);
    DROP TABLE olap.dim_date;
       olap         heap r       postgres    false    7            �            1259    17364    dim_date_date_id_seq    SEQUENCE     �   CREATE SEQUENCE olap.dim_date_date_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE olap.dim_date_date_id_seq;
       olap               postgres    false    7    238                       0    0    dim_date_date_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE olap.dim_date_date_id_seq OWNED BY olap.dim_date.date_id;
          olap               postgres    false    237            �            1259    17358    dim_location    TABLE     �   CREATE TABLE olap.dim_location (
    location_id integer NOT NULL,
    city character varying(150),
    state character varying(150)
);
    DROP TABLE olap.dim_location;
       olap         heap r       postgres    false    7            �            1259    17357    dim_location_location_id_seq    SEQUENCE     �   CREATE SEQUENCE olap.dim_location_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE olap.dim_location_location_id_seq;
       olap               postgres    false    7    236                       0    0    dim_location_location_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE olap.dim_location_location_id_seq OWNED BY olap.dim_location.location_id;
          olap               postgres    false    235            �            1259    17351    dim_payments    TABLE     l   CREATE TABLE olap.dim_payments (
    payment_id integer NOT NULL,
    paymentmode character varying(150)
);
    DROP TABLE olap.dim_payments;
       olap         heap r       postgres    false    7            �            1259    17350    dim_payments_payment_id_seq    SEQUENCE     �   CREATE SEQUENCE olap.dim_payments_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE olap.dim_payments_payment_id_seq;
       olap               postgres    false    7    234                       0    0    dim_payments_payment_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE olap.dim_payments_payment_id_seq OWNED BY olap.dim_payments.payment_id;
          olap               postgres    false    233            �            1259    17344    dim_products    TABLE     �   CREATE TABLE olap.dim_products (
    product_id integer NOT NULL,
    category character varying(150),
    sub_category character varying(150)
);
    DROP TABLE olap.dim_products;
       olap         heap r       postgres    false    7            �            1259    17343    dim_products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE olap.dim_products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE olap.dim_products_product_id_seq;
       olap               postgres    false    7    232                       0    0    dim_products_product_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE olap.dim_products_product_id_seq OWNED BY olap.dim_products.product_id;
          olap               postgres    false    231            �            1259    17371 
   fact_sales    TABLE       CREATE TABLE olap.fact_sales (
    order_id integer NOT NULL,
    customer_id integer,
    product_id integer,
    payment_id integer,
    location_id integer,
    date_id integer,
    quantity integer,
    amount numeric(10,2),
    profit numeric(10,2)
);
    DROP TABLE olap.fact_sales;
       olap         heap r       postgres    false    7            �            1259    17282 	   customers    TABLE     �   CREATE TABLE oltp.customers (
    customer_id integer NOT NULL,
    customername character varying(150),
    city character varying(150),
    state character varying(150)
);
    DROP TABLE oltp.customers;
       oltp         heap r       postgres    false    6            �            1259    17281    customers_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE oltp.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE oltp.customers_customer_id_seq;
       oltp               postgres    false    6    220                       0    0    customers_customer_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE oltp.customers_customer_id_seq OWNED BY oltp.customers.customer_id;
          oltp               postgres    false    219            �            1259    17303    location    TABLE     �   CREATE TABLE oltp.location (
    location_id integer NOT NULL,
    city character varying(150),
    state character varying(150)
);
    DROP TABLE oltp.location;
       oltp         heap r       postgres    false    6            �            1259    17302    location_location_id_seq    SEQUENCE     �   CREATE SEQUENCE oltp.location_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE oltp.location_location_id_seq;
       oltp               postgres    false    6    226                       0    0    location_location_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE oltp.location_location_id_seq OWNED BY oltp.location.location_id;
          oltp               postgres    false    225            �            1259    17310    orders    TABLE     G  CREATE TABLE oltp.orders (
    order_id integer NOT NULL,
    order_no character varying(50),
    order_date date,
    year_month character varying(10),
    customer_id integer,
    product_id integer,
    payment_id integer,
    location_id integer,
    quantity integer,
    amount numeric(10,2),
    profit numeric(10,2)
);
    DROP TABLE oltp.orders;
       oltp         heap r       postgres    false    6            �            1259    17309    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE oltp.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE oltp.orders_order_id_seq;
       oltp               postgres    false    228    6                       0    0    orders_order_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE oltp.orders_order_id_seq OWNED BY oltp.orders.order_id;
          oltp               postgres    false    227            �            1259    17296    payments    TABLE     h   CREATE TABLE oltp.payments (
    payment_id integer NOT NULL,
    paymentmode character varying(150)
);
    DROP TABLE oltp.payments;
       oltp         heap r       postgres    false    6            �            1259    17295    payments_payment_id_seq    SEQUENCE     �   CREATE SEQUENCE oltp.payments_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE oltp.payments_payment_id_seq;
       oltp               postgres    false    224    6                       0    0    payments_payment_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE oltp.payments_payment_id_seq OWNED BY oltp.payments.payment_id;
          oltp               postgres    false    223            �            1259    17289    products    TABLE     �   CREATE TABLE oltp.products (
    product_id integer NOT NULL,
    category character varying(150),
    sub_category character varying(150)
);
    DROP TABLE oltp.products;
       oltp         heap r       postgres    false    6            �            1259    17288    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE oltp.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE oltp.products_product_id_seq;
       oltp               postgres    false    222    6                       0    0    products_product_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE oltp.products_product_id_seq OWNED BY oltp.products.product_id;
          oltp               postgres    false    221            ;           2604    17340    dim_customers customer_id    DEFAULT     �   ALTER TABLE ONLY olap.dim_customers ALTER COLUMN customer_id SET DEFAULT nextval('olap.dim_customers_customer_id_seq'::regclass);
 F   ALTER TABLE olap.dim_customers ALTER COLUMN customer_id DROP DEFAULT;
       olap               postgres    false    229    230    230            ?           2604    17368    dim_date date_id    DEFAULT     p   ALTER TABLE ONLY olap.dim_date ALTER COLUMN date_id SET DEFAULT nextval('olap.dim_date_date_id_seq'::regclass);
 =   ALTER TABLE olap.dim_date ALTER COLUMN date_id DROP DEFAULT;
       olap               postgres    false    237    238    238            >           2604    17361    dim_location location_id    DEFAULT     �   ALTER TABLE ONLY olap.dim_location ALTER COLUMN location_id SET DEFAULT nextval('olap.dim_location_location_id_seq'::regclass);
 E   ALTER TABLE olap.dim_location ALTER COLUMN location_id DROP DEFAULT;
       olap               postgres    false    236    235    236            =           2604    17354    dim_payments payment_id    DEFAULT     ~   ALTER TABLE ONLY olap.dim_payments ALTER COLUMN payment_id SET DEFAULT nextval('olap.dim_payments_payment_id_seq'::regclass);
 D   ALTER TABLE olap.dim_payments ALTER COLUMN payment_id DROP DEFAULT;
       olap               postgres    false    234    233    234            <           2604    17347    dim_products product_id    DEFAULT     ~   ALTER TABLE ONLY olap.dim_products ALTER COLUMN product_id SET DEFAULT nextval('olap.dim_products_product_id_seq'::regclass);
 D   ALTER TABLE olap.dim_products ALTER COLUMN product_id DROP DEFAULT;
       olap               postgres    false    232    231    232            6           2604    17285    customers customer_id    DEFAULT     z   ALTER TABLE ONLY oltp.customers ALTER COLUMN customer_id SET DEFAULT nextval('oltp.customers_customer_id_seq'::regclass);
 B   ALTER TABLE oltp.customers ALTER COLUMN customer_id DROP DEFAULT;
       oltp               postgres    false    220    219    220            9           2604    17306    location location_id    DEFAULT     x   ALTER TABLE ONLY oltp.location ALTER COLUMN location_id SET DEFAULT nextval('oltp.location_location_id_seq'::regclass);
 A   ALTER TABLE oltp.location ALTER COLUMN location_id DROP DEFAULT;
       oltp               postgres    false    225    226    226            :           2604    17313    orders order_id    DEFAULT     n   ALTER TABLE ONLY oltp.orders ALTER COLUMN order_id SET DEFAULT nextval('oltp.orders_order_id_seq'::regclass);
 <   ALTER TABLE oltp.orders ALTER COLUMN order_id DROP DEFAULT;
       oltp               postgres    false    228    227    228            8           2604    17299    payments payment_id    DEFAULT     v   ALTER TABLE ONLY oltp.payments ALTER COLUMN payment_id SET DEFAULT nextval('oltp.payments_payment_id_seq'::regclass);
 @   ALTER TABLE oltp.payments ALTER COLUMN payment_id DROP DEFAULT;
       oltp               postgres    false    224    223    224            7           2604    17292    products product_id    DEFAULT     v   ALTER TABLE ONLY oltp.products ALTER COLUMN product_id SET DEFAULT nextval('oltp.products_product_id_seq'::regclass);
 @   ALTER TABLE oltp.products ALTER COLUMN product_id DROP DEFAULT;
       oltp               postgres    false    221    222    222            �          0    17337    dim_customers 
   TABLE DATA           @   COPY olap.dim_customers (customer_id, customername) FROM stdin;
    olap               postgres    false    230   6g                 0    17365    dim_date 
   TABLE DATA           ]   COPY olap.dim_date (date_id, order_date, day, month, quarter, year, day_of_week) FROM stdin;
    olap               postgres    false    238   ��                 0    17358    dim_location 
   TABLE DATA           >   COPY olap.dim_location (location_id, city, state) FROM stdin;
    olap               postgres    false    236   �       �          0    17351    dim_payments 
   TABLE DATA           =   COPY olap.dim_payments (payment_id, paymentmode) FROM stdin;
    olap               postgres    false    234   �       �          0    17344    dim_products 
   TABLE DATA           H   COPY olap.dim_products (product_id, category, sub_category) FROM stdin;
    olap               postgres    false    232   G�                 0    17371 
   fact_sales 
   TABLE DATA           �   COPY olap.fact_sales (order_id, customer_id, product_id, payment_id, location_id, date_id, quantity, amount, profit) FROM stdin;
    olap               postgres    false    239   ��       �          0    17282 	   customers 
   TABLE DATA           I   COPY oltp.customers (customer_id, customername, city, state) FROM stdin;
    oltp               postgres    false    220   ��       �          0    17303    location 
   TABLE DATA           :   COPY oltp.location (location_id, city, state) FROM stdin;
    oltp               postgres    false    226   ��       �          0    17310    orders 
   TABLE DATA           �   COPY oltp.orders (order_id, order_no, order_date, year_month, customer_id, product_id, payment_id, location_id, quantity, amount, profit) FROM stdin;
    oltp               postgres    false    228   ��       �          0    17296    payments 
   TABLE DATA           9   COPY oltp.payments (payment_id, paymentmode) FROM stdin;
    oltp               postgres    false    224   �J      �          0    17289    products 
   TABLE DATA           D   COPY oltp.products (product_id, category, sub_category) FROM stdin;
    oltp               postgres    false    222   �J                 0    0    dim_customers_customer_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('olap.dim_customers_customer_id_seq', 1, false);
          olap               postgres    false    229                       0    0    dim_date_date_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('olap.dim_date_date_id_seq', 1, false);
          olap               postgres    false    237                       0    0    dim_location_location_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('olap.dim_location_location_id_seq', 1, false);
          olap               postgres    false    235                       0    0    dim_payments_payment_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('olap.dim_payments_payment_id_seq', 1, false);
          olap               postgres    false    233                       0    0    dim_products_product_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('olap.dim_products_product_id_seq', 1, false);
          olap               postgres    false    231                       0    0    customers_customer_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('oltp.customers_customer_id_seq', 1, false);
          oltp               postgres    false    219                       0    0    location_location_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('oltp.location_location_id_seq', 1, false);
          oltp               postgres    false    225                       0    0    orders_order_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('oltp.orders_order_id_seq', 1, false);
          oltp               postgres    false    227                       0    0    payments_payment_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('oltp.payments_payment_id_seq', 1, false);
          oltp               postgres    false    223                       0    0    products_product_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('oltp.products_product_id_seq', 1, false);
          oltp               postgres    false    221            K           2606    17342     dim_customers dim_customers_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY olap.dim_customers
    ADD CONSTRAINT dim_customers_pkey PRIMARY KEY (customer_id);
 H   ALTER TABLE ONLY olap.dim_customers DROP CONSTRAINT dim_customers_pkey;
       olap                 postgres    false    230            S           2606    17370    dim_date dim_date_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY olap.dim_date
    ADD CONSTRAINT dim_date_pkey PRIMARY KEY (date_id);
 >   ALTER TABLE ONLY olap.dim_date DROP CONSTRAINT dim_date_pkey;
       olap                 postgres    false    238            Q           2606    17363    dim_location dim_location_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY olap.dim_location
    ADD CONSTRAINT dim_location_pkey PRIMARY KEY (location_id);
 F   ALTER TABLE ONLY olap.dim_location DROP CONSTRAINT dim_location_pkey;
       olap                 postgres    false    236            O           2606    17356    dim_payments dim_payments_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY olap.dim_payments
    ADD CONSTRAINT dim_payments_pkey PRIMARY KEY (payment_id);
 F   ALTER TABLE ONLY olap.dim_payments DROP CONSTRAINT dim_payments_pkey;
       olap                 postgres    false    234            M           2606    17349    dim_products dim_products_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY olap.dim_products
    ADD CONSTRAINT dim_products_pkey PRIMARY KEY (product_id);
 F   ALTER TABLE ONLY olap.dim_products DROP CONSTRAINT dim_products_pkey;
       olap                 postgres    false    232            U           2606    17375    fact_sales fact_sales_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY olap.fact_sales
    ADD CONSTRAINT fact_sales_pkey PRIMARY KEY (order_id);
 B   ALTER TABLE ONLY olap.fact_sales DROP CONSTRAINT fact_sales_pkey;
       olap                 postgres    false    239            A           2606    17287    customers customers_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY oltp.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 @   ALTER TABLE ONLY oltp.customers DROP CONSTRAINT customers_pkey;
       oltp                 postgres    false    220            G           2606    17308    location location_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY oltp.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);
 >   ALTER TABLE ONLY oltp.location DROP CONSTRAINT location_pkey;
       oltp                 postgres    false    226            I           2606    17315    orders orders_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY oltp.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 :   ALTER TABLE ONLY oltp.orders DROP CONSTRAINT orders_pkey;
       oltp                 postgres    false    228            E           2606    17301    payments payments_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY oltp.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);
 >   ALTER TABLE ONLY oltp.payments DROP CONSTRAINT payments_pkey;
       oltp                 postgres    false    224            C           2606    17294    products products_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY oltp.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 >   ALTER TABLE ONLY oltp.products DROP CONSTRAINT products_pkey;
       oltp                 postgres    false    222            Z           2606    17376 &   fact_sales fact_sales_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY olap.fact_sales
    ADD CONSTRAINT fact_sales_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES olap.dim_customers(customer_id);
 N   ALTER TABLE ONLY olap.fact_sales DROP CONSTRAINT fact_sales_customer_id_fkey;
       olap               postgres    false    230    239    4683            [           2606    17396 "   fact_sales fact_sales_date_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY olap.fact_sales
    ADD CONSTRAINT fact_sales_date_id_fkey FOREIGN KEY (date_id) REFERENCES olap.dim_date(date_id);
 J   ALTER TABLE ONLY olap.fact_sales DROP CONSTRAINT fact_sales_date_id_fkey;
       olap               postgres    false    238    239    4691            \           2606    17391 &   fact_sales fact_sales_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY olap.fact_sales
    ADD CONSTRAINT fact_sales_location_id_fkey FOREIGN KEY (location_id) REFERENCES olap.dim_location(location_id);
 N   ALTER TABLE ONLY olap.fact_sales DROP CONSTRAINT fact_sales_location_id_fkey;
       olap               postgres    false    4689    239    236            ]           2606    17386 %   fact_sales fact_sales_payment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY olap.fact_sales
    ADD CONSTRAINT fact_sales_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES olap.dim_payments(payment_id);
 M   ALTER TABLE ONLY olap.fact_sales DROP CONSTRAINT fact_sales_payment_id_fkey;
       olap               postgres    false    234    4687    239            ^           2606    17381 %   fact_sales fact_sales_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY olap.fact_sales
    ADD CONSTRAINT fact_sales_product_id_fkey FOREIGN KEY (product_id) REFERENCES olap.dim_products(product_id);
 M   ALTER TABLE ONLY olap.fact_sales DROP CONSTRAINT fact_sales_product_id_fkey;
       olap               postgres    false    232    4685    239            V           2606    17316    orders orders_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY oltp.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES oltp.customers(customer_id);
 F   ALTER TABLE ONLY oltp.orders DROP CONSTRAINT orders_customer_id_fkey;
       oltp               postgres    false    220    4673    228            W           2606    17331    orders orders_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY oltp.orders
    ADD CONSTRAINT orders_location_id_fkey FOREIGN KEY (location_id) REFERENCES oltp.location(location_id);
 F   ALTER TABLE ONLY oltp.orders DROP CONSTRAINT orders_location_id_fkey;
       oltp               postgres    false    226    4679    228            X           2606    17326    orders orders_payment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY oltp.orders
    ADD CONSTRAINT orders_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES oltp.payments(payment_id);
 E   ALTER TABLE ONLY oltp.orders DROP CONSTRAINT orders_payment_id_fkey;
       oltp               postgres    false    224    228    4677            Y           2606    17321    orders orders_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY oltp.orders
    ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES oltp.products(product_id);
 E   ALTER TABLE ONLY oltp.orders DROP CONSTRAINT orders_product_id_fkey;
       oltp               postgres    false    4675    228    222            �      x�m[�V�Ȓ}���_�K�L�C���],`U�sּ$��u�%F��]_?{G^����ngI��D��;"�:�ڙ��5��"O�����˛f�~�;$�_fۿ.o��{=` ����w˿�Cgɢ�M�6�e��#ytm�������|�@�h�mݝ�O������rU�Y4>��[b.;PF�}�t�Gs>׃�eq�|�?�ny_��Y=��f��~�a(��8�\aW�0�E/��hN˟�m���h3���1]S��Y�5�~����wҷ�Ms�����/9�}��n������*�6`�?��e �#���>��` �^��|2�H��n���3��8p�ˇ��̰�(�u��Φ]^�����"z�����Cs��r=_���,W�.0�����\�JW�\��M=�H�*��g��r]��v\tG�zo:��g�o��&��9�Fn�]^��f���诺뚷zX^]�b�E��ө�bQ���q���E�X����9~��>�f��>��e���A=7Gn�(#��i	�����t\�
v��5�[%�
#C{��_1��o� �s�,�����0Xڼʣ|�|��H�Ta��/s��)ݛ3��,�=��h����f^�*���6�5����X}�k�{:�n�����΢��<a<5.K����p�7�`�D�/�;�t�kݘ/�S���j=r������zړ.���5�bN�{<�m>/�'i^eg�q���8�`O��)S�v��2��5�
x�����{��|���^�74c\ʪ/U�p�q[}�rc�����������	 u��RVr�O��8��/��X��״�;�'���t���i ��e���#�����Yt?4'��r�� ,�9Nk���Nw1Ǧ=ː
�Gk��
�����,��#�S-��T/7۝�ƪ��!E���Y-������vf�М�m�����[0=a�����K]����#�v7�?Xl��7C�_�T+9Ȼ>	3�������s��2�V�?�86�v�(@\����k ��p����X��"P�� Gk�<��@O`�Hr��<�a���rs<^0��/��^�[G�Ѿ��ݶ�P�ql|H(�*�,�e�q�}�'`.�nxǁ`(��N����~bD(��a0�vi�����a_/�j�9�烯aI�~���N(%^4gF�;J9 F�z��1D�w;[1���Y�%�����F@�j�׃]$�ܪa`pn�8VX��l����m�Ct��_��r�i?0�E
�D���0"J61�$��#��M"���,�`�E��h��{P��x�14-q�^6B����(����	��ƽ8�5���nОpO��ǂ��6/���ZS���U��AS
�EgUikN^��WC�.-�.AGZ9;�Eq�PY�(��]�Z0&s�܍����y�&��3\ w��x�W~!R�0c�II<t���ɐ`�v�r�6�/�U�C� ~��q?��Ih�?��π�z���6���>�� �s�\��a_�_�@���ɞ�=�����G{�?���1�Lb�R6��,R@*J�@bv� 1u u��5�lS6|`P[h�̎6�>�7����ׁa��Zd�S�T��a���C��R uS���d���]�?�1�	*�+��Ö&�P���a%�>���-�,� ���`Bt��ٿG|�``���zR��r��[����/�n���/�*V���q9>v['�p/B���V��q�Q��9t��
dR�!�fp��=}��i�Y���,��񋦞��k:�L�ͅ�u���2O�rd��@VI<�|lH;3��
�ǒ���c!�|��*���@�t�9���6{�4XΓ��[��d�g�.�a0� D�%Z!N�g�9�GЅg�@!Q�d&��a��H7�(�6�/��@�fy��{ې�S�9j� �G��/��*���k��������۷t��PnZA��D�$亝�t�O�Q! 
�osH1��=����z�ȳ<��(l��C����Ħ��3��AI��vwv	��| �s��[����U��OOU\hN������������M%�\Ȼ^ɂ0�L�Ԟ{BC5���Ni p�4��{�3�.D��j��b�����K�Eϔp�@Nr�2*�;ZU��h���:A@|��Á>&��K	.�6���a�ݖ��p�<�m��	����_������@�hc>�[� ZL��H�{E� ��p���ёH�F�`���R�9� ��!�D@�2������`L;���&�>���z�O�ų�,u�b5YH)��w{�JD
�H ��(A�RH�����b?		� ����/��i'5�֞��i��,cy��>����m��:��!A��t����Z��kGRjo4iZ:�1��l�Y�5���B铂S��46�� ��f�s0���b(�A��kk�=�@�)PU����K(Vkq�}�S�k��fV��'����Ҕ����@�>��g��S�>nA���@��2h�w�+�������,���ڣ�A�R �H�y������z�Uj���?��ʙʘ�*����7��T��@R��(GI#ղKLT�c��&�E��=l�^@�>]p9�n��@�{� �/~���Ϣ�^`u�D�#}���ؐ���|�t^���A	?��a��y~%@B[S�&�{?h[���c�r'Zd<����\b-W�d������n'-~Y��SE+2�|t������n �r?���i>��f#,�I��f�c1�$?�{�MU�9��TU�˂��k�w��@�*A���3�7ՉO8==���Y E���TO��1�T�Ο�5�G1��f{������?Y�M���z깬R� �h��>C�x�m����S]�0�L�q���C?�L|#-�l�HK��w�Q�(<�~��NK��qZ�@�Ѥp�k�<�ziY9�����]��=Q$!�,�V���K	�U⪋L.ny#�-O��0�R�օT��n�d�[hT�#5�+J&  y0�&@f&i5��/I����o-��bo
�0�[���pG˸
|�ٝ$ f���
��z�œ��ch�B,A�����9<��ֺo��d.�I�GD�E�~۬5p������������|�$�f����E[�'��c�6�|lJ�l��8���L���ȤH`m�e� j�־�^�������cV-��?�$1�C�W=�En`�}���ND�0��<�p�-�%'����Bb����,�
J҆b��fg�I�^�z��z�:��1�%�6���˘ձ�r��1ֱ�W�q���� 3\p��X�e����p�W����g@))9!��)=�|2���z&w��P�P-э ('|��(m��S� x��߬������Y2p`rgLø�J r-YiU>}3���|F���,<Вar�Ȋ��>��y��$Q����`@{��}�m��R�:/����"��-�3�U����}��^�˾ڂ8�AR�3{�^0���eV�1�i�;_A�lP[���" &�1´�'!l{�+�¬�$�Թ���+*���|X��(2SꤩJ3�aG2{�2ٰ7�y0KݕMt�c?�Xf:�U����z�B��쩵�TeS:w��Y��|E��
�(��1���11d�di)L�ℹ�6rbHG6��t�C�,m2�R5��2�IhÊF�L���q!j�O�^��}��/���<+;Qa'g$�t�
��d8/2G�Vr�) kUw�1Laoj���±I����)���_^
��b�IZ��	ڇ����Bl�)��2��vy�B�84C	�Ԙ���؁a�+��N>y�Pb>��Z��������S��b�g��(���l��O��VpB��Ů��N�žN(�M/C�v� �/�K}bB��Ze� @:�u+�I���Od�->����6�U&9YITx�W���#�B�t#KP1P�"��@\(�F�-qV0� S��zv�����K�
F�m
X�e��{��)��PBl�� �
  F��W8T>�u�1�~I����n����n�E�ЊIk�H����%���B�m�}�Hd\�B�>|��aE1�)�1�ncd�0�i< I�D5�?�~�}�4�5���XAȤ���V�hg7i�H���lL�\I��,�z�4��8pe��~�3�2x��	�YF�2����N����1C2��\�"ŹW.lt1�G@;��;T(`��ÈU��Yx&�Y�Pń�^���<³k (d��˴ӑ�B���RXPtAa� ;�v�)�oK�zD<(�q)oK��E���c����y]X^��+Kێ�=�vpnf��#Z�.�v5OP[L��^���֮�_�o��6@�mI�0�Njg�S�p�V�;�jg���A8j��U��Wj�غ���Zom�B��"�=�#cͽ�bk�R+*�|sz�`&�v�FQe>�~�j)�UyW����o (*�����_����t4�R���B��-QqL,(���bIA�r��q��Ʒ�i�;2�Xwq���gT��D*�^�d�1uC?�;ʗS��#R�$l`t*���OB,F������s�&��%JE4���l�Y�ۖ��f�rQL�q�؟}�-�D�8)m��څ;�La(����T�B��(�\f����^>Β���o�� ċ���V���fma�'XzIkd�,::�F>M�ͫO�	���д͇���Cuw�0i2�b�	a�d>a��9�M��	�vIQ������@�,�L93�$?W�~���p6��)X���/>�4���X��߫��^�(!Q%��Թ�T�I�8�1�s@��Ws�$�t�~A%��lm9D���D��Iڷȫ�ǩ�6���	��M�wb��9`" �����` �i%K>�*����*��E�@A�&� �琚h���eC�v[|ϒר��L*L���q��,���i��Oh�J�d�]�2]��IY��?����&�]�g3�(�'.Iذ�6e���)8�h�n��K��&pg'�&��幻K�$��'P�Խ\�j����S������F_�OYD�Hu74oo�5����{����8�����T��R}>��S���d@��&!���� }m��&��2�6��`���6�<�~����Xf
Fs=R��X�k�BT�S�͚�����H8�ws�feE1�C�)s���[��,Ԩ |��O�>ɧ<�:�]KV�.���<t���o)�TKZoɸ"��y`��$�4C޻��~�1��^R�!�܍g�
RX&�Es�R��ʙ�c/�WkW|�i��J�^؁��Z�UI�s��b�b9��#,� qR�X~��$<�} �Z�T唧���C7��aF	��g���eYV����L��^`Z��W��=мa��r���C=��R)y��!8��V�Qm��P�r+bx�EF|�֪�$G�AY-�HPGϗ���t�dy�9�������iU��Q���(B�/@W]�,�ߎ���=�<\z�̠�VL�yA����m�U��`�L���̫��!�I�Y�V��\�R��/�����p�����<cq�`|q8S�'��u<��pv$�� 5�N��Q�b����3e�o�K�-2kq�6��B ө�ʲ�I[����	qC���ja��
w���&�pkQE0rY�b�.�j��T���[�z*�X��J���9!�c����aǪ��w�"�B�v��n:�ln�b���0׀�*g)d�6���I�{��*euT��Ʋ�{�뤪��q70���)o᠐�T��|:X#4[W��ɀ�Yf?�L�S�C4��|zJ
����+�* ����=k�b�yh�i鶄��,�.���n?Tct��_ྲྀS#8��l
[�0�,6ۦ;_F��V�IA=%�I1C���W?���h�!��$�����O���&wj�5�c_�g����|˪�+��I���6 �m�tu��v^[�r�D��1.�/&H�	�g���L���u}:��q�L�b'�\�l~�Rטa;}T��$sn/���y)2��o���gJ�����D�*�UZI���B�=V��F6�i��|�e�Y��`��A��^���y�ą�lJ�Kb�"����L-�c�Q숲�Lǈ￹�9=H���4]�u�$��]��y�z4����=�Y:mUg�}nƎ�d�0�j�����ǅclFul���ݽ\0Q�d�&p66of>͞OT�l��W6��>��/����#�{SG���S�H���o��mr�yZhz��yH#�����o�d7�|A�e��ΙIz1	��afM��Mu]L-�2��4�-�٪���w��G1����6�쑒?c�Rq�1���3��L�������Oh8��!Tj���cf����u�*�V���]���)�v��4��b�g��W�a�R.ʋ4�l��=�>2i���grJ��M��?����I�^���tth#�,HKZ��2�_�Z�/|�_d �\���K6�/���|��(�ZM�=3;�C�ܑ,�b��Á��`����p�~$���]P-��qn�-�5���L%T48�mO�G]���ܕ.UȪ8��K��7�4wk�9YϽ�[9�(���z�l2UWᯀ���2¿3���B"�J�K%��ca�|�6��*([�3&�P��Qt��� `XЕ[L{��2�f&+w�_��e쪟�YƉGt	Qe��-����g��-+3%��]�vQ���(���X,�I4گ            x�m\��-�m����mL?g��9� 'NH��Ȁl�{Ϛ&������ݷ$�,����S�Z��[ϟ�7~��_~����׿���<>�n���[Ο�w�������_#�����8�i�	�5�s�jS<����?e������?��rِR~��3J��k̿��Z�z'}�|�����]k������&�v�g�g��(�0�����������������?����u�RK�����N�A皨��ϖz��e������:��b����}�L�oy��j��݅'{���LS������(ҷs@�w3U�g�g�J������/Q�2ḷ��Q���(�9ѳ�'
ںOS������F��+����Lf\����<ۚ¤����8l'���ߞ�o���p��&�ۍ�{�G�A�\���7[��~�3Qp�Rݶ[�Ϋ��׏�;����ę̂?{y��9�	[�S��Llj�:�T?nX���f��vS�����R�����'�<�T��R��,�^�@۾�b��Hf�(�FXg؅��I�t�`�+�\{9፠��mH7�k�As=��B��6�p���?N;a�k�s\�k�,�� p��g�ws?������zw޿��r�"�^a
&}��9��v��������ӌ�t��t����v������<?�-t���>?�m�_4��)`����U�b���A�2S�d��(8����/�0����ϟp�#����}��ۈsm���;\�������#�YFh	��xDs���t���p�c����=]���m7~��_��W��O4r�fCD3����i��e*ӯ"�<����v�c&�� F�H�0x�Y�����i;���I硃�lWV��X.~��"�$c
7��H��X.~!���Q�2���f�p�MΣ�v�7�T��!T7��<D�����.z�N�3�J���#'�hsY�Sw84n�����,���4���i��a�����a5��q�a�܏�?��[|��[j5_]��2����+C��Ǯ+����u&����Ο��$�����r?o��VQI�а�����ռ��ف�r��^��dg��-d�0+�����uj�.�V6L5��o�|a��h?*��[q,���Y=��v�d��½LI�2f=��u'�%9�g� ����l�y�nc�{�P3��D��=4�����Z8.$X�U�{2]ҕ�>�Kp|�&���(����\��c.���-,�o|6�=��2�����{oZ�̔��~ �F�	�]��O����n{�V�i��kf��6z�]���
	�0��v�&�v8f�V�٥r�w� 1�FfPoaV8([���Y�Al(�n��L���p��Ӝ�L{iG�����0�!{�pҲ{nHk�$��>�5A�ϳ�����NN�uq�W7���a�A��`?7��x�v��(�W���VY~��(�l'(��WMx(��򍠼r@�\V���H+.ݱD���V�+�u��b�䉗\xb��P��B������洸U�
�<Zu �83A��J˯�Z��p����亥ƭJ��9MƢ+a��s!d��ͫ��dhEY�B܌G�����T�A�,�'�ܚgBc��87	gK���ث�#�
)g�f��6 �5	��9<ϼ-�:�O�W�x����]L5�,�S�f#�\�v��]K��ƶ�2I�i�ٸ��=��>8�S��Ц&wR���f2i;F-���":,���Óo s����A�Z����]��m�ݩ�rv\׸o9-��X�֤|^�)�r���8����yo�9o�������r���Р�[.����G�nd����af߾�˳�����
��c��&�-��'9ՠ���4+�	��Y�DZ��/F���wL#^��q��l�\���r�t�x�c�Z���ݠ���p`���1&�F|�N���,��2�n�б�v(tٹ���X$�V��Փr;�s�np��.�b�&V�Y�A��Eޖz��e p�\�N\���{+e���"��/'�3�w���f���s'�\<,s�w�l�$9u?FA�8�{��Y7�L�2�=��By��
���S�k/���}\��ګ��sӋ-J^�F��{�κ_��嵃j���%pNIg���(�7��]�Żܽk@V�ͻ�ܦ��q��Ś����a�I�Q�-�u;Z��<$2ڻ.dꦞ7d��{f��T�C�Z/�5����~�iV��Ƞ	�T�a��������S��	���$��G��
#eR �QӼ'9$_�}N]y~M��z��x�Y�,�R�����/#��Ƹ`��1ņ,E�q|�����_���[��������v=�D��L�O>7`ڂG�nJ��Ԗ�}��۠�d�������9q�����Ey_���)q����Q�7��ұŃ�N�4�mْ@�w���Rcm�BlM�9H���d��y�b"u�yB��p�yL�&#_h�ѓ�����m��!�aCd˜��߸��q�բ7�����N7��R��N� �e^����.$�V-��,�X�{{����.�����r���n,;��oQj��ވ�k��ԯ����O(m���y��^5��<��6G�����Owb4���\gޥ	�6eu)
�r���EW'�X羂9�OnI��yv$lC��}���O�:�k)W�}
��%�-���" =��3����a%�Db�vJ�B�@���1+ո�nG�R�����^b �yF���]�st)��
����P���)1zI��-���Ej����%��}sZ�����Ц3/Ż��.�������t��RQJG�+��Ulv���2d[)U�x{�Uy���;B�4`&�3sb��L9Rj|e�O�f@��t<��tB���4�^'��3��?;�4{���e���ky2�,���܂BKu%�N7�O2��˂�){j���g�6'L����d$VYV�_=g�Y�#�����b=\*I˲��#Կ���ȵN󅣫�L�r���dBP����u辟��I��t�RD��	/�+��}"���HU���q��y ��H����f���ܡ!ש����m��\���u7����4,�a-e���X��t�P&FL�9�y��+�la�Nd.�Ȱ�V�o@�UR/�1B�~������so����ٗ���WE!#�����%f7*��en-��i+c@%�z��RD~�8Ud �G�翍H�3찼GB����~yQ�1�5۟x���B)P,�k�p@ZXa�/�x��F��/b�@�3{�\���Rف̋��a!������38o�����&�[Qn�����u�h�z�����K�y��N�t���!9,�m�k�v���D���o��M�D��9��LG4Gcb���8����7V�,��i t!�!Ƌ�Im[����݌v�v�J]@�O-92����Ry,OC�=�T�<��I�S$���"RW�1�L�R���oh�g'�p���HկT ܦ���(Ҝ�#$� B���p�Q�cfC��"2M1.wϩ<���(r�N�:�օ۰g��	�b�ƺU�
��Ъxxݗ&Ċ�/��@܃6�$��Ј�b�!����H�>p�B���汖:q,�1��PO�X�mϫh���>�0]���W�8C�-���ԁ~<�a�A=t`�;[AC�8�V�kE�M�x��� "�A�z�r��8� ��!�H�5��1����n+b�N�x5ǉc��>����W>�yϴ����\jq���Q�aP���K}��.���M~�7��t.eg�2�;�f�Bj�[q�y@8sT �����Uro�X�n����hL^��~�z����;cl?�'��GU�HҫC5�S�SHyd%�҉]�|o��pI�4J�.s0�[��s�q�l<(�C�:�s)����*���{�������@-����s�Յ���P=&��8�(?d�7�<P�*��K��yiaZ�����Yr]Q[���k�C��Tq���wV0��]J�_8�BOs�sH<����
v��\MCSp�Jm�)Rk7����h�ު��W5_`dt_!X�Z;Xs�>�9�^+�D��Dr�Pǅ9B5F�p� �  �(�Z�딺[�G�����P0%�0%{�0��p7��jIi��/��Ds@I�L+��7�D�2VP�uZ-�����̤Z-JB���}c#mn��A�7�����KH��P�Nu���aԋzga��΋֍�@��o�� WD��r%=��%����M��a[H��0�*��y��~Vfaס��=�$�&b}F������91S�iJ��A�`�������D9�/��[k4 FJ�l��V/��2����l�u� �η�ȳ��RW&a���Y�����-l�0EY�l)J)7O���KJPQO�Lx�9�uL�����W �OT4sxy!�N��Z�'L8��>W�-�,w�;���}.�۞��L�;)��Z�=��h2����I���D�,���A���X��E
8��Y��6Q�>�羧ͳ�_/��T٨Kj�*㒼u�I�'*�N�W�陴���{�L��}�G���~���Gj*S�P�婫�LJ�������/�4J��^E��J�$|�dF ,� �}��P�Gv�m�#a�Xs#1��1
�F�<Ǧ�9&�n;��x]�mL�o�cU��8	mb���q�4|�IL�qJ�T�'��{�Yv�çLRK-����@z1N��1�Bm�M!=r���J��Kn�u�ּ��)�,.�ԔIC��.���֖�S�ڊ�hxS�x��c�\���"&��-~��|�T��N���;4��,��֐G�k+$Z��V���k-xY�X
��k�7�:M��b�ܡS�C7A&ɍ%��)�ż/��ZK~P�y�DA¦�PM���i@|�..jF�d.��GanT����{*�	��tA��c�U7����u�g;<>{�¡�A��x���߫{�iD�j�0&~'G�����E����!o��}w��|�k^��pr�^����p���s�*���!��x"ί���rcw�/���>c#B%�;����_��Q��NMj}/�êp ��Z���XjԀtr7��\������a���Ү=|�35�T��*������Z?���� �;���fJ_���Q�H3H2B�p �`�6�Zs���b���BD��;v�v�T/�	�N�VXm*�~N�t,�����R�)<�~&"�A� ��� *5��TBUyP/�U���T�����u{p�y"�*)�g~�����NBh��M�������Sd"zr�{.W�JR�x#Q�����<l�&	m�fH��# Iꄐ�^�L�ۼ��>�J�����?CLN�         �   x�U��N�@�ϳO�'@l�9��*��"��lg]�&��=��ެ�7�-��V4rAfWsN��V��r2S\weI�x�ٳ�73�.
�B�w��u���G¥��d�+s�~�;��#��d/Ř��O��#{��P��R2�{
ن}�,k��R�Ꮫ�r�H!生�S8��y�v5��38���4������n���!b�5GaWx��Hc��c�7v�sp      �   4   x�3���2�tIM�,QpN,J�2�t���2�t.JM���r:��p��qqq A�      �   �   x�e���0���)�������@*#�	��$���?閪�uw�Χ�y �;k$��+�H���O�.lԣm���C,%���v��a�>��edg�Ȥ^�v�Iu�6!���ʎY��-
����A�Fe�w�h=_�y���eƮ��J��+ �kr_-            x�u]W��8��f�������&��
r�w�k*-Ap8�%�j�W�j�'�+�k���K�}���'���!��^��Z ���ZW�=k��!�(D�/�k	0�c䴁�KC�k�t��+G�r�S�G+][�u�S��|�:�"$��ٯ�~�3?��+�{�D����ہ��Ne�B@J#^n߈�������Y׬�@��W��d�i���k���S�����O0f?��TN׵�& �:��W�CCL.]���s����}.���������ܓ�YS�����|R��Cx:j�x���Sf`VNz�T��#�r-V��5W��T?DS�ϔVL��d�M�+~��*�l
h�q%bs#�1'2���+�Y��7^#����t���t5Q
W��N�I��a!�X��5���V�u��!��b/����d�K2{�fi�_��5*�c@�z�U�U);m\�,*���\�R�҃���1(����k`
!��N�.h��CЩ�f�������!~���;�˧�u,��66�`7V�㿴 �P,��|# ~=��%[�,�gמ7d�B:���5�Mr�,@�	�,� �4��B�\�O���g�L-6�)'`q:ƙ��1����{(t^,<TN�T���T��4|w�8����D �k���}��@
��*�иQFx���7���q�O�5"��v>{�PG�G&L1�eH#����1q0L�.-���'iPH0g{+}Mڈ�� &�����.g�PDmOm��2��,�YT�Kג�M9:� U�,A�o9�8bŅ�P}�oڨ>���X}�~�|�m�����p8��ņ��Z�P�+���P1�:�8Y3^,�~�����StN(�k��k��-��0�s����rv��($�
����1D	���bO�,�Ĵ���+e~��n�f�N�������|H�4'j��qũd��sz(m?�"��!�@Xb��JYS�b�*)L@�+%W�+�37���O����Abv���ŘcZ������Y��YPQ�% \����eS�>�8h�ؠI�1�6g"(�ŧ̦�~p<l2�2�����)�q��Qbagf�-挀Ɲ��������#u�3b�w��L�y�y��!GmWɫ��MG�	��y��4��j��X���m��iD��`K�Bv1��9�Dͤ��`*1��s�0$s]��0��E<k'L�O޺���y�Z��������G�]oBi��I[L"������F1����JK�b���Ę`3<�A�������wq/7B�$���Xp?g�^23J�9�� � ���/��K�E�B��!�cMo�!��Ż�K_=y�V3�k`4���2����r�;�{��@ۭq���(��B�4h���QrE������jL��i��H����3u��oZ|ߢ�Ra"c���Mq��� �L� 2L�z#��5E�k�1���̹ȄB��|�rY[*Ը��P���cEGe� ���6ݔlو�C�����nIC�X��s�Kͬ��o�73����_~M��I�?�̭-�;BR[�L-�Q���	��fY��^�[,&WY�Ф8H$�Ƃ�{,�U���E� hݶQ�=��>�9�[��|[Gͬo���x��A��<�QY��ԑ�!��s��	� *.�qS�BKR��J� ���Et>e��,�RA�aI1=�A��:�\����C9�뀉 H�uZ�1<Tq=���?��E�����i�~TLg��l.Q�.͖�+kĔ!,z���	�����X����lH�_L<�H�fۘ�����!^HGHș�'��
��'u�AB�&��O��%�V�P�1�7D��� ��E�T�|iT]���Qp!�B����G�y�;��`hP�Q��&4i�@�b޶ļɛ�a�ey�(9���T�
!�cCiA�0(-y���G>5�t��I.�Q�x��q�c���F}=TX��Wo;̼��T����0*)��(��Q��0a���*O�bAjSR8�!�͖<X����K`)UЗYE�~b�qF������h����tC�۽a���W������)�t�/��ƥ5��Ɵ�τ&d� uBMQ�T�l�ԥ��a )�;�rʱO���Wiۘ�Fc\ ,��g��q)�c3�Wf�k�v���cCMK�������֡��/�<eY��\��e`z��R�`yd]�d̦��h+����$.�)$��\m�a$T/�r/"P�����D�Z1㈣�6�[ �W��|1���*Ơ�W׫īI�V��5A��>L�������]�J���6`�ݘN�b��ï��B��bqr�wrB#l�$�'1��:�`�9������g�F�?�������~]���r#g����Ф�"��=���R���.�얈��:R�$�V<�/>�MN���_�ګV+�87�Z7���1d٬���7]�TڨeH��'�F7�>\�ykz���B���$�LP�ݧ<Ϧ�
N�X�����mǳ���l���y3����V9;�@��!�5=Lӳ��gu���ߧsn@G=7�F��Z�����,�@�������ڝ4?ğ�C���Y�P�l�P��N�$UZ��fh�w{4)�[�ՃO�g[ nï"U�Ȭ/�R�e��O��d)��Q@A���[�:Oj<��A�RTJ{7%?����sJ5b����)��[�8���$^�� �m�/��}��t�W�rCr������6��:�B{j�)%�t���n����U� tRoT��
�'Sd����~����B�L�a�P�9�| ���)��T{)����p_�ݺ��V�^��@��}�'�⧍�,���WNٴ��R<�ޚa���I����&��:c����|N�4D�L���F�tt7Y�%�\[�Fu��x?�VMz=C!v3Ť�;K������89�e�	�� D/�\���Whn�M�*=�&�}�����5ܪ�y ���ɚ���J(Dq�/��)�+eS����+i?�
�o#iR���F�KC̢}QKA�ck�v�A�T��e�4��`��;b�>������+��.;�c�i)��%np��S�H6�E�%�!��+�Պ�|�}Q4�A���o>����J�=�(�"/����Q �����5�0��(	#e��XOPM�V3��'M·�FRÑ�����ƽ>RԦ�GZ@��X�Z�$ě�v�
���NC�R<aߙU5dml�:K��?s�h��zR���=6��R������s~P$yۓP�\5%���F�B�m��)�U!VgI�bE��`�݋��i����ߨ������VuQ5Yx��iiX�-/�3g�6�a��cAhO�	?��G2hbnC������ֿ3�Լ΢���d<�B;���zq�� J���Ǫ�分�v��9~��}[�k�"�7�R���M��9� v��-12�d���<?e�@�(��������/�!"~}ʙ�I|g*l��էCq�(,��#�����6�'�T+K|�x�P�tUy�u!PS�:L��� �u����M2;͝ೕ%����b�� �[� 2�O<�'1���Ș"��DPl���=� �-M?�?z�|(�Ġ���fא��+(ƼM�c�"Ԋ��98(�X/��}j��D�q {0�ᰨ�ˆW:ݐI�2�F��N�j���r�i��yO l�i�B�P汭o]��Dl��p2LG� �
2��,0��JR�)v�F~� !#�g�f�.�ּ-LL�6�b��l��(|*�m3�	L�!4����L��wB(�o���[�o�iP���ѱX�s�)oHr*�! ����4���?�u�}�Q�<Ot9	4��A�a��F%J��cjz�d��3�<-�R=DNw'T��۠/7JgF�.�1#�6ӟ����'��)bX��\�+�{�f��>0�rvc`�2���U
H5H����_2Z�j�7�ёME�
L���.*�V~�JF��ݒ�y�I)~    ���.i�\�ʋ��ԣ�~�
�Td:��9Ă.��O-��u?���财�HsjCy_xez�Ϣ%]T���)@ �7�_�0D
�^��fnۓ����A(62��M|jKV�� h�=��%'C�{y�H5WA6�{d'dʱW�K��e3���c){n6�a�8�؆�B�2d1�ʰ�=��v�{�䇌3>��}��tV����2��$�E�Q���6x�T��o���A�ij�E�y�mn�E���9=LazL-��mЀ���1��/��E�]	�q[ttXTX�Un���֦���l� j�@p�vgc)g�I�$Ѱ��!H/��3ݠ̰��1jɩ�E?��N)s)4���DŘ4��aQ)>,��^_Ly�V8|��!@r�W�&lOQ��I�f a��j_��k��F@8�%�eo2�=���0;>��8�BM!���^�ʫ9@exG���<�x�-[m/��mܐ���V0�=HC�o���E.��M*��D�*
��[��a.j�RTfc�*>۲_n�/��U��.WY�n�;P}K.�0O�(n�Ҕ*���Wa��E��0j�G`(��5����&S`�18QBs�(HȐ��A(�(Zx���Wh�h��aH��H���T^£V���W�"I���bݫ���Mhl#�xq�T����g��({2&Р��Zz�,I!����m`�96�-�N�bsb���]դA>Le0��(�6X�{2�*��m��y�?R��(�n>P�8����w���@Ә�d}|���~��	���qT�li�qZy�j2v��[������nn�d�g'�+���٦txRu��u�!L�1�(�)(���U[䠒��8#�Ta&�������;�O�ո��(u��l��ڼ�꧰��N��8M����{D?�Z����䁦S�3�Y���Fyw��eo-��l�E�a�Khy�4;�=׃)L����RX"����pn�� Ě.��T��8R�O�n���8�.��>y���%>r)��|�"3�|W
���g�C�D�'�Q�-إ�	*�*�����a`ﮚ,�:��ks�Z��hGqED�ڐ�1&�&6�����tPx������E�e�(�F\ɏk��������-��$��&H}!�M)݃`Ufq��p�rD�8���q����~_zj��l���Q ��d�W�$�
Cj��x�I��7��:β�̷̥��G���]є�B�j-ץ'J� �ؖ)$�y�X�2)��C�ً
N�9�QZ�,D(�!f��(���F�mV�� �/n��-�9���Z*��aafe��m��a�L'��jP&�7*;��$>H{u��zK��FF�: տ��M>�T�~or񓔣	@i^M_PW��\ [��������Y���`b�;���H�c����XYa$8[�^q*���l��F�՝ �\ZVik*�W�ś���pb�A2`B��e�<���C� �7�C���E1K|�pr1Z�����^��6X�ٙPZ嗔;d��o�$]U�颲���/�<��r�P���w���K�]C1�C�M��C%�T�w�Y3%���ܐ/h�0XZ?����c� ���dcT�ߨ�0n�J'�Q����*C�X"���)ƠH��	���OŪ 1i���B�H`N�'���d
��j�����oXV��v�����BZ��Wyt�~��P=i�M�f��n8����3����T�:�ޏ�?��	W����1	b��6�SZ����8A�;��:pF����2O6�5{�A���[�k�y�6=�Q�ս]��l�E���j��V�C�CM�dr���]��� ��w���̠laE<����5gse|�y�g���[��Fc��Ybe��/�\�s�������jo.b�-;C0��9�~��zl!�c���_����h�F��9Px��}�i�����r`�$-Qt��a���:響����KM�-�����5]'����D}�����&���9�Л�y;>����83Y&0�>� NL�׷�̀ڑQ�D��\de��[��D)�۠1U�o���ZR�T���Ih�y����9�rHK��Zb��;I���R��7,���[�V(�M_BBt����T��(����cw��aыQ���K-PCqHw�:�u�Z<�$��tb�ubGN���0��Z�ǋC�����-E,ۦ��ߏk{W�H��f;��:����4x��F1Q$+����p���'�3��!���h������G�=�m����2��>�X`�Ծ�b;�Ң���~ ��\MD�d�j�m�\��X��_}�#�ޔ���ѲL������掸��_�xK��L�T����a��*%w�z�t ��>#��4�D��<�^f�%tPʚ�R"!f �0�-��av�|PEy�����P�P�s�C�-߯�-R���<����"pN� !G]v��0(���,�}�\
�僑9�Ws��F�2�]����U.�"'&�('I�{(����0J�BV)W�-��B�#L�Z�}[^�P�%L͂�:���
ڗkv��\,�I����$�[?�����h�`5�l��:�X�0��|@�����^EŽ$ko!�|���j��
��+�����	A��tx���gU@�d��ꯛ�? ����-��Z�<7�>�_F�2D/�1�z����$K �B�=�b\��(g���*ν\��T����BUz�<�nC��@��十'杁~iA�(� �.D�`P����*f{z$f������c}A���1���3���o?�w&"��=�S�1�rVtX��}Q��¥������>�JH-ǝ�K��1�݃0>;���qrU�:\SYh�1�}�S`�m]w;A���S�vRs̵�.�����0h�s{~4SHf��Uv�觗�x[� c����:ey��^�L�Uä���A��3��i�nG�¬w�G��a�`��7'zs��AM>�Ն�M<�t�7�(yL����3+�-0��2�r�*W��f0�-�D$�X8�w�����C���\W���0@9�L]7�|LҔk�(���H^e�'f���w0�eDWm�m�b�%?��p�FH�<=���q�Ά���3�RsC�_г趣�ƍ����Q�]��Fg�r(�ܔ2ǫ��y���A1W�͢��i��,���s�g�e_Py�[��Śr=6�0yI��>`ZB5�-{�]}��:����Hٍ�r��He��Q�����S&e&JR3�X%��O۲T����'$�S�;�K��T��nc��������ek�A!�@�*��w�7;����nd��q���0G�s�U�ԃ`�L���k��9;�=UY��]tkM$�҇%��&G���ә��f'������Z`���/�gɀ���?�S�o�ұ�:���LZ����s���nd�/�8Z����m�t�3Ce6��B��Ć�߸�f[�˕i������f]̍�خ�b�a�6�Q��*H��ܑ"��\`𧽚}}ï�qbhH�@�N'�Ǡɚ?�:�����Â��������ru}`\�H)�SH���RO-��@`^���*VR����|�7P�r6h��ۊ�GGR)���Xѿ=�{��S^�i��v�S_�d�݆��u�؜����bDUs���^�����-�EJ�����,�w]�Ol�~�݋-s!�߅M�L�<�Ű��B<A����H8����H������[�2X�$G�4Զ:�D�m)��a��Nb�"���6 �Lu9.�e��2��E{���̶�5K:�9����uL�\���˼��C�j�T�3H�*ӥDG�g6d�� �W�#�b�S3/a��IE�~����s����������3�d{��m�p�T<:�-�6 �f$C��+WV��zsű�6��\*V�W'oh
)oj<	�T|��&3��AI���ڸ�r�&�N���%?���i��hXr��Q�%���To�`m���P���u��i��2@Bs�bX}�ܣ�:�5�f��r�V�>�A��y$���y1-ԟ5���#�0I\����I    HNs���рEb��U�$��a{ܼ���%���ӽ�zb������=����*���C�Y�.�5�Q�\c�kC�7�(⵲��O��տ�UT�{I�|Pg6|c��9�?��r�>Ř���sgs�و�8m|Q�%z��Dȿ�	�-´����bWGT^\XŎ)}A�.�Ӳ���Є�[�L���D;��I��L��܆U
�Țo�:�:�8���z�M�.g �=�B��!������Տ�˚gH��{U�u�]I���!�_�<}PV����� �I��^����� ш��g�W͂����1��W-���LKj����4���e�r^~�E]7�Q�3Qn�;P�� ���/���H7��6�kE�l��&�� ��	�2]٭~���6�Iu��EI(v%�� V���6t�Ə�G��\T�q
a��z�/����N��}�� �|%9��4��#k�J����ԟ��1��h�d���ADK��Yh��d������@Ҹ�W;�ǂa�>�gw_l�Z��Z�9V|�n����JBt�}m�����vӉj��G�$�~��:�r@�%�4��n ��zt�@�Iw׹����c�>�z�fpO�'���q��	YOBٖ��M�G�؀ɾM��0�p�0��V��a��K��:="�8��j񷎀��������Й���8̳��3H�p �2���9[����OH��׳$���T%1����e�(��L�5�>��N�9��KV���J���Ӷ&�s��|8V��4�R-Ӎ�����@�0:6�ˌ�@h1�0U������K�iY���]���	&�C�f���U�	�[��ˣ�ys��ϝ*�(��lER�t?�Sff�A&�>�MO����5��iM��dZ�Q�rˆ�:��I)�_������v%1ߩ�/j<�'�*�VEњIS�>�Ybn��i~O��X��yCC� ��a&ѭDE� ?S����M+��E�|c�~6@Rr'�����٤#DU;��bO(_%�7bv�]zڣ��+j�0��rk��"-ތ��,v횤	���0��|�-�C��xi�:����"�t�i������Fq��=V�^���/���z� ���d��=p���C�L�	SsV����Q�&N$�*���}�L�@j'<g�g��
����F�n/��"����uhb	�t�P�	5N�����ɾ!�%�3N�A���m�%t�����L� <�C,���V�^ƨ��v.�H�Yq�S�-��j�]X
rC�3���xU1Safr�H�o����>X��u�+,t���5x	w� =���$*���a;�вh�}c]Z���*k����<��ý�������(������7r)[I��V��,�
4�#/�I�kz`�OO�:@8 m*n�g/���ü���^��`�@�����]Y�~^Yt�qX��l��H`��`X�7������y��ϞX�18��U#����E.��YY�Ґ�;Q!y���v�q�jD �����6vɾ�s�BC��aJ�o�%4zC������:|���TzJ�]��gM�w��s�?���pHn�Ϛ�_e��7�� �5:�g����0���q�В�&�+�K$����N}��*sµ]��[�)z�t���C?��&o�PGw�Tzi,9a>v�t��Be��{�6h2���-{�ZL�����ϗ�i��~��R4/ŋ�
H�I�s���tz�އ�d�ʪ|=�A2�	�k!�;�ɑ�(W��~���8������\��i6�C��In��*����v�p������`�Br�D���2���U��S���ޣ>���3��;�f>�Uw�۾�e�X����Xsv��N��j�$/	(�r`#	��f�Q�t�H��|2!��j=�Ɛ�����O�SDX-'�hೖI�ŝ���9�5p��j�7�!�.2U���V`-f��4ύ-�h�x��q	��í��HaQ�T�k�]���ґ`!�㌒�k�opLOb2���~�x�*�f;�1�0xi����/����=K�� ;��Le���N�A����K4�<U�6e�^� &0[)���͞���~k6��^�߁�.�z���rQ�Q��zy���}
�A�2}.���J�xm�mF�D&/�CՎS~}i�b��:���,����i3���,X��ސFU6�Wy~�R���7l�j�9�e_�N�|u�K#d�
�q�8�B�E*�P_�����aK��x�0�{o�����b�z�@r��Y�_�Bر�Bm����� ��щK�)��W��P�� �ɘ��i3�BNb��т����P�lU�P!�T	�3�e!�ݗ1��x��t�(%�ʜ�vRk�]hf�捡��^oQ����SN( h
��:��V�B��5�1��h��2"�Y�>'Ӧ�p���~���[�A#%��3B�2����O���u!�/�BkU�~M޲�RԵ��Z��+��PqM�[� ��6H� �O-���U�zа	��𳪫D�a{Uz�,��Vks	z��-��؂]� N�$`f�S0�ӑ�:乑��
�aҲ�Q��S��<�§��73����q?l󖫋-Gٱ�'�p��̆�(���j�pg(Fz�D�6��2F�V2?ZVH>���wj�H���E���6�rg�6Ax�Vۖ�S�`% (����s�ū����9�5Ē�PC6}_������ISa�Ϭ��i�0\�/:Dm;����/.s��~w,���r�Q�&��zkJp�:���� �������{�ЂX��y�V�KLqC��Z���F�.ޑ�����BВ���Z���e��������/-AQ-:}��槼M�I�~�2�Dv�&����8/H\*���?�\��=������Y�ʚ�L
��R^�;-�(��#�d�D�C�3�Χ�i�t�/��ER�-���䢧�x2�N��{��nU��_���ʬ����Y�k��jJ��i%�P�퀨f!�]�A�Ά�-�;�%�3/U�܊��,�O�*�M�DT=��頊���#��3�0�/C�� .�GZMc�����$Xh����h��X���bX@�*Ce~� ��v���q�TnPc�d��LUT��xŽ�$��)��jOV���K;k˛U���,]�O�[��:���e�Z�LVҰ�8�� �4|qF���p��j�W3�%�+�t0mJ|:�b��?��S��w Xj��CT�)���V���p��~��F�'��W\�u%G���6�T�����q;��u�j�7��W�p�7�l꒏K%�e�%oT��qP��{6h߉�^�B���A� v���zkL�A�c}T�>�N,C
߻�y�g����Y���Ǎ�䄴~f�lhK_U�o+�a�،*f�Zh,��vڈ~������N���y%����O�xtOt����0��n����3j#m5���� �7�e^IZ�����h:^\�u�!�o�/ҿ����Ӝ��ʺ	�Ǉ��\���Uzz�6<��(��3�}�]vY�̘��������/�v��%LTu�d�U�XT%��zI����P������!�n�}U]�����i��Tt��?Qn�r���k���oޝ�&s7}C�f�d�
��W�C9��?���/���TNq?�n��@��f���8۸�>A��(N=����g�/�"n�]���n����YL-�+�$�����A�陿q]ǔ��N�$�5��U�A�F���o]/�D���t���\�G/����4�(o\�ط����IJ��{ܧ3�x�p<N���I�)@\��̰dzaT�X�(�n$�Nk���/P�'o4���FZ_z�ld��������v�xw����iW�َ���+k�L�� Jw����n��n�FU{rX ts�f��{ڃv�j�o�2,M�)[
E��-ju:4�9g��.�nl_�
�䲊�._��}�g+�=�dT���]���nR?Ps^�Q��#T�(�qOGs"���j�1I�̍7RAxŸƢi_\}�͆�~�h�i�lO�S���QKl �  ��ܜ-��-�7���7��>���f+�;��h@*# �j�����u��}K�t�Ι͚_���}a��9�E���c���I�2���`ߚ>��lUH�p��ga�v�x$����	��mjSc�������39O,鞔g����
U� �fjW�|Q�UFd�w�<��yZ;_7_J��b�T)`֭�f�F��<���x����5P-*Ӷ���U״ܕ#w0��/ӿ�,x���+q���:�1yc��wmdC�������2h�L�.T��{��m���(�^��l�*뽚@�,�m��ap��x��l�7��_=z��4e��`Zf? &`�jt��m),/'�¦����x��3��o��\�A����N��*1&�)�}�{�-]�|�zJ��$W�L6%���: n���#�-�B�����3Өqk�s[}�O�� &�B������ܛ����ҎNGȉ=��_9�r��<:3�Xr.JT�5�����H)�l��{� 1I���
H�*'y���c-�0�n��;�z'ň��̩X���_��]�8W�1G��(T��c=	��|7j�Z�-Kx`U����y�<z��S������R���bF�{z0�N$�0N=��[���H���g���&r�t���_��?���i����aw@j��b|4�eW\WiC�����Aq0�ă̡��U��]����R��M���_�x���,-�Q/��Р���B��l2��0����sz�>_��� ���*�}4z���s�l�1;��ڻw,/�U�8��������FH�J|7�Ŝ^�ۦ��]�N�[����P�qP�`
�q�O+�]����}�����M��I���b=������t�f1�v��-��y������h];�|�viʉ���TLc!�i7z�'�i2kd����**o3j��<��ek�rk���+P�ZǍ�L����."����v�]���:ÝU����9!4����A��(33��Dӝ7�{^�.���YdP��z"�օ�ҭ�vL+�m!���i���*{��BS+4�g�K]ppl�W��,�{>Pl�B���G�70C[� ��W�b��W��C�����(0����P������ާY��ܣ�{(�DgPe��'(�$�y�y
u�
��4�?��}K*�c����TҲ�Ij:��Pk#q����qj�M��[�7��3�ߩ/Y_�o{�� \ ���0���Vt�.]��}�[����"~�+���;���ݢ�"1�Re�)/N� �Կ#A;�����J���Ϛ� 5�wb}�<o0J-�H�r�Ƭ�m\v��=f�2I�-����;�BWe���@�cD�P��lW�V�v���:YG�#Ȫ_3�~.W�i���xP�%�,P��AV?�� A*����<}^��}����}lJ=�0�w0�#�Sub����2{�;|/�1p�FebA�օ�a�����Ή�/�6���Ι�+�����J!]'����� ��Sd&�b'-S�d�+�b�+D�m���g�^����uv.�aL��eX"������4,lw�ʸ"�l{P�k��~�9�y���N���r�B�v��|QTN{5�fm^�H�M�������S�o��Vu[�?J!�i�T7{)��e%&���ٗÇ[���{o����cO����X�A��c�T�e�;O�*�T<�R�z��,k�{{���!��@<��J,�Ǜo�W���$�{����se�l��5Ec݈+�_���V��`��iW�����,7�N֦�n���,������i$����	.y��[�|F� ϭ��X�H�3u(NT���;J���բ��	��k������A�|\�U+w�k��Ё�;��X9W�������7���{�t�}9K��<:�N�,�m�e�|@8Za/+@��&,����i�1YG�A�6��_StQ�g�+��d�K�7�ݕ؍ð��Q���C�Z�vuw�ߣpqYG�7���Y�˲��U��
ۮ���B9>ٻ�ыQ���<��p"�
E]�9�.t�p*�i)������K@l\�;�{� 0ђr���ҫ/R���É��u��>3�Tk? �}��o�̰��G�������T_��ȵG����'P}�-'-@S���Go���~�"l~y��QK8k�3�/dF�]O�c�n���2�r����6��K<�suƑ(�@�2D���Ʌ�3�0}�8���X�5G�fm�oSQ�6����*c���]��Czy�� � �'r�H�����vbw��}�+*��L�z�/ʳKbF�㚔;�m���A�$uFn�C_�K�Uf�"{�
�M��������`(USA4g�ofN2��>Ӭ2����;k��}��5���<%Ԙt"Pf�ח�5s�̛/]�=�	�K�qCU�3יI���.�`�׾_�'�( �Z� ��ݥ�8�st����ʇ�E����P��g�1Pųa��ޭ����7�~*������R��O�Q���ƨ'3mic�K)HR�l��N~w��QtHw�����Na��y�(��췣H��S���a��F��1��G���1�5�Q��b��q��gk����+���KP�/��yC�*,�jTOW�Oc�1e�� �h�1J�Q�s���g��������j�Gw�����+���Zzf:a��t�}��᷹�ɯҜ�1�-�u����K���^棕~���5m�J��	�7_<P��r^�Zo�q�T�ϊky(�W0��'w�8�n�N��,�x�O�Z_���,t������V.&���NLͨ�L{7���P��s�Š��H��9f}'�lg�����R����u��.:�gjҋ�����B='��J�ȼ��%�7g�E� _��M�0��O)ǟ�L�Y�?�vg_ �{�Qμ��)��'ua���M��
v��s��ft}Gz�cg^ڨ���˛�FX!�/J���Tc�J�'�3����ͤ�Tڝ`W��.6�z�������?^��      �      x��]�r�Ȳ]���_Ё���)�Vے��v􍷁�2����d���ɚ@���+GXPC'Oʳ8z<�W�/>�����~�al�U�_�Uӵ?��o�?�,�n��'?=�GW-����F_����i;���{�u͊G���>z⿚=~�Gw㟋�oy���v������>��/wX���:zV[�?�1�����*��q�w�?���jۮ����um?��=}��������?��YN]��Y<�������l��0�k�q��~����~�u�~=L�qt�5���/n�����fמ�8�����xhNx�L�������?����fF?����Z��o�u�<���t��)�yt5����[\m��3�構��p:��A�����=p�f���Խ��bٌ#��w�9��qu�/����{N=��w}���o�)𾧎���n���c���xâW�������k�wβ.q~�m����x�w��Ż~�;Գ7�,��,���ǟ���H�z�D�$���n��K+ho��ߚө9'R$^�նF�<'R$�G�ʸ�[�X$���%�B�\$��-o�?LWd��E_��z��Ws�8���>5�]k��Q)8�x�G,��F�Ŧ1to	^�������i��o;~Z�[7�=i��L�����-��\��4�'�_|��O��Ҝtq7`s���)�P��X�`��8�����=�H��V��;{���3������g)y��iZ: (o�����`�H��ġN0R{Wg���3�i�}�����	K!>�B~kW�a\`]�N����)C!0x���E��W���iI�nX�A[�H�}�^��"S/�x�MZ{�+n��-�-�_�w��p��� ���U��u�-@�륃'$E}�=��E��}CN��?[�Y�����M�>�G@��#ax���%\�Rw~BA��fǙe��}{8�m�,S#=Z��'������2r�ǹ�)���(yYD��waH�xQ^�v��U>�5%��q��|�#��V��ޒ7�N��t���kI��~�p��	<�e�Ő�W��0�tmK�7�u����|�4��y��C׽&�|�7eBAO�� ˥� ��CK-�/�@2ۃ+���=n��?�S?t�/!ec.m`��]���U$5����5�\(��?8n���n�kW�߰R޻+.��(���-g��o��N{��N5;��� �6;���Ro�n"���6�ر�;�t��1���=p��Z�:�=N�^*��j8��_TIH+\�%�����/�CȬei-K7���:���	���}/�A"��ð�|ZF�|��/:���d,78��}� ̡}B�o�F��K�e���cK��؟�e)3��������-B�I�p@SY6�Οt�}�"sщG6y�AV�w�U�~,�2(��]]��Ax�U��;���S��������[���/�0&�J:�5���]����b�׮����8��՞�sV��?a)�{����-�u=4�|߭�-ΏS��<KصB�m8�ՙ�:J����9�wI������� Lʫ�P�+>�?��rV�/��OH��=�XoV�ZW(�[|��g�q`oF�m+�!9����^T��td$�\	���"�dE�q��SuO�נ�@Q��j 7Nt�J���C��y��j��\���Utu��V{_�Z.�[��^�̓8"<�O8�x���`o�%y� G��q��Ѿ�7]��M}_���z#��D~Ot�B�[~A,��'$��/D�	!�@�F����\��Q�#�9B啁��-"zˁ/�0����L
���
xu�-�.tDi-}��98~/�pB<Nf�����b ����3�E ƹg�bO�q3t;�E��4 ���v� �k�V��
m���"��B��E7������#z���5I���֮�����هBwG��nz��d�S��2���c�R���7��L�;<������W�{�{��k
/�!��쀬>����g:bk3�LN���w7�\�Ӱ[�6o^�R��}櫕�Q3���Pg��λ�{�pD�^��Rp�*�E��P!k��d~�a@��7��]&�,� ������V����`!��qmI`Bt�x�_B���6*j���~�Bq%P��s,������k�%��R������{����n�w>���A�N2͊������`�y�/	̆$���M���&0������dd�a9�@��E�����`Ѻm�pM�p-	l���8��3YM`?nx�n��Yh)hu�-�������(( |2��6b?}��y��!���Z0��'��-�(� ��\�:PR�j��B�0k;b%D�~^B�{N��sۻ�^�3jA��/�j>ɫ�g�΅��ivB��2���pR�@|Ϥo�z	�Upl�$�ކղH��"�ߺ�"#
D���ؒ"��-^�h�~"E��Ā��Hq!��X���?���R�R��H��7YT�'��Yp� �w�g>�Q��⥴gA�@���J��G8_�W�"��R�Vo �V)�E�:S1���ʌdI��"E�'���s��8Wa ��B 
����@����ĥ���y��&w�Q <vr�/�s��Mcc@wM�	��= �U�'�D_T�	k���Yr��-�3%If"ۅ�G�.�qo��4
�1���HJ��O�\�  �G����9EO��@x06�&@�M��̍�3���#��ŏ��<��4���|��c{ =��j��~�nI����c�4.\��5���rZ;�Z�/����"W|���!��k.���!�3kQ�Yu�X_�F\�B��-��tu��߶�(����aC���֤07���7��������/����D`�qAB�*Q��8e69��1�D���]�&.$-'ܬk�y&j�� ���4)��P	]�Γ/:��Ւ���ض]�SQB�[f���p��k�W�����
9��s�HX�򫜈덐:爈H%3�{�'^uMX.S�2��ŕx�n��
qrt�m׸�������|*1!lVI.��:Nؔ:V~r.��<����x:�Re+'�ǒcr��	��/����\�p�n�z�B\��?wG�u��y����v����2��58d�нĪ�~��ܘ+����(��L�"F� ��uV���� ��#9���35�iNܖ�:3a��vo�D˓sUf=�%���
V����h@/y�OC�7�f���gR3u[������I-
R��zy�v���'�A��3�IC�)RIv_�G'g승$[nR�i��x�*��)Eb�*{�)@�H��᷽TM7Iwe�K�:�$#�Ǩ1e�pk��+~*�A�q�i��$�#����NR :�%k���PN'��}r���n�7I��qiBd��ϧ�x�(%G�/����Th�������zD �*K�)��܈5��M�wh8�'��X��aLC�%2�+�'�F���q�F�I�a�(���B �s������<n�9��(\�	h�u�,�é�1 �*���
�$�d�/���Ku���p�yKc��?�j=S\�!=�}���>M��h$���l
��Ǵ2C��rlD��l��/S*R���I�ۢ��>�2����
�yMm	�nV�t���zKb���]	��:��(pU�q�r�9��`��� ���Pʬ0�iy!)Rf��F�
D��H���
���]sm��G��ѱ�eNX��5*,��M��S�V+�о5�}H��'�IGXspįc���N
�u�9� R�V��ퟚT���� �U6�iX�CG���$��Y��F28=�q��:r�e�QL�w�O���Z2���"Bj��.4��U�6XR���$;F��1��>�{�OCى��P���Y�ev��

k� ;嬺��e���@���6��!J�b��+�,;u|~�p�ӑ��<YK�%��\pGߛNd���	T��`�Zo��?�sQywp�oS�$�|�~��Ę4���,H�o�k*� ���E �VvF��1�U��a؃�*	pO�0Le�F    8����I>R:�J��M�hnv���'���N�t.6�jJk�L��5
ka�h󻟇��IK�E9��v���D�#���m��}��� ���'���agcM���y��	�މr�y ��P�TS����P�q���4���u�0U-!�3��6�kk�DO�^���2Q7Gv7�{��:]3U�#-t��AV�_s�Tqⱶ)���֍�#'U���W��Ei�������,�u���q��=]z4ѱ��v|>��S� �s]R�%�$�W���~$�)W����"
��[Oԗ����ZD��i�N��^0�9 8��^ȴ�y��2u*��Z(k���"S�
VNհ�|����0�;��<G-�ϼr�US�C8�67g�$�E����&���MF����`�*m*q  `�[�&�3]m���"N�V�ֹaeo���S0��Nz?�\C�����bN�׺d^q�!»�tu��4qj�al�Ӑ�;�N#+���E�#➯o���(cK��d9Ba	 �y����D�(�K�6d��X��xjz�x�1Q���l�PV�diTp�L���S������J)��-�6Vh<r�����nd@`۩l�WpAI��~96k�p1IM��H�;�e�{:�j��'M�H[���j���h�PD�0U���Dh!�
_	o��@�V�a��f+Þv얼���I���J,��M�ڿe�[O*���T�L�����iYL��G���.�����e,	���ͮ�*KJ��L6��r^�:2�l`Yf�#�Hv�%(s��/�>�H��&N/0JeY*��B��GJ�8WY*R��S4\���>R�����YjJH�5nu��C�����D�u�թ�6��MW�8b�
� �toof���!�//a׫�F�1��y����hE.��)A��vӴ����ťi���k7:�p�;7��I/w-��ׁ1U���z)]��NQ-��}��7BQW����� l*p|E7B����;; ɦS~8�v<�Y��i�����g���u��U.�҂K~���b(A-����ymh�~
U_�E|V*��n�p�'s��a-Ztz��\T�P����$Wނj�*Q����0a�c74V�_����%�>XU�$��������b� ��q]���Nܝ�����r�NM���Q���5v(���:�Ĭ��*b��۹L2�U�%*"� [5)�������{�uixkE�% �_��2N�|IV���n�p�Q�������<r��W����e��Wk�8���Wq�	�UG�w�գ�2��q3U,�*�'g}�<�,]�(��#�e�����DS:����e��m)|;
&�ʊ�i$�g��E��ϗfe�Fj{�#Ka7e�B�K�β�s�x¬>3�mu�T�c�Aח|��`��}I����C�yj
K�3�<3�������$��x��<���*�o:��s��R�Ʊ�ӄq�u��ƫ�d�m�Tx��K�iJ5���P�'#�^~W5�a�ݢ4�4���z������c!����}�) �������t�r�
�/v�Rc���:U	�dU&�Yd��ؼ6�n[!� X�<�����K:��
���Hb��0S�vXa�QOC�/�x�LT��˒���&*�V��j,g���u�.�Y���c�2�E*e�1�<���7̌��4�8�Z�FʆzH�\��X�HS�/���)ɲ�;�E��5��tº5�;���Z�15���7�M������v;UlG4��V�� ƿ�߹f�Y����߹��N��6�Ѕ�4,��W'�q.k֫���q
Ȱ�*{��҈PeRB���A����.5��O9��}g�z$��o�jD��u�A,������ /�J�*8���ZLa�[Z���Љ�Iޭ~4����q#�@U�����;���rj�UMϕ�g&uds�W'��{��mZE�����|c'#�+%�ҹ_Z,���1Uu��1��YQ�hqa�DkU �KU��,+��?�#�Hh��\�ݢ�2�C8.-T{*%u����ge��~��LB��:JYl~se�	���N���X�c�#��ϣE9��p�.}oH����G.�,��N�;��K�;���)a�*�J����3/&ͧ��`�fE�U$���0�Zi�:V�2��a�e�Ҽ2��� +���"G�ɬ�����T����@�L7.�H�0�V�!Yw6j��~!�M���,U�.@�gɌ��>�Sr�J�e"�"�ʳ��{+�O��F��,�	�����I)K����H�M�Yf����$U��g�r���3�̚��Վ�'0�T�<������Rd�*�gm}���"{#����t<�*����O&��W�JT�~���X�x<4+>c�=l���U9�����[ �p=����V�k�:��ˬ�3��:�KN���ؼ���$��%���@ɑs����	Wg����wTU
���_Q�r�T��I�D߈lm����-��y�{2��Ǆj�vfU�׃�������4D
	[�_N�m�9Pw[M1��M�[r[�Ui�>n�y�$֍Z���S��kV�_;��$�L�n�*] >d�7p�)n����OM����gY��f�\�����ab�+z�w#���"HX�_�3�@e�]��䎌�c�-�����3��L𹀚�t��*�qC9H�$��U���4M����K�� #N��:@-�v\��,;N#��Ʈ>8�]y]�4���F:��^��4HwM��o�N�V�WKvٞ2S6�F.�W8��ř�����믿.�B���	�_`a���kZl] ��� ^{��"�-m�"VĔu�^�n�_��A�������C�0�C����9 �Ĳ��Բ����9���:�P4D{�S�.�X5&��8�FwrKr�3I���,LR��M�؇�i`M�`���?�T���m��r̢�D��]�T���'�N�"x��(�f2�R[i*�1�iw;j1ei&ۍi����\�����q01m�"�aX�K<�ȮMU�4L̎��P.�9����N�zY�K����M�M������:
s��q_t֔EAd�M����S�S����fs�͉�!��A��gSZލ4�0�C�D�`G/��o۟���n64`�s�M@� %~_��7n?n^0������ʞ���K��aP�UYY�A�7�=,梅�U0�����3��*�/��9`�M�����2;>*G$,"5�]�k>�y�e�'�,�;���T��$=
9: �W���$�aݪY�'"a1V��7���frn� �a�K������`M�b3�by\�2���2
�0�s)˓W����$\�'
��o����[:u�@�|G�2�G	P~{��.|x����@�j��^�SFU�"�#e.F[�dˎf4�&L���hd�腠�Kx"i���P�z��BNn�/|�a�9N�><��.�ОA� ��Y�,���eӠf�7�����.�:��d�\Us��iB�~�2*_))c*�ٸ3Q��P��b��:�R��IՐ#�Ciq3C��i��G��A�8s��
���Rq)V�`��d7BX�p}C��9��e�78���D�,˧&������Xv6��_�L����N5����#3�ٟ�c�$�]�ϲZ���)�vE�Ud�4�r�D�,L2;_C����!��)7�A�F�[%��</<Z�Z���[�rS��s),�9YT?��F�������_���)gT�!�*w�gG7,�'�0?�bj�t;�����{C����h4�6{+�jDW���	dªj�rm�s��?6ݫC2 ��#�%W
 ��hC3"�χpI2�*'�c/c���r��(K�R��� ��ܴ-�jĹ�Zp +�ɥ�?��(O6��Ƌ�XY���u
,��?�2d�T���q�X{V�3�JyN�%p�S1���������%�{��IMw�n0�L�������L�
N�I��S`�\����+�������`kڴ���|���`G�HU�0 �  Q�־JiN�=E���W��+w�&Ie�2��h�����>K?��?�T&�L(tǚ3&!U�^����2?����-��nT�?#g����t��&�8��	V�B���uq���bfu:%�.es�_|��ƔA����S��RB���[��؇�TAsh�7sQVS��V�M���܈u�U�̠��Y~ \�)�&��[���TG��VO�R|Sֱ� ��	�4��*Òy�Pa@m:�di���L�XyYh�V%F�#P�$�����_Q����ЂY�T{i?K���z*Q�q���pHV�˞�fڙ��췸4�D�F�jd����o�L��^��W2��Q\I|"��/���1c���zw���	tO �y������
��Ԫ���9��nN�E��=�A��XUL����������?��
      �   �   x�U��N�@�ϳO�'@l�9��*��"��lg]�&��=��ެ�7�-��V4rAfWsN��V��r2S\weI�x�ٳ�73�.
�B�w��u���G¥��d�+s�~�;��#��d/Ř��O��#{��P��R2�{
ن}�,k��R�Ꮫ�r�H!生�S8��y�v5��38���4������n���!b�5GaWx��Hc��c�7v�sp      �      x��}Y�,;��w친\B�~�8j��x3�G�wUVeT�e�]��(e>�߿�G͏�r�'�_j����C�Q�!�QK��K��r���W��o���k[j9s3˚̲Υ���K�2~�V��%����2lEm��N��/��|��¶?VZImKZ����?3I�r�,����L��u{�\e���횓���vπl�Y�P���S`Z�S���3�?e���G�ن��h���S��?�������a��,VV�#w��`i��C�磶=�f��IU��4�b�Tu����nn8+���UQmA��b)pL[���8|W�Ş������������_0-��[{Ib؆%�������?�HC�����n�؇-�XP�����;=��������մ��� ��j^]W!�w���YS�����J���[`�ڷa2��X��c/��z5�s3�q��c��n�K>���F���y{,�X���>���<�Z�Uk.4��qS�O��i��鍏�c�����f7�}@��l�t�rE,6�W��s���m����Ľ���U�Ѷ]}��SB�+b؊��2�/;��~�L��X9�W4�K"a�}$���^�:^�!�k�N�u���e�a��=��l�(�;�gԻ�
ӵ��đ���G�;�F��x�ש��xY=>�?�4�e��B0-{���|�Y��u�f�
������f���3�6�^F���ov�S��������v������7��p�`ML���
��M��ѓ��ɪ�>N^X�˿� }޸��������{�L��Vb�`�m�������cXlT��_�o�W��Q��.���ǚ������=qZ�?��+<���M�l�=�8W�;La�O�}r����Ӻ�����b1��2�!��{�����a	�~w$��B8��|b���M�����} ]Gj��{;6O=a�-��x�흃�-�S4=����ۂ��^vaq������8��h-�>�4�u5%�V��(%�bێ�>�3\'I߶���<�>Uk̅݃������?�6����L=�a�W�hܴ2a[�Ncu�}�<���,\�|����.����ͦ��m�%U�/�u��9�ۮ�I�'n"\ۚ��R���y*���6�9a�v��5�;��s�;�8E��\f�e�vv�tZ�;�t����٘��i%��ӟv-����Ǩ��4Z:��sm�L[=L͉؟{�J�����02�~)��*j8J�������L���!D�^9&��2Ř��m�:��[ �=�$�[ˌa���6�����M,��%�|���eX��{~��K����C�vKv��UU`��K�)ܱz����.{ݻ������י�����A�ݠ��{܉ÿ�`�XL	�F=wd�E�,f����W�-\��f̱���,�b,^bNx�si�/��T���+{�O����N��ӫ⛮�@[Q�`Ŧ�t������MM�`[K��b�S��z��^���}�l��ve1��3����i.0����]��P��u���7�9�nk3�f
�N~u�,��>����3���a���o��ݘ�7D�鶜���0�q�N�[ST(�c�G1C��O?��ø뺀ϖln��=�!�T;k]v��{�t[���w�Lt��m�9m��\4Uh�a��q;��⮏� ��;cUˈ)Ex�u��%-.�t.�1�X?v-��8`�e%�<�{}��Z�]D
��셎E>�E�1�Ҵ�5�4�݅e�q�7x��H����a�b�rv��/�k�bj~���-�d�e��yo���[�Va|�>2H�a�F�)%th���y��&[ӭ`��Îq���k��?;�v[����f.�¢F��ӎH/�D0�H��}p`y����	7Ay�m_��D�c�U=|my�8�,�:k����o�(>���-������� ��x�S�<�O�v�vO� ַ7�0b�֗m�8�{��}]L�o;1U�~��ɲh�=�с�1��&�D��i0R�����>^7s�g���>W�Ά���^�G���� �9�K�SO%0g=�v��N�C�#,��
PJw{��Z4ޏ��-l@���Ӈ�[Q�,���C��m�yV~�:w?L�	k�\p�]XJ�����ٱ�gE8��37�Vݒ�ȃn3�=n�Ai��._>�����ɢ'J<��^>�v�m/^��"�'��&ۃ�>p����*%�[��	[��mm�
��/y�
L�?ؾ%6*1�����>My�7lb�{���Vt������$��R��\X��}xP�}	a�����Z8���rp���	� �-�}��p�@xuCvA��uM���\Í�@k�u�9����MNc�[*�Z����@�|��q��4����Ɂ	8y8��kDx���:SPBK,��x��	�Gt����;��m�d5�\~	� ��N:���6|��iʰn���~lGd��4:��V� �Ʒ1׈{����Q��������k	~�����O��(A�ս�ɛ�`a��o���؊�� �1=4�C;
�7��w06��(�������4��r�`h��X0��b�
�F�`.���x�z�2ѡ����R '6"��I���/�4��=m�2��'l�&<8W�ĊsUDX����l�'�`��vo��z�G���Br�XR,f)�YWb����=�m�qu��˖�Ձ��jU:B;��gG���F���7��,5´mJ�)���'&X��ζ�(H�lס�6_s%��������'K�q�e��	�7���p���q���b_ܫ1²|����6��)X�⛱&�peum�����(��`�����Fpd�q��֙+���S���/�d:�-Vs�z��Na+n[�+��$vB�Y�l������ZV�����"E[��q.�w*��nq�5��ɤX��=����w��O��<N��d�1]5�B^5�5#�+�_D�����gC���P�����C��f�q����4�^t���}4��zR`o�Q��S��]��$��t�n��އ���t��%:�k�S|�ĝ�~��S��P��L����R����������D؆��-�FJŏo4�T��i^�FwG���F+ó!XZ$U��������������>�ű���P
\����HK�gv����*h0�o-}Ѷ01��w��5��Y@iwZ�#[�6�X�S柷��������T;P��@��9�A��p�
oU3���EȐ�_BO�_N��{
��kP�T�!���[�4���g���1'���@56�A� Q%�eG�7��á�7Q��4���_2�� cӔ��] ����-�׌�T
�# #�����N�s�1#( �V���o<1,5�#�h/פ���)<�Y|�7bP#��b�?ES���U��:��-��Eb�[��w�wq�r�l �ވ+N��gh��s�Ȯ�=�X��+���|^'	v�5�XcO�
ns�{z����O�-�l+qǍ�!+&�	>m�G�FxTzV�VO���ϤKE�O)�3��$۽�ʪ^\cf�3m=��h0f�����vwiƤ� io���8׊ٖH�4ʳ)�a�D����0���3o���N��c �σ�(>�4��q��ګ��� � jTh��/�g��U��~տ KR�W��wG��+Ֆ�*�MT�D�6����p���? ����i���I���x��,�n�Y�q�U4��?�.��*y�w���|�m����\�/�8�^�F8GV|�0 ��ۧ�@uo���Y�YN-�Ӿ�i��.R�8��ԯ:�Ӵ�؟�"Vu(Vb�r�!�*N-��ǁ]�X�j �*H7� �_���8|���M�X��D, ����{�a5�	XmWo���zN4X�A^@zi\O�\n;N�l����r�������>Ǉ�xk��x�|Q�A��f��|l�������A��iQ�%|�^����.��Nf���J�5a�6sm��ܟu�t��Y�h�|U�����3��Y�f��+91����߬����.�z�\ó�k�9O�Y_~����Yۅ�m��'�����~9����:
�ض�;!���� v�(����y    �b�����+�\Q����ń�ҝD�=�/���Ș�V-��L�6pc:�W=�=�Ξ��Mw�1L�|�vM7�A�ñ,_X?�;����U�e/�N'��}��P]~xN���[�4��@�+$Zv��~\��"� ՝���|��K��i�[��WR���@:�K�[�?lI�on �ot���/���A��m�/1���1:k�x׊˵S�E
w�>�]	@���Z�Ճl*��¶+�GF!���r/�1�7U�N��Y6�aB�c��N�EWz��v�2.�g~����^q�NR�k��tw��x�I� #�����S���yf.v��_̓��ީ`$��y�������0]�}WҲ�lv���)=��Xg����!h��p�p����}�1�;����_@��^WX��-�j���̌����[Fo� �v#�!)b�.��Lu��׋	��{ʝ��
��b���\M�a�q��'ŀ5�#i���Z/��$�9��y����]�`+��������� �W�V0����%e�-��XzO��-^��S���(��l�FK�x%�y�z���a:�\%W��,q��Dr�|�7G���i_ �:�u�89K�l�s4�L��"4K���L�<g+�xo�2���u�F��W�ws���ci�ii�FI�а4 ��Z��/�4���'f� y��\=R���-��c��W�_�(�zi�#[�wb�?����f�$�~�k����H&MT���EO�drd�Ǯ�z+�q��1V+)ә_����;���t֢߰~+>�����$ԯ��d!���4b����a.���:F�F�\j�A#q�A#��Ւ�蛓�["�-����a�F��ͱ�C獪
˙ �GW㢮;��/����6*:Y0}�dv��?ޗ�F��-�4�r��m���~�Br�>r-d�U�7w���@
;�A��P��)Yt 7���w�us� �\ ��E؉��]�¸�@d9U��2#^���"_�ZYń1ߘ����r*}��L�xG
t��3��98���@�Rb�W��#f>����h
TWc����C ���s�X�v�&��r�Y8<�xB/g����_IH�u"�u\���*?̍��A�rr����?`��I~a)�- 	k��\<؂d���}ȸߌMHF.3s��qڨo׍����	4� ���gT.��8QI�L۲�_���s��T���dS���@]˶�q�z"՗�@�F%�vn�5�8��C$L'��L7��/�.<�G�ڂ$��v��e�o];�V�vͶa򼏛*�Q9�lȴM��D��:�vN�MXk$N�����@�{�T;���U+r��'��ߗd[������d/�����~ގ���VymW������ђh������!{���H�r���qQ��M�Oc-ϊ}@����2})O��`%z�58Zn��R�,_Vx���EPX��>�t����w����^	�U+#!6*����y�����~Hkhlm�.~Y�S�iO�;�7�D��ZO�
���񽺰��eY43ް{
����O
���4����,H>!���:c����O��l�ak$K�c��q�+V����@�1k�|��x�-Ǫ��Yg`�����.?�8^a,c>��I�8J����:��q;����Ď�a��fx���u��T7�	��a�҃=`���<¶ {��H'[�ǂt[���͉�1�QN��������{#��Sh�:f/LQ�*V��̖U<��b��J��3(��[��d5Q�270�Iu��'è$�B�퓑Ւ��x��M(�h �2|}3އz��
[3��\�[��o��4g�d��+���3��� ���٧���pA�g��I��5�ӯ���d�w)�n��±�5���̽�����w�2�Ȫr��X���FL�̳��j�g��w�,�����{�� ���9u�:{Ӹ�ނې��CHH�-,'T��Ǹ/BC\���_�?�Ca"��1[)���� ��IIʟu㽲�#8VCxb��#�嫁E��mGGe�[q��=�z|����`��Kt����:�+$;���C9�Ua � K:r�;+WL�sa� g�Hp��}����Đ@|2r�;�����3+�g��������b�zAn���AE��m�{�\��n��&�>WȺ�Ͻ�}�K���W��7ߺW�'��%�n�ؽ٫+�^�#l�e,�D�8�ݻh�ƹ�^ ��c�O�b �� �ރP���u�lO�������;9�Q��1��s,��h��Z�sÑ�l9W������#P��`{w�hRsȀ+-ܴ���Vf�U�|�zw<W�{��(L-�~�����P�d���[��Q�$��z���OC8Q\U�qQ?�{e��i7~Q��?��{;�U0��Xё�Ս��!d�h��	lG<¶�R@a��*�����y��z=�A�r؆�):�1�s�Q���#�I�%	/��6O�m���~i(��<��@���r�DqF��m�b*���W��e���z��:*+�O8R8�����
e j��<W/�z�G�e�3�b�u����S��ǲТb,b��嶂d�E��[�y��%̃@�M�E�ϙ�;hS�ê������7T?��`#Yi"]Pu��k�\L䅑�t�(k	�qO���@�-/�""�?�x7�� }�a�
n���.<�v{W��m�"1Z��XL[豸#iY3j̓�	�Q��i�+h5?"�<�Ʀ�rB屶qL3D�?�7\�"���Q��p��Z��.)�2���	^Op^����v"g:XP���O<9$�`� �>�R�؟x�qOۥ�cO\�*:�A4ȁy����c��>ԙ�ȷ*�KD[/�;�&�{l�q��P�ƍ��V��Fg��5�zy�
}��օ/������$ z�f»�� ��c��T/I��u�qw�h��?0��-ʈB���c?Aq�O�����"�t:�� T�B$~��;(! �eg������&�&��5�pc/$t��s��SN��JС��c��mE�u
�
��m�
1�ܢA�jw�YΚ5�w�7��A�y
u�y��S�,|A�ug5.�Y�п_��L���;�{����i<
�C�(^k���?�XrL2��ӆ��_�;��5��K\\�*���u+��(�T�_3t���>-UG �@�o>���X����V�*!I`�b�e\�ґ�j����8��K9|�`'��K�i��уe5��?ܮ
��2!xF��g��穞�Jã��.Y��A�|�K<����m�Ngjҡ��K�{���4�M�T�/3������Sl�U��m����"�uX
y	--�ٿ@�d�ka�_X�:�jAwE� ��-@�c��������Jñ�݉8�v�UǏC���o���N�t	˛�y�"�}�R�`>_�DͥE�����pՌXRO�=M����A�Ws9�fQPRV�N���x5H>��	R����b���$1�Q�ٯ5f8�A9��!��EL�y.�G��Zl6L�|���z���]s.L��5�����3�lϵ�C��ZG:>h�O���>f��"�$XN�
�GaCu9��jYX�7�r���v��]��d�㍶�پ����xk�aE�
�Ƨz�I��[��z�I�\����J���'��>QLY�>W��������Eܩ$�'��/���T1��U*�ks��~������QZs��`���K�+x�uϪ���n�$}�y���N7��p5����m��~t �܄�z�z �GOY�(0��/S�r�S^IЋ$��i����&)�903���-���@��$�/?��v���*�Ի}��î�i9d)�֯���%=\�VR����V�s؜�>K��4�7��8C/^4CJK������8s�;�;��+���Qc�?Z��Q��N������8�3�y����;��̚��T�k�ŕe(C�M�������.�Q"�Ì5�yE׵�a�����SBC�[Qq
�'�Q��$�����)~�Ȝ��W�Д�6��J@Tl��OL�w�,�yh4O9�Ԟ    ������t^=������tT|ĥq�t�yQWi'*�`ۏ�S�e��s:�L˶�����,^Y�#�TV��ʶ&F�t'hӹ�-������	U3�ʋ��+�p�2�#V<'�"�ǥ/Z����e��0O�IW��λɅiQa&��~SL'�w��v%(�:>ɛN6��1I�aw#X�ܓ��_w,>�
&�݋�%&�W\�'�4D����HT��ݘ�L�v��1O�����}m,�/����k��Եk@1i�G��Ro���y��P܆�&�w�X8|�����dZQ0qdE## �iF�$T��l"2�H�����$�IH\Bw��*�-�y�A<�	������5�|�����a�B �������~���e]L�s�	O�(��o3 ���Y�5���y�4r�a�&�X�9���P�}�kj������]���ÿ?n���2PR,�[�w܌T��-5�_��?|�����7��L�2˥�S�xz�[��M-fF`��i	���b
�}D���*a<��gƠ��-~����_��X~D���OpFmcd9"WrD��p�R��r� �L��#2��f���'ȏ��@��QY�7G9�
��AM�U�ɀ��%��r�/t(.���ճ7��r�3j:YcmP��l������|](��[�ы"�t=��{��蛪K�od�ɖK���\��U@�l���I<��Z0]�R���I@���#9�-�d/3F?�GaKA�SD*�8O�j
�������U�J*�Ba�V/8��f{C�^X���s��i��a�'�TU������~	�Q��,})�Z�!�ҥ �Mx�\�Ia�á`x:ިH��U�m��fI��]�*��j�fy��V�^	s
%�H�a�0V�d/|�����,���t���6�1�may8�|�K��`�9��p;_N�>"B�O;��u��C5�w_:����NTI�����l����C������C���,8���λ�����L��qyd�-��5�'V*T��G��$䴗�
N!��}�0	�����'֤�O,R�ۉ��iRe
�mU�,L���q�7����J�/����;�$\.!�������c�LYg�Xc=b�>Y��>E�˫�����/�`��x��mҔ�0�z8��* �ǰ��?�Ԟ������^���6��*1{�ј4�K�Ͻ��v�f� �����|��K��ڒ۾u�X�WV(��8�h{C7Ն|���滋%���pU�����v�w��J��4j���i7I�nE���iw�-����ʹ����u�zx�|ط҄���IN̵�4~�Z�U�|=��^Da�\Sz�,�Z�niښ4(�� I�+��������V����
_���2����_b]٤m���F�w��%��V���y:��K^$�]���:�%�f�L��Ȗ-J���w�RN.�ʳ��'�t'�.r̿��+Cy��\����v?����
���E��O)FN*��{!?5���ߝ�~�𷈣��J!��V금���)���"��B�d�ƏZb"!��x��[Ж���)�;���.����+�����"�;��d���4��J��+'`�e��}�F�f.�'�`M�P�^w;i涍ذO��[��?sh��&po�|t�.��^@n�2��x�U|O�C�yk�:2�zH��X^d���D��xX�������|���+a#�.��+���}k�� �ʔM^�m����OgAkQ�;�����76����j���h�{�T��m��QVsaңarWʔ��o��A�b��Ӷ[N}��
a�s,*BT��=sk2]�����oKvi[�
���ٛ<����K���np:�`�j�۾g;��~���� 	���N<;.��5@� !p�=y�5�v�ʤn9�O�=�VvO�� ��S�v����
��=ڦ;w��:��﷽�P;����kJ��ߵ`�3X�
 Eu�~ST�q�#����"���l!VI�{��R.�	ەӹ�h�w�ɢ�ҲL�d�S߮�S�W��)�E9���y���͕�&��H>aH�\�B�s�>f]�st/L���	���P�|rQ/T�ހ��z��W��"��DGw���/`$��F��K�oo���ٱE���d��v��	������ҵ3��D�?}t��˅�Ғ��h�����,��B�a�k�B�sk5n2R�`�y�EY�7m�����L;m���^o]��K��Rx#sXR	����f1*��Z�0#^�_=��H�%��O���7�fȻ�y�����u�1�m����+�V��L<��c�����m�u@��~)_]�N��ڈ|}�qwOڊʲ ��QIi���˵���Lnk�]l��������8(���x�oaN�kt��C�����y����<Y����:�+wP�/�����ۏ���r��D�����~��06�2oE [WI>L���/�R���A�ڄ/Sq���Ee_��>�e2�$�B�u�7�N.��E)�!�i�����Q*�m�B:B:5��Z���/|��b�2�ׁ픸�y#@�ygoKS��D��T�Wc�l��iKꨳD��?eg��J���P9�N�2�~����M�6���|�����y��6�.�+��$��:�fM�ㇵ��i��������d!Ee�iW��p���v~���u����u`�������������X��%��K��vtdz����	!e�ЧMZ'zV*.�<�\�"5��~�4h�VQ�Y=S=�7���kj:V'3&!��.A�NMHH����� ��ƧU9d�9~>���h?��p섯J��t�8);������ټ��l;P;��`�g��=���݇�JfTZf�d2��˳&��E]u���Y<��T��e�
��'IB�M~U=�Ict�=GXܡ����rGrr}�瑽}C�c�!ii}�rc���_����".���с	U��]��p�x�Q}jMv,v�Ɔ�f::��2��B�i�w�����Қ�3W٤<���n��B0U�;�]/$��8O�2���x�v�u:�*��)�O�P��W%@�w�7��FO2�0���W�-3xF�)�z����n�T�R-��^�rm[�냗�f���Ws�#>�mPk�����KY.gp�#o{9�m:�����j'�D�O��T4�$0D���ʈ����$?�s^'��d�:�s�э7�$֡���s��d��缷퓷��.�m�NI>�Oۖ��D��9��z�e�����bF�Sk����C�NR6�P���$���{n�4{��CK|�b}����-���3��s � J�$���Ą�D�cM�e�6���hp\��02%��&G�rph/�(n�I�J�h�r�Ͼ��LA��М�װN�SPAao�^R�-���C[�m\�{99��g`'�N�����	�qNf[X h�Y��<,�أ':aZ����e!N)���ql�REb�0�V�Jv���(�����Յ�Ԟ�L�0S_�� ��v��Pt[�K��<�����`[�W�j�~�,yTgMEa$�"�+��� 5�s���J#��'�:��u���Ia;[��ŒD��8�i�(�Y��m� �#o[��l�[�$?�	"H�ݢ�p~Tz����˅�Q�r) C6Ƥ������Z�����J?+_�)�������ad�+�䛅��>
��Eߔ?�q�P�T�V4|w^��+D��Ϗ�O����	��q�m��Ni���x�dΒ��k�ϙ.�W�7�]�(��I��R�����Ä|�+
"���C��z��1E�aL�BԶA#;�!��~�H]���U�;�kܣgJ����7�����+'����<�I���o9�L]=i^KT(l����pMV% Q��^��g>���*�wzuf�T.O{�@��HҴ,�� �P���rE���"8.j�k������Kn/��":<�+��u���zuѐ�>MVS�5���Ж��%����3/�����Ru"Y�:'�)��t���fIʢ�D{X�����[E�t�:i =�>��
l�F�b��N?uB	*C��Tu�NV;��6=�:_�n�i�    |�y�;4�!���ȟuݭH���ů�3�8]��om�!lQ��x'ݩ,aqKk�B�1g��#��?�Odݕ���_Z����&���h��rp~�~�N�
*���N�����O�_i.~sQZ�4��ݶjV�q%ء x�ςJEP7[>�X��ۢ�����ugLvm�H��)�ʹ�`�y����D_/?M�}l��e����Ҟ�(��=�B�\S�!��u]��DW,��oK��z%ꩃĊ�՚C[��[=u���L���2�������@�E �M�յh�Ƭ(́�~�B�dTaOE���ФpT�<�|�KӴ��0�0+��m��wPv֙�}��FSE�(U*(���/H���۳�ys[�ރ�᎐Hʦ�[����2ѝ}]W��A�^cq�x���,H�握8��%؞��������@,�䑜��u�o	��A��P�JAl���߫"!ݦ_�Գ���%�'��I�_�aW&8�14��dg�~��f�M����F.�cw1�i��n2/�g�G��4��<��E�,��H;���)�=	� �s��O�x�����?^v�e�����ĸ�sfB}��;���Y�)��D\���uZu�2 Қ�����~�}��jooTS8,�|(�Ҿ6��z�3�2��)�i�0���mW`��%p�P.�(~<o�A�jI�s�4zQd
�}Ud��n���_8.̡��}�X4�[=�(���'��r�����(��O/P|r�4z���h�q�Ox���Z�V-߻���.D`>)���������T�Ѣv�̽K�xx#ԹV����#�������7�W�b~�{�:;���RH�]�缺%������pj*��)�l��
�$����*��R.��)��>:�c���E*���ϭ�=3c�ܘ�2�0%`�Fr�:7H��x���a5�ċ4�Jϫfg{�u9.E�)��14��<���øD����"*��)'��$D��$l�*�*��dmLFX�䏎��8�sd%��;[�g�79W>j>���aQy�y�[�BP��ʤ���z�Sp�{D�O�-pŪ��|�>e�����i��,�)x���vQG�4�����\���ŧ�B����F���-�-���p�H�r$^�I�3��'�7r�>&,� !/�;����-o
L�|R��m�?u�&�$�Ѕ2�������M��Nt)�����ԅq��p�I�W��b�5Q�b�}�t5��l�n��x$g�|�6��FwW2GI�B�m>�Ȩ���M�������z�(Fy���	K�_)�=U����1�4��o5��eyh`r���9��Z�~�Xi"���S�P���UX1�9�p!�ɽ�g�N��S�_I+����gWoa��1�:P<��贫Z��)��V���x�@����1V�>qWq��~Z�GvX}I	[��uµ��6#~i�S)�Cx=�\6Y��qۼ��+7-�g��D���'�Y��+���/-�cU���a]z���ڹ�	�kAQ�	N���/���i= :���Ôy�������8�cee W�Ԏ��c��]˟���j8-�B�T6-��w�Z]�ٟvw���b�Ӎ���U	j��h��l����(Ww��ϒZ��yw7y���Y[�����ּ5�WFBG���|����X���}�-��M��~I����Y�2�����;�͛��|h�Er(MG�ʼ�b�� �޸�_T��YY�o8=α�'��XE;J\q�tp�F%@̡��ur�P��p^g��..�[Ob�5��!9������S�Z���&��cH�Ԭ"�|�Z��B��Q�s+�Z!���?��띘T��{Uy\�>�8���ՐJ����L����EE�����Z� ���	�}|7*�-��u�n�q���FL�bУ���-4T'0{\g<�`�#E�:i7ڲ��w�cb�x�?��;���PC�BE�� +9G�?Z ��xjY�xp��Y�7��0ѻ2�%m_ ?L=���h7�Ş\}XT*��N3@�E,�� �� �g>�W2�ʷQM��M���$�b���@��Y`�]�)����
,Wg���,�2��S>W�����G�Y$K�������WQU���^���sG�:n�Q7~o�V��)�ۿ�֜� L1� Q�O��VJ>Ь��,���V��,�k]t
Oo�/�`���t���}�����/�e&��]?iE���N�"��]�@X!���ʴ/G�WH�
)�1�Z��3&��]y-C�w*��j�(�x:٬���u-�8,���+�m5���QdS�Vqaw��.�A�d��n�ʼgj�V���(Hú(�����5u��^������)[���f���J@���*��	ۺb\�j��2�U�aJI�䌵m��
��5���3W��<N�^|�㡟�V}�I�]�+à��-JX,��1�`%[f�
P��X�E���a��kД��e[SAbD���������o=M����`��Ge�?��O��z�}��Q�`lm��O����i�,<���2��s/qC�������.�U��|�4?Guc%PL��2�M�fN/��$|)&���ft~짫�*���j4���R<��<)���s=H�˂�c�ҜR�yh�$����zJ��Q;��ұΙt�\d�ĵ�(O�V����|�N����|������C�@�=��z=��GP�`G1U��2���$�>�0�=�0�j���	cc_�.M^i�t�������p}�#$1~k����m�g]ES
�t��N_K�5�(�d�qXf?��A�s�\��\\��j�?u+.�UYL�\��b��l}�H)�	s��C�N~���b�#��`_�����߽��L�$tc^.�K�TgE+pX"!���O7�5{�U���O,��ʃ��"u��T�i_[�X!��zr:	>���N��_^�Q�A�4�M��w�/]=;FW�wE��_ۃ��O_ �6�1��0ǝ�
EU���a�굳,;zӘަ����'n�^N�q
�f�Xf)�k�c�WG?���=4���R�m��ȅ#k�
�0|O���.Rs��o�xI���&�dA%M�e+wQ�C���ۘ:�%��#K���@��wx8�&u?LN�����~Pܕ�Bv�C���W[�hvqxe
�@��-���E\��;��J{��B�C#�B�3s<�ҙ)��C��
?��NI��p8�ԥ���g'^����)�"��L��Ӓ����������dIu��1��W%�B�By¶_�b��Q���A�5��|3m=���;�����:������z���]nmuܪ� K�v9� �/���s��5+��+�/�>H�^^i����|ֱF���`�C̛Y��+ō�|U/�3�{mt��W�lۆ�:�>{R#�i{(6ASM�<UU;>�Ò9K[��V�-JoA�,8�S۪�,5�X�@}�vap¹�ƼA���aR��������Cη�#k�"��Ɓ	�|� �2� ˉ-eB���1�j(�Mń���Τk��^	�@|4<�g��k�H�%��*�R\W%�I�?�<
'k~��˄,Y���ǌc�V�_�guD���*�W�v����ָ$�W��2K�?��P�Yz񃱞��]��L��^"<�*�D���:.`��Z�ݝ�29�6n�(B!9�,/�A��ՑJ�G~d���ر�`B���9�`��'�ȧ+J�(eS�c�R����Dwrĸt<�~#��gyW���_�x,�xOJ���y�l2Zn�u0��%�56�_�i:*&5�FZQp\�����7Vf��	�FM�{pq@�,=Xj�/{U��E��;u����^��T��}��P_�$�׈���G��&N[g�tn7�]pӾ�.B:mq�9��ZT�m�sI�ۆx��#?�?��M_�/�GB�dǿv�-�|W�2M�	�x4�cA��2���B����v�9.�Q�,\�ŋ�z�v�V���=���qŕ�x�~/�[�ռg8�|fO;
l>W�@�!���wfW���r�8ZZ��/�*c�]�4�@O���X��{�&!��Ef��S�ȍ����z    d�θ��K�*��Z����E�9��[f��Y�q&K��{i̲� ^�!��%� ����H�����������ѐ���y�f�H�;��V������a�k�*JÔ��qY�	S؈�:hZ���'�\�t����R,:a��_��F��T���r�2	k0eX����哝��X���w�r�0-W�"����@��/�Ev���LS͉��+~;}� �#ͼ_�ݮ��V:� 6n'��+9���9xE���$���I��7=����q�nfW�����|��9r Q1���6��ɏ��Y�1ZY��X�3���?���\�$��zl��U�� 'yc4j�$2�}��ٻ�ъKe�ϱ��ACEf��$�Xŏƍ=�I	ac�T�L�x���(G����*���]����]g�Ah[�r�xU�\n���}��p�Lh���Sp��>+�}����ӡM_�O4��M-��ϦX׭�mU���P�(�q=��&�GG92�B��|���6���1�[�v�c��L0��]3�7U�La�������J��[��LU����f��3-�#}]�yy��W]���Z��W�[��[�`x�n	��lF@�Mm�j����Lm�	�O̫<-�( mW+�`���L�#g������r�i�$Կ̤�D?�|��ȳ5�;#��`3���D�+6��S6�����&��Y������Oy�B~�w5�K= X	����l�����L4��p[�6�.�%y��WA?�j�;3Q�������j��h��I��7�~=Fi�Xc�å
�.��dp�p�0���4�T1Hb��E�%x�v�|V�{LȞ�N�G�����8\U�B,��D��8���m�)��B��(AkPک)���b.ro�Om?諂1��~���X��*��n+ͫ��3C˿������!QН�������\��du�E-k��X���v���N2�6yCu��媴}�vW!+���&��$��1ƌ��(��	��x!�&[���u�pGh���L9�>n?e&J�(L��{3�+lLF���7�{�������jG;�}!x���Xi�z�H�rS��Z�w<;�a��eOXN��`i�!�X��<�����i��q\���Y��� �Z4vB��K�b�E_-[䳆�XIb�L>gD��������/�AMu���rO'k}}�F��x��������G�p��P5}Pk�V�wX����0��z�z� `��LS��-y�׃�:D�������wE\��J@�n�ἲ�Ŗ��[�^"?��G�bm�[�'�x[�P����mS@�с�Ll�%>,��C�Ù���A[=A+�[WGy[��g� ��ߛ'-��ȕ"D���}�� *;Ua��B��<U�O%&��� ��},1a���W�j�L��A"�]�ƝN`��,����~,J��m#ܻy�u�j��t�ȶ!��P�t$��K���&$�.��QT%a�*/:dN|Տ������#0�y�{O�9���H}@�I쎼^v%��/;��W�^6��de���r���uxۥ��g<O2x�jT�j���b^�p�z����u��^\��\ą����ϐ|#��r	��8�,���J�wAR�(J�q[\\���P�E���*�L���wu9�
��tc��X�BSv�n��<�d4�	�J1�I�sx��1C�Mu�J#i#w�G; �W5���0|��? E���$�h��>J	��8D�}��ƪ������x��|5.'��zwm����VP9󱵹'/�����D�;49-�~'��7���J
l�����Ú��J�4~ױo�V#��y6��� ���&�"�FMH��n1]Wѽ�|�V����`Fv�q"�/�\zk�HW�4۷&B���ꅴvT�j�t�r�x�t�!vNk^&�˷�Z��z72X�=�	����rE���*af"F:�v�*Syޙ>��F�G�ks�׳a�b�2�/ Q8]�� 1���Bpr���q�ڲ-~nO끑���J�9:\��jk�0m�TI<�3�]�లc��꺩�\�M�����R�b������"����j.�m��Z�$3U�������jK/l��Ͼr�T������|��N�:����F��G�A` ua:<k���9T��-��,
#k��:� �_��j<^:Ҋx뒯O;��el׊忙js g2���Fk�����N���6!?6�������%�~k���YMԦ�³�
DH��w�S3[-�f=Q�pvP�~����}��!V�1H̨1P7����*�3X���
)�^�(��n�B}��e�Zpt����*��P�'�MI�՘#��W�i>T~a�V^���߷�9	j"��#�N4��Wh�	b	U�2:x��Uufd^E5��AX���
/�_�(
oi��"�I��K����i���Q�-��'�W���OИ�AcL$:��	���O('Vi)X2��/F���
Z�vM��
�l}�\�*�m_p*�����N�;�g�n���d�~����t���{�.�f-�5��X�ll��Lq�y2���ʯ���-ʑ ����� C��G��t�
=���(6���|k�c�Z�3��栴�~���4��T�F6S��V�e�!%*Gt���j�[� ^ύٔ�J����W���!�����*[}p����v�<�X�x�R��Qg��A����s #����Ǩ"��L.�J4]w�M�3��%�E�����llU$d]\Feޟ0QQ/c���#*Cg�|�0Z�p�#�N^PjN�Z9!_�L5���"���
7;�.�w���p�M&P�緧I:/�*y��z��Ζr��-v6e��F�v�_[}�&n����BҡQ����Da��P9=��+3�ͻ���C�χ��J"�K-L��∘�K�n0�LA.��TG�fOD�b�i�5���{Q��e���NV4V̨�0��l!���Ϲ�w���FT�L�m��mU��!�����\p�Ȧ�sj=�$��C_3���tl:����|���!�#R��:�WN��:��_ao�= ���o<�N�
����ŭ�{VH��L/�����c�{��3Y=>��u��u9�z�@�ވw�R����>v��7B� ����|�u�6i���'k�ķ������~���W�'~U1f5�/�W�|o���mVt�|�6_�Z|lj�}FF���=�$Z>�	��i��y���P0{b�M��b��"&��G�L�yd4�H�3)��^���UD/��T����Ǎ)vq�\Ֆ.�����x�e�Ȁ^�ъ)U�S���u�~=u�&�]�f�c������m髃����L?�|����x�� �\֋�ʥ]�!����6���Y�َra�N%����y�&%~���g�.Ĩ�������X1[�\:k��D}i���l�?���;<��b7�����Z��7N�6�e|m%�9�}'7��T����?^�W���0&E�.����E��o�F�'����$�s��8���SQ�OkB٥�<�@¼'(�Z�V`f{Y�rJ�U��:��Ͳ���/���/� kΪz��ſ��3#�r��Z.B�A��U߭+����qtEϒ�搟����QA{���a�v���0�\.W�t5?���.�G��h��
,$U��(�f�v	����Y��W�nε�9H�lu[�a�y����䐏Ν6�[���2=�ߒQ�C���úh���I&�L\wҸ����rS�
�l��_���i�P��#�8��=ԔT��YpQ�xfJ�OU�uc����J�<��"�9�q�n���JrfE;�uqohq��ߋ�%�[�<˨�S�T�#����E���t\M�z�^�����y�i��a4�?�C3捦�\�2c�S|2�w����3�þڑ\�kFc�d�a�+v��2���_+�e2Z�8I����w.��B����
��ÖT��=\|i;y�Y)�&@����B�e��hNc����O y�+$-�4�ua�G���Jf��];���.7,�%ۭ�i�a,����6\��|U:�n�����>$rt�3�cm`���(طm�Gh%���L����m��ϭ1���9���(�J �  lfAd��^B"A�P�q<��S"�k,���`�/MMm"B���V=z�L����-�@fl�g��ꦺQr'd ���?���h��Z��;	�C<w�V���U0��� ӽ0�"���3X�K.�,��޿���rx��9���2���'f%��r@*=�I��h�Drm��������;��A(����1�{<Ɯn��ƈ]7���Sp������^�*���,�������+�l݊�
����u��#�H<��C��LU�u�D?�%��X)����V��ߏ.�>����t,��}V�*���!��>p�n�[�|�v�Q)s�VD+��=0�'�r4�)�ռ�r'�$��qi����o;�+K�E�ю���m��4��0J�O�-a֤��J�hA�f ՞J��C3�-߼<_w!����U��D�cq��L��(�	rb��x�F�#_���ħ%�a��lM$+["Zb���N�&�>j�"�����57��zӇD�~���i �٧�3D�&[�8q>G�iM�2�)W�/;�n��n�!�du�(��x8��`ˍ�����ߘ�zq�\9�9%h'��g��(��p�A���A\b�9��ʤ�lqD=R�vZN�߈�?�/5
���qM���"�#ru��h�e�������ZNL��+�����J���֧%�V��h���`4/��Μ�j-GU��J?����?���      �   4   x�3���2�tIM�,QpN,J�2�t���2�t.JM���r:��p��qqq A�      �   �   x�e���0���)�������@*#�	��$���?閪�uw�Χ�y �;k$��+�H���O�.lԣm���C,%���v��a�>��edg�Ȥ^�v�Iu�6!���ʎY��-
����A�Fe�w�h=_�y���eƮ��J��+ �kr_-     