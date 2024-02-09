import fitz  # PyMuPDF

# Open the PDF file
pdf_document = fitz.open("path_to_your_document.pdf")

for page_num in range(len(pdf_document)):
    # Get a page
    page = pdf_document.load_page(page_num)

    # Extract text and positions
    text_instances = page.get_text("dict")["blocks"]

    for instance in text_instances:
        # Each instance is a dictionary with text and bbox (bounding box)
        text = instance.get("text", "").strip()
        bbox = instance.get("bbox")

        # Here you could analyze the bbox coordinates to infer table structure
        print(f"Text: {text}, BBox: {bbox}")