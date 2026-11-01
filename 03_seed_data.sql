-- Каналы обслуживания
INSERT INTO channels (channel_name, channel_type, is_active) VALUES
('mobile_app', 'digital', true),
('web', 'digital', true),
('atm', 'physical', true),
('api', 'digital', true),
('branch', 'physical', true),
('call_center', 'hybrid', true);

-- Финансовые продукты
INSERT INTO financial_products (product_code, product_name, product_type, category, is_active, description) VALUES
('acc-001', 'Текущий счет', 'account', 'debit', true, 'Стандартный текущий счет для ежедневных операций'),
('acc-002', 'Накопительный счет', 'account', 'savings', true, 'Счет с начислением процентов на остаток'),
('card-001', 'Дебетовая карта Classic', 'card', 'debit', true, 'Дебетовая карта с кэшбэком'),
('card-002', 'Дебетовая карта Premium', 'card', 'debit', true, 'Премиальная дебетовая карта'),
('card-003', 'Кредитная карта', 'card', 'credit', true, 'Кредитная карта с льготным периодом'),
('loan-001', 'Потребительский кредит', 'loan', 'credit', true, 'Кредит на любые цели'),
('loan-002', 'Автокредит', 'loan', 'credit', true, 'Кредит на покупку автомобиля'),
('loan-003', 'Ипотека', 'loan', 'credit', true, 'Кредит на покупку недвижимости'),
('dep-001', 'Депозит Срочный', 'deposit', 'savings', true, 'Срочный вклад с фиксированной ставкой'),
('dep-002', 'Депозит Пополняемый', 'deposit', 'savings', true, 'Вклад с возможностью пополнения'),
('inv-001', 'Инвестиционный портфель', 'investment', 'investment', true, 'Готовые инвестиционные решения'),
('inv-002', 'ИИС', 'investment', 'investment', true, 'Индивидуальный инвестиционный счет');

-- Категории транзакций
INSERT INTO transaction_categories (mcc_code, category_name, is_business_expense) VALUES
('5411', 'Продуктовые магазины', false),
('5812', 'Рестораны и кафе',  false),
('5813', 'Бары и ночные клубы',  false),
('4121', 'Такси', false),
('4784', 'Платные дороги и транспорт', false),
('4814', 'Телекоммуникации и связь', false),
('4900', 'Коммунальные платежи', true),
('5311', 'Универмаги', false),
('5691', 'Магазины одежды', false),
('5732', 'Электроника и техника',  false),
('5912', 'Аптеки',  false),
('5977', 'Косметика и парфюмерия',  false),
('6012', 'Финансовые сервисы и переводы',  false),
('7011', 'Отели и гостиницы',  true),
('7995', 'Азартные игры', false),
('8090', 'Медицинские услуги', false),
('8211', 'Образование', true),
('8398', 'Благотворительность', false),
('9399', 'Госуслуги и штрафы', true),
('0000', 'Прочие расходы', false);

-- Контрагенты
INSERT INTO counterparties (counterparty_type, tax_id, name, bank_bic, account_number, category) VALUES
('bank', '7700000001', 'ЦБ РФ', '044525000', null, 'regulator'),
('bank', '7702000002', 'ПАО Сбербанк', '044525225', null, 'systemically_important'),
('bank', '7703000003', 'Банк ВТБ', '044525000', null, 'systemically_important'),
('bank', '7704000004', 'Газпромбанк', '044525000', null, 'systemically_important'),
('company', '7715000005', 'ООО "Ромашка Retail"', '044525000', '40702810123450000001', 'retail'),
('company', '7716000006', 'ООО "Лютик Опт"', '044525000', '40702810123450000002', 'wholesale'),
('company', '7717000007', 'АО "Технологии Будущего"', '044525000', '40702810123450000003', 'it'),
('company', '7718000008', 'ООО "СтройИнвест"', '044525000', '40702810123450000004', 'construction'),
('individual', '123456789012', 'Петров Иван Сидорович', null, null, 'salary'),
('individual', '123456789013', 'Иванова Мария Петровна', null, null, 'business'),
('individual', '123456789014', 'Сидоров Алексей Иванович', null, null, 'investor'),
('individual', '123456789015', 'Кузнецова Елена Дмитриевна', null, null, 'pensioner'),
('government', '7719000009', 'ФНС России', null, null, 'tax'),
('government', '7720000010', 'СФР (ПФР)', null, null, 'pension'),
('other', null, 'Прочие контрагенты', null, null, 'misc');

