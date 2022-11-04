#!/usr/bin/env bash
# exit on error
set -o errexit

/opt/render/project/src/.venv/bin/python -m pip install --upgrade pip 
python3 -m pip install --upgrade pip setuptools wheel
pip install virtualenv
virtualenv .
source /opt/render/project/src/.venv/bin/activate

pip install .
poetry install 
