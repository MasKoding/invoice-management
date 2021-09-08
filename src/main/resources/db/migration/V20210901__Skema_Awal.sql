CREATE TABLE invoice (
    id character varying(36) NOT NULL,
    created timestamp without time zone,
    created_by character varying(255),
    status_record character varying(255) NOT NULL,
    updated timestamp without time zone,
    updated_by character varying(255),
    amount numeric(19,2) NOT NULL,
    description character varying(255) NOT NULL,
    due_date date NOT NULL,
    invoice_number character varying(100) NOT NULL,
    paid boolean NOT NULL,
    id_invoice_type character varying(255) NOT NULL,
    CONSTRAINT invoice_amount_check CHECK ((amount >= (0)::numeric))
);



--
-- Name: invoice_type; Type: TABLE; Schema: public; Owner: invoice
--

CREATE TABLE invoice_type (
    id character varying(36) NOT NULL,
    created timestamp without time zone,
    created_by character varying(255),
    status_record character varying(255) NOT NULL,
    updated timestamp without time zone,
    updated_by character varying(255),
    code character varying(100) NOT NULL,
    name character varying(100) NOT NULL
);

CREATE TABLE invoice_payment_provider(
    id_invoice_type character varying(36) NOT NULL,
    id_payment_provider character varying(36) NOT NULL
);


--
-- Name: payment; Type: TABLE; Schema: public; Owner: invoice
--

CREATE TABLE payment (
    id character varying(36) NOT NULL,
    created timestamp without time zone,
    created_by character varying(255),
    status_record character varying(255) NOT NULL,
    updated timestamp without time zone,
    updated_by character varying(255),
    amount numeric(19,2) NOT NULL,
    provider_reference character varying(255) NOT NULL,
    transaction_time timestamp without time zone NOT NULL,
    virtual_type character varying(255) NOT NULL,
    id_virtual_account character varying(255) NOT NULL,
    CONSTRAINT payment_amount_check CHECK ((amount >= (1)::numeric))
);



--
-- Name: payment_provider; Type: TABLE; Schema: public; Owner: invoice
--

CREATE TABLE payment_provider (
    id character varying(36) NOT NULL,
    code character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created timestamp without time zone,
    created_by character varying(255),
    status_record character varying(255) NOT NULL,
    updated timestamp without time zone,
    updated_by character varying(255),
    logo character varying(255)
);



--
-- Name: virtual_account; Type: TABLE; Schema: public; Owner: invoice
--

CREATE TABLE virtual_account (
    id character varying(36) NOT NULL,
    created timestamp without time zone,
    created_by character varying(255),
    status_record character varying(255) NOT NULL,
    updated timestamp without time zone,
    updated_by character varying(255),
    account_number character varying(255) NOT NULL,
    company_id character varying(255) NOT NULL,
    id_invoice character varying(255) NOT NULL,
    id_payment_provider character varying(255) NOT NULL
);



--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: invoice
--


--
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: invoice
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);


--
-- Name: invoice_type invoice_type_pkey; Type: CONSTRAINT; Schema: public; Owner: invoice
--

ALTER TABLE ONLY invoice_type
    ADD CONSTRAINT invoice_type_pkey PRIMARY KEY (id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: invoice
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: payment_provider payment_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: invoice
--

ALTER TABLE ONLY payment_provider
    ADD CONSTRAINT payment_provider_pkey PRIMARY KEY (id);


--
-- Name: payment_provider payment_provider_unique_code; Type: CONSTRAINT; Schema: public; Owner: invoice
--

ALTER TABLE ONLY payment_provider
    ADD CONSTRAINT payment_provider_unique_code UNIQUE (code);


--
-- Name: virtual_account virtual_account_pkey; Type: CONSTRAINT; Schema: public; Owner: invoice
--

ALTER TABLE ONLY virtual_account
    ADD CONSTRAINT virtual_account_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: invoice
--



--
-- Name: virtual_account fkbbdwdxpgdisiikyyhf2xteblc; Type: FK CONSTRAINT; Schema: public; Owner: invoice
--

ALTER TABLE ONLY virtual_account
    ADD CONSTRAINT fkbbdwdxpgdisiikyyhf2xteblc FOREIGN KEY (id_invoice) REFERENCES invoice(id);


--
-- Name: invoice fkco4sbxv9cj2oevm6cdpq76ffb; Type: FK CONSTRAINT; Schema: public; Owner: invoice
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT fkco4sbxv9cj2oevm6cdpq76ffb FOREIGN KEY (id_invoice_type) REFERENCES invoice_type(id);


--
-- Name: payment fkptriq88d7e8io9mhri8p10cq0; Type: FK CONSTRAINT; Schema: public; Owner: invoice
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT fkptriq88d7e8io9mhri8p10cq0 FOREIGN KEY (id_virtual_account) REFERENCES virtual_account(id);


--
-- Name: virtual_account fkt3t7f64hvgk4xjblsovqqkpll; Type: FK CONSTRAINT; Schema: public; Owner: invoice
--

ALTER TABLE ONLY virtual_account
    ADD CONSTRAINT fkt3t7f64hvgk4xjblsovqqkpll FOREIGN KEY (id_payment_provider) REFERENCES payment_provider(id);



ALTER TABLE ONLY invoice_payment_provider
    ADD CONSTRAINT invoice_type_provider_pkey PRIMARY KEY (id_invoice_type,id_payment_provider);


    
ALTER TABLE ONLY invoice_payment_provider
    ADD CONSTRAINT fk_invoice_type_provider FOREIGN KEY (id_invoice_type) REFERENCES invoice_type(id);

--
    
ALTER TABLE ONLY invoice_payment_provider
    ADD CONSTRAINT fk_payment_provider_provider FOREIGN KEY (id_payment_provider) REFERENCES payment_provider(id);
--
-- PostgreSQL database dump complete
--