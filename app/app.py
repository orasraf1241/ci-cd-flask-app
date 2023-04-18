from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello, to leumi!"

if __name__ == '__main__':
    context = ('ssl.crt', 'ssl.key')
    app.run(debug=True, ssl_context=context,host="0.0.0.0", port=443)