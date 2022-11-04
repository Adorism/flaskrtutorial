#!/usr/bin/env bash
# exit on error
set -o errexit

/opt/render/project/src/.venv/bin/python -m pip install --upgrade pip 

pip install --reinstall python3-pkg-resources python3-setuptools
pip install virtualenv
virtualenv .
source /opt/render/project/src/.venv/bin/activate

pip install .
poetry install 
