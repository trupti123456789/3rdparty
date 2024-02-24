from tabula import read_pdf
from robot.api import logger

class my_tabula():
    def read_pdf_table(self, pdf_path, pages="all"):
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