-- Сотрудники
INSERT INTO employees (department, role, is_active) VALUES
('кредитный отдел', 'менеджер', true),
('кредитный отдел', 'старший менеджер', true),
('кредитный отдел', 'начальник отдела', true),
('депозитный отдел', 'менеджер', true),
('депозитный отдел', 'старший менеджер', true),
('отдел обслуживания', 'операционист', true),
('отдел обслуживания', 'старший операционист', true),
('отдел обслуживания', 'администратор зала', true),
('отдел пластиковых карт', 'менеджер', true),
('отдел пластиковых карт', 'специалист', true),
('инвестиционный отдел', 'консультант', true),
('инвестиционный отдел', 'старший консультант', true),
('бэк-офис', 'специалист', true),
('бэк-офис', 'ведущий специалист', true),
('отдел рисков', 'аналитик', true),
('отдел рисков', 'старший аналитик', true),
('call-центр', 'оператор', true),
('call-центр', 'ведущий оператор', true),
('отдел маркетинга', 'менеджер', true),
('отдел разработки', 'программист', true);

-- Маркетинговые кампании
INSERT INTO marketing_campaigns (campaign_name, campaign_type, start_date, end_date, target_segment, status, budget) VALUES
('Летняя акция', 'email', current_date - 30, current_date + 60, 'all', 'active', 500000.00),
('Приветственный бонус', 'sms', current_date - 15, current_date + 45, 'common', 'active', 300000.00),
('Премиум-предложение', 'email', current_date - 45, current_date + 15, 'premium', 'active', 750000.00),
('Кэшбэк за покупки', 'push', current_date - 60, current_date - 5, 'pro', 'completed', 400000.00),
('Новогодняя акция', 'email', current_date + 10, current_date + 40, 'all', 'planned', 1000000.00),
('Весенний марафон', 'sms', current_date + 5, current_date + 35, 'sme', 'planned', 250000.00),
('Карта лояльности', 'offline', current_date - 90, current_date - 30, 'vip', 'completed', 600000.00),
('Инвестиционный портфель', 'social', current_date - 20, current_date + 20, 'premium', 'active', 450000.00);

-- Клиенты
INSERT INTO clients (client_type, tax_id, full_name, registration_date, status, created_at, email, phone)
SELECT
    (array['common', 'pro', 'premium'])[floor(random()*3+1)],
    lpad(floor(random()*999999999999)::text, 12, '0'),
    case when random() < 0.5 then
        (array['Иванов', 'Петров', 'Сидоров', 'Смирнов', 'Кузнецов'])[floor(random()*5+1)] || ' ' ||
        (array['Иван', 'Петр', 'Сергей', 'Алексей', 'Дмитрий'])[floor(random()*5+1)] || ' ' ||
        (array['Иванович', 'Петрович', 'Сергеевич', 'Алексеевич', 'Дмитриевич'])[floor(random()*5+1)]
    else
        (array['Иванова', 'Петрова', 'Сидорова', 'Смирнова', 'Кузнецова'])[floor(random()*5+1)] || ' ' ||
        (array['Екатерина', 'Анастасия', 'Мария', 'Ольга', 'Елена'])[floor(random()*5+1)] || ' ' ||
        (array['Ивановна', 'Петровна', 'Сергеевна', 'Алексеевна', 'Дмитриевна'])[floor(random()*5+1)]
    end,
    (current_date - (random() * 1825)::int),
    (array['active', 'active', 'active', 'blocked', 'pending'])[floor(random()*5+1)],
    (current_timestamp - (random() * interval '730 days')),
    substring(md5(random()::text), 1, 8) || floor(random() * 1000)::text || '@' || 
    (array['yandex.ru', 'mail.ru', 'gmail.com'])[floor(random() * 3 + 1)],
    '+7' || (array['903', '916', '925', '926', '985'])[floor(random()*5+1)] || 
    lpad(floor(random()*10000000)::text, 7, '0')
