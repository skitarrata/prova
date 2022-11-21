NAME = inception

all: prune reload

linux:
	@ echo "127.0.0.1 svalenti.42.fr" >> /etc/hosts
	
stop:
	@ docker-compose -f srcs/docker-compose.yml down

clean: stop
	@ rm -rf ~/Desktop/inception

prune: clean
	@ docker system prune -f

reload: 
	@ docker-compose -f srcs/docker-compose.yml up -d --build
	@mkdir -p /home/svalenti/data/db
	@mkdir -p /home/svalenti/data/wd

.PHONY: linux stop clean prune reload all
