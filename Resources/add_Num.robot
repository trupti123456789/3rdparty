*** Settings ***
Library    Num.py

*** Test Cases ***
Add Two Numbers And Verify Result
    [Documentation]    This test adds two numbers using the Num library and verifies the correct result is returned.
    [Tags]             addition    num
    ${result}=         add two numbers    2    2
    Should Be Equal As Numbers    ${result}    4   