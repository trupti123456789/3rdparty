*** Settings ***

Library        my_tabula.py


*** Test Cases ***
Read PDF Table Example
                     
   Read Pdf      {CURDIR}/../Data/QuotePDF.pdf            