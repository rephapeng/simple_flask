from flask import Flask, render_template
import requests
import json


app = Flask(__name__)


@app.route('/')
def home():
    trivia = json.loads(requests.get("http://localhost:8080/trivia").text)
    return render_template("index.html", trivia=trivia)