FROM generate_series(1, 200);

-- Договоры
WITH 
client_list AS (SELECT client_id FROM clients),
random_data AS (
    SELECT 
        client_id,
        current_date - (random()*365)::int AS start_date,
        random() AS rand_for_case,
        random() AS rand_for_end_date,
        random() AS rand_for_create
    FROM generate_series(1, 350), client_list
)
INSERT INTO agreements (client_id, agreement_number, agreement_type, start_date, end_date, status, created_at)
SELECT
    client_id,
    'agr-' || to_char(now(), 'yyyymmdd') || '-' || lpad(row_number() over ()::text, 6, '0'),
    (array['service', 'credit', 'deposit', 'card', 'investment'])[floor(random()*5+1)],
    start_date,
    CASE 
        WHEN rand_for_case < 0.3 THEN start_date + (rand_for_end_date * 365)::int + 30
        ELSE null
    END,
    (array['active', 'active', 'active', 'closed', 'pending', 'suspended'])[floor(random()*6+1)],
    start_date - (rand_for_create*30)::int
FROM random_data
ORDER BY random()
LIMIT 350;

-- Финансовые инструменты
WITH 
agreement_list AS (SELECT agreement_id FROM agreements),
product_list AS (SELECT product_id FROM financial_products),
random_instruments AS MATERIALIZED (
    SELECT 
        agreement_id,
        product_id,
        random() AS rand_currency,
        random() AS rand_opening_days,
        random() AS rand_closing_days,
        random() AS rand_closing_null,
        random() AS rand_balance,
        random() AS rand_status,
        random() AS rand_rate,
        random() AS rand_overdraft,
        random() AS rand_overdraft_null,
        random() AS rand_auto_payment
    FROM agreement_list
    CROSS JOIN product_list
),
instrument_data AS (
    SELECT
        agreement_id,
        product_id,
        rand_currency,
        current_date - (rand_opening_days * 730)::int AS opening_date,
        rand_closing_days,
        rand_closing_null,
        (rand_balance * 500000)::decimal(15,2) AS current_balance,
        rand_status,
        rand_rate,
        rand_overdraft,
        rand_overdraft_null,
        rand_auto_payment,
        row_number() OVER (ORDER BY random()) AS rn
    FROM random_instruments
)
INSERT INTO financial_instruments (agreement_id, product_id, instrument_number, currency, opening_date, closing_date, current_balance, status, instrument_details)
SELECT
    agreement_id,
    product_id,
    'instr-' || to_char(now(), 'yyyymmdd') || '-' || lpad(rn::text, 8, '0'),
    (array['RUB', 'USD', 'EUR'])[floor(rand_currency * 3 + 1)],
    opening_date,
    CASE 
        WHEN rand_closing_null < 0.85 THEN null
        ELSE opening_date + (rand_closing_days * 180)::int + 1
    END AS closing_date,
    current_balance,
    (array['active', 'active', 'active', 'closed', 'frozen'])[floor(rand_status * 5 + 1)],
    jsonb_build_object(
        'interest_rate', (rand_rate * 15)::decimal(5,2),
        'overdraft_limit', CASE 
                              WHEN rand_overdraft_null < 0.3 
                              THEN (rand_overdraft * 100000)::decimal(10,2) 
                              ELSE null 
                           END,
        'auto_payment', rand_auto_payment < 0.2
    )::json
