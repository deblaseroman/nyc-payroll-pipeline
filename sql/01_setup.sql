CREATE DATABASE IF NOT EXISTS PAYROLL;

CREATE SCHEMA IF NOT EXISTS PAYROLL.RAW;

USE SCHEMA PAYROLL.RAW;

CREATE OR REPLACE TABLE PAYROLL.RAW.PAYROLL_RAW (
    fiscal_year         NUMBER(4,0),
    agency_name         VARCHAR(100),
    title_description   VARCHAR(100),
    base_salary         NUMBER(12,2),
    pay_basis           VARCHAR(100),
    regular_hours       NUMBER(4,0),
    regular_gross_paid  NUMBER(12,2),
    ot_hours            NUMBER(12,2),
    total_ot_paid       NUMBER(12,2),
    total_other_pay     NUMBER(12,2)
);
