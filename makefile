build:
	@echo Building app...
	@shc -vrf gitback.sh -o gitback
	@echo Configuring Executables...
	@chmod +x gitback
	@echo Cleaning up...
	@mv gitback ./dist
	@rm -f "gitback.sh.x.c"
	@echo Finished!
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
	@echo Finished!
destroy:
	@rm -f ./dist/gitback
	@rm -f "gitback.sh.x.c"
	@rm -f gitback_debug