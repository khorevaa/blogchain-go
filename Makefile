PROJECTNAME=$(shell basename "$(PWD)")
SCRIPT_AUTHOR=Andrey Kapitonov <andrey.kapitonov.96@gmail.com>
SCRIPT_VERSION=0.0.1.dev

all: build-migration-tool migrate-up

build-migration-tool:
	git clone https://github.com/rubenv/sql-migrate
	cd ./sql-migrate/sql-migrate && go build && cd ../..
	mv ./sql-migrate/sql-migrate/sql-migrate ./tools
	rm -rf ./sql-migrate

migrate-up:
	./tools/sql-migrate up

migrate-down:
	./tools/sql-migrate down

migrate-status:
	./tools/sql-migrate status

migrate-new:
	./tools/sql-migrate new $(name)

help:
	@echo -e "Usage: make [target] ...\n"
	@echo -e "build-migration-tool 	: Download & create migration tool"
	@echo -e "migrate-up 			: Apply migrations"
	@echo -e "migrate-down 		: Down migrations"
	@echo -e "migrate-status 		: Status of migrations"
	@echo -e "migrate-new 			: Create new migration by name={name_here}"
	@echo -e '\nProject name : '$(PROJECTNAME)
	@echo -e "Written by $(SCRIPT_AUTHOR), version $(SCRIPT_VERSION)"
	@echo -e "Please report any bug or error to the author."