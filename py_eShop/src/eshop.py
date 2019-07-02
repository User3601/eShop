
from flask import Flask, url_for, render_template, request
#from flask.ext.mysqldb import MySQL
app = Flask(__name__)


@app.route("/")
def eShop():
    return render_template('eShop_main.html')

@app.route("/login")
def login():
    return render_template('login_page.html')

@app.route("/logout")
def logout():
    return render_template('eShop_main.html')

@app.route("/stock")
def stock():
    return render_template('stock.html')

@app.route("/about")
def about():
    return render_template('about.html')

@app.route("/contact")
def contact():
    return render_template('contact.html')




if __name__ == "__main__":
    app.run()
