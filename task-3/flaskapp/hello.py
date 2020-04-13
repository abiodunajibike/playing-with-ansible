from flask import Flask
app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World'


if __name__ == "__main__":
    # defaults to host: 127.0.0.1 and port: 5000
    # to avoid restart the app for every change to take effect
    app.debug = True
    app.run()
