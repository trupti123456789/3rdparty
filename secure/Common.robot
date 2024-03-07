*** Settings ***
Library                         QForce
Library                         QWeb
Library                        String


*** Variables ***
# IMPORTANT: Please read the readme.txt to understand needed variables and how to handle them!!
${initial_sleep_time}           5
${BROWSER}                      chrome
${username}                     mounika.t@cloudfulcrum.com.qa
${password}                     Secureworks@1234
${login_url}                    https://secureworks--qa.sandbox.my.salesforce.com       # Salesforce instance. NOTE: Should be overwritten in CRT variables
${home_url}                     ${login_url}/lightning/page/home
# ${Client_id}                    3MVG9x2D7w6gNN5nlLEllIpweU.kfqLihFpd7zXjpfp7AM.7exhIDwat9HWlpN4OallaktP5x1LAjFoS4gF1U
# ${Client_secret}                0FDC347A3E07ECA12593CA0199C453C520F394B94FAFB1D02E065A1229DB9C0B
# ${Mainproject}              https://secureworks--qa.sandbox.lightning.force.com/lightning/r/pse__Proj__c/a21D1000002DEkYIAW/view
*** Keywords ***
Setup Browser
    # Setting search order is not really needed here, but given as an example
    # if you need to use multiple libraries containing keywords with duplicate names
    Set Library Search Order    QForce                      QWeb
    Open Browser                about:blank                 ${BROWSER}
    SetConfig                   DefaultTimeout              30s                         #sometimes salesforce is slow


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
    ${login_status} =           IsText                      To access this page, you have to log in to Salesforce.    2
    Run Keyword If              ${login_status}             Login
    ClickText                   Home
    VerifyTitle                 Home | Salesforce

Wait And Increase Sleep Time
    [Arguments]                 ${initial_sleep_time}
    ${sleep_time}=              Evaluate                    ${initial_sleep_time} + 30 if ${initial_sleep_time} > 5 else ${initial_sleep_time}
    Sleep                       ${sleep_time}s
Login as   
    [Arguments]               ${Persona}
    ClickText                   Setup
    ClickText                   Setup for current app
    SwitchWindow                NEW
    TypeText                    Search Setup                 ${Persona}
    Clicktext                   Search Setup
    Clicktext                    ${Persona}
    ClickText                   Login                       Reset Password    recognition_mode=Vision
Log Out 
    ClickText    View profile
    ClickText    Log Out    partial_match=False

