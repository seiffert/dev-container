# Docker Based Development Environment

This is denderello's development environment in a Docker container.

## Building

You can build it using `make`:

    make

## Usage

You can start it using `docker run`:

    docker run --rm -t -i -v $(echo ~):/var/shared/ denderello/dev-container

## Credits

This is highly influenced by the work of [@shykes](https://github.com/shykes) and his [shykes/devbox](https://github.com/shykes/devbox) project.
