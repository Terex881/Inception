all:
	mkdir -p /home/sdemnati/data/wordpress
	mkdir -p /home/sdemnati/data/mariadb
	docker-compose -f docker-compose.yml up --build

clean:
	docker-compose -f docker-compose.yml down -v

fclean: clean
	docker system prune -af --volumes
	rm -rf /home/sdemnati/data/mariadb
	rm -rf /home/sdemnati/data/wordpress

re: fclean all
