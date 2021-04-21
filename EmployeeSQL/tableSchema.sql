{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Table: public.title\
\
-- DROP TABLE public.title;\
\
CREATE TABLE public.title\
(\
    title character varying COLLATE pg_catalog."default",\
    title_id character varying COLLATE pg_catalog."default" NOT NULL,\
    CONSTRAINT "title_id_PK" PRIMARY KEY (title_id)\
);\
\
-- Table: public.employee\
\
-- DROP TABLE public.employee;\
\
CREATE TABLE public.employee\
(\
    emp_no integer NOT NULL,\
    emp_title_id character varying COLLATE pg_catalog."default",\
    birth_date date,\
    first_name character varying COLLATE pg_catalog."default",\
    last_name character varying COLLATE pg_catalog."default",\
    sex character varying COLLATE pg_catalog."default",\
    hire_date date,\
    CONSTRAINT employee_pkey PRIMARY KEY (emp_no)\
);\
\
-- Table: public.departments\
\
-- DROP TABLE public.departments;\
\
CREATE TABLE public.departments\
(\
    dept_no character varying COLLATE pg_catalog."default" NOT NULL,\
    dept_name character varying COLLATE pg_catalog."default",\
    CONSTRAINT departments_pkey PRIMARY KEY (dept_no)\
);\
\
-- Table: public.dept_emp\
\
-- DROP TABLE public.dept_emp;\
\
CREATE TABLE public.dept_emp\
(\
    emp_no integer NOT NULL,\
    dept_no character varying COLLATE pg_catalog."default" NOT NULL,\
    CONSTRAINT dept_emp_pkey PRIMARY KEY (emp_no, dept_no),\
    CONSTRAINT "dept_no_FK" FOREIGN KEY (dept_no)\
        REFERENCES public.departments (dept_no) MATCH SIMPLE\
        ON UPDATE NO ACTION\
        ON DELETE NO ACTION\
        NOT VALID,\
    CONSTRAINT "emp_no_FK" FOREIGN KEY (emp_no)\
        REFERENCES public.employee (emp_no) MATCH SIMPLE\
        ON UPDATE NO ACTION\
        ON DELETE NO ACTION\
        NOT VALID\
)\
\
-- Table: public.salaries\
\
-- DROP TABLE public.salaries;\
\
CREATE TABLE public.salaries\
(\
    salary integer,\
    emp_no integer NOT NULL,\
    CONSTRAINT "emp_no_PK" PRIMARY KEY (emp_no)\
)\
\
-- Table: public.dept_manager\
\
-- DROP TABLE public.dept_manager;\
\
CREATE TABLE public.dept_manager\
(\
    dept_no character varying COLLATE pg_catalog."default" NOT NULL,\
    emp_no integer NOT NULL,\
    CONSTRAINT dept_manager_pkey PRIMARY KEY (dept_no, emp_no),\
    CONSTRAINT "dept_no_FK" FOREIGN KEY (dept_no)\
        REFERENCES public.departments (dept_no) MATCH SIMPLE\
        ON UPDATE NO ACTION\
        ON DELETE NO ACTION\
        NOT VALID,\
    CONSTRAINT "emp_no_FK" FOREIGN KEY (emp_no)\
        REFERENCES public.employee (emp_no) MATCH SIMPLE\
        ON UPDATE NO ACTION\
        ON DELETE NO ACTION\
        NOT VALID\
)\
\
}