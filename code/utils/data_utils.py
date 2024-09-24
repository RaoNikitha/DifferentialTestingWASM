from langchain_community.document_loaders import PyMuPDFLoader
import pandas as pd
import json
from pathlib import Path

# load file given path
def load_file(file_path):
    with open(file_path, 'r') as f:
        data = f.read()
    return data


# load manual from pdf
def load_pdf(file_path):
    loader = PyMuPDFLoader(file_path)
    data = loader.load()
    return data


# load manual from json
def load_json(file_path):
    with open(file_path, 'r') as f:
        data = json.loads(json.load(f))
    return data


# save output to file
def save_file(content, path):
    with open(path, 'w') as output:
        output.write(content)


def create_dir(path):
    Path(path).mkdir(parents=True, exist_ok=True)
