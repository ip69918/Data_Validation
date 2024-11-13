# Data_Validation
  Data validation means checking the accuracy and quality of source data before using, importing or otherwise processing data. Data validation in Python is the process of ensuring that data is accurate, consistent, and reliable. It involves verifying that data meets predefined criteria and rules to maintain its quality.Python offers numerous libraries and tools, such as Pandas, NumPy, and regular expressions, to automate data validation processes.
  This application provides a practical, efficient solution for validating large amounts of data in a structured and reliable manner, making it ideal for data-centric workflows. By integrating with Docker, it ensures a seamless experience.

## Features
We have developed a robust data validation application that provides an efficient platform for validating datasets against specified schemas. The application is designed to validate data based on three key parameters:

1.**file_path**: The path to the data file you wish to validate. <br/>
2.**paylaod_format**: The format of the file, either csv or json. <br/>
3.**paylaod_schema**: A valid schema against which the data will be validated.

- Dockerized Environment: The entire application is containerized using Docker, which makes it easy to set up and run across any system. It eliminates dependencies and ensures a consistent environment across development, testing, and production.

- FastAPI with Uvicorn: The API is built using FastAPI, a modern, high-performance web framework. It runs on Uvicorn, which provides an asynchronous server, ensuring optimal speed and scalability. Once the Docker container is running, the server is immediately available, allowing users to interact with the API to validate their datasets seamlessly.

- API-Driven Validation: By sending a request to the running API with the required parameters (file path, format, schema), users can instantly validate the contents of CSV or JSON files. This streamlines data validation processes for various applications, ensuring that input data conforms to expected formats before processing.

You will get validation status.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- **Python 3.8+** installed. (https://www.python.org/downloads/)
- **Docker** installed (for containerized deployment). (https://docs.docker.com/get-docker/)
- Any necessary Python dependencies from `requirements.txt`.

# Getting started
## Python Installation and Setup
If you are running the project locally without Docker, you need to install the required Python packages.
### Create a virtual environment :
- On Windows:
``` bash
 python -m venv env
```

### Activate the virtual environment:
- On Windows:
``` bash
.\env\Scripts\activate
```

### Clone the Repo:
- On windows:
``` bash
git clone -b Python_Versions https://github.com/ip69918/Data_Validation.git
```

### Change the Directory where Dockerfile present:
``` bash
cd Data_Validation
```

### Build an image with using Dockerfile-py:
- On windows:
``` bash
docker build -t my-application --build-arg python_version={python_version} -f Dockerfile-py .
```

### Run the container:
- On windows:
``` bash
docker run -p 8000:8000 my-application
```
Once the container is running, the FastAPI server will be live, and you can access the validation API at http://localhost:8000.

