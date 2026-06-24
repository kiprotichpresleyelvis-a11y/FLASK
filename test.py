from flask import *

# initialize the aplication
app=Flask (__name__)

# define route/endpoint
@app.route("/api/home")

# define the function 
def home ():
    return jsonify({"message":"welcome home"})

@app.route("/api/services")
def services():
    return jsonify({"message":"welcome to services"})

@app.route("/api/about")
def about():
    return jsonify({"message":"welcome to about"})

@app.route("/api/contact")
def contact():
    return jsonify({"message":"contact us for more information"})

@app.route("/api/products")
def products():
    return jsonify({"message":"Products available"})

@app.route("/api/students")
def students():
    return jsonify({"message":"List of students"})

@app.route("/api/courses")
def courses():
    return jsonify({"message":"courses offered"})

@app.route("/api/Teachers")
def Teachers():
    return jsonify({"message":"List of Teachers"})

@app.route("/api/news")
def news():
    return jsonify({"message":"latest news update"})

@app.route("/api/gallery")
def gallery():
    return jsonify({"message":"Gallery images"})

@app.route("/api/faq")
def faq():
    return jsonify({"message":"Frequently asked questions"})

@app.route("/api/profile")
def profile():
    return jsonify({"message":"Student Profile information"})

@app.route("/api/events")
def events():
    return jsonify({"message":"Upcoming events"})

@app.route("/api/library")
def library():
    return jsonify({"message":"Library resources available"})

@app.route("/api/addition",methods = ["POST"])
def addition():
    if request.method == "POST":
        number1 = request.form["number1"]
        number2 = request.form["number2"]
        sum=int(number1)+int(number2)
        return jsonify({"the answer is":sum})
  


@app.route("/api/difference", methods = ["POST"])
def difference():
    if request.method == "POST":
        number1 = request.form["number1"]
        number2 = request.form["number2"]
        difference=int(number1)-int(number2)
        return jsonify({"the answer is":difference})
    

@app.route("/api/multiplication", methods = ["POST"])
def multiplication():
    if request.method == "POST":
        number1 = request.form["number1"]
        number2 = request.form["number2"]
        product=int(number1)*int(number2)
        return jsonify({"the answer is": product})
    

  
@app.route("/api/division", methods = ["POST"])
def division():
    if request.method == "POST":
        number1 = request.form["number1"]
        number2 = request.form["number2"]
        division=int(number1)/int(number2)
        return jsonify({"the answer is":division})
    


# run the application
app.run(debug=True)