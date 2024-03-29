*** Settings ***
Resource                    com.robot
Library                     my_tabula.py
Library                     PDFTableExtractor.py
Library                     QWeb
Suite Setup                 Setup Browser
Suite Teardown              End suite
*** Test Cases ***
Read PDF Table Example
    [Tags]                  tabula 1
    Appstate              home
    LaunchApp             Sales
    Clicktext             Quote
    Goto                  https://secureworks--qa.sandbox.lightning.force.com/lightning/r/Quote__c/a5nD10000002cApIAI/view
    ##reading pdf
    Expect File Download

    ClickText    Show more actions
    Clicktext             PDF
    

    # Verify the PDF has been downloaded and get the file path

    ${file_path}=         Verify File Download    timeout=30
    

    # Set the downloaded PDF file as the active PDF+

    UsePdf                ${file_path}


     ${pdf_text}=            GetPdfText

    ${Read_Table}          Read Pdf Table          ${file_path}
    LogScreenshot

#     Appstate                home
#     LaunchApp               Sales
#     #ClickText              Show more navigation items
#     ClickText               Groups
#     ClickText               newset1

#     Expect File Download
#     Clicktext               Download
#     # Verify the PDF has been downloaded and get the file path

#     ${file_path}=           Verify File Download    timeout=30

#     # Set the downloaded PDF file as the active PDF+

#     UsePdf                  ${file_path}
#     ${pdf_text}=            GetPdfText

#     ${Read_Table}          Read Pdf Table          ${file_path}
#     LogScreenshot
# #Extract Tables From PDF And Save As CSV
#     ${tables}=    Extract Tables   ${file_path}
#      LogScreenshot
#     Tables To CSV    ${tables}  ${file_path}
#      LogScreenshot