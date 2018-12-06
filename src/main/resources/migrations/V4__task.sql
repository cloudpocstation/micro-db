create table store_task
(
  id bigint not null,
  use_case character varying(50) not null,
  data text not null,
  max_deliveries integer not null,
  delivery_count integer not null,
  next_delivery timestamptz not null,
  status character varying(30) not null,
  correlation_id character varying(50) not null,
  create_timestamp timestamptz not null,
  change_timestamp timestamptz not null,
  primary key (id)
)
with (
oids = false,
autovacuum_enabled = true
);

create sequence sq_task_id
  start with 51
  increment by 50
  no minvalue
  no maxvalue
  cache 1
  owned by store_task.id;