FROM instrument_data
ORDER BY random()
LIMIT 450;

-- Транзакции

WITH 
instrument_list AS (SELECT instrument_id, currency FROM financial_instruments),
counterparty_list AS (SELECT counterparty_id, name FROM counterparties),
category_list AS (SELECT mcc_code, category_name FROM transaction_categories)
INSERT INTO transactions (instrument_id, operation_date, value_date, amount, currency, transaction_type, description, counterparty_info, mcc_code, status, counterparty_id)
SELECT
    i.instrument_id,
    op_date,
    op_date::date AS value_date,
    CASE 
        WHEN t_type IN ('debit', 'payment', 'withdrawal') THEN -1 * round((random() * 25000 + 50)::numeric, 2)
        ELSE round((random() * 80000 + 500)::numeric, 2)
    END AS amount,
    i.currency,
    t_type,
    'Операция: ' || cat.category_name,
    cp.name AS counterparty_info,
    cat.mcc_code,
    (array['completed', 'completed', 'completed', 'pending', 'failed'])[floor(random()*5+1)],
    cp.counterparty_id
FROM (
    SELECT 
        (current_timestamp - (random() * interval '365 days')) AS op_date,
        (array['debit', 'credit', 'transfer', 'payment', 'withdrawal', 'deposit'])[floor(random()*6+1)] AS t_type
    FROM generate_series(1, 2000)
) params
JOIN LATERAL (SELECT instrument_id, currency FROM instrument_list ORDER BY random() LIMIT 1) i ON true
JOIN LATERAL (SELECT counterparty_id, name FROM counterparty_list ORDER BY random() LIMIT 1) cp ON true
JOIN LATERAL (SELECT mcc_code, category_name FROM category_list ORDER BY random() LIMIT 1) cat ON true;


-- Офферы клиентам 
WITH 
client_list AS (SELECT client_id FROM clients),
campaign_list AS (SELECT campaign_id FROM marketing_campaigns),
random_offers AS (
    SELECT 
        client_id,
        campaign_id,
        current_date - (random() * 90)::int AS offer_date,
        random() AS rand_status,
        random() AS rand_acceptance,
        random() AS rand_conversion
    FROM generate_series(1, 300), client_list, campaign_list
)
INSERT INTO client_offers (client_id, campaign_id, offer_date, offer_status, acceptance_date, conversion_value)
SELECT
    client_id,
    campaign_id,
    offer_date,
    (array['sent', 'sent', 'viewed', 'accepted', 'rejected', 'expired'])[floor(rand_status*6+1)],
    CASE 
        WHEN rand_acceptance < 0.3 THEN offer_date + (random() * 5)::int 
        ELSE null 
    END,
    CASE 
        WHEN rand_conversion < 0.2 THEN (random() * 50000)::decimal(15,2) 
        ELSE 0 
    END
FROM random_offers
ORDER BY random()
LIMIT 300;

