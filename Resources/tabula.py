#tabula.py
from tabula import read_pdf
from robot.api import logger

class MyPDFLibrary:
    def read_pdf_table(self, pdf_path, pages="all"):
        """Reads tables from a PDF and logs the first table as an example."""
        try:
            # Attempt to read tables from the PDF
            tables = read_pdf(pdf_path, pages=pages)
            if tables:
                # Log the first table to the Robot Framework log for demonstration
                logger.info(f"First table from the PDF:\n{tables[0]}")
            else:
                logger.info("No tables found in the PDF.")
        except Exception as e:
            logger.error(f"Failed to read PDF: {e}")