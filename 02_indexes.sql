create index client_snapshots_idx1 on client_snapshots(client_id);
create index interaction_events_idx1 on interaction_events(client_id);
create index agreements_idx1 on agreements(client_id);
create index applications_idx1 on applications(client_id);
create index balance_snapshots_idx1 on balance_snapshots(instrument_id);
create index financial_instruments_idx1 on financial_instruments(agreement_id);
create index transactions_idx1 on transactions(instrument_id);
