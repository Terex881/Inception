all:
	sudo mkdir -p /home/sdemnati/data/wordpress
	sudo mkdir -p /home/sdemnati/data/mariadb
	docker-compose -f srcs/docker-compose.yml up --build > /dev/null

clean:
	docker-compose -f srcs/docker-compose.yml down -v

fclean: clean
	docker system prune -af --volumes
	sudo rm -rf /home/sdemnati/data/mariadb
	sudo rm -rf /home/sdemnati/data/wordpress

re: fclean all