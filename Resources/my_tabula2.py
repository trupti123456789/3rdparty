# pdf_table_extractor.py
from tabula import read_pdf
from robot.api import logger


def extract_pdf_tables(pdf_path):
    # This function uses tabula-py to extract tables from a PDF and returns them
    tables = tabula.read_pdf(pdf_path, pages='all', multiple_tables=True)
    return tables