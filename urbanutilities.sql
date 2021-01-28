-- Database export via SQLPro (https://www.sqlprostudio.com/allapps.html)
-- Exported by josh at 28-01-2021 12:14.
-- WARNING: This file may contain descructive statements such as DROPs.
-- Please ensure that you are running the script at the proper location.


-- BEGIN TABLE failed_jobs
DROP TABLE IF EXISTS failed_jobs;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table failed_jobs contains no data. No inserts have been genrated.
-- Inserting 0 rows into failed_jobs


-- END TABLE failed_jobs

-- BEGIN TABLE migrations
DROP TABLE IF EXISTS migrations;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 9 rows into migrations
-- Insert batch #1
INSERT INTO migrations (id, migration, batch) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2021_01_28_084909_create_watchlists_table', 2);

-- END TABLE migrations

-- BEGIN TABLE oauth_access_tokens
DROP TABLE IF EXISTS oauth_access_tokens;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 3 rows into oauth_access_tokens
-- Insert batch #1
INSERT INTO oauth_access_tokens (id, user_id, client_id, name, scopes, revoked, created_at, updated_at, expires_at) VALUES
('3ef3d3d5cfe6cedf247a6fd8067cf2aaa02e1bcc0219937966396a9d916fac668b3f1a1f50ad8f78', 1, 2, NULL, '["*"]', 0, '2021-01-28 09:54:23', '2021-01-28 09:54:23', '2022-01-28 09:54:23'),
('b400e1b6f9099e4198535c861721b5f896fbbeacb452ebf577b538961b90e29a7c9c5afd7a22ba9a', 1, 2, NULL, '["*"]', 0, '2021-01-28 09:52:04', '2021-01-28 09:52:04', '2022-01-28 09:52:04'),
('daef1a7dab86ff98db28e79e8343691ab7afcd888881426eed2672c1d4ae9f1888bb4d6ac0260bd4', 1, 2, NULL, '["*"]', 0, '2021-01-28 09:32:18', '2021-01-28 09:32:18', '2022-01-28 09:32:18');

-- END TABLE oauth_access_tokens

-- BEGIN TABLE oauth_auth_codes
DROP TABLE IF EXISTS oauth_auth_codes;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table oauth_auth_codes contains no data. No inserts have been genrated.
-- Inserting 0 rows into oauth_auth_codes


-- END TABLE oauth_auth_codes

-- BEGIN TABLE oauth_clients
DROP TABLE IF EXISTS oauth_clients;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 2 rows into oauth_clients
-- Insert batch #1
INSERT INTO oauth_clients (id, user_id, name, secret, provider, redirect, personal_access_client, password_client, revoked, created_at, updated_at) VALUES
(1, NULL, 'Laravel Personal Access Client', 'N8nQXT1mCbL0PJulf5qqGQAoTanfRBJPTrXpWVv8', NULL, 'http://localhost', 1, 0, 0, '2021-01-28 08:40:37', '2021-01-28 08:40:37'),
(2, NULL, 'Laravel Password Grant Client', 's6EbNKi1cuvZ0vchdyeXZhBKyIfc5TXpPOsJ7wCq', 'users', 'http://localhost', 0, 1, 0, '2021-01-28 08:40:37', '2021-01-28 08:40:37');

-- END TABLE oauth_clients

-- BEGIN TABLE oauth_personal_access_clients
DROP TABLE IF EXISTS oauth_personal_access_clients;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 1 row into oauth_personal_access_clients
-- Insert batch #1
INSERT INTO oauth_personal_access_clients (id, client_id, created_at, updated_at) VALUES
(1, 1, '2021-01-28 08:40:37', '2021-01-28 08:40:37');

-- END TABLE oauth_personal_access_clients

-- BEGIN TABLE oauth_refresh_tokens
DROP TABLE IF EXISTS oauth_refresh_tokens;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 3 rows into oauth_refresh_tokens
-- Insert batch #1
INSERT INTO oauth_refresh_tokens (id, access_token_id, revoked, expires_at) VALUES
('a14e2639c7805e75bbbed0fd65458a948fd8a5553a8c3db4db3c90ed87161354f448e476b6a31b1f', 'b400e1b6f9099e4198535c861721b5f896fbbeacb452ebf577b538961b90e29a7c9c5afd7a22ba9a', 0, '2022-01-28 09:52:04'),
('adbfeb3103b13aa91cac7d43556bfd6dfab60ec1cbedbccd286938a11d9b9ee67fc90b9a676d2312', '3ef3d3d5cfe6cedf247a6fd8067cf2aaa02e1bcc0219937966396a9d916fac668b3f1a1f50ad8f78', 0, '2022-01-28 09:54:23'),
('f64c10bea99a4537e09efc2cdccc30e2d16c44cf46cdd081699e330f0f5965bdbf6c016641b38ce4', 'daef1a7dab86ff98db28e79e8343691ab7afcd888881426eed2672c1d4ae9f1888bb4d6ac0260bd4', 0, '2022-01-28 09:32:18');

-- END TABLE oauth_refresh_tokens

-- BEGIN TABLE password_resets
DROP TABLE IF EXISTS password_resets;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table password_resets contains no data. No inserts have been genrated.
-- Inserting 0 rows into password_resets


-- END TABLE password_resets

-- BEGIN TABLE users
DROP TABLE IF EXISTS users;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 1 row into users
-- Insert batch #1
INSERT INTO users (id, name, email, email_verified_at, password, api_token, remember_token, created_at, updated_at) VALUES
(1, 'Josh Harington', 'josh1@live.co.za', NULL, '$2y$10$BxkUOREP9/x6Y6brlmkhHuG3g.iNZKTnfyun6X8hgNDjYSVrk2P4W', NULL, 'DV2k2ZpQLREQj0dpukdBulVi3DX89an7IgzVjiMhHDPjGARhWDFjR0Lo6FpS', '2021-01-28 07:54:49', '2021-01-28 07:54:49');

-- END TABLE users

-- BEGIN TABLE watchlists
DROP TABLE IF EXISTS watchlists;
CREATE TABLE `watchlists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `movie_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserting 14 rows into watchlists
-- Insert batch #1
INSERT INTO watchlists (id, user_id, movie_id, created_at, updated_at, deleted_at) VALUES
(1, 1, 464052, '2021-01-28 09:48:55', '2021-01-28 09:49:01', '2021-01-28 09:49:01'),
(2, 1, 553604, '2021-01-28 09:48:56', '2021-01-28 09:48:57', '2021-01-28 09:48:57'),
(3, 1, 553604, '2021-01-28 09:48:59', '2021-01-28 09:49:00', '2021-01-28 09:49:00'),
(4, 1, 464052, '2021-01-28 09:49:01', '2021-01-28 10:09:31', '2021-01-28 10:09:31'),
(5, 1, 577922, '2021-01-28 09:49:02', '2021-01-28 10:11:01', '2021-01-28 10:11:01'),
(6, 1, 508442, '2021-01-28 09:57:23', '2021-01-28 09:57:27', '2021-01-28 09:57:27'),
(7, 1, 628534, '2021-01-28 09:57:28', '2021-01-28 10:13:04', '2021-01-28 10:13:04'),
(8, 1, 464052, '2021-01-28 10:12:49', '2021-01-28 10:13:05', '2021-01-28 10:13:05'),
(9, 1, 553604, '2021-01-28 10:12:50', '2021-01-28 10:12:50', NULL),
(10, 1, 577922, '2021-01-28 10:12:50', '2021-01-28 10:12:50', NULL),
(11, 1, 529203, '2021-01-28 10:12:53', '2021-01-28 10:13:01', '2021-01-28 10:13:01'),
(12, 1, 458576, '2021-01-28 10:12:54', '2021-01-28 10:12:54', NULL),
(13, 1, 732721, '2021-01-28 10:12:55', '2021-01-28 10:12:55', NULL),
(14, 1, 575446, '2021-01-28 10:12:56', '2021-01-28 10:12:56', NULL);

-- END TABLE watchlists

