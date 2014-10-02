PROJECT=dev-container

.PHONY=all get-deps build push

all: .build get-deps build clean

.build:
	mkdir .build

get-deps: .build
	git clone git://github.com/andsens/homeshick.git .build/homeshick
	git clone git://github.com/denderello/dotfiles.git .build/denderello-dotfiles

clean:
	rm -rf .build

build:
	docker build -t denderello/$(PROJECT) .

push:
	docker push denderello/$(PROJECT)
