#!/usr/bin/env bash
# exit on error
set -o errexit

/opt/render/project/src/.venv/bin/python -m pip install --upgrade pip 
pip install virtualenv
virtualenv .
. venv/bin/activate

pip install .
poetry install 

python manage.py collectstatic --no-input
python manage.py migrate