#DB SERVER FILE
from flask import Flask, render_template, request, redirect, url_for
from flask_mysqldb import MySQL
import config

app = Flask(__name__)
app.config.from_object(config)

mysql = MySQL(app)

@app.route('/')
def index():
    return 'testing!'

if __name__ == '__main__':
    app.run(debug=True)