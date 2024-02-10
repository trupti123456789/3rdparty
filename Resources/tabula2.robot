*** Settings ***
Resource        com.robot
Library        my_tabula2.py
Library        QWeb
Suite Setup               Setup Browser
Suite Teardown            End suite

*** Test Cases ***
    [Tags]                tabula 2
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
    ${pdf_table}=        Extract Pdf Tables           ${file_path}
    Log                     ${pdf_table}
