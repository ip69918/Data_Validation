import base64
import requests
import json
import logging

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

def data_validate(file_path, payload_format, payload_schema):

    """
    Send a post request to validate data in CSV or JSON format.
    file_path: Path to the file to validate
    payload_format: Format of the payload (e.g. CSV, JSON)
    payload_schema: Schema of the payload (e.g. JSON)

    """


    url = "http://127.0.0.1:8000/validate-data/"

    # Read and encode file content to Base64
    logger.info("Reading file: %s", file_path)
    try:
        with open(file_path, "rb") as f:
            file_content = f.read()
        logger.info("File read successfully!")
    except Exception as e:
        logger.error("Failed to read file: %s", e)
        return

    file_content_base64 = base64.b64encode(file_content).decode('utf-8')
    logger.info("Base64 encoding complete.")

    data = {
        "payload_format": payload_format,
        "payload_schema": json.dumps(payload_schema),
        "payload_content_base64": file_content_base64
    }

    try:
        logger.info("Sending POST request to %s", url)
        response = requests.post(url, json=data)
        #logger.info("Response received!")

        if response.status_code == 200:
            result = response.json()
            if result["status"] == "success":
                print("Data is valid")
            else:
                logger.error("Validation errors: %s", result.get('errors'))
        else:
            #logger.error("Failed to validate data. HTTP Status: %s", response.status_code)
            logger.error("Response: %s", response.text)
    except Exception as e:
        logger.error("An error occurred: %s", e)

# Example usage
if __name__ == "__main__":
    file_path = r"C:\Users\ishan\OneDrive\Desktop\testing.csv"
    payload_format = "csv"
    payload_schema = {"Medication": "object", "Units": "int64"}
    data_validate(file_path, payload_format, payload_schema)
