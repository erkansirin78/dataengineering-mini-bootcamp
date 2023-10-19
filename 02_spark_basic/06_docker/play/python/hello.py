from flask import Flask
app = Flask(__name__)


@app.route('/atscale')
def hello():
    return "<h1>Merhaba AtScale2 modifed</h1>"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5555)
