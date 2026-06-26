from flask import *
import pymysql

# initialize the application
app = Flask(__name__)

# define the route/endpoint
@app.route("/api/signup" , methods=["POST"])

# define the function
def signup () :
    # get user inputs from the form 
    username = request.form["username"]
    email = request.form["email"]
    password = request.form["password"]
    phone = request.form["phone"]

    # connection to database
    connection = pymysql.connect(
        host="localhost" ,
        user ="root" ,
        password="" ,
        database="modcomelvis") 
    
    # define the cursor 
    cursor = connection.cursor() 

    # define sql to insert users 
    sql="insert into users(username,password,email,phone)values(%s,%s,%s,%s)"

    # define data coming from the form 
    # NB:coming from step3
    data=(username,password,email,phone) 

    # by use of cursor, execute the sql /run querry
    cursor.execute(sql,data)

    # commit/save the changes to database
    connection.commit()

    return jsonify({"message" : "user registered successfully"})

# member signin/login
# define your route /endpoint
@app.route("/api/signin" , methods=["POST"])

# define the function 
def signin() :
    # get user inputs from the form 
    email=request.form["email"]
    password=request.form["password"]

    # connection to database
    connection = pymysql.connect(
        host="localhost" ,
        user ="root" ,
        password="" ,
        database="modcomelvis"
    ) 
    
    # define the cursor 
    cursor = connection.cursor(pymysql.cursors.DictCursor) 

    # define sql to select users 
    sql= "select * from users where email = %s and password = %s"

    # define data coming from the form 
    # NB:coming from step3
    data=(email,password) 

    # by use of cursor, execute the sql /run querry
    cursor.execute(sql,data)
    # wrong email and password 
    if cursor.rowcount == 0 :
        return jsonify({ "message" : "Invalid email or password" }) 
     
    # correct email and password
    if cursor.rowcount == 1 :
        # fetch user
        user = cursor.fetchone() 
        return jsonify ({"message" : "login successfull", "user": user})







# run the application
app.run(debug=True)