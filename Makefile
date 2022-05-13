
# read env vars
include .env
export

.PHONY: run
run:
	./tools.sh $(filter-out $@,$(MAKECMDGOALS))

%:
	@:
