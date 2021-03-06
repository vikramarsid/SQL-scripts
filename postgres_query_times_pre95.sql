--
--  Author: Hari Sekhon
--  Date: 2020-08-05 16:16:21 +0100 (Wed, 05 Aug 2020)
--
--  vim:ts=2:sts=2:sw=2:et:filetype=sql
--
--  https://github.com/harisekhon/sql
--
--  License: see accompanying Hari Sekhon LICENSE file
--
--  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
--
--  https://www.linkedin.com/in/harisekhon
--

-- PostgreSQL query times from pg_stat_statements for PostgreSQL <= 9.4
--
-- Requires PostgreSQL 9.1+
--
-- Tested on PostgreSQL 9.1+, 10.x, 11.x, 12.x

-- postgresql.conf needs before start:
-- shared_preload_libraries = 'pg_stat_statements'
--
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

SELECT
  calls,
  rows,
  ROUND(total_time::numeric / 1000, 4) AS total_secs,
  -- newer versions of PostgreSQL have mean_time field, but we have to calculate on PostgreSQL <= 9.4
  ROUND(total_time::numeric / 1000 / GREATEST(calls, 1), 4) AS average_secs,
  query
FROM
  pg_stat_statements
ORDER BY
  average_secs DESC,
  calls DESC,
  rows DESC
LIMIT 100;
