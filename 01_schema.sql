CREATE TABLE clients (
  client_id serial PRIMARY KEY,
  client_type varchar(10) not null check(client_type in ('common','pro','premium')),
  tax_id varchar(20) not null unique,
  full_name varchar(255) not null,
  registration_date date not null check (registration_date <= CURRENT_DATE),
  status varchar(20) not null default 'active' CHECK(status IN ('active', 'blocked', 'closed', 'pending')),
  created_at timestamp not null default CURRENT_TIMESTAMP,
  email varchar(255) not null,
  phone varchar(12) not null
);

CREATE TABLE agreements (
  agreement_id serial PRIMARY key,
  client_id integer not null references clients(client_id) on delete cascade,
  agreement_number varchar(50) not null unique,
  agreement_type varchar(50) not null check(agreement_type in ('service', 'credit', 'deposit', 'card', 'investment')),
  start_date date not null default CURRENT_DATE,
  end_date date check(end_date > start_date),
  status varchar(20) not null default 'active' check(status in ('active', 'closed', 'terminated', 'suspended', 'pending')),
  created_at timestamp not null default CURRENT_TIMESTAMP
);

CREATE TABLE financial_products (
  product_id serial PRIMARY KEY,
  product_code varchar(20) unique not null,
  product_name varchar(100) not null,
  product_type varchar(30) not null check(product_type in ('account', 'card', 'loan', 'deposit', 'investment')),
  category varchar(50) not null check(category in ('credit', 'debit', 'savings', 'investment', 'insurance')),
  is_active boolean not null default true,
  description text
);

CREATE TABLE financial_instruments (
  instrument_id serial PRIMARY KEY,
  agreement_id integer not null references agreements(agreement_id) on delete cascade,
  product_id integer not null references financial_products(product_id) on delete restrict,
  instrument_number varchar(50) not null unique,
  currency varchar(3) not null default 'RUB',
  opening_date date not null default CURRENT_DATE check(opening_date <= CURRENT_DATE),
  closing_date date check(closing_date > opening_date),
  current_balance decimal(15,2) not null default 0 check(current_balance >= 0),
  status varchar(20) not null default 'active' check(status in ('active', 'closed', 'frozen', 'dormant')),
  instrument_details json
);

CREATE TABLE counterparties (
  counterparty_id serial PRIMARY KEY,
  counterparty_type varchar(20) not null check(counterparty_type in ('individual', 'company', 'bank', 'government', 'other')),
  tax_id varchar(20),
  name varchar(255) not null,
  bank_bic varchar(9),
  account_number varchar(34),
  category varchar(100)
);

CREATE TABLE transactions (
  transaction_id serial PRIMARY KEY,
  instrument_id integer not null references financial_instruments(instrument_id) on delete restrict,
  operation_date timestamp not null default CURRENT_TIMESTAMP check(operation_date <= CURRENT_TIMESTAMP),
  value_date date not null default CURRENT_DATE check(value_date <= CURRENT_DATE),
  amount decimal(15,2) not null check(amount != 0),
  currency varchar(3) not null default 'RUB',
  transaction_type varchar(20) not null check(transaction_type in ('debit', 'credit', 'transfer', 'payment', 'withdrawal', 'deposit')),
  description varchar(500),
  counterparty_info varchar(255),
  mcc_code varchar(4),
  status varchar(20) not null default 'completed' check(status in ('pending', 'completed', 'failed', 'cancelled', 'reversed')),
  parent_transaction_id integer references transactions(transaction_id),
  counterparty_id integer references counterparties(counterparty_id)
);

CREATE TABLE transaction_categories (
  category_id serial PRIMARY KEY,
  mcc_code varchar(4) not null unique,
  category_name varchar(100) not null,
  is_business_expense boolean not null default false
);

CREATE TABLE channels (
  channel_id serial PRIMARY KEY,
  channel_name varchar(50) not null unique check(channel_name in ('mobile_app', 'web', 'atm', 'api', 'branch', 'call_center')),
  channel_type varchar(20) not null check(channel_type in ('digital', 'physical', 'hybrid')),
  is_active boolean not null default true
);

