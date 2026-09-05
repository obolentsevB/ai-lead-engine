CREATE SCHEMA IF NOT EXISTS app;

CREATE TABLE app.processed_submissions (
    submission_id TEXT PRIMARY KEY,
    email         TEXT NOT NULL,
    received_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE app.leads (
    id                  SERIAL PRIMARY KEY,
    submission_id       TEXT UNIQUE NOT NULL,
    full_name           TEXT,
    email               TEXT NOT NULL,
    domain              TEXT,
    message             TEXT,
    email_class         TEXT,
    mx_valid            BOOLEAN,
    enrichment_status   TEXT,
    icp_score           INT,
    score_reasons       JSONB,
    industry            TEXT,
    likely_pain         TEXT,
    personalized_opener TEXT,
    confidence          TEXT,
    red_flags           JSONB,
    route               TEXT,
    action_taken        TEXT,
    processing_ms       INT,
    input_tokens        INT,
    output_tokens       INT,
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX ON app.leads (created_at DESC);
CREATE INDEX ON app.leads (route);

CREATE TABLE app.workflow_errors (
    id            SERIAL PRIMARY KEY,
    workflow_name TEXT,
    node_name     TEXT,
    error_message TEXT,
    execution_id  TEXT,
    payload       JSONB,
    occurred_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);