-- События взаимодействий
WITH 
client_list AS (SELECT client_id FROM clients),
channel_list AS (SELECT channel_id FROM channels),
random_events AS MATERIALIZED (
    SELECT 
        client_id,
        channel_id,
        random() AS rand_event_type,
        random() AS rand_timestamp,
        random() AS rand_device,
        random() AS rand_ip1,
        random() AS rand_ip2,
        random() AS rand_ip3,
        random() AS rand_ip4,
        random() AS rand_duration
    FROM client_list
    CROSS JOIN channel_list
    CROSS JOIN generate_series(1, 1500)
),
event_details AS (
    SELECT
        client_id,
        channel_id,
        CASE 
            WHEN rand_event_type < 0.40 THEN 'page_view'
            WHEN rand_event_type < 0.60 THEN 'login'
            WHEN rand_event_type < 0.75 THEN 'logout'
            WHEN rand_event_type < 0.85 THEN 'offer_view'
            WHEN rand_event_type < 0.92 THEN 'transaction'
            WHEN rand_event_type < 0.97 THEN 'offer_click'
            ELSE 'error'
        END AS event_type,
        current_timestamp - (pow(rand_timestamp, 1.5) * interval '180 days') AS event_timestamp,
        'sess_' || md5((client_id::text || floor(rand_timestamp * 100)::text)) AS session_id,
        CASE 
            WHEN rand_device < 0.50 THEN 'mobile'
            WHEN rand_device < 0.75 THEN 'desktop'
            WHEN rand_device < 0.90 THEN 'tablet'
            WHEN rand_device < 0.97 THEN 'other'
            ELSE 'atm'
        END AS device_type,
        floor(10 + rand_ip1 * 245)::int || '.' || 
        floor(rand_ip2 * 255)::int || '.' || 
        floor(rand_ip3 * 255)::int || '.' || 
        floor(1 + rand_ip4 * 254)::int AS ip_address,
        floor(exp(rand_duration * 5) / 10)::int AS duration_seconds
    FROM random_events
)
INSERT INTO interaction_events (client_id, channel_id, event_type, event_timestamp, session_id, device_type, ip_address, duration_seconds)
SELECT
    client_id,
    channel_id,
    event_type,
    event_timestamp,
    session_id,
    device_type,
    ip_address,
    duration_seconds
FROM event_details
ORDER BY random()
LIMIT 1500;


-- Заявки
WITH 
client_list AS (SELECT client_id FROM clients),
product_list AS (SELECT product_id FROM financial_products),
employee_list AS (SELECT employee_id FROM employees),
raw_apps AS (
    SELECT
        c.client_id,
        p.product_id,
        CASE WHEN random() < 0.8 THEN e.employee_id ELSE null END AS employee_id,
        (current_timestamp - (random() * interval '180 days')) AS app_date,
        (array['new', 'new', 'upgrade', 'modification', 'closure'])[floor(random()*5+1)] AS app_type,
        (array['approved', 'approved', 'pending', 'rejected', 'under_review'])[floor(random()*5+1)] AS app_status,
        round((random() * 800000 + 10000)::numeric, 2) AS req_amount
    FROM generate_series(1, 250)
    JOIN LATERAL (SELECT client_id FROM client_list ORDER BY random() LIMIT 1) c ON true
    JOIN LATERAL (SELECT product_id FROM product_list ORDER BY random() LIMIT 1) p ON true
    JOIN LATERAL (SELECT employee_id FROM employee_list ORDER BY random() LIMIT 1) e ON true
)
INSERT INTO applications (client_id, product_id, employee_id, application_date, application_type, status, decision_date, decision_reason, requested_amount, approved_amount)
SELECT
    client_id,
    product_id,
    employee_id,
    app_date,
    app_type,
    app_status,
    CASE 
        WHEN app_status IN ('approved', 'rejected') THEN app_date + (random() * interval '5 days')
        ELSE null 
    END AS decision_date,
    CASE 
        WHEN app_status = 'rejected' THEN (array['Плохая кредитная история', 'Недостаточный доход', 'Предоставлен неполный пакет документов', 'Высокая долговая нагрузка'])[floor(random()*4+1)]
        WHEN app_status = 'approved' THEN 'Кредитный скоринг пройден успешно'
        ELSE null 
    END AS decision_reason,
    req_amount AS requested_amount,
    CASE 
        WHEN app_status = 'approved' THEN round((req_amount * (0.8 + random() * 0.2))::numeric, 2)
        ELSE 0.00 
    END AS approved_amount
FROM raw_apps;

