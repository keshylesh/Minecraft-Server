build: Dockerfile
	docker build -t mcserver .

test: build
	docker run -it -p 25563:25565 --volume ./data:/data mcserver 

.PHONY: clean
clean:
	sudo rm -rf ./data/*
