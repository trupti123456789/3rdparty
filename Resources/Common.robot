*** Settings ***

Library       my_tabula.py

*** Test Cases ***
Read PDF Table Example
    Read pdf table    CURDIR}/../Data/QuotePDF.pdf