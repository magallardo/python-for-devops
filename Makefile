install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	pylint --disable=R,C *.py devopslib

test:
	python -m pytest -vv --cov=devopslib --cov=test_*.py
	# python -m pytest --nbval getting_started_python.ipynb # test jupyter notebook