#!/usr/bin/python
#A simple script to count the pages of the rules
#Pure vanity, a monument to my work
from pdfreader import PDFDocument
import os
from pathlib import Path

script_path = Path(os.path.dirname(os.path.realpath(__file__)))
package_path = script_path / '../../_rulepackage/'

sum = 0
for d, _, files in os.walk(package_path):
  for file in files:
    if file.endswith('.pdf'):
      with open(Path(d) / file, 'rb') as pdf:
        doc = PDFDocument(pdf)
        sum += len(list(doc.pages()))
        print(file, len(list(doc.pages())), 'pages')

if sum == 0:
  print("Total is 0 - was the package even compiled?")
  exit(1)

print(f"Total: {sum} pages")
