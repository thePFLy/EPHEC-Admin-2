lancer le docker compose :
être dans le dossier web et lancer la cmd:
$ docker-compose up -d

arrêt :
$ docker compose stop

Stop and/or destroy the containers
$ docker compose down

Stop and/or destroy the containers and their volumes (including named volumes)
$ docker compose down -v

Delete everything, including images and orphan containers
$ docker compose down -v --rmi all --remove-orphans


AFFICHAGE:
http://localhost/


ACCESS DB:
http://localhost:8080/

(user 'root' mdp 'root'; code de creation de table et remplissage dans "create table.txt")