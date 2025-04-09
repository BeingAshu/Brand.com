# Step 1: Use an official Python runtime as a parent image
FROM python:3.9-alpine

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the current directory contents into the container at /app
COPY . /app

# Step 4: Install the dependencies from the requirements.txt file
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Expose the port that Flask will run on (default is 5000)
EXPOSE 5000

# Step 6: Run the Flask app when the container starts
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
