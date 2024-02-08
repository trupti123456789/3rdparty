*** Settings ***

Library       my_tabula.py

*** Test Cases ***
Read PDF Table Example
    my_tabula.Read Pdf Table  CURDIR}/../Data/QuotePDF.pdf