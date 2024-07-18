#!/usr/bin/python
#A simple script to count the pages of the rules
#Pure vanity, a monument to my work
from pdfreader import PDFDocument
from glob import glob

sum = 0
files = glob('../_rulepackage/*.pdf')
for file in files:
    with open(file, 'rb') as pdf:
        doc = PDFDocument(pdf)
        sum += len(list(doc.pages()))
        print(file, len(list(doc.pages())), 'pages')

print("Total:", sum)
