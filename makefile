.PHONY: build
.PHONY: debug
.PHONY: clean
.PHONY: install
build:
	@echo Building app...
	@shc -vrf gitback.sh -o gitback
	@echo Configuring Executables...
	@chmod +x gitback
	@rm -f "gitback.sh.x.c"
	@echo Finished!
install:
	@shc -vrf gitback.sh -o gitback
	@echo Configuring Executables...
	@chmod +x gitback
	@sudo rm -f /usr/local/bin/gitback
	@sudo mv gitback /usr/local/bin/
	@rm -f "gitback.sh.x.c"
debug:
	@echo Building app...
	@shc -vrf gitback.sh -o gitback_debug
	@echo Configuring Executables...
	@chmod +x gitback_debug
	@echo Finished!
	@echo WARNING: DEBUG BUILD, ONLY USE THIS IF YOU KNOW WHAT YOU ARE DOING!!!
clean:
	@echo Cleaning directories...
	@rm -f "gitback.sh.x.c"
	@rm -f ./dist/gitback
	@rm -f "gitback.sh.x.c"
	@rm -f gitback_debug
	@echo Finished!