CREATE TABLE marketing_campaigns (
  campaign_id serial PRIMARY KEY,
  campaign_name varchar(100) not null,
  campaign_type varchar(30) not null check(campaign_type in ('email', 'sms', 'push', 'offline', 'social')),
  start_date date not null default CURRENT_DATE,
  end_date date check(end_date > start_date),
  target_segment varchar(50) not null check(target_segment in ('common', 'pro', 'premium', 'vip', 'sme', 'all')),
  status varchar(20) not null default 'planned' check(status in ('planned', 'active', 'completed', 'cancelled')),
  budget decimal(15,2) not null default 0 check(budget >= 0)
);

CREATE TABLE client_offers (
  offer_id serial PRIMARY KEY,
  client_id integer not null references clients(client_id),
  campaign_id integer not null references marketing_campaigns(campaign_id),
  offer_date date not null default CURRENT_DATE check(offer_date <= CURRENT_DATE),
  offer_status varchar(20) not null default 'sent' check(offer_status in ('sent', 'viewed', 'accepted', 'rejected', 'expired')),
  acceptance_date date check(acceptance_date >= offer_date),
  conversion_value decimal(15,2) default 0 check(conversion_value >= 0)
);

CREATE TABLE interaction_events (
  event_id serial PRIMARY KEY,
  client_id integer not null references clients(client_id),
  channel_id integer not null references channels(channel_id),
  event_type varchar(50) not null check(event_type in ('login', 'logout', 'page_view', 'transaction', 'offer_view', 'offer_click', 'error')),
  event_timestamp timestamp not null default CURRENT_TIMESTAMP check(event_timestamp <= CURRENT_TIMESTAMP),
  session_id varchar(100) not null,
  device_type varchar(50) not null check(device_type in ('mobile', 'desktop', 'tablet', 'atm', 'other')),
  ip_address varchar(45) not null,
  duration_seconds integer not null default 0 check(duration_seconds >= 0)
);

CREATE TABLE employees (
  employee_id serial PRIMARY KEY,
  department varchar(100) not null,
  role varchar(50) not null,
  is_active boolean not null default true
);

CREATE TABLE applications (
  application_id serial PRIMARY KEY,
  client_id integer not null references clients(client_id),
  product_id integer not null references financial_products(product_id),
  employee_id integer references employees(employee_id),
  application_date timestamp not null default CURRENT_TIMESTAMP check(application_date <= CURRENT_TIMESTAMP),
  application_type varchar(50) not null check(application_type in ('new', 'upgrade', 'closure', 'modification')),
  status varchar(30) not null default 'pending' check(status in ('pending', 'approved', 'rejected', 'cancelled', 'under_review')),
  decision_date timestamp check(decision_date >= application_date),
  decision_reason text,
  requested_amount decimal(15,2) not null default 0 check(requested_amount >= 0),
  approved_amount decimal(15,2) default 0 check(approved_amount >= 0)
);

CREATE TABLE balance_snapshots (
  snapshot_id serial PRIMARY KEY,
  instrument_id integer not null references financial_instruments(instrument_id),
  snapshot_date date not null default CURRENT_DATE check(snapshot_date <= current_date),
  closing_balance decimal(15,2) not null check(closing_balance >= 0),
  average_balance decimal(15,2) not null check(average_balance >= 0),
  min_balance decimal(15,2) not null check(min_balance >= 0),
  max_balance decimal(15,2) not null check(max_balance >= min_balance and max_balance >= 0)
);

CREATE TABLE client_snapshots (
  client_snapshot_id serial PRIMARY KEY,
  client_id integer not null references clients(client_id),
  snapshot_date date not null default CURRENT_DATE check(snapshot_date <= CURRENT_DATE),
  total_balance decimal(15,2) not null check(total_balance >= 0),
  active_products_count integer not null check(active_products_count >= 0),
  monthly_turnover decimal(15,2) not null check(monthly_turnover >= 0),
  segment varchar(50) not null check(segment in ('common', 'pro', 'premium', 'vip', 'sme', 'corporate'))
);

CREATE TABLE instrument_transaction_categories (
  instrument_id integer not null references financial_instruments(instrument_id),
  category_id integer not null references transaction_categories(category_id),
  monthly_limit decimal(15,2) not null check(monthly_limit >= 0),
  actual_monthly_spend decimal(15,2) not null default 0 check(actual_monthly_spend >= 0),
  PRIMARY KEY (instrument_id, category_id)
);

