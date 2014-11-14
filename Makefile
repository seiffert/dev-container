PROJECT=dev-container

.PHONY=all get-deps build push

all: clean .build get-deps build

.build:
	mkdir .build

get-deps: .build
	git clone https://github.com/seiffert/dotfiles.git .build/dotfiles

clean:
	rm -rf .build

build:
	docker build -t pseiffert/$(PROJECT) .

push:
	docker push pseiffert/$(PROJECT)
