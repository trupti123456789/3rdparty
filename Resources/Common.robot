*** Settings ***

Library       my_tabula.MyPDFLibrary

*** Test Cases ***
Read PDF Table Example
    Read pdf table    CURDIR}/../Data/QuotePDF.pdf