from flask import Flask, url_for, render_template
app = Flask(__name__)


@app.route("/")
def eShop():
    return render_template('eShop.html')

@app.route("/login")
def login():
    return render_template('login_page.html')

@app.route("/logout")
def logout():





if __name__ == "__main__":
    app.run()
