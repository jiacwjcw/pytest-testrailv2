
define HELP

This is the pytest testrail project Makefile.

Usage:
make clean        - Remove generated files
make lint         - Run static analysis
make release      - Bumpversion and push with tags
make requirements - Install dependencies

endef

export HELP

all help:
	@echo "$$HELP"

clean:
	rm -rf .cache .coverage .tox pytests_py*-test.xml pytest_testrailv2.egg-info pytest_testrailv2.txt pytests_coverage.xml
	find . -name '*.pyc' -delete

lint:
	flake8 pytest_testrailv2 | tee pytest_testrailv2.txt

README.rst: README.md
	pandoc --from=markdown --to=rst --output=README.rst README.md

release:
	bump2version part $(type)
	git push origin master --tags

requirements: .requirements.txt

.requirements.txt: requirements/*.txt
	pip install -r requirements/base.txt
	pip freeze > $@

test: lint
	tox
