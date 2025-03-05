all:
	mkdir -p /Users/sdemnati/data/wordpress
	mkdir -p /Users/sdemnati/data/mariadb
	docker-compose -f srcs/docker-compose.yml up --build

clean:
	docker-compose -f srcs/docker-compose.yml down -v

fclean: clean
	docker system prune -af --volumes
	rm -rf /Users/sdemnati/data/mariadb
	rm -rf /Users/sdemnati/data/wordpress

re: fclean all