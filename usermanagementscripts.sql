-- Table: public.auth_user

-- DROP TABLE public.auth_user;

CREATE TABLE public.auth_user
(
    auth_user_id integer NOT NULL DEFAULT nextval('auth_user_auth_user_id_seq'::regclass) ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    first_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    password character varying(255) COLLATE pg_catalog."default" NOT NULL,
    status character varying(255) COLLATE pg_catalog."default",
    mobile character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT auth_user_pkey PRIMARY KEY (auth_user_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.auth_user
    OWNER to postgres;





-- Table: public.auth_role

-- DROP TABLE public.auth_role;

CREATE TABLE public.auth_role
(
    auth_role_id integer NOT NULL DEFAULT nextval('auth_role_auth_role_id_seq'::regclass) ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    role_name character varying(255) COLLATE pg_catalog."default",
    role_desc character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT auth_role_pkey PRIMARY KEY (auth_role_id),
    CONSTRAINT auth_role_role_desc_key UNIQUE (role_desc)
,
    CONSTRAINT auth_role_role_name_key UNIQUE (role_name)

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.auth_role
    OWNER to postgres;
	
	
	
	
-- Table: public.auth_user_role

-- DROP TABLE public.auth_user_role;

CREATE TABLE public.auth_user_role
(
    auth_user_id integer NOT NULL,
    auth_role_id integer NOT NULL,
    CONSTRAINT auth_user_role_pkey PRIMARY KEY (auth_user_id, auth_role_id),
    CONSTRAINT account_role_user_id_fkey FOREIGN KEY (auth_user_id)
        REFERENCES public.auth_user (auth_user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT auth_role_role_id_fkey FOREIGN KEY (auth_role_id)
        REFERENCES public.auth_role (auth_role_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.auth_user_role
    OWNER to postgres;
	
INSERT INTO auth_role VALUES (1,'SUPER_USER','This user has ultimate rights for everything');
INSERT INTO auth_role VALUES (2,'ADMIN_USER','This user has admin rights for administrative work');
INSERT INTO auth_role VALUES (3,'SITE_USER','This user has access to site, after login - normal user');	


insert into auth_user (auth_user_id,first_name,last_name,email,password,status) values (1,'Ankit','Wasankar','admin@gmail.com','$2a$10$DD/FQ0hTIprg3fGarZl1reK1f7tzgM4RuFKjAKyun0Si60w6g3v5i','VERIFIED');
insert into auth_user_role (auth_user_id, auth_role_id) values ('1','1');
insert into auth_user_role (auth_user_id, auth_role_id) values ('1','2');
insert into auth_user_role (auth_user_id, auth_role_id) values ('1','3');
	
	