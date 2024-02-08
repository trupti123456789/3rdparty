*** Settings ***
Library                         QForce
Library                         QWeb

*** Variables ***
# IMPORTANT: Please read the readme.txt to understand needed variables and how to handle them!!
${initial_sleep_time}           5
${BROWSER}                      chrome
${username}                     mounika.t@cloudfulcrum.com.qa
${password}                     Secureworks@1234
${login_url}                    https://secureworks--qa.sandbox.my.salesforce.com       # Salesforce instance. NOTE: Should be overwritten in CRT variables
${home_url}                     ${login_url}/lightning/page/home
# ${username}                     trupti@practice.com
# ${password}                     Meera@123456
# ${login_url}                    https://login.salesforce.com

*** Keywords ***
Setup Browser
    # Setting search order is not really needed here, but given as an example
    # if you need to use multiple libraries containing keywords with duplicate names
    Set Library Search Order    QForce                      QWeb
    Open Browser                about:blank                 chrome                      prefs=download.prompt_for_download: False, plugins.always_open_pdf_externally: True   
    
End suite
    Close All Browsers
    
Login
    [Documentation]             Login to Salesforce instance
    GoTo                        ${login_url}
    TypeText                    Username                    ${username}                 delay=1
    TypeText                    Password                    ${password}
    ClickText                   Log In
    
Home
    [Documentation]             Navigate to homepage, login if needed
    GoTo                        ${home_url}
    ${login_status} =           IsText                      To access this page, you have to log in to Salesforce.                              2
    Run Keyword If              ${login_status}             Login
    ClickText                   Home
    VerifyTitle                 Home | Salesforce
    
Wait And Increase Sleep Time
    [Arguments]                 ${initial_sleep_time}
    ${sleep_time}=              Evaluate                    ${initial_sleep_time} + 30 if ${initial_sleep_time} > 5 else ${initial_sleep_time}
    Sleep                       ${sleep_time}s