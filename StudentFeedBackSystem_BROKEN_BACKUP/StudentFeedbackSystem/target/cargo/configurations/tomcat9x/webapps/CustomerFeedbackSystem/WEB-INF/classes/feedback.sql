
-- Create Feedback Table
CREATE TABLE IF NOT EXISTS st_feedback (
    ID BIGINT PRIMARY KEY,
    teacher_id BIGINT,
    student_id BIGINT,
    student_name VARCHAR(255),
    k_rating INT,
    c_rating INT,
    m_rating INT,
    p_rating INT,
    o_rating INT,
    comments TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255),
    modified_by VARCHAR(255),
    created_datetime TIMESTAMP,
    modified_datetime TIMESTAMP
);

-- Insert Dummy Teacher (assuming Role ID 3 is Teacher)
-- Ensure this user doesn't already exist to avoid duplicates if run multiple times (basic check ignored for script simplicity, reliance on unique constraint if any)
-- Password 'root' (as per system properties helper or standard dev env)
INSERT INTO user (ID, NAME, USERNAME, PASSWORD, EMAIL, CONTACTNO, GENDER, DOB, ROLEID, ROLENAME, CREATED_BY, MODIFIED_BY, CREATED_DATETIME, MODIFIED_DATETIME)
VALUES (1001, 'John Doe', 'teacher1', 'teacher123', 'john.doe@college.edu', '9876543210', 'Male', '1980-01-01', 3, 'TEACHER', 'admin', 'admin', NOW(), NOW())
ON DUPLICATE KEY UPDATE NAME='John Doe';
