*** Settings ***
Resource        com.robot
Library        my_MuPdf.py
Library        QWeb
Suite Setup               Setup Browser
Suite Teardown            End suite
*** Test Cases ***
Read PDF Table Example MuPdf

    [Tags]            mupdf
 
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

    #  UsePdf                  ${file_path}
    # ${pdf_text}=            GetPdfText

    #  extract_tables     ${file_path}  

       ${pdf_text}=           extract_tables                    ${file_path}
    Log                      ${pdf_text}