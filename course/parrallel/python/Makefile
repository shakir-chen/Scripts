# FILE=mp_test.py
FILE=mp_test_2.py

ts := $(shell /bin/date "+%Y-%m-%d---%H-%M-%S")

all:
	python3.5 $(FILE)

edit:
	vim $(FILE)

backup:
	@echo $(ts)
	cp $(FILE) version/$(FILE)-$(ts)

timestamp:
	@echo Timestamp is $(ts)
	@sleep 10
	@echo Timestamp is $(ts)
