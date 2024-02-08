*** Settings ***

Library        my_tabula.py
Library        QWeb

*** Test Cases ***
Read PDF Table Example
   Use pdf         {CURDIR}/../Data/QuotePDF.pdf             
   #Read Pdf      {CURDIR}/../Data/QuotePDF.pdf            