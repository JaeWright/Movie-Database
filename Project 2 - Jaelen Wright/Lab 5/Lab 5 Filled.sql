PGDMP                      	    z           Lab 5 2nd try    14.5    14.5 D    `           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            a           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            b           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            c           1262    16682    Lab 5 2nd try    DATABASE     l   CREATE DATABASE "Lab 5 2nd try" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Canada.1252';
    DROP DATABASE "Lab 5 2nd try";
                postgres    false            �            1259    16691    Actor    TABLE     y  CREATE TABLE public."Actor" (
    "Actor ID" bigint NOT NULL,
    "Actor Name" character varying NOT NULL,
    "Year of birth" integer NOT NULL,
    "City" character varying NOT NULL,
    "State" character varying NOT NULL,
    "Country" character varying NOT NULL,
    "Eye color" character varying,
    "University Name" character varying
)
WITH (autovacuum_enabled='true');
    DROP TABLE public."Actor";
       public         heap    postgres    false            �            1259    16735 
   Actor Cast    TABLE     �   CREATE TABLE public."Actor Cast" (
    "Movie Title" character varying NOT NULL,
    "Release Date" date NOT NULL,
    "Actor Name" character varying NOT NULL,
    "Actor ID" bigint NOT NULL
)
WITH (autovacuum_enabled='true');
     DROP TABLE public."Actor Cast";
       public         heap    postgres    false            �            1259    16770    Awards    TABLE     �   CREATE TABLE public."Awards" (
    "Award ID" integer NOT NULL,
    "Movie Title" character varying NOT NULL,
    "Release Date" date NOT NULL
)
WITH (autovacuum_enabled='true');
    DROP TABLE public."Awards";
       public         heap    postgres    false            �            1259    16756    Cinema    TABLE     f  CREATE TABLE public."Cinema" (
    "Cinema Name" character varying NOT NULL,
    "Location" character varying NOT NULL,
    "Price" double precision NOT NULL,
    "Date" date NOT NULL,
    "Time" time without time zone NOT NULL,
    "Duration" time without time zone NOT NULL,
    "Cinema Hall" character varying NOT NULL
)
WITH (autovacuum_enabled='true');
    DROP TABLE public."Cinema";
       public         heap    postgres    false            �            1259    16721 
   Department    TABLE     �   CREATE TABLE public."Department" (
    "Department Name" character varying NOT NULL,
    "University Name" character varying NOT NULL,
    "Number of Students" integer NOT NULL,
    "Desciption" text
)
WITH (autovacuum_enabled='true');
     DROP TABLE public."Department";
       public         heap    postgres    false            �            1259    16683    Director    TABLE     �  CREATE TABLE public."Director" (
    "Director ID" bigint NOT NULL,
    "Director Name" character varying NOT NULL,
    "Year of birth" integer NOT NULL,
    "City" character varying NOT NULL,
    "State" character varying NOT NULL,
    "Country" character varying NOT NULL,
    "University Name" character varying,
    "Eye color" character varying
)
WITH (autovacuum_enabled='true');
    DROP TABLE public."Director";
       public         heap    postgres    false            �            1259    16742    Director Cast    TABLE     �   CREATE TABLE public."Director Cast" (
    "Director Name" character varying NOT NULL,
    "Director ID" bigint NOT NULL,
    "Movie Title" character varying NOT NULL,
    "Release Date" date NOT NULL
)
WITH (autovacuum_enabled='true');
 #   DROP TABLE public."Director Cast";
       public         heap    postgres    false            �            1259    16706 	   Education    TABLE     �   CREATE TABLE public."Education" (
    "Public" boolean NOT NULL,
    "Representative Color" character varying NOT NULL,
    "Department Name" character varying NOT NULL,
    "University Name" character varying NOT NULL
)
WITH (autovacuum_enabled='true');
    DROP TABLE public."Education";
       public         heap    postgres    false            �            1259    16784    Festival Appearances    TABLE     �   CREATE TABLE public."Festival Appearances" (
    "Name" character varying NOT NULL,
    "Movie Title" character varying NOT NULL,
    "Release Date" date NOT NULL
)
WITH (autovacuum_enabled='true');
 *   DROP TABLE public."Festival Appearances";
       public         heap    postgres    false            �            1259    16749 	   Festivals    TABLE     �   CREATE TABLE public."Festivals" (
    "Name" character varying NOT NULL,
    "Year" date NOT NULL
)
WITH (autovacuum_enabled='true');
    DROP TABLE public."Festivals";
       public         heap    postgres    false            �            1259    16714    Movie    TABLE     �   CREATE TABLE public."Movie" (
    "Movie Title" character varying NOT NULL,
    "Release Date" date NOT NULL,
    "Rating" integer NOT NULL,
    "Budget" double precision NOT NULL,
    "Gross" double precision
)
WITH (autovacuum_enabled='true');
    DROP TABLE public."Movie";
       public         heap    postgres    false            �            1259    16728    Movie Genre    TABLE     �   CREATE TABLE public."Movie Genre" (
    "Title" character varying NOT NULL,
    "Genre" character varying NOT NULL,
    "Release Date" date NOT NULL
)
WITH (autovacuum_enabled='true');
 !   DROP TABLE public."Movie Genre";
       public         heap    postgres    false            �            1259    16777    Tickets and Showtimes    TABLE     �   CREATE TABLE public."Tickets and Showtimes" (
    "Cinema Name" character varying NOT NULL,
    "Location" character varying NOT NULL,
    "Movie Title" character varying NOT NULL,
    "Release Date" date NOT NULL
)
WITH (autovacuum_enabled='true');
 +   DROP TABLE public."Tickets and Showtimes";
       public         heap    postgres    false            �            1259    16763    Type of Award    TABLE     �   CREATE TABLE public."Type of Award" (
    "Award ID" integer NOT NULL,
    "Award Category" character varying NOT NULL,
    "Instituiton" character varying NOT NULL
)
WITH (autovacuum_enabled='true');
 #   DROP TABLE public."Type of Award";
       public         heap    postgres    false            �            1259    16699    Type of movie    TABLE     �   CREATE TABLE public."Type of movie" (
    "Genre" character varying NOT NULL,
    "Genre Description" character varying NOT NULL
)
WITH (autovacuum_enabled='true');
 #   DROP TABLE public."Type of movie";
       public         heap    postgres    false            P          0    16691    Actor 
   TABLE DATA           �   COPY public."Actor" ("Actor ID", "Actor Name", "Year of birth", "City", "State", "Country", "Eye color", "University Name") FROM stdin;
    public          postgres    false    210   9]       V          0    16735 
   Actor Cast 
   TABLE DATA           _   COPY public."Actor Cast" ("Movie Title", "Release Date", "Actor Name", "Actor ID") FROM stdin;
    public          postgres    false    216   v^       [          0    16770    Awards 
   TABLE DATA           M   COPY public."Awards" ("Award ID", "Movie Title", "Release Date") FROM stdin;
    public          postgres    false    221   7_       Y          0    16756    Cinema 
   TABLE DATA           q   COPY public."Cinema" ("Cinema Name", "Location", "Price", "Date", "Time", "Duration", "Cinema Hall") FROM stdin;
    public          postgres    false    219   �_       T          0    16721 
   Department 
   TABLE DATA           p   COPY public."Department" ("Department Name", "University Name", "Number of Students", "Desciption") FROM stdin;
    public          postgres    false    214   v`       O          0    16683    Director 
   TABLE DATA           �   COPY public."Director" ("Director ID", "Director Name", "Year of birth", "City", "State", "Country", "University Name", "Eye color") FROM stdin;
    public          postgres    false    209   b       W          0    16742    Director Cast 
   TABLE DATA           h   COPY public."Director Cast" ("Director Name", "Director ID", "Movie Title", "Release Date") FROM stdin;
    public          postgres    false    217   -c       R          0    16706 	   Education 
   TABLE DATA           m   COPY public."Education" ("Public", "Representative Color", "Department Name", "University Name") FROM stdin;
    public          postgres    false    212   �c       ]          0    16784    Festival Appearances 
   TABLE DATA           W   COPY public."Festival Appearances" ("Name", "Movie Title", "Release Date") FROM stdin;
    public          postgres    false    223   �d       X          0    16749 	   Festivals 
   TABLE DATA           5   COPY public."Festivals" ("Name", "Year") FROM stdin;
    public          postgres    false    218   %e       S          0    16714    Movie 
   TABLE DATA           ]   COPY public."Movie" ("Movie Title", "Release Date", "Rating", "Budget", "Gross") FROM stdin;
    public          postgres    false    213   �e       U          0    16728    Movie Genre 
   TABLE DATA           I   COPY public."Movie Genre" ("Title", "Genre", "Release Date") FROM stdin;
    public          postgres    false    215   <f       \          0    16777    Tickets and Showtimes 
   TABLE DATA           k   COPY public."Tickets and Showtimes" ("Cinema Name", "Location", "Movie Title", "Release Date") FROM stdin;
    public          postgres    false    222   �f       Z          0    16763    Type of Award 
   TABLE DATA           V   COPY public."Type of Award" ("Award ID", "Award Category", "Instituiton") FROM stdin;
    public          postgres    false    220   �g       Q          0    16699    Type of movie 
   TABLE DATA           G   COPY public."Type of movie" ("Genre", "Genre Description") FROM stdin;
    public          postgres    false    211    h       �           2606    16698    Actor PK_Actor 
   CONSTRAINT     f   ALTER TABLE ONLY public."Actor"
    ADD CONSTRAINT "PK_Actor" PRIMARY KEY ("Actor Name", "Actor ID");
 <   ALTER TABLE ONLY public."Actor" DROP CONSTRAINT "PK_Actor";
       public            postgres    false    210    210            �           2606    16741    Actor Cast PK_Actor Cast 
   CONSTRAINT     �   ALTER TABLE ONLY public."Actor Cast"
    ADD CONSTRAINT "PK_Actor Cast" PRIMARY KEY ("Movie Title", "Release Date", "Actor Name", "Actor ID");
 F   ALTER TABLE ONLY public."Actor Cast" DROP CONSTRAINT "PK_Actor Cast";
       public            postgres    false    216    216    216    216            �           2606    16776    Awards PK_Awards 
   CONSTRAINT     y   ALTER TABLE ONLY public."Awards"
    ADD CONSTRAINT "PK_Awards" PRIMARY KEY ("Award ID", "Movie Title", "Release Date");
 >   ALTER TABLE ONLY public."Awards" DROP CONSTRAINT "PK_Awards";
       public            postgres    false    221    221    221            �           2606    16762    Cinema PK_Cinema 
   CONSTRAINT     i   ALTER TABLE ONLY public."Cinema"
    ADD CONSTRAINT "PK_Cinema" PRIMARY KEY ("Cinema Name", "Location");
 >   ALTER TABLE ONLY public."Cinema" DROP CONSTRAINT "PK_Cinema";
       public            postgres    false    219    219            �           2606    16727    Department PK_Department 
   CONSTRAINT     |   ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "PK_Department" PRIMARY KEY ("Department Name", "University Name");
 F   ALTER TABLE ONLY public."Department" DROP CONSTRAINT "PK_Department";
       public            postgres    false    214    214            �           2606    16690    Director PK_Director 
   CONSTRAINT     r   ALTER TABLE ONLY public."Director"
    ADD CONSTRAINT "PK_Director" PRIMARY KEY ("Director Name", "Director ID");
 B   ALTER TABLE ONLY public."Director" DROP CONSTRAINT "PK_Director";
       public            postgres    false    209    209            �           2606    16748    Director Cast PK_Director Cast 
   CONSTRAINT     �   ALTER TABLE ONLY public."Director Cast"
    ADD CONSTRAINT "PK_Director Cast" PRIMARY KEY ("Director Name", "Director ID", "Movie Title", "Release Date");
 L   ALTER TABLE ONLY public."Director Cast" DROP CONSTRAINT "PK_Director Cast";
       public            postgres    false    217    217    217    217            �           2606    16713    Education PK_Education 
   CONSTRAINT     g   ALTER TABLE ONLY public."Education"
    ADD CONSTRAINT "PK_Education" PRIMARY KEY ("University Name");
 D   ALTER TABLE ONLY public."Education" DROP CONSTRAINT "PK_Education";
       public            postgres    false    212            �           2606    16791 ,   Festival Appearances PK_Festival Appearances 
   CONSTRAINT     �   ALTER TABLE ONLY public."Festival Appearances"
    ADD CONSTRAINT "PK_Festival Appearances" PRIMARY KEY ("Name", "Movie Title");
 Z   ALTER TABLE ONLY public."Festival Appearances" DROP CONSTRAINT "PK_Festival Appearances";
       public            postgres    false    223    223            �           2606    16755    Festivals PK_Festivals 
   CONSTRAINT     \   ALTER TABLE ONLY public."Festivals"
    ADD CONSTRAINT "PK_Festivals" PRIMARY KEY ("Name");
 D   ALTER TABLE ONLY public."Festivals" DROP CONSTRAINT "PK_Festivals";
       public            postgres    false    218            �           2606    16720    Movie PK_Movie 
   CONSTRAINT     k   ALTER TABLE ONLY public."Movie"
    ADD CONSTRAINT "PK_Movie" PRIMARY KEY ("Movie Title", "Release Date");
 <   ALTER TABLE ONLY public."Movie" DROP CONSTRAINT "PK_Movie";
       public            postgres    false    213    213            �           2606    16734    Movie Genre PK_Movie Genre 
   CONSTRAINT     z   ALTER TABLE ONLY public."Movie Genre"
    ADD CONSTRAINT "PK_Movie Genre" PRIMARY KEY ("Title", "Genre", "Release Date");
 H   ALTER TABLE ONLY public."Movie Genre" DROP CONSTRAINT "PK_Movie Genre";
       public            postgres    false    215    215    215            �           2606    16783 .   Tickets and Showtimes PK_Tickets and Showtimes 
   CONSTRAINT     �   ALTER TABLE ONLY public."Tickets and Showtimes"
    ADD CONSTRAINT "PK_Tickets and Showtimes" PRIMARY KEY ("Cinema Name", "Location", "Movie Title", "Release Date");
 \   ALTER TABLE ONLY public."Tickets and Showtimes" DROP CONSTRAINT "PK_Tickets and Showtimes";
       public            postgres    false    222    222    222    222            �           2606    16769    Type of Award PK_Type of Award 
   CONSTRAINT     h   ALTER TABLE ONLY public."Type of Award"
    ADD CONSTRAINT "PK_Type of Award" PRIMARY KEY ("Award ID");
 L   ALTER TABLE ONLY public."Type of Award" DROP CONSTRAINT "PK_Type of Award";
       public            postgres    false    220            �           2606    16705    Type of movie PK_Type of movie 
   CONSTRAINT     e   ALTER TABLE ONLY public."Type of movie"
    ADD CONSTRAINT "PK_Type of movie" PRIMARY KEY ("Genre");
 L   ALTER TABLE ONLY public."Type of movie" DROP CONSTRAINT "PK_Type of movie";
       public            postgres    false    211            �           1259    16711    IX_Department Info    INDEX     l   CREATE INDEX "IX_Department Info" ON public."Education" USING btree ("Department Name", "University Name");
 (   DROP INDEX public."IX_Department Info";
       public            postgres    false    212    212            �           1259    16789    IX_Festivals movie was shown at    INDEX     }   CREATE INDEX "IX_Festivals movie was shown at" ON public."Festival Appearances" USING btree ("Movie Title", "Release Date");
 5   DROP INDEX public."IX_Festivals movie was shown at";
       public            postgres    false    223    223            �           1259    16696    IX_Relationship20    INDEX     T   CREATE INDEX "IX_Relationship20" ON public."Actor" USING btree ("University Name");
 '   DROP INDEX public."IX_Relationship20";
       public            postgres    false    210            �           1259    16688    IX_Relationship21    INDEX     W   CREATE INDEX "IX_Relationship21" ON public."Director" USING btree ("University Name");
 '   DROP INDEX public."IX_Relationship21";
       public            postgres    false    209            �           2606    16797    Actor Actor Education    FK CONSTRAINT     �   ALTER TABLE ONLY public."Actor"
    ADD CONSTRAINT "Actor Education" FOREIGN KEY ("University Name") REFERENCES public."Education"("University Name");
 C   ALTER TABLE ONLY public."Actor" DROP CONSTRAINT "Actor Education";
       public          postgres    false    212    210    3229            �           2606    16822    Actor Cast Actors in Cast    FK CONSTRAINT     �   ALTER TABLE ONLY public."Actor Cast"
    ADD CONSTRAINT "Actors in Cast" FOREIGN KEY ("Actor Name", "Actor ID") REFERENCES public."Actor"("Actor Name", "Actor ID");
 G   ALTER TABLE ONLY public."Actor Cast" DROP CONSTRAINT "Actors in Cast";
       public          postgres    false    210    210    216    3224    216            �           2606    16817    Actor Cast Actors in Movie    FK CONSTRAINT     �   ALTER TABLE ONLY public."Actor Cast"
    ADD CONSTRAINT "Actors in Movie" FOREIGN KEY ("Movie Title", "Release Date") REFERENCES public."Movie"("Movie Title", "Release Date");
 H   ALTER TABLE ONLY public."Actor Cast" DROP CONSTRAINT "Actors in Movie";
       public          postgres    false    213    216    3231    216    213            �           2606    16842    Awards Awards won by movie    FK CONSTRAINT     �   ALTER TABLE ONLY public."Awards"
    ADD CONSTRAINT "Awards won by movie" FOREIGN KEY ("Movie Title", "Release Date") REFERENCES public."Movie"("Movie Title", "Release Date");
 H   ALTER TABLE ONLY public."Awards" DROP CONSTRAINT "Awards won by movie";
       public          postgres    false    213    221    213    221    3231            �           2606    16792    Education Department Info    FK CONSTRAINT     �   ALTER TABLE ONLY public."Education"
    ADD CONSTRAINT "Department Info" FOREIGN KEY ("Department Name", "University Name") REFERENCES public."Department"("Department Name", "University Name");
 G   ALTER TABLE ONLY public."Education" DROP CONSTRAINT "Department Info";
       public          postgres    false    214    212    212    3233    214            �           2606    16802    Director Director Education    FK CONSTRAINT     �   ALTER TABLE ONLY public."Director"
    ADD CONSTRAINT "Director Education" FOREIGN KEY ("University Name") REFERENCES public."Education"("University Name");
 I   ALTER TABLE ONLY public."Director" DROP CONSTRAINT "Director Education";
       public          postgres    false    209    212    3229            �           2606    16827 !   Director Cast Director(s) in cast    FK CONSTRAINT     �   ALTER TABLE ONLY public."Director Cast"
    ADD CONSTRAINT "Director(s) in cast" FOREIGN KEY ("Director Name", "Director ID") REFERENCES public."Director"("Director Name", "Director ID");
 O   ALTER TABLE ONLY public."Director Cast" DROP CONSTRAINT "Director(s) in cast";
       public          postgres    false    209    217    217    3221    209            �           2606    16832 "   Director Cast Director(s) in movie    FK CONSTRAINT     �   ALTER TABLE ONLY public."Director Cast"
    ADD CONSTRAINT "Director(s) in movie" FOREIGN KEY ("Movie Title", "Release Date") REFERENCES public."Movie"("Movie Title", "Release Date");
 P   ALTER TABLE ONLY public."Director Cast" DROP CONSTRAINT "Director(s) in movie";
       public          postgres    false    217    213    213    3231    217            �           2606    16862 1   Festival Appearances Festivals movie was shown at    FK CONSTRAINT     �   ALTER TABLE ONLY public."Festival Appearances"
    ADD CONSTRAINT "Festivals movie was shown at" FOREIGN KEY ("Movie Title", "Release Date") REFERENCES public."Movie"("Movie Title", "Release Date");
 _   ALTER TABLE ONLY public."Festival Appearances" DROP CONSTRAINT "Festivals movie was shown at";
       public          postgres    false    223    223    213    3231    213            �           2606    16807    Movie Genre Genres of movie    FK CONSTRAINT     �   ALTER TABLE ONLY public."Movie Genre"
    ADD CONSTRAINT "Genres of movie" FOREIGN KEY ("Title", "Release Date") REFERENCES public."Movie"("Movie Title", "Release Date");
 I   ALTER TABLE ONLY public."Movie Genre" DROP CONSTRAINT "Genres of movie";
       public          postgres    false    213    215    215    3231    213            �           2606    16857 ,   Festival Appearances Movie Festival Showings    FK CONSTRAINT     �   ALTER TABLE ONLY public."Festival Appearances"
    ADD CONSTRAINT "Movie Festival Showings" FOREIGN KEY ("Name") REFERENCES public."Festivals"("Name");
 Z   ALTER TABLE ONLY public."Festival Appearances" DROP CONSTRAINT "Movie Festival Showings";
       public          postgres    false    218    223    3241            �           2606    16852 $   Tickets and Showtimes Movie Showings    FK CONSTRAINT     �   ALTER TABLE ONLY public."Tickets and Showtimes"
    ADD CONSTRAINT "Movie Showings" FOREIGN KEY ("Movie Title", "Release Date") REFERENCES public."Movie"("Movie Title", "Release Date");
 R   ALTER TABLE ONLY public."Tickets and Showtimes" DROP CONSTRAINT "Movie Showings";
       public          postgres    false    213    213    3231    222    222            �           2606    16847 %   Tickets and Showtimes Shows at cinema    FK CONSTRAINT     �   ALTER TABLE ONLY public."Tickets and Showtimes"
    ADD CONSTRAINT "Shows at cinema" FOREIGN KEY ("Cinema Name", "Location") REFERENCES public."Cinema"("Cinema Name", "Location");
 S   ALTER TABLE ONLY public."Tickets and Showtimes" DROP CONSTRAINT "Shows at cinema";
       public          postgres    false    219    222    222    219    3243            �           2606    16837    Awards Types of Awards    FK CONSTRAINT     �   ALTER TABLE ONLY public."Awards"
    ADD CONSTRAINT "Types of Awards" FOREIGN KEY ("Award ID") REFERENCES public."Type of Award"("Award ID");
 D   ALTER TABLE ONLY public."Awards" DROP CONSTRAINT "Types of Awards";
       public          postgres    false    221    220    3245            �           2606    16812    Movie Genre Types of genres    FK CONSTRAINT     �   ALTER TABLE ONLY public."Movie Genre"
    ADD CONSTRAINT "Types of genres" FOREIGN KEY ("Genre") REFERENCES public."Type of movie"("Genre");
 I   ALTER TABLE ONLY public."Movie Genre" DROP CONSTRAINT "Types of genres";
       public          postgres    false    215    3226    211            P   -  x�m��N1�ϳO1/ ���*P��&.e��S3�Bx{���&��I����� >M��;�����Fp�r���/�x�U���p�-��D
�q-�3����5XV��n-�r�z�9y[��<B�n,�%DRxTrF�	d�=t�;G�b���)���M�i���I�0MC�w}9iUS�+K�ޝ5�&ȵ�\H��rۜ=_�wA�8�)�RvO�(��Ҭ���K	'w0�,�݃)y��y7�&�~
�F0�ϱ��{4�����K߹��f���K�J$���3��]i��gY�Ѷ�p      V   �   x����0����)�j([Q1&&M���4�������s�W�E�H�RE2J�[�w�YP���;t^53֓'��<�*�q[�����A[������L�7R��"me�z~^�ŝG�D��&,x~���@ep2Ll�9���<�K�.���K�Z�6���2q_	!~��9�      [   |   x���
�0E�3_1?��ɣ%�Ю��t�J������W������S\�h�����H]���@�W�^e���'��(���c��RR���o���I���]�p��=��,Ԥ�q�8�\q1�!�      Y   �   x�m���0E����(�k�M�HXF\
�H�D�{�������{�}.�S3��O$c@p2�8�(�T�q�l�v�Z����4��[���d$�H#�,��9���xp�9�hqT�{�ݫ� �qȘ�%�v�/w������u��&4��AEV������ G�      T   �  x��Mk1���_���JRzKj�[	�K)�hǻ�e�2#�I~}G�Mkh΅Bo����}FZ��R��!��-�-�c/�rs�X,��Ae�-�􄞻���J�m��F�b�vCa�X���"uRzF	�r���nI��C,\��ɡt�P�eK8��1�چ���B�Z�K��Wy�l�����sJ�o���幹��<b�X��%�ɷ�.nn����W"�l��ę�#�]p��X�	U���[��aI�]��b�P���~I��$�����W��)RG�&����ۍ�ja�~|�k�a��se#y�É;�Z')B�)K%2
T�ͻ65�sbrW׃$�Z[�(�Ⱦ�&">ϧb:�w�D;�!���H��X���}����J�)��l>���6����l�
��      O      x�u��N�0��y��`�q��b|��vI[���Ɠ�n��ǅ�7˒��S��m��Da�`�\N`�=�+r���Ő����2&xղD[0v5h.��I�n��	UZ̡�z��C{+|���負��~�+(���y�u�I)u'P�Бӈ>9���,���V�����3��Bk�Bl�Tm>����jk<�Q��O�Q�fg��e�8^9qc�j�,@�3�����>+���'n{a��2i��      W   �   x����0E�ӯ���<4�5$�h0��qSa��M�������ܓ��0`m�sv�A��� MT)U"�L�u��c�s�i&H�5��y�N;�MDq;eR�2-��;G�|��2����h�o�>Iu��V��+
9T�c"���U�{�*�s!�E�:�m0P/nZ��n\�|gs�:!�+!>�      R   �   x�e��
�0D��W��U��A롐K�C\wa�-��I�Z�:�fx�U���������Q��>���A����0���
3Ff�E�{����	݂P+��RB�F[̓��L'�#���z����4�l�����T���}�x���%J�      ]   �   x�M�A
�0 ϛW�"ٴ*9j5�'A�/��6�4����6 �<Ìu��?����Њ�$%U&����:,7,+f����8ۙ$-�z�8u���̧�V�f����F,x| �v�8�e���ScR���B|��2�      X   O   x�sK-.�,K�Qp�4204�54�50�r��:E�����&Qg�ZS�B]C$Q��������B�dP�!��=... �H�      S   �   x�5��
�0E��W�"3yv�BAW�B7n����R��7���=�k���)@�4k��PǴ��{g�?� ��ѽb������������Ct����܇%Oi����#��@)�x����g���7C�����N9t�(~��"ک��ʚ�6G xR�w�?O���j2�      U   �   x�%���0E羯�Դ4	Q'#&,.X_���HS�^��ι�^胑�4��˴TF()d�yG�qr��C�m����(F��Y����<Y����m���������x�'��د&S��U�u	3o���Z/��p�q	� � �,�      \   �   x�M��
�0E�3_�H1>Z\� �n��i4i��4��Ю�a8soq�/R_���'{���E4J��"\�4�J�Κ�؁t��z'���%��4ΰ~(���qr�:�%�(�c���߰E�G�Ii�X���,�Vp�[g�Q�?7��I����t�S���,t?�      Z   ]   x�3�tJ-.Q.�/���/NN,*�2����&�d�+��¤���;g�g&�*8�'�s�@�J
�J@��K`M!�����)�:c���� �,d      Q   a   x���	�0 �s2E�D=����%֔4��"n�{��|~���"E�^���PUl|N*�N�k�mX:��&�E�/�t\��OUH�d2��=��ǽF���     