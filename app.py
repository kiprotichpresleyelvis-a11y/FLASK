from flask import *
import pymysql
import os

# initialize the application
app = Flask(__name__)

app.config['UPLOAD_FOLDER'] = 'static/images'

# Create the folder if it does not exist
os.makedirs(app.config['UPLOAD_FOLDER'], exist_ok=True)

# Create a reusable function for uploading images
def save_image(file):
    filename = file.filename
    photo_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
    file.save(photo_path)
    return filename

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

# add products

# define the route/endpoint
@app.route("/api/addproduct" , methods=["POST"])

# define the function
def products () :
    # get user inputs from the form .
    product_name = request.form["product_name"]
    product_description =request.form["product_description"]
    product_cost= request.form["product_cost"]
    product_category = request.form["product_category"]
    product_photo= request.files["product_photo"]

    filename = save_image (product_photo)

    # connection to database
    connection = pymysql.connect(
        host="localhost" ,
        user ="root" ,
        password="" ,
        database="modcomelvis"
    )  

    # define the cursor why is it not advisable to save images in mysql database
    cursor = connection.cursor()

    # define sql to insert products 
    sql ="insert into product_details (product_name,product_description,product_cost,product_category,product_photo)values(%s,%s,%s,%s,%s)"

    # define your data 
    # NB:coming from step 3
    data =(product_name,product_description,product_cost,product_category,filename)

    # execute/run the  querry 
    cursor.execute(sql,data)

    # commit/ save changes  
    connection.commit()

    return jsonify({"message" : "product added successfully"})




# fetch products/get products 
# 1.define the route/endpoint
@app.route("/api/getproducts", methods=["GET"])
# 2. define the function
def getproducts():

#3. connection to database 
    connection = pymysql.connect(
        host="localhost" ,
        user ="root" ,
        password="" ,
        database="modcomelvis"
    )  

    # 4. define the cursor
    cursor= connection.cursor(pymysql.cursors.DictCursor)

    # 5.define sql to fetch products 
    sql= "select * from product_details"
    
    # 6.execute/run query
    cursor.execute(sql)

    # 7.fetch all products 
    allproducts=cursor.fetchall()
    # 8.return all products
    return jsonify (allproducts)


# run the application
app.run(debug=True)