*** Settings ***
Library    Num.py

*** Test Cases ***
Minimal task
   ${Result} =   Add Two Numbers        1    2
   Log           ${Result}
        