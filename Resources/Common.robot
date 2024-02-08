*** Settings ***
Resource        com.robot
Library        my_tabula.py
Library        QWeb

*** Test Cases ***
Read PDF Table Example
    Appstate                home
    LaunchApp               Sales
    ClickText               Show more navigation items
    ClickText               Groups
    ClickText               newset
   
    Expect File Download
    Clicktext               Download

    # Verify the PDF has been downloaded and get the file path

    ${file_path}=           Verify File Download        timeout=30

    # Set the downloaded PDF file as the active PDF+

    UsePdf                  ${file_path}
   Expect File Download
   Use pdf         {CURDIR}/../Data/QuotePDF.pdf             
   #Read Pdf      {CURDIR}/../Data/QuotePDF.pdf            