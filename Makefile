# Définir les commandes par défaut
.DEFAULT_GOAL := help

all: build up

# Construire les images Docker pour tous les services
build:
	mkdir -p /home/pmailly/data/wordpress
	mkdir -p /home/pmailly/data/mariadb
	docker compose -f ./srcs/docker-compose.yml build

# Démarrer les conteneurs Docker pour tous les services
up:
	docker compose -f ./srcs/docker-compose.yml up -d

# Arrêter les conteneurs Docker pour tous les services
down:
	docker compose -f ./srcs/docker-compose.yml down -v

stop:
	docker compose -f ./srcs/docker-compose.yml stop

# Supprimer les volumes non utilisés
clean-volumes:
	docker volume rm wp db -f
	rm -rf /home/pmailly/data/wordpress
	rm -rf /home/pmailly/data/mariadb

fclean: down clean-volumes

fclean_of_death: fclean
	docker system prune -a -f
# Supprimer tous les conteneurs, volumes et images, puis redémarrer tout
re: fclean all


# Afficher l'aide
help:
	@echo "Utilisation : make [commande]"
	@echo
	@echo "Commandes disponibles :"
	@echo "  build           Construire les images Docker pour tous les services"
	@echo "  up              Démarrer les conteneurs Docker pour tous les services"
	@echo "  down            Arrêter les conteneurs Docker pour tous les services"
	@echo "  logs            Afficher les logs des conteneurs Docker"
	@echo "  prune-volumes   Supprimer les volumes non utilisés"
	@echo "  reset           Arrêter tous les conteneurs, supprimer tous les volumes et images Docker, reconstruire les images et redémarrer tous les services"
