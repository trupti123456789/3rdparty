*** Settings ***

Library        my_tabula.py
Library        QWeb

*** Test Cases ***
Read PDF Table Example

   Expect File Download
   Use pdf         {CURDIR}/../Data/QuotePDF.pdf             
   #Read Pdf      {CURDIR}/../Data/QuotePDF.pdf            