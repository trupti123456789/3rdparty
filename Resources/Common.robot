*** Settings ***
Resource        com.robot
Library        my_tabula.py
Library        QWeb

*** Test Cases ***
Read PDF Table Example
    Appstate                home
    LaunchApp               Sales
    Clicktext               Quote
    Goto                    https://secureworks--qa.sandbox.lightning.force.com/lightning/r/Quote__c/a5nD10000002cApIAI/view
    ##reading pdf
    Expect File Download
    Clicktext               PDF

    # Verify the PDF has been downloaded and get the file path

    ${file_path}=           Verify File Download        timeout=30

    # Set the downloaded PDF file as the active PDF+

    UsePdf                  ${file_path}
  
            
   Read Pdf        ${file_path}          