# PDFTableExtractor.py
import tabula
import pandas as pd

def extract_tables(pdf_path):
    # Extract tables from the PDF
    tables = tabula.read_pdf(pdf_path, pages='all')
    return tables

def tables_to_csv(tables, base_filename):
    for index, table in enumerate(tables, start=1):
        table.to_csv(f"{base_filename}_Table_{index}.csv", index=False)