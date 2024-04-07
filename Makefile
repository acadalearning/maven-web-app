BIN_DIR = bin

build:
	@echo "Building this project.."
	mkdir $(BIN_DIR)

clean:
	@echo "Cleaning this project"
	rm -rf $(BIN_DIR)

test:
	@echo "Testing.."

all: clean build
