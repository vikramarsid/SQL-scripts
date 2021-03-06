--
--  Author: Hari Sekhon
--  Date: 2020-08-12 10:36:55 +0100 (Wed, 12 Aug 2020)
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

-- Show PostgreSQL settings from postgres.conf file
--
-- Requires PostgreSQL 9.5+
--
-- Tested on PostgreSQL 9.5, 9.6, 10.x, 11.x, 12.x

SELECT
  *
FROM
  pg_file_settings;
