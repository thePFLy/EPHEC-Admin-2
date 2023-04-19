-- CREATE DATABASE servermail;

CREATE USER 'adminwoodytoys'@'127.0.0.1' IDENTIFIED BY 'adminwoodytoys';
GRANT ALL PRIVILEGES ON *.* TO 'adminwoodytoys'@'127.0.0.1';

-- GRANT SELECT ON servermail.* TO 'adminwoodytoys'@'127.0.0.1' IDENTIFIED BY 'adminwoodytoys';

FLUSH PRIVILEGES;

USE servermail;

CREATE TABLE `virtual_domains` (
`id`  INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `virtual_users` (
`id` INT NOT NULL AUTO_INCREMENT,
`domain_id` INT NOT NULL,
`password` VARCHAR(106) NOT NULL,
`email` VARCHAR(120) NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `email` (`email`),
FOREIGN KEY (domain_id) REFERENCES virtual_domains(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `virtual_aliases` (
`id` INT NOT NULL AUTO_INCREMENT,
`domain_id` INT NOT NULL,
`source` varchar(100) NOT NULL,
`destination` varchar(100) NOT NULL,
PRIMARY KEY (`id`),
FOREIGN KEY (domain_id) REFERENCES virtual_domains(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `servermail`.`virtual_domains`
(`id` ,`name`)
VALUES
('1', 'woodytoys.lab'),
('2', 'l2-4.ephec-ti.be');

INSERT INTO `servermail`.`virtual_users`
(`id`, `domain_id`, `password` , `email`)
VALUES
('1', '1', SHA2('simon', 256), 'simon@woodytoys.lab'),
('2', '1', SHA2('julien', 256), 'julien@woodytoys.lab'),
('3', '1', SHA2('sebastien', 256), 'sebastien@woodytoys.lab');

INSERT INTO `servermail`.`virtual_aliases`
(`id`, `domain_id`, `source`, `destination`)
VALUES
('1', '1', 'simonmoers@woodytoys.lab', 'simon@woodytoys.lab'),
('2', '1', 'julienmeire@woodytoys.lab', 'julien@woodytoys.lab'),
('3', '1', 'sebastienfantuzzi@woodytoys.lab', 'sebastien@woodytoys.lab');