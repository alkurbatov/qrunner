#!/bin/bash

# For additional details please visit
# https://py2app.readthedocs.io/en/latest/

rm -rf build dist
python setup.py py2app -A

