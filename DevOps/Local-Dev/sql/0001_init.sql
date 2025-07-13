-- Create schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS upaguru_copilot;

-- Create the table inside that schema
CREATE TABLE IF NOT EXISTS upaguru_copilot.lesson_plan_audit (
                                                                 id VARCHAR(100) PRIMARY KEY,
    subject VARCHAR(255),
    topic VARCHAR(255),
    grade_level VARCHAR(100),
    response BYTEA,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
    );
