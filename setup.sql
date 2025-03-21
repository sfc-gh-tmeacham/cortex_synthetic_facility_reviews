-- =============================================
-- SESSION SETUP
-- =============================================
-- Set session context for the current user
USE ROLE SYSADMIN;                -- Your Role
USE DATABASE SANDBOX_DB;          -- Target database for our work
USE SCHEMA PUBLIC;                -- Initial schema (will be changed later)
USE WAREHOUSE COMPUTE_WH;         -- Compute resources for our session

-- =============================================
-- TEAM CONFIGURATION
-- =============================================
-- Define team name variable (must be uppercase with no spaces)
SET team_name = 'SUPERSTARS';

-- Create a dedicated schema for the team if it doesn't already exist
CREATE SCHEMA IF NOT EXISTS IDENTIFIER($team_name);
USE SCHEMA IDENTIFIER($team_name);     -- Switch to the team's schema

-- Verify schema creation was successful
show terse schemas;                    -- Display available schemas

-- =============================================
-- GIT REPOSITORY SETUP
-- =============================================
-- Create a Git repository integration in Snowflake for the EMS Protocol Chatbot project
CREATE GIT REPOSITORY CORTEX_SYNTHETIC_FACILITY_REVIEWS
	ORIGIN = 'https://github.com/sfc-gh-tmeacham/cortex_synthetic_facility_reviews.git' 
	API_INTEGRATION = 'GITHUB_ALL'     -- Uses pre-configured GitHub integration
	COMMENT = 'Git Repo Healthcare Facility Reviews Analysis with Snowflake Cortex HOL';

-- Display details about the Git repository configuration
DESCRIBE GIT REPOSITORY CORTEX_SYNTHETIC_FACILITY_REVIEWS;

-- Synchronize with the remote repository to ensure we have the latest code
ALTER GIT REPOSITORY CORTEX_SYNTHETIC_FACILITY_REVIEWS FETCH;

-- =============================================
-- GIT REPOSITORY EXPLORATION
-- =============================================
-- Example Git commands for repository exploration
-- For more information: https://docs.snowflake.com/en/developer-guide/git/git-operations

-- List all branches in the repository
SHOW GIT BRANCHES IN CORTEX_SYNTHETIC_FACILITY_REVIEWS;

-- List files in the main branch
LS @CORTEX_SYNTHETIC_FACILITY_REVIEWS/branches/main;

-- =============================================
-- NOTEBOOK CREATION
-- =============================================
-- Generate a unique notebook name based on team name
SET notebook_name = concat_ws('_',$team_name,'CORTEX_SYNTHETIC_FACILITY_REVIEWS');

-- Preview the generated notebook name
SELECT $notebook_name as notebook_name;

-- Create a Snowflake Notebook from the Git repository
CREATE OR REPLACE NOTEBOOK IDENTIFIER($notebook_name)
   FROM '@CORTEX_SYNTHETIC_FACILITY_REVIEWS/branches/main/' -- path to the files we need for our notebook
   MAIN_FILE = 'notebook_app.ipynb'    -- Primary notebook file to use
   COMMENT = 'Healthcare Facility Reviews Analysis with Snowflake Cortex'
   QUERY_WAREHOUSE = COMPUTE_WH        -- Compute resources for notebook execution

-- We are done with this worksheet
