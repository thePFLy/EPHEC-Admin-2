USE servermail;

INSERT INTO `servermail`.`virtual_domains` (`id` ,`name`)
VALUES 
('1', 'woodytoys.lab');

INSERT INTO `servermail`.`virtual_users` (`id`, `domain_id`, `password` , `email`)
VALUES
-- ('1', '1', ENCRYPT('firstpassword', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'simon@woodytoys.lab'),
-- ('2', '1', ENCRYPT('secondpassword', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'sebastien@woodytoys.lab'),
-- ('3', '1', ENCRYPT('secondpassword', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'julien@woodytoys.lab');
('1', '1', 'firstpassword', 'simon@woodytoys.lab'),
('2', '1', 'secondpassword', 'sebastien@woodytoys.lab'),
('3', '1', 'secondpassword', 'julien@woodytoys.lab');

INSERT INTO `servermail`.`virtual_aliases` (`id`, `domain_id`, `source`, `destination`)
VALUES
('1', '1', 'simon@woodytoys.lab', 'sebastien@woodytoys.lab');
