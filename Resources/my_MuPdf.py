import fitz  # PyMuPDF

def extract_text_from_first_page(pdf_path):
    doc = fitz.open(pdf_path)
    first_page = doc[0]
    text = first_page.get_text()
    return text