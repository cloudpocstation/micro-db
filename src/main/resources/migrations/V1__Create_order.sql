
CREATE TABLE STORE_ORDER
(
  STORE_ORDER_ID bigint NOT NULL,
  VIN character(17),
  GCID character(36) NOT NULL,
  BUNO character varying(5),
  BUSINESS_UNIT character varying(35) NOT NULL,
  BRAND character varying(3) NOT NULL,
  CLIENT_CHANNEL character varying(50) NOT NULL,
  SALES_CHANNEL character varying(50),
  POLICIES_TO_AGREE text NOT NULL,
  REFERENCE_TIMESTAMP timestamp without time zone NOT NULL,
  BASKET_DISCOUNT_CODE character varying(100),
  BU_TIMEZONE character varying(10) NOT NULL,
  STATUS character varying(50) NOT NULL,
  STATUS_REASON character varying(100) NOT NULL,
  CREATE_TIMESTAMP timestamp without time zone NOT NULL,
  CHANGE_TIMESTAMP timestamp without time zone NOT NULL,
  PRIMARY KEY (STORE_ORDER_ID)
)
WITH (
  OIDS = FALSE,
  autovacuum_enabled = TRUE
);


CREATE UNIQUE INDEX PK_STORE_ORDER_INDEX
  ON STORE_ORDER USING btree
  (STORE_ORDER_ID DESC NULLS LAST);


CREATE TABLE STORE_ORDER_ITEM
(
  STORE_ORDER_ITEM_ID bigint NOT NULL,
  STORE_ORDER_ID bigint NOT NULL,
  OFFER_CODE character varying(35),
  SIRI_BEST_TYPE character varying(1),
  SIRI_SA_CODE character varying(4),
  SIRI_UPGRADE_CODE character varying(11),
  EXTERNAL_CONTRACT_ID character varying(38),
  CONTRACT_START_DATE timestamp without time zone,
  CONTRACT_END_DATE timestamp without time zone,
  STATUS character varying(50) NOT NULL,
  STATUS_REASON character varying(50) NOT NULL,
  CREATE_TIMESTAMP timestamp without time zone NOT NULL,
  CHANGE_TIMESTAMP timestamp without time zone NOT NULL,
  PRIMARY KEY (STORE_ORDER_ITEM_ID)
)
WITH (
OIDS = FALSE,
autovacuum_enabled = TRUE
);

CREATE UNIQUE INDEX PK_STORE_ORDER_ITEM
  ON STORE_ORDER_ITEM USING btree
  (STORE_ORDER_ITEM_ID DESC NULLS LAST);

ALTER TABLE STORE_ORDER_ITEM
  ADD CONSTRAINT FK_STORE_ORDER FOREIGN KEY (STORE_ORDER_ID)
REFERENCES STORE_ORDER (STORE_ORDER_ID) MATCH SIMPLE
  ON UPDATE NO ACTION
  ON DELETE NO ACTION;


CREATE INDEX IDX_FK_STORE_ORDER
  ON STORE_ORDER_ITEM(STORE_ORDER_ID);


CREATE SEQUENCE SQ_STORE_ORDER_ITEM_ID
  START WITH 51
  INCREMENT BY 50
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;

CREATE SEQUENCE SQ_STORE_ORDER_ID
  START WITH 51
  INCREMENT BY 50
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;