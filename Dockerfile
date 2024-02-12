# Use an official Python runtime as a parent image
FROM python:3.9

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /code

# Copy the dependencies file to the working directory
COPY requirements.txt /code/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt || true

# Copy the rest of the application code to the working directory
COPY . /code/


ENV PYTHONPATH "${PYTHONPATH}:/code"

# Run migrations and collect static files (if needed)
# RUN python manage.py migrate
# RUN python manage.py collectstatic --noinput

# Expose the port on which the Django app will run
EXPOSE 8000

# Command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
