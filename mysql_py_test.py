from flask import Flask
from flask import render_template
from flask import request
from flask_mysqldb import MySQL

app = Flask(__name__)

# MySQL configurations

app.config[ 'MYSQL_USER' ] = 'root'
app.config[ 'MYSQL_DB' ] = 'eshop_db'
app.config[ 'MYSQL_HOST' ] = 'localhost'
mysql = MySQL(app)

@app.route('/')
def users():
    cursor = mysql.connection.cursor()
    cursor.execute('''SELECT idproduct, name FROM product''')
    rv = cursor.fetchall()
    output = ''
    for row in rv:
        output = output + '<p>'
        for value in row:
            output = output + str(value) + '<br />'
        output = output + '</p>'
    return output


if __name__ == "__main__":
    app.run()