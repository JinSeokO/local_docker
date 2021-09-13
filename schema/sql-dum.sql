CREATE DATABASE `recruit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;



CREATE TABLE  `recruit`.`user` (
                        `user_id` int(11) NOT NULL AUTO_INCREMENT,
                        `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `recruit`.`yearly_vacation` (
                                             `yearly_vacation_id` int(11) NOT NULL AUTO_INCREMENT,
                                             `user_id` int(11) NOT NULL,
                                             `year` int(11) NOT NULL,
                                             `left_vacation_count` float NOT NULL DEFAULT '15',
                                             PRIMARY KEY (`yearly_vacation_id`),
                                             UNIQUE KEY `yearly_vacation_pk` (`user_id`,`year`),
                                             CONSTRAINT `yearly_vacation_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `recruit`.`vacation` (
                            `vacation_id` int(11) NOT NULL AUTO_INCREMENT,
                            `yearly_vacation_id` int(11) DEFAULT NULL,
                            `start_date` date DEFAULT NULL,
                            `end_date` date DEFAULT NULL,
                            `vacation_type` enum('full','half','quarter') COLLATE utf8mb4_unicode_ci NOT NULL,
                            `period` float DEFAULT '0',
                            `comment` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
                            `state` enum('created','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'created',
                            PRIMARY KEY (`vacation_id`),
                            KEY `vacation_yearly_vacation_yearly_vacation_id_fk` (`yearly_vacation_id`),
                            CONSTRAINT `vacation_yearly_vacation_yearly_vacation_id_fk` FOREIGN KEY (`yearly_vacation_id`) REFERENCES `yearly_vacation` (`yearly_vacation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


