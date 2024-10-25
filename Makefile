COMPOSE_FOLDER = './srcs'

GREEN='\033[32m'
ORANGE='\033[0;33m'
NONE='\033[0m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'

all:
	@echo $(YELLOW)"Building and lauching services... -"$(NONE)
	docker-compose -f $(COMPOSE_FOLDER)/docker-compose.yml up --build -d
	@echo $(YELLOW)"Build and launch over -"$(NONE)

clean: 
	@echo $(BLUE)"- removing containers, images and network -"$(NONE)
	docker-compose -f $(COMPOSE_FOLDER)/docker-compose.yml down --rmi all
	docker container prune -f

re: clean all

.SILENT: all clean
.PHONY: all clean