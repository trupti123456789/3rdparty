*** Settings ***
Library    Num.py

*** Test Cases ***
Minimal task

    [Tags]        num
   ${Result} =   Add Two Numbers        1    2
   Log           ${Result}
        