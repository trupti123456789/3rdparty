# # pdf_table_extractor.py
# from tabula import read_pdf
# from robot.api import logger


# def extract_pdf_tables(pdf_path):
#     # This function uses tabula-py to extract tables from a PDF and returns them
#     tables = tabula.read_pdf(pdf_path, pages='all', multiple_tables=True)
#     return tables

from tabula import read_pdf
from robot.api import logger

class MyPDFLibrary:
    def read_pdf_table (self, ${file_path}, pages="all"):
        """Reads tables from a PDF and logs all tables."""
        try:
            # Attempt to read tables from the PDF
            tables = read_pdf(pdf_path, pages=pages)
            if tables:
                # Iterate over each table and log it to the Robot Framework log
                for index, table in enumerate(tables, start=1):
                    logger.info(f"Table {index} from the PDF:\n{table}")
            else:
                logger.info("No tables found in the PDF.")
        except Exception as e:
            logger.error(f"Failed to read PDF: {e}")