install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

post-install:
	python -m textblob.download_corpora

lint:
	pylint --disable=R,C *.py devopslib

test:
	python -m pytest -vv --cov=devopslib --cov=test_*.py
	# python -m pytest --nbval getting_started_python.ipynb # test jupyter notebook

format:
	black *.py devopslib/*.py

# run:
# 	run docker
# 	docker run -p 127.0.0.1:8080:8080 <image_id>

deploy:
	echo "deploy goes here"
	#deploy
	# aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 561744971673.dkr.ecr.us-east-1.amazonaws.com
	# docker build -t devops-may-2022 .
	# docker tag devops-may-2022:latest 561744971673.dkr.ecr.us-east-1.amazonaws.com/devops-may-2022:latest
	# docker push 561744971673.dkr.ecr.us-east-1.amazonaws.com/devops-may-2022:latest

all: install post-install lint test format deploy