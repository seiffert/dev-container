# Docker Based (Go) Development Environment

This is Paul's development environment in a Docker container.

## Building

You can build it using `make`:

    make

## Usage

You can start it using `docker run`:

    docker run --rm -t -i -v $(echo ~/Projects):/home/dev/Projects pseiffert/dev-container

## Credits

This is highly influenced by the work of [@denderello](https://github.com/denderello), [@shykes](https://github.com/shykes), and his [shykes/devbox](https://github.com/shykes/devbox) project.
