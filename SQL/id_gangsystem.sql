ALTER TABLE `users`
ADD COLUMN `gang` varchar(255) DEFAULT NULL,
ADD COLUMN `gang_rank` varchar(255) DEFAULT NULL;

CREATE TABLE `id_gangs` (
  `name` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(255) DEFAULT NULL,
  `ranks` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `maxMembers` int(11) DEFAULT NULL,
  `maxPushers` int(11) DEFAULT NULL,
  `locations` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;