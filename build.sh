#!/usr/bin/env bash
# exit on error
set -o errexit

/opt/render/project/src/.venv/bin/python -m pip install --upgrade pip 

pip install virtualenv
virtualenv .
source /opt/render/project/src/.venv/bin/activate
pip install --upgrade pippip install --force-reinstall -U setuptools
pip install .
poetry install 
