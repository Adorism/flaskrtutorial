#!/usr/bin/env bash
# exit on error
set -o errexit
pip install virtualenv
virtualenv .
. venv/bin/activate
/opt/render/project/src/.venv/bin/python -m pip install --upgrade pip 
pip install .
poetry install 

python manage.py collectstatic --no-input
python manage.py migrate