-- Балансовые снимки инструментов
WITH 
instrument_list AS (
    SELECT 
        i.instrument_id,
        p.product_type,
        p.product_code,
        CASE WHEN p.product_type = 'deposit' AND p.product_code = 'dep-001' 
             THEN true ELSE false END AS is_fixed_deposit
    FROM financial_instruments i
    JOIN financial_products p ON i.product_id = p.product_id
),
random_snapshots AS MATERIALIZED (
    SELECT 
        instrument_id,
        is_fixed_deposit,
        random() AS rand_days,
        random() AS rand_closing,
        random() AS rand_min_pct,
        random() AS rand_avg_pct,
        random() AS rand_max
    FROM instrument_list
    CROSS JOIN generate_series(1, 5)
)
INSERT INTO balance_snapshots (instrument_id, snapshot_date, closing_balance, average_balance, min_balance, max_balance)
SELECT
    instrument_id,
    current_date - (rand_days * 30)::int AS snapshot_date,
    (rand_closing * 500000)::decimal(15,2) AS closing_balance,
    CASE 
        WHEN is_fixed_deposit THEN (rand_closing * 500000)::decimal(15,2)
        ELSE (min_bal + (max_bal - min_bal) * rand_avg_pct)::decimal(15,2)
    END AS average_balance,
    CASE 
        WHEN is_fixed_deposit THEN (rand_closing * 500000)::decimal(15,2)
        ELSE min_bal::decimal(15,2)
    END AS min_balance,
    CASE 
        WHEN is_fixed_deposit THEN (rand_closing * 500000)::decimal(15,2)
        ELSE max_bal::decimal(15,2)
    END AS max_balance
FROM (
    SELECT 
        *,
        50000 + (rand_max * 700000) AS max_bal,
        (50000 + (rand_max * 700000)) * (rand_min_pct * 0.8) AS min_bal
    FROM random_snapshots
) with_bounds
ORDER BY random()
LIMIT 500;

-- Клиентские снимки
WITH 
client_list AS (SELECT client_id FROM clients),
random_snapshots AS MATERIALIZED (
    SELECT 
        client_id,
        random() AS rand_days,
        random() AS rand_balance,
        random() AS rand_products,
        random() AS rand_turnover,
        random() AS rand_segment
    FROM client_list
    CROSS JOIN generate_series(1, 3)
)
INSERT INTO client_snapshots (client_id, snapshot_date, total_balance, active_products_count, monthly_turnover, segment)
SELECT
    client_id,
    current_date - (rand_days * 30)::int,
    (rand_balance * 3000000)::decimal(15,2),
    floor(rand_products * 5 + 1)::int,
    (rand_turnover * 500000)::decimal(15,2),
    (array['common', 'pro', 'premium', 'vip', 'sme', 'corporate'])[floor(rand_segment * 6 + 1)]
FROM random_snapshots
ORDER BY random()
LIMIT 200;

-- Лимиты по категориям трат
WITH 
card_account_instruments AS (
    SELECT i.instrument_id 
    FROM financial_instruments i
    JOIN financial_products p ON i.product_id = p.product_id
    WHERE p.product_type IN ('card', 'account')
),
category_list AS (SELECT category_id FROM transaction_categories),
all_pairs AS (
    SELECT 
        i.instrument_id,
        c.category_id,
        round((random() * 100000 + 5000)::numeric, 2) AS monthly_limit,
        round((random() * 80000)::numeric, 2) AS actual_monthly_spend,
        random() AS sort_order
    FROM card_account_instruments i
    CROSS JOIN category_list c
    WHERE random() < 0.20
),
unique_pairs AS (
    SELECT DISTINCT ON (instrument_id, category_id)
        instrument_id,
        category_id,
        monthly_limit,
        actual_monthly_spend
    FROM all_pairs
    ORDER BY instrument_id, category_id, sort_order
)
INSERT INTO instrument_transaction_categories (instrument_id, category_id, monthly_limit, actual_monthly_spend)
SELECT 
    instrument_id,
    category_id,
    monthly_limit,
    actual_monthly_spend
FROM unique_pairs
ORDER BY random()
LIMIT 600;
