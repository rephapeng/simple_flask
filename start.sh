#!/bin/sh
export FLASK_APP=main.py
export FLASK_ENV=development
flask run --port 5001 --reload 