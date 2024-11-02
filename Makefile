COMPOSE_FOLDER = ./srcs
VOLUMES_FOLDERS = /home/dspilleb/data
MARIADB_FOLDER = $(VOLUMES_FOLDERS)/mariadb
WORDPRESS_FOLDER = $(VOLUMES_FOLDERS)/wordpress
RM = rm -rf

GREEN=\033[32m
ORANGE=\033[0;33m
NONE=\033[0m
BLUE=\033[0;34m
YELLOW=\033[1;33m
RED=\033[0;31m

all:
	echo "$(YELLOW)Building and lauching services... -$(NONE)"
	mkdir -p $(MARIADB_FOLDER)
	mkdir -p $(WORDPRESS_FOLDER)
	docker-compose -f $(COMPOSE_FOLDER)/docker-compose.yml up --build -d
	echo "$(YELLOW)Build and launch over -$(NONE)"

clean: 
	echo "$(BLUE)- removing containers, images and network -$(NONE)"
	docker-compose -f $(COMPOSE_FOLDER)/docker-compose.yml down --rmi all
	docker container prune -f

fclean: 
	echo "$(ORANGE)- removing containers, images and network and volumes -$(NONE)"
	docker-compose -f $(COMPOSE_FOLDER)/docker-compose.yml down -v --rmi all
	docker container prune -f
	sudo $(RM) $(MARIADB_FOLDER)
	sudo $(RM) $(WORDPRESS_FOLDER)

help:
	echo "To launch the containers => $(GREEN)make$(NONE) or $(GREEN)make all$(NONE)"
	echo "To remove the containers and the images but $(ORANGE) keep Volumes $(NONE) => $(ORANGE)'make clean'$(NONE)"
	echo "To remove the containers and the images $(RED) and Volumes $(NONE) => $(RED)'make fclean'$(NONE)"
	echo "To relaunch while keeping Volumes => $(BLUE)'make re'$(NONE)"

re: clean all

.SILENT: all clean fclean help
.PHONY: all clean fclean help
