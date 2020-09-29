# FILE=backsurvey.py
# FILE=univpub.py
FILE=real_estate.py
# FILE=google.py
# FILE=baidu.py

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
