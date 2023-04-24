# Définir les commandes par défaut
.DEFAULT_GOAL := help

# Construire les images Docker pour tous les services
build:
	docker compose build

# Démarrer les conteneurs Docker pour tous les services
up:
	docker compose up

# Arrêter les conteneurs Docker pour tous les services
down:
	docker compose down

stop:
	docker compose stop

# Supprimer les volumes non utilisés
prune-volumes:
	docker volume prune -f

# Supprimer tous les conteneurs, volumes et images, puis redémarrer tout
reset:
	docker compose down -v
	docker system prune -a -f
	docker compose build
	docker compose up

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
