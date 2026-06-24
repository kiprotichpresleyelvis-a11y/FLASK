from flask import *
import pymysql

# initialize the aplication
app  =  Flask(__name__)

# define the route / endpoint
@app.route("/api/signup",methods=["POST"])

# define signup function
def signup():
    # get user user inputs from the form
    username=request.form["username"]
    email=request.form["email"]
    password=request.form["password"]
    phone=request.form["phone"]
    
    # connection to database
    connection = pymysql.connect(
        host="root",
        user="localhost",
        password="",
        database="modcomelvis")





# run the application
app.run(debug=True)