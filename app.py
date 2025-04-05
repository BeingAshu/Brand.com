from flask import Flask, render_template

app = Flask(__name__)

# Home route
@app.route('/')
def home():
    return render_template('home.html')

# Products route
@app.route('/products')
def products():
    return render_template('products.html')

# Purpose route
@app.route('/purpose')
def purpose():
    return render_template('purpose.html')

# Expert Advice route
@app.route('/expert-advice')
def expert_advice():
    return render_template('expert_advice.html')

# FAQ route
@app.route('/faq')
def faq():
    return render_template('faq.html')

if __name__ == '__main__':
    app.run(debug=True)
