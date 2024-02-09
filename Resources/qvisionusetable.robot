*** Settings ***
Resource                    com.robot
Library                     QWeb
Suite Setup                 Setup Browser
Suite Teardown              End suite
Library                QVision
*** Test Cases ***
    Appstate                home
    LaunchApp               Sales
    ClickText               Show more navigation items
    ClickText               Groups
    ClickText               newset1

    Expect File Download
    Clicktext               Download
    # Verify the PDF has been downloaded and get the file path

    ${file_path}=           Verify File Download        timeout=30

    # Set the downloaded PDF file as the active PDF+

    UsePdf                  ${file_path}
    ${pdf_text}=            GetPdfText

    # Example of reading table cell data from a UI table (hypothetical for PDF context)
    ${cell_data}=           QVision.Read Table Cell             row_header=Product Name    column_header=Price
    Log                     ${cell_data}
